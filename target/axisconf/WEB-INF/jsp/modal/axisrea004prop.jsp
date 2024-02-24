<%/* Revision:# ahAhJjPnrmw+GUGuzfn2gQ== # */%>
<%-- * Fichero: axisrea004prop.jsp */--%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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

        function f_onload_axisrea004prop() {
            f_cargar_propiedades_pantalla();
                       
            //Revisar si se esta modificando          
            if (objDom.getValorPorId("H_MODIF") == 1)
            {             
                objDom.setDisabledPorId("CTRAMO",true);
                objDom.setValorPorId("CTRAMO_MOD",objDom.getValorPorId("CTRAMO"));
            }
            
           
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0"){
            //alert("voy a cerrar la pantalla prop");
                    parent.f_aceptar_axisrea004_prop($('#deletedTramos').val());            
            }
                
        }
                
         // INI - ML - 5271 - VALIDAR PTRAMO NO SEA 0  
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {            	
            	if (document.getElementById('PPORTRAMO') && (document.getElementById('PPORTRAMO').value > 0) || document.getElementById('PPORTRAMO').value == "") {            		
            		f_grabar_datos();
            	} else {
            		alert('EL VALOR DEL PORCENTAJE DEL TRAMO NO PUEDE SER 0');
            	}            		
                //objUtiles.ejecutarFormulario("modal_axisrea004prop.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }           
        }
        // FIN - ML - 5271 - VALIDAR PTRAMO NO SEA 0
        
        function f_but_cancelar() { 
               parent.f_cerrar_modal("axisrea004prop");                
        }    
        
         function f_actualitza_plocal()
         {      
             //alert("Antes de la recarga");
             f_cargar_propiedades_pantalla(); 
         }
         
         function f_actualiza_number(CAMPON){                                             
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroMoneda(objDom.getValorPorId(CAMPON),null));
         }     
         
         
         /* ************************************   *********************************** */
         /* *********************************************************************************************** */
         
         function f_grabar_datos() {
                //alert("En recarga combos");
               
                
                var cadena_valores = "";
                
                /* Como varian los datos en cada caso, controlaremos si estan o no y pondremos a null*/
                        var NORDEN = null;
                        if(document.miForm.NORDEN){ NORDEN = document.miForm.NORDEN.value; }
                        var ITOTTRA = null;
                        if(document.miForm.ITOTTRA){ ITOTTRA = document.miForm.ITOTTRA.value; }
                        var NVERSIO = null;
                        if(document.miForm.NVERSIO){ NVERSIO = document.miForm.NVERSIO.value; }
                        var SCONTRA = null;
                        if(document.miForm.SCONTRA){ SCONTRA = document.miForm.SCONTRA.value; }
                        var CTRAMO = null;
                        if(document.miForm.CTRAMO){ CTRAMO = document.miForm.CTRAMO.value; }
                        var PLOCAL = null;
                        if(document.miForm.PLOCAL){ PLOCAL = document.miForm.PLOCAL.value; }
                        var ILAA = null;
                        if(document.miForm.ILAA){ ILAA = document.miForm.ILAA.value; }
                        var CFREBOR = null;
                        if(document.miForm.CFREBOR){ CFREBOR = document.miForm.CFREBOR.value; }
                      
                      
                        var PCTGASTOS = null;
                        if(document.miForm.PCTGASTOS){ PCTGASTOS = document.miForm.PCTGASTOS.value; }
                    
                        var PTASAAJUSTE = null;
                        if(document.miForm.PTASAAJUSTE){ PTASAAJUSTE = document.miForm.PTASAAJUSTE.value; }
                        var PCTPB = null;
                        if(document.miForm.PCTPB){ PCTPB = document.miForm.PCTPB.value; }
                        var IMPAVISO = null;
                        if(document.miForm.IMPAVISO){ IMPAVISO = document.miForm.IMPAVISO.value; }
                        var IMPCONTADO = null;
                        if(document.miForm.IMPCONTADO){ IMPCONTADO = document.miForm.IMPCONTADO.value; }
                        var PTASAAJUSTE = null;
                        if(document.miForm.PTASAAJUSTE){ PTASAAJUSTE = document.miForm.PTASAAJUSTE.value; }
                        //INI BUG CONF-250  Fecha (02/09/2016) - HRE - COntratos Q1, Q2, Q3
                        var PPORTRAMO = null;
                        if(document.miForm.PPORTRAMO){ PPORTRAMO = document.miForm.PPORTRAMO.value; }
                        //FIN BUG CONF-250  - Fecha (02/09/2016) - HRE
                        
                        var PCTCONTADO = null;
                        if(document.miForm.PCTCONTADO){PCTCONTADO = document.miForm.PCTCONTADO.value; }
                        var CLOSSCORRIDOR = null;
                        if(document.miForm.CLOSSCORRIDOR){ CLOSSCORRIDOR = document.miForm.CLOSSCORRIDOR.value; }
                        var CCAPPEDRATIO = null;
                        if(document.miForm.CCAPPEDRATIO){ CCAPPEDRATIO = document.miForm.CCAPPEDRATIO.value; }
                        var IBONOREC = null;
                        if(document.miForm.IBONOREC){ IBONOREC = document.miForm.IBONOREC.value; }
                        var ICAPCOASEG = null;
                        if(document.miForm.ICAPCOASEG){ICAPCOASEG = document.miForm.ICAPCOASEG.value; }
                        var NANYOSLOSS = null;
                        if(document.miForm.NANYOSLOSS){ NANYOSLOSS = document.miForm.NANYOSLOSS.value; }
                        var IPRIMAESTIMADA = null;
                        if(document.miForm.IPRIMAESTIMADA){ IPRIMAESTIMADA = document.miForm.IPRIMAESTIMADA.value; }
                      
                
                
                cadena_valores = "NORDEN=" + NORDEN + "&ITOTTRA=" + ITOTTRA +
                "&NVERSIO=" + NVERSIO + "&SCONTRA=" + SCONTRA + "&CTRAMO=" + CTRAMO +
                "&PLOCAL=" + PLOCAL + "&ILAA=" + ILAA + "&CFREBOR=" + CFREBOR +
                "&PCTGASTOS=" + PCTGASTOS +
                "&PTASAAJUSTE=" + PTASAAJUSTE + "&PPORTRAMO=" + PPORTRAMO + "&PCTPB=" + PCTPB +//--BUG CONF-250  Fecha (02/09/2016) - HRE 
                "&IMPAVISO=" + IMPAVISO + "&IMPCONTADO=" + IMPCONTADO + "&PCTCONTADO=" + PCTCONTADO +
                "&CLOSSCORRIDOR=" + CLOSSCORRIDOR + "&CCAPPEDRATIO=" + CCAPPEDRATIO +
                "&ICAPCOASEG=" + ICAPCOASEG + "&IBONOREC=" + IBONOREC + "&NANYOSLOSS=" + NANYOSLOSS +"&IPRIMAESTIMADA="+IPRIMAESTIMADA;
                               
                //objAjax.invokeAsyncCGI("modal_axisrea004prop.do?"+cadena_valores, callbackActualizarDatos, "operation=ajax_grabar", this, objJsMessages.jslit_cargando,true);
                
                objUtiles.ejecutarFormulario("modal_axisrea004prop.do", "grabar", document.miForm, "_self");  
            }        
            
          
          
     
        function callbackActualizarDatos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("A la vueltassss");
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        parent.f_aceptar_axisrea004_prop();      //No hay errores se recarga la pantalla base      
                    }
                         
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }    
         

    </script>
  
  
  </head>
    <body onload="f_onload_axisrea004prop()"><c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import><!--form name="axisrea004Form" action="" method="POST"--><form name="miForm"
                                                                                  action="modal_axisrea004prop.do"
                                                                                  method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="H_MODIF" id="H_MODIF"
                   value="${__formdata.H_MODIF}"/>
            <input type="hidden" name="CTRAMO_MOD" id="CTRAMO_MOD"
                   value="${__formdata.CTRAMO_MOD}"/>
            <input type="hidden" name="NVERSIO" id="NVERSIO"
                   value="${__formdata.NVERSIO}"/>
            <input type="hidden" name="SCONTRA" id="SCONTRA"
                   value="${__formdata.SCONTRA}"/>
            <input type="hidden" name="SCTRXL" id="SCTRXL"
                   value="${__formdata.SCTRXL}"/>
            <input type="hidden" name="NVERXL" id="NVERXL"
                   value="${__formdata.NVERXL}"/>
            <input type="hidden" name="deletedTramos" id="deletedTramos"
                   value="${__formdata.deletedTramos}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axisrea004prop" c="LIT_NOMBRE_PANTALLA"
                              lit="9002222"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axisrea004prop" c="ALT_NOMBRE_PANTALLA"
                              lit="9002223"/>
                </c:param>
                <c:param name="form">axisrea004prop</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0" style="height:130px">
                <div class="separador">&nbsp;</div>
                <tr>
                    <td>
                        <!-- TRAMOS -->
                        <table class="area">
                            <tr>
                                <th style="width:15%;height:0px">&nbsp;</th>
                                <th style="width:15%;height:0px">&nbsp;</th>
                                <th style="width:15%;height:0px">&nbsp;</th>
                                <th style="width:15%;height:0px">&nbsp;</th>
                                <th style="width:15%;height:0px">&nbsp;</th>
                                <th style="width:15%;height:0px">&nbsp;</th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop" c="CTRAMO"
                                              dejarHueco="false">
                                    <!-- TRAMO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CTRAMO"><axis:alt f="axisrea004prop"
                                                                       c="LIT_CTRAMO"
                                                                       lit="9000609"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="NORDEN"
                                              dejarHueco="false">
                                    <!-- NORDEN-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_NORDEN"><axis:alt f="axisrea004prop"
                                                                       c="LIT_NORDEN"
                                                                       lit="500102"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ITOTTRA"
                                              dejarHueco="false">
                                    <!--CAPACIDAD-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ITOTTRA"><axis:alt f="axisrea004prop"
                                                                        c="LIT_ITOTTRA"
                                                                        lit="9000602"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="PLOCAL"
                                              dejarHueco="false">
                                    <!--PLOCAL-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PLOCAL"><axis:alt f="axisrea004prop"
                                                                       c="LIT_PLOCAL"
                                                                       lit="9902199"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop"
                                              c="IPRIMAESTIMADA"
                                              dejarHueco="false">
                                    <!--PRIMA ESTIMADA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IPRIMAESTIMADA"><axis:alt f="axisrea004prop"
                                                                               c="LIT_IPRIMAESTIMADA"
                                                                               lit="9902183"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                   <!-- BUG/IAXIS-14001 Se quita el campo iprio para agregar el campo IXLPRIO -->
                                   <!-- <axis:ocultar f="axisrea004" c="IXLPRIO" dejarHueco="false">
                                    
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IXLPRIO"><axis:alt f="axisrea004"
                                                                             c="LIT_CAPLICPRIOAXL"
                                                                             lit="89906330"/></b>       
                                    </td>
                                </axis:ocultar>-->
                                
                                <axis:ocultar f="axisrea004prop" c="ILAA"
                                              dejarHueco="false">
                                    <!--ILAA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ILAA"><axis:alt f="axisrea004prop"
                                                                     c="LIT_ILAA"
                                                                     lit="9902179"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop" c="CTRAMO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <%-- CTRAMO--%>
                                        <select name="CTRAMO" id="CTRAMO"
                                                size="1"
                                                class="campowidthselect campo campotexto"
                                                onchange="f_actualitza_plocal()"
                                                obligatorio="true"
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_CTRAMO_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_CTRAMO_SEL2"
                                                          lit="9000609"/>
                                                -
                                            </option>
                                            
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaTramos}">                                                 
                                                <c:if test="${element.CATRIBU != 0}">
                                                    <option value="${element.CATRIBU}"
                                                            <c:if test="${element.CATRIBU == __formdata.CTRAMO}"> selected </c:if>/>
                                                    ${element.TATRIBU}
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="NORDEN"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- NORDEN -->
                                        <input type="text"
                                               class="campo campotexto"
                                               obligatorio="true" id="NORDEN" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, false, -1,'<axis:alt f="axisrea004prop" c="NORDEN" lit="500102"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>=100){alert('<axis:alt f="axisrea004prop" c="NORDEN" lit="9907685"/>');this.value='';this.focus()}}"
                                               name="NORDEN" style="width:80%"
                                               value="${__formdata.OB_IAX_TRAMO.NORDEN}"
                                               <axis:atr f="axisrea004prop" c="NORDEN" a="modificable=true&formato=entero"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ITOTTRA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- ITOTTRA Importe-->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ITOTTRA" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="ITOTTRA" lit="9000602"/>')){this.value='';this.focus()}"
                                               name="ITOTTRA" obligatorio="true"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.ITOTTRA}'/>"
                                               <axis:atr f="axisrea004prop" c="ITOTTRA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="PLOCAL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- PLOCAL Importe-->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PLOCAL" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PLOCAL" lit="9902199"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004prop" c="PLOCAL" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               name="PLOCAL" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PLOCAL}'/>"
                                               <axis:atr f="axisrea004prop" c="PLOCAL" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop"
                                              c="IPRIMAESTIMADA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- PRIMAESTIMADA Importe-->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IPRIMAESTIMADA" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="IPRIMAESTIMADA" lit="9902183"/>')){this.value='';this.focus()}"
                                               name="IPRIMAESTIMADA"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IPRIMAESTIMADA}'/>"
                                               <axis:atr f="axisrea004prop" c="IPRIMAESTIMADA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                
                                
                                  <!-- BUG/IAXIS-14001 Se quita el campo iprio para agregar el campo IXLPRIO --> 
                               <!-- <axis:ocultar f="axisrea004" c="IXLPRIO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IXLPRIO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IXLIPRIO" lit="89906330"/>')){this.value='';this.focus()}"
                                               name="IXLPRIO" obligatorio="true"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IXLPRIO}'/>"
                                               <axis:atr f="axisrea004" c="IXLPRIO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>-->
                                
                                <axis:ocultar f="axisrea004prop" c="ILAA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- ILAA Importe -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ILAA" onchange="" name="ILAA"
                                               style="width:80%" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="ILAA" lit="9902179"/>')){this.value='';this.focus()}"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.ILAA}'/>"
                                               <axis:atr f="axisrea004prop" c="ILAA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <!-- v2 -->
                            <tr>
                                <axis:ocultar f="axisrea004prop" c="PCTGASTOS"
                                              dejarHueco="false">
                                    <!-- % GASTOS -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTGASTOS"><axis:alt f="axisrea004prop"
                                                                          c="LIT_PCTGASTOS"
                                                                          lit="108480"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="PTASAAJUSTE"
                                              dejarHueco="false">
                                    <!-- % TASA DE AJUSTE -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PTASAAJUSTE"><axis:alt f="axisrea004prop"
                                                                            c="LIT_TASAAJUSTE"
                                                                            lit="9902205"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- INI BUG CONF-250  Fecha (02/09/2016) - HRE - COntratos Q1, Q2, Q3 -->
                                <axis:ocultar f="axisrea004prop" c="PPORTRAMO"
                                              dejarHueco="false">
                                    <!-- PORCENTAJE POR TRAMO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PPORTRAMO"><axis:alt f="axisrea004prop"
                                                                            c="LIT_PPORTRAMO"
                                                                            lit="9909382"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN BUG CONF-250  - Fecha (02/09/2016) - HRE -->                                                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop" c="PCTGASTOS"
                                              dejarHueco="false">
                                    <!-- INI - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->           
                                    <td class="campocaja" colspan="1">
                                        <input type="text"
                                               class="campo campotexto"
                                               obligatorio="true"
                                               id="PCTGASTOS" onchange=""
                                               name="PCTGASTOS" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PCTGASTOS" lit="108480"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>999.99){alert('<axis:alt f="axisrea004prop" c="PCTGASTOS" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCTGASTOS}'/>"
                                               <axis:atr f="axisrea004prop" c="PCTGASTOS" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                    <!-- FIN - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO --> 
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="PTASAAJUSTE"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PTASAAJUSTE" onchange=""
                                               name="PTASAAJUSTE" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PTASAAJUSTE" lit="9902205"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>999.99){alert('<axis:alt f="axisrea004prop" c="PTASAAJUSTE" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PTASAAJUSTE}'/>"
                                               <axis:atr f="axisrea004prop" c="PTASAAJUSTE" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                
                               <!-- INI BUG CONF-250  Fecha (02/09/2016) - HRE - COntratos Q1, Q2, Q3 -->
                                <axis:ocultar f="axisrea004prop" c="PPORTRAMO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PPORTRAMO" onchange=""
                                               name="PPORTRAMO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PPORTRAMO" lit="9902205"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004prop" c="PPORTRAMO" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PTRAMO}'/>"
                                               <axis:atr f="axisrea004prop" c="PPORTRAMO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN BUG CONF-250  - Fecha (02/09/2016) - HRE -->                                                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop" c="PCTPB"
                                              dejarHueco="false">
                                    <!-- % PB -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTPB"><axis:alt f="axisrea004prop"
                                                                      c="LIT_PCTPB"
                                                                      lit="9902488"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="IMPAVISO"
                                              dejarHueco="false">
                                    <!--  Avisos Siniestros -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IMPAVISO"><axis:alt f="axisrea004prop"
                                                                         c="LIT_IMPAVISO"
                                                                         lit="9902196"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="IMPCONTADO"
                                              dejarHueco="false">
                                    <!-- Importe pagos contado -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IMPCONTADO"><axis:alt f="axisrea004prop"
                                                                           c="LIT_IMPCONTADO"
                                                                           lit="9902194"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="PCTCONTADO"
                                              dejarHueco="false">
                                    <!-- % Pagos contado -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTCONTADO"><axis:alt f="axisrea004prop"
                                                                           c="LIT_PCTCONTADO"
                                                                           lit="9902195"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="CFREBOR"
                                              dejarHueco="false">
                                    <!--  BORDERO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CFREBOR"><axis:alt f="axisrea004prop"
                                                                        c="LIT_TFREBOR"
                                                                        lit="9000610"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop" c="PCTPB"
                                              dejarHueco="false">
                                    <!-- INI - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->          
                                    <td class="campocaja" colspan="1">
                                        <!-- %PB -->
                                        <input type="text"
                                               class="campo campotexto"
                                               obligatorio="true"
                                               id="PCTPB" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PCTPB" lit="1000495"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004prop" c="PCTPB" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               name="PCTPB" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCTPB}'/>"
                                               <axis:atr f="axisrea004prop" c="PCTPB" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                    <!-- FIN - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="IMPAVISO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Avisos Siniestros -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IMPAVISO" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="IMPAVISO" lit="9902196"/>')){this.value='';this.focus()}"
                                               name="IMPAVISO" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IMPAVISO}'/>"
                                               <axis:atr f="axisrea004prop" c="IMPAVISO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="IMPCONTADO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Importe pagos Contado -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IMPCONTADO" onchange=""
                                               name="IMPCONTADO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="IMPCONTADO" lit="9902194"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IMPCONTADO}'/>"
                                               <axis:atr f="axisrea004prop" c="IMPCONTADO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="PCTCONTADO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % Pagos Contado -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCTCONTADO" onchange=""
                                               name="PCTCONTADO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="PCTCONTADO" lit="9902195"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004prop" c="PCTCONTADO" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCTCONTADO}'/>"
                                               <axis:atr f="axisrea004prop" c="PCTCONTADO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="CFREBOR"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- BORDERÓ -->
                                        <select name="CFREBOR" id="CFREBOR"
                                                size="1"
                                                class="campowidthselect campo campotexto"
                                                obligatorio="true"
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_BORDERO_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_BORDERO_SEL2"
                                                          lit="9000610"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaPrebor}">
                                                <option value="${element.CATRIBU}"
                                                        <c:if test="${element.CATRIBU == __formdata.OB_IAX_TRAMO.CFREBOR}"> selected </c:if>/>
                                                ${element.TATRIBU}
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop"
                                              c="CLOSSCORRIDOR"
                                              dejarHueco="false">
                                    <!-- LOSS CORRIDOR -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CLOSSCORRIDOR"><axis:alt f="axisrea004prop"
                                                                              c="LIT_CLOSSCORRIDOR"
                                                                              lit="9902197"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop"
                                              c="CCAPPEDRATIO"
                                              dejarHueco="false">
                                    <!--  CAPPED RATIO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CCAPPEDRATIO"><axis:alt f="axisrea004prop"
                                                                             c="LIT_CCAPPEDRATIO"
                                                                             lit="9902198"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ICAPCOASEG"
                                              dejarHueco="false">
                                    <!-- % ICAPCOASEG  -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ICAPCOASEG"><axis:alt f="axisrea004prop"
                                                                           c="LIT_ICAPCOASEG"
                                                                           lit="9902211"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ANYOSLOSS"
                                              dejarHueco="false">
                                    <!-- % ANYOS ARRASTRE  -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ANYOSLOSS"><axis:alt f="axisrea004prop"
                                                                          c="LIT_ANYOSLOSS"
                                                                          lit="9902191"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="BONOREC"
                                              dejarHueco="false">
                                    <!-- % BONOS RECLAMACION  -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_BONOREC"><axis:alt f="axisrea004prop"
                                                                        c="LIT_BONOREC"
                                                                        lit="9902192"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ICOSTOFIJO"
                                              dejarHueco="false">
                                    <!-- Costo fijo de la capa  -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ICOSTOFIJO"><axis:alt f="axisrea004prop"
                                                                           c="LIT_ICOSTOFIJO"
                                                                           lit="9906805"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop"
                                              c="PCOMISINTERM"
                                              dejarHueco="false">
                                    <!-- % de tasa fija/variable  -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCOMISINTERM"><axis:alt f="axisrea004prop"
                                                                             c="LIT_PCOMISINTERM"
                                                                             lit="9905559"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004prop"
                                              c="CLOSSCORRIDOR"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <%-- LOSS CORRIDOR--%>
                                        <select name="CLOSSCORRIDOR"
                                                id="CLOSSCORRIDOR" size="1"
                                                class="campowidthselect campo campotexto"
                                                onchange=""
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_LOSSCORR_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_LOSSCORR_SEL2"
                                                          lit="9902197"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaLoss}">
                                                <c:if test="${element.CCODIGO != 0}">
                                                    <option value="${element.CCODIGO}"
                                                            <c:if test="${element.CCODIGO == __formdata.OB_IAX_TRAMO.CLOSSCORRIDOR}"> selected </c:if>>
                                                        ${element.TDESCRIPCION}
                                                    </option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop"
                                              c="CCAPPEDRATIO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <%-- CAPPED RATIO--%>
                                        <select name="CCAPPEDRATIO"
                                                id="CCAPPEDRATIO" size="1"
                                                class="campowidthselect campo campotexto"
                                                onchange=""
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_CRATIO_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004prop"
                                                          c="ALT_CRATIO_SEL2"
                                                          lit="9902198"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaCapped}">
                                                <c:if test="${element.CCODIGO != 0}">
                                                    <option value="${element.CCODIGO}"
                                                            <c:if test="${element.CCODIGO == __formdata.OB_IAX_TRAMO.CCAPPEDRATIO}"> selected </c:if>>
                                                        ${element.TDESCRIPCION}
                                                    </option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ICAPCOASEG"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Capacidad/Coaseguro Importe -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ICAPCOASEG" onchange=""
                                               name="ICAPCOASEG" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="ICAPCOASEG" lit="9902211"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.ICAPCOASEG}'/>"
                                               <axis:atr f="axisrea004prop" c="ICAPCOASEG" a="modificable=true&formato=decimal"/>/>
                                        <%-- <fmt:formatNumber
                                             pattern='${__formatNumberPatterns[__defaultCMONINT]}'
                                             value='${__formdata.ICAPCOASEG}'/>--%>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ANYOSLOSS"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Años arrastre siniestros -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="NANYOSLOSS" onchange=""
                                               name="NANYOSLOSS" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, false, -1,'<axis:alt f="axisrea004prop" c="NANYOSLOSS" lit="9902191"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>=100){alert('<axis:alt f="axisrea004prop" c="NANYOSLOSS" lit="9907685"/>');this.value='';this.focus()}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.NANYOSLOSS}'/>"
                                               <axis:atr f="axisrea004prop" c="ANYOSLOSS" a="modificable=true&formato=entero"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="IBONOREC"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Bono Reclamacion -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IBONOREC" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004prop" c="IBONOREC" lit="9902192"/>')){this.value='';this.focus()}"
                                               name="IBONOREC" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IBONOREC}'/>"
                                               <axis:atr f="axisrea004prop" c="IBONOREC" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop" c="ICOSTOFIJO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Costo fijo de la capa -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ICOSTOFIJO" onchange=""
                                               name="ICOSTOFIJO"
                                               style="width:80%"
                                               value="${__formdata.OB_IAX_TRAMO.ICOSTOFIJO}"
                                               <axis:atr f="axisrea004prop" c="ICOSTOFIJO" a="modificable=true"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004prop"
                                              c="PCOMISINTERM"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % de tasa fija/variable -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCOMISINTERM" onchange=""
                                               name="PCOMISINTERM"
                                               style="width:80%"
                                               value="${__formdata.OB_IAX_TRAMO.PCOMISINTERM}"
                                               <axis:atr f="axisrea004prop" c="PCOMISINTERM" a="modificable=true"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                        <!-- ************************* FIN DATOS TRAMOS  ********************* -->
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisrea004prop</c:param>
                            <c:param name="f">axisrea004prop</c:param>
                            <c:param name="__botones">cancelar,aceptar</c:param>
                        </c:import>
                    </td>
                </tr>
            </table>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>