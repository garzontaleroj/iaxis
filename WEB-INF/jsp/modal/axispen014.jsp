<%/*
*  Fichero: axispen014.jsp - Alta/Mod. Plan de pensiones
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
    <title><axis:alt c="title" f="axispen014" lit="9900904"/></title> 
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
            if (!objUtiles.estaVacio(objDom.getValorPorId("CCODPLA"))){
                document.miForm.CODDGS.setAttribute('readonly','true');
            }
            if (objDom.getValorPorId("GRABAR_OK")== '0'){
                parent.f_aceptarAxispen014(objDom.getValorPorId("CCODPLA"));
            }
            
        }

        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen014');
        }

        function f_but_aceptar() {
                if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axispen014.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    
 

            
        function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
           } 


            function f_aceptar_axispen008(CCODFON,CFONDGS,TFONDO) {
                objDom.setValorPorId("CCODFON",CCODFON );
                objDom.setValorPorId("TFONDO",TFONDO );
                objDom.setValorPorId("CFONDGS",CFONDGS );
                objUtiles.cerrarModal("axispen008"); 
        
            }
            function f_but_buscar_fondo(){
                f_abrir_modal("axispen008");
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
    </script>    
</head>

<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    <form name="miForm" action="f_onload()" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axispen014" lit="108879"/></c:param>     
            <c:param name="formulario"><axis:alt c="FORMULARIO" f="axispen014" lit="108879"/></c:param> 
            <c:param name="form">axispen014</c:param>
        </c:import>
              
        <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt c="TAXISPER021" f="axispen014" lit="9000642"/></c:param>
                    <c:param name="nid">axisper021</c:param>
        </c:import>  

         <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axispen008|<axis:alt c="TITULO_008" f="axispen014" lit="9900865"/><%-- Cercador de fons de pensions --%>
            </c:param>
        </c:import>
        <%--<input type="hidden" name="operation" value=""/>        --%>
        <input type="hidden" name="operation" value="" />
        <input type="hidden" id="CCODPLA" name="CCODPLA" value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.CCODPLA}"/> 
        <input type="hidden" id="CCODFON" name="CCODFON" value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.CCODFON}"/>    
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
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt c="CODDGS" f="axispen014" lit="1000109"/></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt c="NOMBRE" f="axispen014" lit="105940"/></b>      
                                        </td>
                                    </tr>

                                    <tr>

                                            <td class="titulocaja"> 
                                                <input type="text" name="CODDGS" id="CODDGS" value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.CODDGS}" 
                                                    class="campowidthinput campo campotexto_ob" style="width:80%" 
                                                    <axis:atr f="axispen014" c="CODDGS" a="modificable=true&obligatorio=true"/> 
                                                    alt="<axis:alt c="CODDGS" f="axispen014" lit="9900843"/>" title="<axis:alt c="CODDGS" f="axispen014" lit="9900843"/>"/>
                                            </td>        
                                            <td class="titulocaja">                                                    
                                                <input type="text" name="TNOMPLA" id="TNOMPLA" value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.TNOMPLA}" 
                                                    class="campowidthinput campo campotexto_ob" style="width:100%" 
                                                    <axis:atr f="axispen014" c="TNOMPLA" a="modificable=true&obligatorio=true"/> 
                                                    alt="<axis:alt c="TNOMPLA" f="axispen014" lit="105940"/>" title="<axis:alt c="TNOMPLA" f="axispen014" lit="105940"/>"/>
                                            </td>    
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen014" c="FALTARE" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="FALTARE" f="axispen014" lit="9001192"/></b>      
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen014" c="FADMISI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt c="FADMISI" f="axispen014" lit="9905754"/></b>      
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen014" c="FALTARE" dejarHueco="false">
                                        <td class="campocaja">
                                            <input  style="width:75%" type="text" class="campowidthinput campo campotexto_ob" id="FALTARE" name="FALTARE" size="15"
                                            value ="<fmt:formatDate value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.FALTARE}" pattern="dd/MM/yyyy"/>" onblur="javascript:f_formatdate(this,'')" 
                                            title="<axis:alt f="axispen014" c="FALTARE" lit="9001192"/>" 
                                            <axis:atr f="axispen014" c="FALTARE" a="modificable=false&obligatorio=true&formato=fecha"/>/>
                                            <a id="icon_FALTARE" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axispen014" c="ICO_FALTARE" lit="9905754" />"  
                                            title="<axis:alt f="axispen014" c="ICO_FALTARE" lit="9905754" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen014" c="FADMISI" dejarHueco="false">
                                        <td class="campocaja">
                                            <input style="width:75%"  type="text" class="campowidthinput campo campotexto_ob" id="FADMISI" name="FADMISI" size="15"
                                            value ="<fmt:formatDate value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.FADMISI}" pattern="dd/MM/yyyy"/>" 
                                            onblur="javascript:f_formatdate(this,'')" 
                                            title="<axis:alt f="axispen014" c="FADMISI" lit="9905754"/>" 
                                            <axis:atr f="axispen014" c="FADMISI" a="modificable=true&obligatorio=true&formato=fecha"/>/><a id="icon_FADMISI" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axispen014" c="ICO_FADMISI" lit="9905754" />"  title="<axis:alt f="axispen014" c="ICO_FADMISI" lit="9905754" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axispen014" c="CMODALI" dejarHueco="false">
                                        <td class="titulocaja"><b><axis:alt f="axispen014" c="CMODALI_TIT" lit="100943"/></b></td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axispen014" c="CSISTEM" dejarHueco="false">
                                        <td class="titulocaja"><b><axis:alt f="axispen014" c="CSISTEM_TIT" lit="9900821"/></b></td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:visible f="axispen014" c="CMODALI">
                                    <td class="campocaja" >
                                     <select name="CMODALI" id="CMODALI" size="1" class="campowidthselect campo campotexto" style="width:75%;" 
                                        onchange=""                                        
                                        title="<axis:alt f="axispen014" c="CMODALI_LIT" lit="100943"/>"
                                        <axis:atr f="axispen014" c="CMODALI" a="obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispen014" c="CMODALI_ALT2" lit="1000348"/> - </option>
                                             <c:forEach var="element" items="${__formdata.listValores.modalidades}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.CMODALI}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispen014" c="CSISTEM">
                                    <td class="campocaja" >
                                     <select name="CSISTEM" id="CSISTEM" size="1" class="campowidthselect campo campotexto" style="width:75%;" 
                                        onchange=""                                        
                                        title="<axis:alt f="axispen014" c="CSISTEM_LIT" lit="9900821"/>"
                                        <axis:atr f="axispen014" c="CSISTEM" a="obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispen014" c="CSISTEM_ALT2" lit="1000348"/> - </option>
                                             <c:forEach var="element" items="${__formdata.listValores.sistemas}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.CSISTEM}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                        <axis:visible f="axispen014" c="CFONDGS">
                                            <td class="titulocaja"> 
                                                <b id="label_CFONDGS"><axis:alt c="CFONDGS" f="axispen014" lit="9001352"/></b> 
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen014" c="TFONDO">
                                            <td class="titulocaja" >
                                                <b id="label_TFONDO"><axis:alt c="TFONDO" f="axispen014" lit="1000179"/></b>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                      <axis:visible f="axispen014" c="CFONDGS">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.CFONDGS}" 
                                                name="CFONDGS" id="CFONDGS" style="width:75%;" 
                                                <axis:atr f="axispen014" c="CFONDGS" a="modificable=false&obligatorio=true"/>
                                                alt="<axis:alt c="CFONDGS" f="axispen014" lit="9001352"/>" title="<axis:alt c="CFONDGS" f="axispen014" lit="9001352"/>"
                                                />

                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axispen014" c="TFONDO">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.AXIS_PLAN.OB_IAX_PLANPENSIONES.TFONDO}"
                                                name="TFONDO" id="TFONDO" style="width:100%;"
                                                <axis:atr f="axispen014" c="TFONDO" a="modificable=false&obligatorio=true"/> />
                                             </td>
                                             <td class="campocaja" >
                                                <input type="button" onclick="f_but_buscar_fondo()" class="boton" value="<axis:alt f="axispen014" c="LIT_BUT_GESTORAS" lit="100797"/>"/>
                                            </td>
                                        </axis:visible>                                        
                                    </tr>

           
                       </table>
                    </table>
                    <div class="separador">&nbsp;</div>                

                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>                        
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispen014</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param> 
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
        inputField     :    "FADMISI",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FADMISI",  
        singleClick    :    true,
        firstDay       :    1
    });
</script>
    <c:import url="../include/mensajes.jsp"/>



</body>
</html>