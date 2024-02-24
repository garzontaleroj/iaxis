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
            <axis:alt f="axisprf105" c="TIT_AXISPRF105" lit="1000431"/>
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
            objDom.setValorPorId("pSTARIFA",'${__formdata.STARIFA}');
            
            if (val1=="OK"){
                parent.f_aceptar_modal("axisprf105","STARIFA_OUT="+'${__formdata.STARIFA_OUT}'+
                                                    "&SSERVIC="+$("#SSERVIC").val()+
                                                    "&TDESCRI="+$("#TDESCRI").val());
            }
            MODO = '${__formdata.MODO}'; 
            if (MODO == 'modificar'){
                $("#FFINVIG").fadeIn();
                $("#tit_FFINVIG").fadeIn();
                $("#popup_calendario_FFINVIG").fadeIn();
            }
        }
        
        function f_but_aceptar(){
            if(document.miForm.CSELECC.checked){
               document.miForm.CSELECC.value=1;
            }else{
               document.miForm.CSELECC.value=0;
            }
            if (objValidador.validaEntrada()) {  
                objUtiles.ejecutarFormulario ("modal_axisprf105.do", "guardar", document.miForm, "_self"); 
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axisprf105");
        }
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if (cual == "axisfileupload")
               objUtiles.ejecutarFormulario ("modal_axisprf105.do?isNew=no&SSEGURO=${__formdata.SSEGURO}&NMOVIMI=${__formdata.NMOVIMI}", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                                     
        }
        
        function f_carga_calculo_precio(){
            var qs="operation=ajax_carga_calculo_precio";
            if ($("#CTIPCAL").val()>=0){
                qs=qs+"&CTIPCAL="+$("#CTIPCAL").val();
                objAjax.invokeAsyncCGI("modal_axisprf105.do", f_callbackajaxCargaCalculoPrecio, qs, this);
            }else{
                f_callbackajaxCargaCalculoPrecio();
            }
        }
        
        function f_callbackajaxCargaCalculoPrecio(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CATRIBU"); 
                var cuantos = elementos.length;
                var CMAGNITCombo = document.getElementById("CMAGNIT");
                objDom.borrarOpcionesDeCombo(CMAGNITCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf105" c="SELECC" lit="108341"/> - ',
                                       CMAGNITCombo, 0);
                for (i = 0; i < cuantos; i++) {
                     var CATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                     var TATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0); 
                     objDom.addOpcionACombo(CATRIBU, TATRIBU, CMAGNITCombo, i+1);
                }
            }// recarrega scroll pane
            var modo = "${__formdata.MODO}";
            if (modo = "modificar"){
                $("#CMAGNIT").val("${__formdata.CMAGNIT}")
            }
            $.reinitialiseScroll(); 
        }
        
    </script>
    </head>
    <body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="modal_axisprf105.do" method="POST">
            <input type="hidden" name="operation" value="guardar"/>
            <input type="hidden" name="STARIFA" value="${__formdata.STARIFA}"/>
            <input type="hidden" name="MODO" value="${__formdata.MODO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <c:if test="${__formdata.MODO == 'actualizar'}"><axis:alt f="axisprf105" c="TIT_AXISPRF105" lit="9900736"/></c:if>
                    <c:if test="${__formdata.MODO != 'actualizar'}"><axis:alt f="axisprf105" c="TIT_AXISPRF105" lit="9904855"/></c:if>
                </c:param>
                <c:param name="formulario">
                    <axis:alt f="axisprf105" c="FORM_AXISPRF105" lit="9904856"/>
                </c:param>
                <c:param name="form">axisprf105</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                   <tr><td>
                        <table class="seccion">
                           <tr>
                               <th style="width:25%;height:0px">&nbsp;</th>
                               <th style="width:25%;height:0px">&nbsp;</th>
                               <th style="width:25%;height:0px">&nbsp;</th>
                               <th style="width:25%;height:0px">&nbsp;</th>                               
                           </tr>
                           <div class="separador">&nbsp;</div>
                           <tr>
                               <axis:visible f="axisprf105" c="SSERVIC" >
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="TIT_SSERVIC" lit="9904857"/></b>
                                   </td>
                               </axis:visible>
                               <axis:visible c="CCODCUP" f="axisprf105">
                                   <td class="titulocaja" id="tit_CCODCUP">
                                       <b><axis:alt f="axisprf105" c="CCODCUP" lit="9904867"/></b>
                                   </td> 
                               </axis:visible>
                            </tr>
                            <tr>
                               <axis:ocultar f="axisprf105" c="SSERVIC" >
                                    <td class="campocaja">
                                        <c:if test="${__formdata.MODO == 'modificar' or __formdata.MODO == 'actualizar'}">
                                            <input type="text" class="campo campotexto" value="${__formdata.OBIAXSERVI.SSERVIC}"  name="SSERVIC" id="SSERVIC" size="15"
                                                   readonly="true" style="width:50%"/>
                                        </c:if>
                                        <c:if test="${__formdata.MODO != 'modificar' && __formdata.MODO != 'actualizar'}">
                                            <c:forEach var="sservic" items="${listValores.LSTSSERVIC}">
                                                <input type="text" class="campo campotexto" value="${sservic.SSERVIC}"  name="SSERVIC" id="SSERVIC" size="15"
                                                       readonly="true" style="width:50%"/>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="CCODCUP" >
                                    <td class="campocaja">
                                        <select name="CCODCUP" id="CCODCUP" size="1" 
                                                title="<axis:alt f="axisprf105" c="TIT_CCODCUP" lit="9904867"/>" 
                                                       <axis:atr f="axisprf105" c="CCODCUP" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                class="campowidthselect campo campotexto" 
                                                <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if> 
                                                style="width:90%;">
                                                <option value = "null"> - <axis:alt f="axisprf105" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="cups" items="${listValores.LSTCUPS}">
                                                    <option value = "${cups.CUPS}" 
                                                    <c:if test="${ cups.CUPS == __formdata.OBIAXSERVI.CCODCUP  }"> selected </c:if> />
                                                        ${cups.CUPS} 
                                                    </option>
                                                </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                               <axis:visible f="axisprf105" c="TDESCRI" >
                                   <td class="titulocaja" colspan="2">
                                       <b><axis:alt f="axisprf105" c="TDESCRI" lit="100588"/></b><!--Descripcion -->
                                   </td>
                               </axis:visible>
                               <axis:visible f="axisprf105" c="CUNIMED" >
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="CUNIMED" lit="9904868"/></b><!--Unitat de mesura -->
                                   </td>
                               </axis:visible>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisprf105" c="TDESCRI">
                                    <td colspan = "2">
                                        <input type="text" class="campo campotexto" cols="" <axis:atr f="axisprf105" c="TDESCRI" a="isInputText=true&obligatorio=true"/> value="${__formdata.OBIAXSERVI.TDESCRI}"
                                                  style="width:94%;"  name="TDESCRI" id="TDESCRI" <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if> />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="CUNIMED" >
                                    <td class="campocaja">
                                        <select name="CUNIMED" id="CUNIMED" size="1" 
                                                title="<axis:alt f="axisprf105" c="TIT_CUNIMED" lit="9904868"/>" 
                                                       <axis:atr f="axisprf105" c="CUNIMED" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                class="campowidthselect campo campotexto" 
                                                <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if> 
                                                style="width:90%;">
                                                <option value = "null"> - <axis:alt f="axisprf105" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="cunimed" items="${listValores.LSTCUNIMED}">
                                                    <option value = "${cunimed.CATRIBU}" 
                                                    <c:if test="${ cunimed.CATRIBU == __formdata.OBIAXSERVI.CUNIMED  }"> selected </c:if> />
                                                        ${cunimed.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                               <axis:visible f="axisprf105" c="CTIPCAL" > 
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="CTIPCAL" lit="9002111"/></b><!--Tipo de cálculo -->
                                   </td>
                               </axis:visible>
                               <axis:visible f="axisprf105" c="CMAGNIT" > 
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="CMAGNIT" lit="9904870"/></b><!--Cálculo precio -->
                                   </td>
                               </axis:visible>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisprf105" c="CTIPCAL" > 
                                    <td class="campocaja" >
                                        <select name="CTIPCAL" id="CTIPCAL" size="1" onchange="f_carga_calculo_precio()"
                                                title="<axis:alt f="axisprf105" c="TIT_CTIPCAL" lit="9002111"/>" 
                                                       <axis:atr f="axisprf105" c="CTIPCAL" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                class="campowidthselect campo campotexto" 
                                                <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if> 
                                                style="width:90%;">
                                                <option value = "null"> - <axis:alt f="axisprf105" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="ctipcal" items="${listValores.LSTCTIPCAL}">
                                                    <option value = "${ctipcal.CATRIBU}" 
                                                    <c:if test="${ ctipcal.CATRIBU == __formdata.OBIAXSERVI.CTIPCAL  }"> selected </c:if> />
                                                        ${ctipcal.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="CMAGNIT" > 
                                    <td class="campocaja" >
                                        <select name="CMAGNIT" id="CMAGNIT" size="1" 
                                                title="<axis:alt f="axisprf105" c="TIT_CMAGNIT" lit="9904870"/>" 
                                                       <axis:atr f="axisprf105" c="CMAGNIT" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                class="campowidthselect campo campotexto" 
                                                <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if> 
                                                style="width:90%;">
                                                <option value = "null"> - <axis:alt f="axisprf105" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="cmagnit" items="${listValores.LSTCMAGNIT}">
                                                    <option value = "${cmagnit.CATRIBU}" 
                                                    <c:if test="${ cmagnit.CATRIBU == __formdata.OBIAXSERVI.CMAGNIT  }"> selected </c:if> />
                                                        ${cmagnit.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                           <tr>
                               <axis:visible f="axisprf105" c="IPRECIO" >  
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="IPRECIO" lit="9905609"/></b><!--Unitat de mesura -->
                                   </td>
                               </axis:visible>
                               <axis:visible f="axisprf105" c="IMINIMO" > 
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="IMINIMO" lit="9904858"/></b><!--Unitat de mesura -->
                                   </td>
                                </axis:visible>
                           </tr>
                           <tr>
                                <axis:ocultar f="axisprf105" c="IPRECIO" >
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" name="IPRECIO" id="IPRECIO" size="15"
                                               <axis:atr f="axisprf105" c="IPRECIO" a="modificable=true&isInputText=true&obligatorio=true"/>
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OBIAXSERVI.IPRECIO}'/>"
                                               style="width:50%" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisprf105" c="IPRECIO" lit="9905609"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value)));this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="IMINIMO" >
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" name="IMINIMO" id="IMINIMO" size="15"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OBIAXSERVI.IMINIMO}'/>"
                                               style="width:50%" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisprf105" c="IMINIMO" lit="9904858"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value)));this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                               <axis:visible f="axisprf105" c="CSELECC" > 
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="CSELECC" lit="9002086"/></b><!--Precio -->
                                   </td>
                               </axis:visible>
                               <axis:visible f="axisprf105" c="CTIPSER" >
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="CTIPSER" lit="9904869"/></b>
                                   </td>
                               </axis:visible>
                               <axis:visible f="axisprf105" c="FINIVIG" >
                                   <td class="titulocaja">
                                       <b><axis:alt f="axisprf105" c="FINIVIG" lit="9000572"/></b>
                                   </td>
                               </axis:visible>
                               <axis:visible f="axisprf105" c="FFINVIG" >
                                   <td class="titulocaja" id="tit_FFINVIG" style="display:none">
                                       <b><axis:alt f="axisprf105" c="FFINVIG" lit="9902716"/></b>
                                   </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisprf105" c="CSELECC" >
                                    <td class="campocaja">
                                         <input type="checkbox" class="campo campotexto" value="${__formdata.OBIAXSERVI.CSELECC}" name="CSELECC" id="CSELECC" size="15"
                                               style="width:22%" <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if>
                                        <c:if test="${__formdata.OBIAXSERVI.CSELECC == 1}">checked</c:if>
                                         />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="CTIPSER" >
                                    <td class="campocaja">
                                        <select name="CTIPSER" id="CTIPSER" size="1" 
                                                title="<axis:alt f="axisprf105" c="TIT_CTIPSER" lit="9904869"/>" 
                                                       <axis:atr f="axisprf105" c="CTIPSER" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                class="campowidthselect campo campotexto" 
                                                <c:if test="${__formdata.MODO == 'actualizar'}">disabled</c:if>
                                                style="width:90%;">
                                                <option value = "null"> - <axis:alt f="axisprf105" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="ctipser" items="${listValores.LSTCTIPSER}">
                                                    <option value = "${ctipser.CATRIBU}" 
                                                    <c:if test="${ ctipser.CATRIBU == __formdata.OBIAXSERVI.CTIPSER  }"> selected </c:if> />
                                                        ${ctipser.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="FINIVIG" dejarHueco="false">  
                                    <td class="campocaja" >
                                        <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OBIAXSERVI.FINIVIG}"/>" 
                                                name="FINIVIG" id="FINIVIG" style="width:50%;" 
                                                title= "<axis:alt f="axisprf011" c="FINIVIG" lit="9000572"/>"  
                                            <c:if test="${__formdata.MODO == 'modificar'}">
                                            <axis:atr f="axisprf011" c="FINIVIG" a="obligatorio=false&formato=fecha&modificable=true&obligatorio=true"/>
                                            </c:if>
                                            <c:if test="${__formdata.MODO != 'modificar'}">
                                            <axis:atr f="axisprf011" c="FINIVIG" a="obligatorio=false&formato=fecha&obligatorio=true"/>
                                            </c:if>/>
                                            <a style="vertical-align:middle;">
                                                <img id="popup_calendario_FINIVIG" alt="<axis:alt f="axisprf011" c="FINIVIG" lit="108341"/>"  
                                                     src="images/calendar.gif" 
                                            </a>
                                    </td>            
                                </axis:ocultar>
                                <axis:ocultar f="axisprf105" c="FFINVIG" dejarHueco="false">  
                                    <td class="campocaja" >
                                        <input  type="text" class="campowidthinput campo campotexto_op" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OBIAXSERVI.FFINVIG}"/>" 
                                                name="FFINVIG" id="FFINVIG" style="width:50%;display:none" 
                                                title= "<axis:alt f="axisprf011" c="FFINVIG" lit="9902716"/>"  
                                            <c:if test="${__formdata.MODO == 'modificar'}">
                                            <axis:atr f="axisprf011" c="FFINVIG" a="obligatorio=false&formato=fecha&modificable=true"/>
                                            </c:if>
                                            <c:if test="${__formdata.MODO != 'modificar'}">
                                            <axis:atr f="axisprf011" c="FFINVIG" a="obligatorio=false&formato=fecha"/>
                                            </c:if>/>
                                            <a style="vertical-align:middle;">
                                                <img id="popup_calendario_FFINVIG" alt="<axis:alt f="axisprf011" c="FFINVIG" lit="108341"/>"  
                                                     src="images/calendar.gif" style="display:none"
                                            </a>
                                    </td>            
                                </axis:ocultar>
                            </tr>
                         </table>
                       </td>
                    </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf105</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FINIVIG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FINIVIG", 
                singleClick    :    true,
                firstDay       :    1
             });
            </script>
            <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FFINVIG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFINVIG", 
                singleClick    :    true,
                firstDay       :    1
             });
             </script>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>