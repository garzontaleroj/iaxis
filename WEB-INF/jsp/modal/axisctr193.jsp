<%/*
*  Fichero: Axisctr193.jsp
*  Fecha: 12/09/2012
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>
<% String pantalla = "axisctr193"; %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            var modo = "${__formdata.CMODO}";
            parent.f_cerrar_axisctr193(modo);
       }
       
       function f_actualizar_agente(){
             //if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("modal_axisctr193.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.axisctr193Form.CAGENTE), this, objJsMessages.jslit_cargando);                 
              //}  
            }   
            
       function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);

                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                       
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                       
                    }else{
                        
                        objDom.setValorPorId("TAGENTE",""); 
                        objDom.setValorPorId("CAGENTE","");
                    }
            
                
                }
             
            }  
       
       function f_onload(){
        
            var ok = "${__formdata.OK}";
            var modo = "${__formdata.CMODO}";
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
                         
               parent.f_aceptar_axisctr193(document.axisctr193Form.SPERSON.value);
               f_but_cancelar();
            }
            
            $("#but_1000102").attr("title", "<axis:alt f='axisctr193' c='BT_TOMADOR' lit='9906192'/>");
          
            f_cargar_propiedades_pantalla();
       }            

       function f_but_1000102(){
        
                try {
        	
                objAjax.invokeAsyncCGI("modal_axisctr193.do", callbackajaxGetTomador, 
                "operation=ajax_get_tomador", this, objJsMessages.jslit_actualizando_registro);
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
       
       
       }
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
              
             
                var parti = document.axisctr193Form.PPARTICI.value;
                if(f_comprobar_negativo(parti) == 0 )
                    objUtiles.ejecutarFormulario ("modal_axisctr193.do", "aceptar", document.axisctr193Form, "_self", objJsMessages.jslit_cargando);                      
                else
                     alert("<axis:alt f='axisctr193' c='ALERTNEG' lit='9902884'/>");
            }
       }
        
       function callbackAjaxGuardar(ajaxResponseText) {
                //alert("volver");
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
       }    
           
            function f_actualizar_valor(){       
                if(document.axisctr193Form.LIDER.checked){
                    document.axisctr193Form.LIDER.value=1;                
                    document.axisctr193Form.CLIDER.value=1;                
                }else{
                    document.axisctr193Form.LIDER.value=0;                
                    document.axisctr193Form.CLIDER.value=0;                
                }            
            
            } 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CORRETAJE_TIPAGE_4");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisctr193.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
             function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);               
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){                 
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    var COMISIformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("OCOMISI"), 0, 0);
                    //var RETENCformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("ORETENC"), 0, 0);                    
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE", NOMBREformateado);                                                            
                    if (!objUtiles.estaVacio(COMISIformateado))
                            objDom.setValorPorId("CCOMISI", COMISIformateado); 
                }
            }
            
            function f_comprobar_negativo(valor){
            
                if(valor<0){
                   return 1;
                }else
                    return 0;
            }
            
            /* ************************************************************************************************** */
            /* ******************************************* FUNCIONES ******************************************** */
            /* ************************************************************************************************** */
            
            function f_abrir_axisper001_tomadores() {
                objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&faceptar=f_aceptar_tomadores_axisper001&ORIGEN=AXISCTR193");
            }
    
            function f_cerrar_axisper001() {
                objUtiles.cerrarModal("axisper001");
                <% session.removeAttribute("faceptar"); %>
            }
    
            function f_aceptar_tomadores_axisper001 (selectedPerson){
                try {
        	//alert("UNO : "+selectedPerson);
                f_cerrar_axisper001();
                objDom.setValorPorId("SPERSON", selectedPerson);
               
               objAjax.invokeAsyncCGI("modal_axisctr193.do", callbackajaxGetPersona, 
               "operation=ajax_get_persona&SPERSON=" + selectedPerson , this, objJsMessages.jslit_actualizando_registro);
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
            
            
            function f_get_persona(SPERSON){
            //alert("DOS : "+SPERSON);
             objAjax.invokeAsyncCGI("modal_axisctr193.do", callbackajaxGetPersona, 
              "operation=ajax_get_persona&SPERSON=" + SPERSON , this, objJsMessages.jslit_actualizando_registro);
            }
        
            function callbackajaxGetPersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    document.axisctr193Form.NNUMIDE.value = '';
                    document.axisctr193Form.TDESCRI.value  = '';
                    document.axisctr193Form.SPERSON.value  = '';
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");                    
               
                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
               
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");                    
               
                    var CTIPIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0) : "");
               
                    var NNUMIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                    
                    var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : ""); 
               
                    var contactos = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CONTACTOS")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CONTACTOS"), 0, 0) : ""); 

                    for (var i = 0; i < objDom.numeroDeTags(doc, "CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 1 || CTIPCON == 5 || CTIPCON == 6) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                
                                break;
                                
                            }
                     }
                    
                    
                    document.axisctr193Form.NNUMIDE.value = NNUMIDE;
                    document.axisctr193Form.TDESCRI.value = TAPELLI1+""+TAPELLI2+" ,"+TNOMBRE;
                    
                    objDom.setValorPorId("SPERSON", SPERSON); 
                     
                  
                }
            } 
            
            
            
            
            function callbackajaxGetTomador(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    document.axisctr193Form.NNUMIDE.value = '';
                    document.axisctr193Form.TDESCRI.value  = '';
                    document.axisctr193Form.SPERSON.value  = '';
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");                    
               
                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
               
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");                    
               
                    var CTIPIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0) : "");
               
                    var NNUMIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                    
                    var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : ""); 
               
                    
                    
                    document.axisctr193Form.NNUMIDE.value = NNUMIDE;
                    document.axisctr193Form.TDESCRI.value = TAPELLI1+""+TAPELLI2+" ,"+TNOMBRE;
                    
                    objDom.setValorPorId("SPERSON", SPERSON); 
                     
                  
                }
            } 
            
            
            function f_actualizar_intermediario_beneficiario(){
                 objAjax.invokeAsyncCGI("modal_axisctr193.do", callbackAjaxCargarAgente,
                                        "operation=ajax_get_intermediario_beneficiario&NNUMIDE=" + objDom.getValorComponente( document.axisctr193Form.NNUMIDE ),
                                        this, objJsMessages.jslit_cargando);
                
            }
            
            function callbackAjaxCargarAgente(ajaxResponseText){
            //alert(ajaxResponseText);
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CAGENTE")[0]))
                    {
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAGENTE"), 0, 0);
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    }
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    var CODIGO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSPERSON_OUT"), 0, 0);
                    objDom.setValorPorId("TDESCRI", NOMBREformateado);
                    objDom.setValorPorId("SPERSON", CODIGO);
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODITABLAS")[0]))
                    {
                        var CODITABLASformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODITABLAS"), 0, 0);
                        objDom.setValorPorId("CODITABLAS", CODITABLASformateado);
                    }
                }
            }
            else
            {
                //Clean resultats anteriors.
                objDom.setValorPorId("CAGENTE", "");
                objDom.setValorPorId("TDESCRI", "");
                objDom.setValorPorId("SPERSON", "");
                objDom.setValorPorId("CODITABLAS", "");
            }
            // recarrega scroll pane
                $.reinitialiseScroll(); 
             
        }
            /* ************************************************************************************************** */
            /* **************************************  AXISPER005  ********************************************** */
            /* ************************************************************************************************** */

            function  f_abrir_axisper005(faceptar, nuevaPers) {
    
                //alert("Voy a abrir la per005 jijijiijiji:"+faceptar);
                    var SPERSON = "";
                    
                    if (objUtiles.estaVacio(faceptar))
                        faceptar = "";
                        
                    if (objUtiles.estaVacio(nuevaPers)) {
                          SPERSON = document.axisctr193Form.SPERSON.value;        
                    }
                    objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=" + faceptar + "&SPERSON=" + SPERSON);
                }
    
            function f_cerrar_axisper005(faceptar) {
                    //alert("Cerrar pantalla 05");
                    objUtiles.cerrarModal("axisper005");
                    
                    if (!objUtiles.estaVacio(faceptar))
                        if (faceptar.indexOf("axisper001") > 0)
                            // Reabrir modal AXPER001 de nuevo
                            objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&faceptar=" + faceptar+"&ORIGEN=AXISCTR193");
            }
    
            function f_aceptar_axisper005 (faceptar, SPERSON) {
                     //alert("Entro en captar 005 jijijijiji");
                     //alert("faceptar:"+faceptar+" y SPERSON:"+SPERSON);
                     objUtiles.cerrarModal("axisper005");
                     /*   if (!objUtiles.estaVacio(faceptar)) {
                        
                            //alert("faceptar:"+faceptar+" y SPERSON:"+SPERSON);
                            var selectedPersonAntiguo;
                           
                            if (faceptar.indexOf("tomadores") > 0) {
                                selectedPersonAntiguo = objDom.getValorPorId("SPERSON_TOMAD");
                                objDom.setValorPorId("SPERSON_TOMAD", SPERSON);            
                             } else if (faceptar.indexOf("asegurados") > 0) {
                                selectedPersonAntiguo = objDom.getValorPorId("SPERSON_GEST");
                                objDom.setValorPorId("SPERSON_GEST", SPERSON);            
                             } else if (faceptar.indexOf("gestores") > 0) {
                                selectedPersonAntiguo = objDom.getValorPorId("SPERSON_GEST");
                                //alert("he entrado en gestores!! voy bien");
                                objDom.setValorPorId("SPERSON_GEST", SPERSON);            
                             }
                           
                            if (faceptar.indexOf("axisper001") > 0) {
                                    //alert("He pasado por la 001");
                                    // Venimos de AXPER005 pero pasando por AXPER001, es una nueva persona
                                   
                                                        objUtiles.ejecutarFormulario("axis_axisctr193.do?SPERSON_ANTIGUO="+selectedPersonAntiguo, "cambiar_tomador", document.axisctr002Form, "_self", objJsMessages.jslit_cargando);
                            } else if (faceptar.indexOf("axisper005")>0) {
                                // Procesar aceptar AXPER002 llamada directamente                
                                
                                                        objUtiles.ejecutarFormulario("axis_axisctr193.do", "guardar_gestor", document.axisctr187Form, "_self", objJsMessages.jslit_cargando);
                               
                            }
                        } */
                        
                        f_get_persona(SPERSON);
                    }    
            
            
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisctr193Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}">
            <input type="hidden" name="NORDEN" value="${__formdata.axisctr_retorno.NORDAGE}">
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}">
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="">
            <input type="hidden" name="CODITABLAS" id="CODITABLAS" value="" />
            <input type="hidden" name="IDCONVENIO" id="IDCONVENIO" value="${__formdata.IDCONVENIO}">
            <input type="hidden" name="SPERSON_SELECTED" id="SPERSON_SELECTED" value="${__formdata.SPERSON_SELECTED}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                          <axis:alt f="axisctr193" c="TIT_AXISCTR014" lit="9904183" />
                </c:param>
                <c:param name="producto"><axis:alt f="axisctr193" c="PRODUCTO_CORR" lit="9904183" /></c:param>
                <c:param name="form">axisctr193</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisctr193" c="PERSONAS" lit="102073"/></c:param>
                    <c:param name="nid">axisper001</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisctr193" c="ALTA_PERSONAS" lit="1000436"/></c:param>
                    <c:param name="nid">axisper005</c:param>
            </c:import>  
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr193" c="NNUMIDE" lit="9903661" /></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr193" c="DESCRIPCION" lit="100588" /></b>
                                        </td>
                                    </tr>    
                                    <tr>
                                <axis:ocultar f="axisctr193" c="NNUMIDE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="5">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" title="<axis:alt f="axisctr193" c="NNUMIDE" lit="100584"/>" style="width:15%"
                                                <axis:atr f="axisctr193" c="NNUMIDE" a="modificable=true&obligatorio=true"/>  onchange="f_actualizar_intermediario_beneficiario()"/>
                                        
                                        
                                        <c:if test="${__formdata.CMODO=='NUEVO'}"><img border="0" src="images/find.gif" onclick="f_abrir_axisper001_tomadores()" style="cursor:pointer"/></c:if>                                  
                                        <input type="text" class="campo campotexto" value="${__formdata.TNOMBRE} ${__formdata.TAPELLI1} ${__formdata.TAPELLI2} " name="TDESCRI" id="TDESCRI" title="<axis:alt f="axisctr193" c="TDESCRI" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                        title="<axis:alt f="axisctr193" c="TDESCRI" lit="100584"/>"/>
                                    </td>
                                </axis:ocultar>                       
                            </tr>
                                        
                             <tr>
                                      <!-- % PARTICIPACION -->
                                        <td class="titulocaja">
                                            <b>%<axis:alt f="axisctr193" c="PPARTICI" lit="101467" /></b>
                                        </td>
                                      
                                    </tr>    
                                    <tr>    
                                        
                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="PPARTICI" name="PPARTICI" size="15"
                                                            value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.PPARTICI}'/>" formato="decimal" <axis:atr f="axisctr193" c="PPARTICI" a="modificable=true&obligatorio=true&formato=decimal"/> title="<axis:alt f="axisctr193" c="CCOMISI" lit="101467"/>" />
                                                            
                                                        </td>
                                        <td class="campocaja">                                        
                                                                                             
                                    </tr>
                                    
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr193</c:param>
                <c:param name="__botones">cancelar,<axis:ocultar f="axisctr193" c = "BT_TOMADOR" dejarHueco="false">,1000102</axis:ocultar>,aceptar</c:param>
            </c:import>
                      
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

