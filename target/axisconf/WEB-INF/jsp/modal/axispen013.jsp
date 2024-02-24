<%/*
*  Fichero: axispen013.jsp - Alta/Mod. Fondos de pensiones
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
    <title><axis:alt c="title" f="axispen013" lit="9900904"/></title> 
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
            if (!objUtiles.estaVacio(objDom.getValorPorId("CCODFON"))){
                document.miForm.CODDGS.setAttribute('readonly','true');
            }
            if (objDom.getValorPorId("GRABAR_OK")== '0'){
                parent.f_aceptarAxispen013(objDom.getValorPorId("CCODFON"));
            }
            
        }
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen013');
        }

        function f_but_guardar() {
            if (objValidador.validaEntrada()){
                objUtiles.ejecutarFormulario("modal_axispen013.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        function inicializaCBANCAR(){
            if(document.miForm.CBANCAR){
                document.miForm.CBANCAR.value = '';
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
                objDom.setValorPorId("TFONDO",TNOMBRE+" "+TAPELLI1+" "+TAPELLI2 );
            }
        }
    </script>    
</head>

<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    <form name="miForm" action="f_onload()" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="titulo" f="axispen013" lit="108879"/></c:param>     
            <c:param name="formulario"><axis:alt c="formulario" f="axispen013" lit="108879"/></c:param> 
            <c:param name="form">axispen013</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen007|<axis:alt c="axispen007_TITULO" f="axispen013" lit="9900864"/><%-- Buscador de gestores --%>
                </c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axispen013" c="PERSONAS" lit="102073"/></c:param>
            <c:param name="nid">axisper021</c:param>
    </c:import>
        <input type="hidden" name="operation" value="" />
        <input type="hidden" id="CCODFON" name="CCODFON" value="${__formdata.FONPENSION.CCODFON}"/>    
        <input type="hidden" id="CCODGES" name="CCODGES" value="${__formdata.FONPENSION.CCODGES}"/> 
        <input type="hidden" id="SPERSON" name="SPERSON " value="${__formdata.FONPENSION.SPERSON }"/>
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
                                        <b><axis:alt c="CODDGS" f="axispen013" lit="1000109"/></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt c="TFONDO" f="axispen013" lit="105940"/></b>      
                                    </td>
                                </tr>
                                <tr>
                                    <td class="titulocaja">                                                    
                                        <input type="text" name="CODDGS" id="CODDGS" maxlength="10" value="${__formdata.FONPENSION.CODDGS}" 
                                            class="campowidthinput campo campotexto_ob" style="width:75%" 
                                            <axis:atr f="axispen013" c="CODDGS" a="modificable=true&obligatorio=true"/> 
                                            alt="<axis:alt c='CODDGS' f='axispen013' lit='9900843'/>" title="<axis:alt c='CODDGS' f='axispen013' lit='9900843'/>"/>
                                    </td>        
                                    <td class="titulocaja">                                                    
                                        <input type="text" name="TFONDO" id="TFONDO" maxlength="100" value="${__formdata.FONPENSION.TFONDO}" 
                                            class="campowidthinput campo campotexto_ob" style="width:100%" 
                                            <axis:atr f="axispen013" c="TFONDO" a="modificable=false&obligatorio=true"/> 
                                            alt="<axis:alt c='TFONDO' f='axispen013' lit='105940'/>" title="<axis:alt c='TFONDO' f='axispen013' lit='105940'/>"/>
                                    </td>
                                    <td class="campocaja" >
                                        <input type="button" onclick="f_but_buscar_persona()" class="boton" value="<axis:alt f="axispen013" c="LIT_BUT_GESTORAS" lit="100797"/>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen013" c="CTIPBAN" dejarHueco="false">
                                        <td class="titulocaja"><b><axis:alt f="axispen013" c="CTIPBAN_TIT" lit="1000374"/></b></td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen013" c="CBANCAR" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axispen013" c="CBANCAR" lit="100965"/></b>  <!-- Cuenta Bancaria -->
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:visible f="axispen013" c="CTIPBAN">
                                    <td class="campocaja" >
                                     <select name="CTIPBAN" id="CTIPBAN" size="1" class="campowidthselect campo campotexto" style="width:75%;" 
                                        onchange="javascript:inicializaCBANCAR();"                                        
                                        title="<axis:alt f="axispen013" c="CTIPBAN_LIT" lit="1000374"/>"
                                        <axis:atr f="axispen013" c="CTIPBAN" a="obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispen013" c="CTIPBAN_ALT2" lit="1000348"/> - </option>
                                             <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                                <option value = "${element.CTIPBAN}" 
                                                <c:if test="${element.CTIPBAN == __formdata.FONPENSION.CTIPBAN}"> selected </c:if> />
                                                ${element.TTIPO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                            
                                    <axis:visible f="axispen013" c="CBANCAR">
                                    <td class="campocaja">
                                        <input type="text" style="width:75%" class="campowidthinput campo campotexto" size="15" value="${__formdata.FONPENSION.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:99%;"
                                               title="<axis:alt f="axispen013" c="CBANCAR_LIT" lit="100965"/>"
                                               <axis:atr f="axispen013" c="CBANCAR" a="obligatorio=false"/>/>
                                    </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen013" c="FALTARE" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="FALTARE" f="axispen013" lit="9001192"/></b>      
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen013" c="FBAJARE" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="FBAJARE" f="axispen013" lit="9001510"/></b>      
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen013" c="FALTARE" dejarHueco="false">
                                        <td class="campocaja">
                                            <input  style="width:75%" type="text" class="campowidthinput campo campotexto_ob" id="FALTARE" name="FALTARE" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FONPENSION.FALTARE}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" 
                                            title="<axis:alt f="axispen013" c="FALTARE" lit="9001192"/>" 
                                            <axis:atr f="axispen013" c="FALTARE" a="modificable=false&obligatorio=true&formato=fecha"/>/>
                                            <a id="icon_FALTARE" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axispen013" c="ICO_FALTARE" lit="108341" />"  
                                            title="<axis:alt f="axispen013" c="ICO_FALTARE" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen013" c="FBAJARE" dejarHueco="false">
                                        <td class="campocaja">
                                            <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FBAJARE" name="FBAJARE" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FONPENSION.FBAJARE}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" title="<axis:alt f="axispen013" c="FBAJARE" lit="9001510"/>" <axis:atr f="axispen013" c="FBAJARE" a="modificable=true&obligatorio=false&formato=fecha"/>/><a id="icon_FBAJARE" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axispen013" c="ICO_FBAJARE" lit="108341" />"  title="<axis:alt f="axispen013" c="ICO_FBAJARE" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                 <tr>
                                        <axis:visible f="axispen013" c="CGESDGS">
                                            <td class="titulocaja"> 
                                                <b id="label_CGESDGS"><axis:alt c="CGESDGS" f="axispen013" lit="9905714"/></b> <%-- Codi Gestora--%>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen013" c="TNOMGES">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMGES"><axis:alt c="TNOMGES" f="axispen013" lit="9905713"/></b> <%-- Nom Gestora --%>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                      <axis:visible f="axispen013" c="CGESDGS">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.FONPENSION.CGESDGS}" 
                                                name="CGESDGS" id="CGESDGS" style="width:75%;" 
                                                <axis:atr f="axispen013" c="CGESDGS" a="modificable=false&obligatorio=true"/>  />
                                                
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axispen013" c="TNOMGES">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.FONPENSION.TCODGES}"
                                                name="TNOMGES" id="TNOMGES" style="width:100%;"
                                                <axis:atr f="axispen013" c="CGESDGS" a="modificable=false&obligatorio=true"/> />
                                             </td>
                                             <td class="campocaja" >
                                                <input type="button" onclick="f_but_buscar_gestores()" class="boton" value="<axis:alt f="axispen013" c="LIT_BUT_GESTORAS" lit="100797"/>"/>
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
        
        <!--<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar </c:if>-->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispen013</c:param>
            <c:param name="__botones">cancelar,guardar</c:param> 
        </c:import>
    
    </form>

    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FALTARE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FALTARE", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FBAJARE",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FBAJARE",  
        singleClick    :    true,
        firstDay       :    1
    });
</script>
    <c:import url="../include/mensajes.jsp"/>



</body>
</html>