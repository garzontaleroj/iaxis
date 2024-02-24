<%/*
*  Fichero: axispen012.jsp - Alta/Mod. Fondos de pensiones
*
*  Fecha: 28/12/2009
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
    <title><axis:alt c="title" f="axispen012" lit="9900904"/></title> 
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
            
            f_cargar_propiedades_pantalla();
            //Si es alta el campo CODDGS es modificable.
            
            if (!objUtiles.estaVacio(objDom.getValorPorId("CCODGES"))){
                document.miForm.CODDGS.setAttribute('readonly','true');
            }
            if (objDom.getValorPorId("GRABAR_OK")== '0'){
                parent.f_aceptarAxispen012(objDom.getValorPorId("CCODGES"));
            }
            
        }
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen012');
        }

        function f_but_guardar() {
            if (objValidador.validaEntrada()){
              
                objUtiles.ejecutarFormulario("modal_axispen012.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        function inicializaNCUENTA(){
            if(document.miForm.NCUENTA){
                document.miForm.NCUENTA.value = '';
            }
        }
        
        function f_aceptar_persona (SPERSON,CAGENTE, SNIP, cual){
            f_cerrar_modal("axisper021");
            objDom.setValorPorId("SPERSON",SPERSON );
            f_get_persona(SPERSON);
            
        }
        function f_cerrar_modalesperson ( cual){
            f_cerrar_modal("axisper021");
        }
        function f_but_buscar_gestores() {
            f_abrir_modal("axispen007");                
         } 
        function f_abrir_modal(cual, noXButton, optionalQueryString) {         
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";                    
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_but_buscar_persona() {
            f_abrir_modal('axisper021', true, "&modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");
        }
        
        function f_cerrar_modalespersona(cual){
            f_cerrar_modal("axisper021");
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_axispen007(CCODGES,CGESDGS,TCODGES){
            objDom.setValorPorId("CGESDGS",CGESDGS );
            objDom.setValorPorId("CCODGES",CCODGES );
            objDom.setValorPorId("TNOMGES",TCODGES );
            f_cerrar_modal("axispen007");
        }
        function f_formatdate(entrada,title){        
            var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisadm003" c="ALERT_FORMDATE" lit="1000421"/>");
                }
            }
        }
        
        
        function f_get_persona(SPERSON){
            var cagenteper = "${__formdata.CAGENTE_SESSION}";
            var xurl="axis_axissin032.do?"+"operation=ajax_get_persona&SPERSON=" + SPERSON+"&CAGENTE="+cagenteper;      
            $.ajax({
                url: xurl,
                success: callbackajaxGetPersona,
                error : errorf,
                dataType:'text'
                });              
        }
        function errorf(a) {
            //alert(a);
        }
        function callbackajaxGetPersona(ajaxResponseText) {
            
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");  
                var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
                var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");   
                objDom.setValorPorId("TGESTORA",TNOMBRE+" "+TAPELLI1+" "+TAPELLI2 );
            }
        }
        
    </script>    
</head>

<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    <form name="miForm" action="f_onload()" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="titulo" f="axispen012" lit="108879"/></c:param>     
            <c:param name="formulario"><axis:alt c="formulario" f="axispen012" lit="108879"/></c:param> 
            <c:param name="form">axispen012</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen007|<axis:alt c="axispen007_TITULO" f="axispen012" lit="9900864"/><%-- Buscador de gestores --%>
                </c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axispen012" c="PERSONAS" lit="102073"/></c:param>
            <c:param name="nid">axisper021</c:param>
    </c:import>
        <input type="hidden" name="operation" value="" />
        <input type="hidden" id="CCODGES" name="CCODGES" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.CCODGES }"/>  
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.PERSONA.SPERSON}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO }"/>    
        <input type="hidden" id="GRABAR_OK" name="GRABAR_OK" value="${__formdata.GRABAR_OK }"/>    
        

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                              <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <tr>
                                    <td class="titulocaja">
                                        <b><axis:alt c="CODDGS" f="axispen012" lit="1000109"/></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt c="TGESTORA" f="axispen012" lit="105940"/></b>      
                                    </td>
                                </tr>
                                <tr>
                                    <td class="titulocaja"> 
                                        <input type="text" name="CODDGS" id="CODDGS" maxlength="10" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.CODDGS}" 
                                            class="campowidthinput campo campotexto_ob" style="width:75%" 
                                            <axis:atr f="axispen012" c="CODDGS" a="modificable=true&obligatorio=true"/> 
                                            alt="<axis:alt c='CODDGS' f='axispen012' lit='9900843'/>" title="<axis:alt c='CODDGS' f='axispen012' lit='9900843'/>"/>
                                    </td>        
                                    <td class="titulocaja">                                                    
                                        <input type="text" name="TGESTORA" id="TGESTORA" maxlength="100" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.PERSONA.TAPELLI1 }" 
                                            class="campowidthinput campo campotexto_ob" style="width:100%" 
                                            <axis:atr f="axispen012" c="TGESTORA" a="modificable=false&obligatorio=true"/> 
                                            alt="<axis:alt c='TGESTORA' f='axispen012' lit='105940'/>" title="<axis:alt c='TGESTORA' f='axispen012' lit='105940'/>"/>
                                    </td>
                                    <td class="campocaja" >
                                        <input type="button" onclick="f_but_buscar_persona()" class="boton" value="<axis:alt f="axispen012" c="LIT_BUT_GESTORAS" lit="100797"/>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen012" c="NCUENTA" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axispen012" c="NCUENTA" lit="100965"/></b>  <!-- Cuenta Bancaria -->
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                          
                                    <axis:visible f="axispen012" c="NCUENTA">
                                    <td class="campocaja">
                                        <input type="text" style="width:75%" class="campowidthinput campo campotexto" size="15" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.NCUENTA}" name="NCUENTA" id="NCUENTA" style="width:99%;"
                                               title="<axis:alt f="axispen012" c="NCUENTA_LIT" lit="100965"/>"
                                               <axis:atr f="axispen012" c="NCUENTA" a="obligatorio=false"/>/>
                                    </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen012" c="FALTA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="FALTA" f="axispen012" lit="9001192"/></b>      
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen012" c="FBAJA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="FBAJA" f="axispen012" lit="9001510"/></b>      
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen012" c="FALTA" dejarHueco="false">
                                        <td class="campocaja">
                                            <input  style="width:75%" type="text" class="campowidthinput campo campotexto_ob" id="FALTA" name="FALTA" size="15"
                                            value ="<fmt:formatDate value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.FALTA}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" 
                                            title="<axis:alt f="axispen012" c="FALTA" lit="9001192"/>" 
                                            <axis:atr f="axispen012" c="FALTA" a="modificable=false&obligatorio=true&formato=fecha"/>/>
                                            <a id="icon_FALTA" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axispen012" c="ICO_FALTA" lit="108341" />"  
                                            title="<axis:alt f="axispen012" c="ICO_FALTA" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen012" c="FBAJA" dejarHueco="false">
                                        <td class="campocaja">
                                            <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FBAJA" name="FBAJA" size="15"
                                            value ="<fmt:formatDate value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.FBAJA}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" title="<axis:alt f="axispen012" c="FBAJA" lit="9001510"/>" <axis:atr f="axispen012" c="FBAJA" a="modificable=true&obligatorio=false&formato=fecha"/>/><a id="icon_FBAJA" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axispen012" c="ICO_FBAJA" lit="108341" />"  title="<axis:alt f="axispen012" c="ICO_FBAJA" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:visible f="axispen012" c="CBANCO">
                                        <td class="titulocaja"> 
                                            <b id="label_CBANCO"><axis:alt c="CBANCO" f="axispen012" lit="9000964"/></b> 
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axispen012" c="COFICIN">
                                        <td class="titulocaja" >
                                            <b id="label_COFICIN"><axis:alt c="COFICIN" f="axispen012" lit="102347"/></b> 
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                      <axis:visible f="axispen012" c="CBANCO">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.CBANCO}" 
                                                name="CBANCO" id="CBANCO" style="width:75%;" 
                                                <axis:atr f="axispen012" c="CBANCO" a="modificable=true&obligatorio=true"/>  />
                                                
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axispen012" c="COFICIN">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.COFICIN}"
                                                name="COFICIN" id="COFICIN" style="width:100%;"
                                                <axis:atr f="axispen012" c="COFICIN" a="modificable=true&obligatorio=true"/> />
                                             </td>
                                        </axis:visible>                                        
                                </tr>
                                <tr>
                                    <axis:visible f="axispen012" c="CDC">
                                        <td class="titulocaja"> 
                                            <b id="label_CDC"><axis:alt c="CDC" f="axispen012" lit="9905743"/></b> 
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axispen012" c="TIMECLOSE">
                                        <td class="titulocaja"> 
                                            <b id="label_TIMECLOSE"><axis:alt c="TIMECLOSE" f="axispen012" lit="9907334"/></b> 
                                        </td>
                                    </axis:visible>
                                    <%--
                                    <axis:visible f="axispen012" c="SPERTIT">
                                        <td class="titulocaja" >
                                            <b id="label_SPERTIT"><axis:alt c="SPERTIT" f="axispen012" lit="9905713"/></b> 
                                        </td>
                                    </axis:visible>
                                    --%>
                                </tr>
                                <tr>
                                      <axis:visible f="axispen012" c="CDC">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.CDC}" 
                                                name="CDC" id="CDC" style="width:75%;" 
                                                <axis:atr f="axispen012" c="CDC" a="modificable=true&obligatorio=true"/>  />
                                                
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen012" c="TIMECLOSE">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" maxlength="5" size="15" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.TIMECLOSE}" 
                                                name="TIMECLOSE" id="TIMECLOSE" style="width:75%;" 
                                                <axis:atr f="axispen012" c="TIMECLOSE" a="modificable=true&obligatorio=true&formato=hora"/>/>
                                                
                                            </td>
                                        </axis:visible>
                                        <%--
                                        <axis:visible f="axispen012" c="SPERTIT">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CODGESTORAS[0].OB_IAX_GESTORAS.SPERTIT}"
                                                name="SPERTIT" id="SPERTIT" style="width:100%;"
                                                <axis:atr f="axispen012" c="SPERTIT" a="modificable=false&obligatorio=true"/> />
                                             </td>
                                        </axis:visible>  
                                        --%>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
        
        <!--<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar </c:if>-->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispen012</c:param>
            <c:param name="__botones">cancelar,guardar</c:param> 
        </c:import>
    
    </form>

    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FALTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FALTA", 
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
    <c:import url="../include/mensajes.jsp"/>



</body>
</html>