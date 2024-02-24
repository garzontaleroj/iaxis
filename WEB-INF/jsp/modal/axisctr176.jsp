
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

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
            parent.f_cerrar_axisctr176(modo);
        }
       
        function f_actualizar_agente(CAGENTE){

           if ( objUtiles.estaVacio(CAGENTE))
                CAGENTE = objDom.getValorComponente(document.axisctr176Form.CAGENTE);
        
           //if (objValidador.validaEntrada()) {
                objAjax.invokeAsyncCGI("modal_axisctr176.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE="+CAGENTE, this, objJsMessages.jslit_cargando);
           //}  
        }
            
        function callbackAjaxCargarAgente(ajaxResponseText){
                
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){

                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    var COMISIformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("OCOMISI"), 0, 0);
                    //var RETENCformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("ORETENC"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                    objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                    if (!objUtiles.estaVacio(COMISIformateado))
                        objDom.setValorPorId("CCOMISI", COMISIformateado); 
                    //objDom.setValorPorId("CPARTICI", RETENCformateado); 
                } else {
                    objDom.setValorPorId("TAGENTE",""); 
                    objDom.setValorPorId("CAGENTE","");
                }
            }
        }  
       
        function f_onload(){
        
            var ok = "${__formdata.OK}";
            var modo = "${__formdata.CMODO}";
            var hayCorretaje = "${__formdata.hayCorretaje}";

            if ( !objUtiles.estaVacio(ok) && ok == 0){
               parent.f_aceptar_axisctr176(document.axisctr176Form.CAGENTE.value);
               f_but_cancelar();
            }

            /*if(modo == 'NUEVO'){
               objDom.setDisabledPorId("CESTADO",true);
            }*/

            var CAGENTE = "${__formdata.CAGENTE}";
            if ( !objUtiles.estaVacio(CAGENTE)){
                document.axisctr176Form.CAGENTE.value = CAGENTE;
            }

            if (hayCorretaje==0) 
                f_actualizar_agente(CAGENTE);

            f_cargar_propiedades_pantalla();
        }            
       
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                f_but_calc_comision();
            }
        }
        
        function callbackAjaxGuardar(ajaxResponseText) {
            try {                
                var doc=objAjax.domParse(ajaxResponseText);
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
            if(document.axisctr176Form.LIDER.checked){
                document.axisctr176Form.LIDER.value=1;                
                document.axisctr176Form.CLIDER.value=1;                
            } else {
                document.axisctr176Form.LIDER.value=0;                
                document.axisctr176Form.CLIDER.value=0;                
            }
        } 
        
        function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CORRETAJE_TODOS_TIPAGE_4");
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    

        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("modal_axisctr176.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
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
            if(valor<0) return 1;
            else return 0;
        }
        
        function f_but_calc_comision(){
           //if (objValidador.validaEntrada()) {
                objAjax.invokeAsyncCGI("modal_axisctr176.do", callbackAjaxAceptar, "operation=ajax_calcular_comision&CAGENTE="+document.axisctr176Form.CAGENTE.value+"&CPARTICI="+document.axisctr176Form.CPARTICI.value, this, objJsMessages.jslit_cargando);
           //}  
        }
        
        function callbackAjaxAceptar(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){

                if(document.axisctr176Form.LIDER.checked){
                    document.axisctr176Form.LIDER.value=1;                
                    document.axisctr176Form.CLIDER.value=1;                
                } else {
                    document.axisctr176Form.LIDER.value=0;                
                    document.axisctr176Form.CLIDER.value=0;                
                }    
                
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OCOMISI")[0])){
                	
                	var COMISIformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("OCOMISI"), 0, 0);                	
	                var comi = objNumero.cambiarSeparadorMilesPorDecimales(COMISIformateado);
	                
	                if (!objUtiles.estaVacio(comi)) {
	                        objDom.setValorPorId("CCOMISI", comi); 
	                        document.axisctr176Form.CCOMISI.value = comi;
	                }
                }

                var parti = document.axisctr176Form.CPARTICI.value;
                if(f_comprobar_negativo(comi) == 0 && f_comprobar_negativo(parti)== 0)
                    objUtiles.ejecutarFormulario ("modal_axisctr176.do", "aceptar", document.axisctr176Form, "_self", objJsMessages.jslit_cargando);                      
                else
                    alert("<axis:alt f='axisctr176' c='ALERTNEG' lit='9902884'/>");
            }
        }  
            
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisctr176Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">                        
            <input type="hidden" name="NORDEN" value="${__formdata.axisctr_corretaje.NORDAGE}">
            <input type="hidden" name="hayCorretaje" value="${__formdata.hayCorretaje}">

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <c:if test="${__formdata.CMODO == 'NUEVO'}">  
                        <axis:alt f="axisctr176" c="TIT_AXISCTR014" lit="9902528" />
                    </c:if>
                    <c:if test="${__formdata.CMODO != 'NUEVO'}">  
                        <axis:alt f="axisctr176" c="TIT_AXISCTR014" lit="9902529" />
                    </c:if>
                </c:param>
                <c:param name="producto"><axis:alt f="axisctr176" c="PRODUCTO_CORR" lit="9902530" /></c:param>
                <c:param name="form">Axisctr176</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                <c:if test="${__formdata.CMODO == 'NUEVO'}">  
                    <axis:alt f="axisctr176" c="TIT_AXISCTR014" lit="9902528" />
                </c:if>
                <c:if test="${__formdata.CMODO != 'NUEVO'}">  
                    <axis:alt f="axisctr176" c="TIT_AXISCTR014" lit="9902529" />
                </c:if>
                </c:param>
                <c:param name="nid" value="axisctr014" />
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
                                            <b><axis:alt f="axisctr176" c="CAGENTE" lit="1000109" /></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr176" c="TAGENTE" lit="100588" /></b>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <axis:ocultar f="axisctr176" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                            <td class="campocaja" colspan="5">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.axisctr_corretaje.CAGENTE}" name="CAGENTE" id="CAGENTE"  title="<axis:alt f="axisctr176" c="CAGENTE" lit="100584"/>"  style="width:15%"
                                                title="<axis:alt f="axisctr176" c="CAGENTE" lit="100584" />" <axis:atr f="axisctr176" c="CAGENTE_TEXT" a="modificable=true&obligatorio=true"/>  onchange="f_actualizar_agente()"/>

                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>                                        
                                                <input type="text" class="campo campotexto" value="${__formdata.axisctr_corretaje.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisctr176" c="TAGENTE" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                                title="<axis:alt f="axisctr176" c="TAGENTE" lit="100584"/>"/>
                                            </td>
                                        </axis:ocultar>                       
                                    </tr>
                                        
                                    <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr176" c="CPARTICI" lit="104818" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr176" c="ISLIDER" lit="9902425" /></b>
                                            </td>
                                            <!--
                                            <axis:ocultar f="axisctr176" c="CCOMISI" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr176" c="CCOMISI" lit="9001923" /></b>
                                                </td>
                                            </axis:ocultar>
                                            -->
                                    </tr>    
                                    <tr>    
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="CPARTICI" name="CPARTICI" size="15"
                                            value="${__formdata.axisctr_corretaje.PPARTICI}" formato="decimal" <axis:atr f="axisctr176" c="CPARTICI" a="modificable=true&obligatorio=true"/> title="<axis:alt f="axisctr176" c="CCOMISI" lit="104818"/>" />
                                        </td>
                                        <td class="campocaja">                                        
                                            <input type="hidden" name="CLIDER" value="${__formdata.axisctr_corretaje.ISLIDER}"> 
                                            <input type="checkbox" <c:if test="${__formdata.axisctr_corretaje.ISLIDER == '1' || __formdata.hayCorretaje == 0}">checked="checked"</c:if>
                                             name="LIDER" id="LIDER" onclick="javascript:f_actualizar_valor()" value="${__formdata.axisctr_corretaje.ISLIDER}" <axis:atr f="axisctr176" c="LIDER" a="modificable=false&obligatorio=true&isInputText=false"/> />
                                        </td>                                                        
                                        <axis:ocultar f="axisctr176" c="CCOMISI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="hidden" class="campo campotexto" id="CCOMISI" name="CCOMISI" size="15" 
                                                value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.axisctr_corretaje.PCOMISI}'/>" <axis:atr f="axisctr176" c="CCOMISI" a="modificable=false&obligatorio=false"/> title="<axis:alt f="axisctr176" c="CCOMISI" lit="9001923"/>" />
                                            </td>
                                        </axis:ocultar>
                                        <!--
                                        <td>
                                            <axis:visible f="axisctr176" c="BT_CALC_COMIS"> 
                                                <input type="button" class="boton" id="but_calc_comision" value="<axis:alt f="axisctr175" c="BT_CALC_COMIS" lit="9903928"/>" onclick="f_but_calc_comision()" />                      
                                            </axis:visible>
                                        </td>
                                        -->
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr176</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
                      
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

