<%/* Revision:# QEnnmiRQz0n/soWOrQ732g== # */%>
<%-- * Fichero: axisrea004.jsp * @author <a href =
     "mailto:icanada@csi-ti.com">Iván Cañada</a> * * Fecha: 23/10/2009 */--%>
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
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all"
              href="styles/calendar-green.css" title="green"/>
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript"
                src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
        <script language="Javascript" type="text/javascript">
    
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
    
            function f_onload_axisrea004() {
               f_cargar_propiedades_pantalla();
                           
                //Revisar si se esta modificando          
                if (objDom.getValorPorId("H_MODIF") == 1)
                {             
                    objDom.setDisabledPorId("CTRAMO",true);
                    objDom.setValorPorId("CTRAMO_MOD",objDom.getValorPorId("CTRAMO"));
                }
                
                //f_actualitza_plocal();
                var grabarOK = '${requestScope.grabarOK}';
                if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                        parent.f_aceptar_axisrea004();            
                        
                        
               //Si recargamos la página
               var abrir035 = '${__formdata.abrir035}';
                if(abrir035 == 1){
                 var CTRAMO = $('#CTRAMO').val();
                     var SCONTRA = $('#SCONTRA').val();
                     var NVERSIO = $('#NVERSIO').val();
                     var CREPOS = $('#CREPOS').val();                 
                     var deletedRepos = $('#deletedRepos').val(); 
                    objUtiles.abrirModal("axisrea035","src","axis_axisrea035.do?operation=form&mantenimiento=0&CTRAMO="+CTRAMO+"&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO+"&CCODIGO="+CREPOS+"&deletedRepos="+deletedRepos);
                }else {
                    if(abrir035==2){
                        parent.f_aceptar_axisrea004($('#deletedTramos').val());
                    }
                }
    
            }
                    
            function f_but_aceptar() {
               
                 if (objValidador.validaEntrada()) {           
                        f_grabar_datos(2);
                }
               
            }
            
            function f_but_cancelar() { 
                       var CTRAMO_MOD = $('#CTRAMO_MOD').val();
                       var CREPOS =$('#CREPOS').val();
                         //si es nuevo, borramos todo y nos vamos por el callback
                          if($('#H_MODIF').val()==0 && !objUtiles.estaVacio(CREPOS)){
                            var CTRAMO = $('#CTRAMO').val();
                            var SCONTRA = $('#SCONTRA').val();
                            var NVERSIO =$('#NVERSIO').val();
                             
                            objAjax.invokeAsyncCGI("modal_axisrea004.do?SCONTRA="+SCONTRA+"&CTRAMO="+CTRAMO+"&NVERSIO="+NVERSIO+"&CREPOS="+CREPOS, callbackAjaxCancelarTramo, "operation=delete_tramo", this, objJsMessages.jslit_cargando, false);
                         }else{
                             //Si editamos
                           parent.f_cerrar_modal("axisrea004");  
                         }
            }    
            
            function callbackAjaxCancelarTramo(){
                parent.f_cerrar_modal("axisrea004");
               // parent.f_onload();
               // parent.f_aceptar_axisrea004();
             }
            
             function f_actualitza_plocal()
             {      
                    //alert("Antes de cargar***" );
                    f_cargar_propiedades_pantalla();
                  
                   var CTRAMO = objDom.getValorPorId("CTRAMO");   
                    
                   
                 /*   if (!objUtiles.estaVacio(CTRAMO))
                    {                   
                        if(CTRAMO==1)
                        {
                             //objDom.setVisibilidadPorId("label_plocal","visible");
                             //objDom.setVisibilidadPorId("plocal","visible");
                             objDom.setDisplayPorId("label_plocal","block");
                             objDom.setDisplayPorId("PLOCAL","block");
                        }
                        else
                        {
                            //objDom.setVisibilidadPorId("label_plocal","hidden");
                            //objDom.setVisibilidadPorId("plocal","hidden");
                            objDom.setDisplayPorId("label_plocal","none");
                            objDom.setDisplayPorId("PLOCAL","none");
                        }    
                        
                    }
                    else
                    {
                       // objDom.setVisibilidadPorId("label_plocal","hidden");
                      //  objDom.setVisibilidadPorId("PLOCAL","hidden");         
                        objDom.setDisplayPorId("label_plocal","none");
                        objDom.setDisplayPorId("PLOCAL","none");
                    } */
             }
             
             function f_actualiza_number(CAMPON){                                             
                    objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(CAMPON),true));
             }       
             
             
                      /* ************************************   *********************************** */
             /* *********************************************************************************************** */
             
             function f_grabar_datos(abrir035) {
                 //  if()
                   objUtiles.ejecutarFormulario("modal_axisrea004.do?abrir035="+abrir035, "grabar", document.miForm, "_self");  
            }        
            
           
             
               function  f_abrir_axisrea035() {
                       if (objValidador.validaEntrada()) {
                            f_grabar_datos(1);
                        }
                    
                }
                
                 function  f_delete_repos() {
                    
                    var crepos = $('#CREPOS').val();
                     if(!objUtiles.estaVacio(crepos)){
                        
                        //Añadimos a deletedRepo la reposicion borrada y limpiamos los campos
                        //Tanto al aceptar como al cancelar, si hay deletedRepos, estas se borraran
                        var deletedRepo = $('#deletedRepos');
                       if(objUtiles.estaVacio(deletedRepo.val())){
                            deletedRepo.val(crepos);
                       }else{
                            deletedRepo.val(deletedRepo.val()+','+crepos);
                       }
                     
                        $('#CREPOS').val('');
                         $('#REPODESCRIP').val('');
                        
                    }
                    
                     /*var crepos = $('#CREPOS').val();
                     if(!objUtiles.estaVacio(crepos)){
                      objAjax.invokeAsyncCGI("axis_axisrea035.do", callbackAjaxCancelar, "operation=delete_reposiciones&CCODIGO=" + $('#CREPOS').val(), this);
                    }*/
                    
                    
                    /*var crepos = $('#CREPOS').val();
                    var deletedRepo = $('#deletedRepo');
                       if(objUtiles.estaVacio(deletedRepo.val())){
                            deletedRepo.val(crepos);
                       }else{
                            deletedRepo.val(deletedRepo.val()+','+crepos);
                       }
                        objUtiles.ejecutarFormulario("modal_axisrea004.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);*/
                    
                 }
                 
                 function callbackAjaxCancelar(){
                    $('#CREPOS').val('');
                     $('#REPODESCRIP').val('');
                    // $('#delete_img').hide();
                    f_grabar_datos(0);
                 }
             
              function f_cerrar_axisrea035(codigo) {
                    objUtiles.cerrarModal("axisrea035");
                    $('#CREPOS').val(codigo);
                    objUtiles.ejecutarFormulario("modal_axisrea004.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            
        </script>
    </head>
    <body onload="f_onload_axisrea004()"><c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import><!--form name="axisrea004Form" action="" method="POST"--><form name="miForm"
                                                                                  action="modal_axisrea004.do"
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
            <input type="hidden" name="CREPOS" id="CREPOS"
                   value="${__formdata.OB_IAX_TRAMO.CREPOS}"/>
            <input type="hidden" name="deletedTramos" id="deletedTramos"
                   value="${__formdata.deletedTramos}"/>
            <input type="hidden" name="deletedRepos" id="deletedRepos"
                   value="${__formdata.deletedRepos}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axisrea004" c="LIT_NOMBRE_PANTALLA"
                              lit="9002222"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axisrea004" c="ALT_NOMBRE_PANTALLA"
                              lit="9002223"/>
                </c:param>
                <c:param name="form">axisrea004</c:param>
            </c:import>
            <!-- Pantallas modales -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axisrea035|
                    <axis:alt f="axisrea034" c="LIT_MODAL_AXISREA036_1"
                              lit="9000570"/>
                    &nbsp;
                    <axis:alt f="axisrea035" c="LIT_MODAL_AXISREA036_2"
                              lit="9902193"/>
                </c:param>
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
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CTRAMO"
                                              dejarHueco="false">
                                    <!-- TRAMO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CTRAMO"><axis:alt f="axisrea004"
                                                                       c="LIT_CTRAMO"
                                                                       lit="9000609"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="NORDEN"
                                              dejarHueco="false">
                                    <!-- NORDEN-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_NORDEN"><axis:alt f="axisrea004"
                                                                       c="LIT_NORDEN"
                                                                       lit="500102"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                
                                <axis:ocultar f="axisrea004" c="IXLPRIO"
                                              dejarHueco="false">
                                    <!--IDAA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IXLPRIO"><axis:alt f="axisrea004"
                                                                     c="LIT_IXLPRIO"
                                                                     lit="89906330"/></b>
                                                                     <!--lit="9902178"/></b>-->
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisrea004" c="ITOTTRA"
                                              dejarHueco="false">
                                    <!--CAPACIDAD-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ITOTTRA"><axis:alt f="axisrea004"
                                                                        c="LIT_ITOTTRA"                                                                        
                                                                        lit="9000602"/></b>
                                                                        <!-- lit="9000602"/></b>-->
                                    </td>
                                </axis:ocultar>
								
								
                                <axis:ocultar f="axisrea004" c="ILAA"
                                              dejarHueco="false">
                                    <!--ILAA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ILAA"><axis:alt f="axisrea004"
                                                                     c="LIT_ILAA"
                                                                     lit="9902179"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                
                                <axis:ocultar f="axisrea004" c="IDAA"
                                              dejarHueco="false">
                                    <!--IDAA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IDAA"><axis:alt f="axisrea004"
                                                                     c="LIT_IDAA"
                                                                     lit="9902178"/></b>
                                                                     <!--lit="9902178"/></b>-->
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CTRAMO"
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
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CTRAMO_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CTRAMO_SEL2"
                                                          lit="9000609"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaTramos}">
                                                <c:if test="${element.CATRIBU != 0}">
                                                    <option value="${element.CATRIBU}"
                                                            <c:if test="${element.CATRIBU == __formdata.CTRAMO}"> selected </c:if>>
                                                        ${element.TATRIBU}
                                                    </option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="NORDEN"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- NORDEN -->
                                        <input type="text"
                                               class="campo campotexto" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, false, -1,'<axis:alt f="axisrea004" c="NORDEN" lit="500102"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>=100){alert('<axis:alt f="axisrea004" c="NORDEN" lit="9907685"/>');this.value='';this.focus()}}"
                                               obligatorio="true" id="NORDEN"
                                               name="NORDEN" style="width:80%"
                                               value="${__formdata.OB_IAX_TRAMO.NORDEN}"
                                               <axis:atr f="axisrea004" c="NORDEN" a="modificable=true&formato=entero"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IXLPRIO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- IXLPRIO Importe, CONF 1048-->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IXLPRIO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IXLPRIO" lit="9000607"/>')){this.value='';this.focus()}"
                                               name="IXLPRIO" obligatorio="true"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IXLPRIO}'/>"
                                               <axis:atr f="axisrea004" c="IXLPRIO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisrea004" c="ITOTTRA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- ITOTTRA Importe-->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ITOTTRA" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="ITOTTRA" lit="9000602"/>')){this.value='';this.focus()}"
                                               name="ITOTTRA" obligatorio="true"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.ITOTTRA}'/>"
                                               <axis:atr f="axisrea004" c="ITOTTRA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisrea004" c="ILAA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!--  Importe -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ILAA" onchange="" name="ILAA" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="ILAA" lit="9902179"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.ILAA}'/>"
                                               <axis:atr f="axisrea004" c="ILAA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisrea004" c="IDAA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!--  Importe-->
                                        <input type="text" 
                                               class="campo campotexto"
                                               id="IDAA"  name="IDAA" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IDAA" lit="9902178"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IDAA}'/>"
                                               <axis:atr f="axisrea004" c="IDAA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <!-- v1 -->
                            <tr>
                                <axis:ocultar f="axisrea004" c="CTPRIMAXL"
                                              dejarHueco="false">
                                    <!-- TIPO PRIMA -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CTPRIMAXL"><axis:alt f="axisrea004"
                                                                          c="LIT_CTPRIMAXL"
                                                                          lit="9902181"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IPRIMAFIJAXL"
                                              dejarHueco="false">
                                    <!-- PRIMA FIJA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IPRIMAFIJAXL"><axis:alt f="axisrea004"
                                                                             c="LIT_IPRIMAFIJAXL"
                                                                             lit="9902182"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IPRIMAESTIMADA"
                                              dejarHueco="false">
                                    <!--PRIMA ESTIMADA-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IPRIMAESTIMADA"><axis:alt f="axisrea004"
                                                                               c="LIT_IPRIMAESTIMADA"
                                                                               lit="9902183"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CAPLICTASAXL"
                                              dejarHueco="false">
                                    <!-- APLIC. TASA.-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CAPLICTASAXL"><axis:alt f="axisrea004"
                                                                             c="LIT_CAPLICTASAXL"
                                                                             lit="9902184"/></b>
                                    </td>
                                </axis:ocultar>
								
								<!--  <axis:ocultar f="axisrea004" c="IPRIO"
                                              dejarHueco="false">
                                    APLIC. PRIORIDAD.
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IPRIO"><axis:alt f="axisrea004"
                                                                             c="LIT_CAPLICPRIOAXL"
                                                                             lit="89906330"/></b>       
                                    </td>
                                </axis:ocultar>-->
                           
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CTPRIMAXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <%-- TIPO PRIMA--%>
                                        <select name="CTPRIMAXL" id="CTPRIMAXL"
                                                size="1"
                                                class="campowidthselect campo campotexto"
                                                onchange=""
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004"
                                                          c="ALT_TIPPRIMA_SEl1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_TIPPRIMA_SEl2"
                                                          lit="9902181"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaTipoprima}">
                                                <c:if test="${element.CATRIBU != 0}">
                                                    <option value="${element.CATRIBU}"
                                                            <c:if test="${element.CATRIBU == __formdata.OB_IAX_TRAMO.CTPRIMAXL}"> selected </c:if>/>
                                                    ${element.TATRIBU}
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IPRIMAFIJAXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- PRIMAFIJAXL Importe -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IPRIMAFIJAXL" onchange=""
                                               name="IPRIMAFIJAXL" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IPRIMAFIJAXL" lit="9902182"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IPRIMAFIJAXL}'/>"
                                               <axis:atr f="axisrea004" c="IPRIMAFIJAXL" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IPRIMAESTIMADA"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- PRIMAESTIMADA Importe-->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IPRIMAESTIMADA" onchange=""
                                               name="IPRIMAESTIMADA" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IPRIMAESTIMADA" lit="9902183"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IPRIMAESTIMADA}'/>"
                                               <axis:atr f="axisrea004" c="IPRIMAESTIMADA" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CAPLICTASAXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <%-- APLIC. TASA.--%>
                                        <select name="CAPLICTASAXL"
                                                id="CAPLICTASAXL" size="1"
                                                class="campowidthselect campo campotexto"
                                                onchange=""
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004"
                                                          c="ALT_APLICTASA_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_APLICTASA_SEL2"
                                                          lit="9902184"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListAplicTasa}">
                                                <c:if test="${element.CATRIBU != 0}">
                                                    <option value="${element.CATRIBU}"
                                                            <c:if test="${element.CATRIBU == __formdata.OB_IAX_TRAMO.CAPLICTASAXL}"> selected </c:if>/>
                                                    ${element.TATRIBU}
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
								
								<!-- <axis:ocultar f="axisrea004" c="IPRIO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        IPRIO 
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IPRIO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IPRIO" lit="89906330"/>')){this.value='';this.focus()}"
                                               name="IPRIO" obligatorio="true"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IPRIO}'/>"
                                               <axis:atr f="axisrea004" c="IPRIO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>-->
                            </tr>
                            <!-- v1 -->
                            <tr>
                                <axis:ocultar f="axisrea004" c="CTIPTASAXL"
                                              dejarHueco="false">
                                    <!-- TIPO TASA -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CTIPTASAXL"><axis:alt f="axisrea004"
                                                                           c="LIT_TTIPTASAXL"
                                                                           lit="9902180"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PTASAXL"
                                              dejarHueco="false">
                                    <!--  %TASA FIJA -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PTASAXL"><axis:alt f="axisrea004"
                                                                        c="LIT_PTASAXL"
                                                                        lit="9902185"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- INI BUG CONF-250  Fecha (02/09/2016) - HRE - COntratos Q1, Q2, Q3 -->
                                <axis:ocultar f="axisrea004" c="PPORTRAMO"
                                              dejarHueco="false">
                                    <!-- PORCENTAJE POR TRAMO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PPORTRAMO"><axis:alt f="axisrea004"
                                                                            c="LIT_PPORTRAMO"
                                                                            lit="9909382"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN BUG CONF-250  - Fecha (02/09/2016) - HRE -->                                                                
                                <axis:ocultar f="axisrea004" c="CTRAMOTASAXL"
                                              dejarHueco="false">
                                    <!-- TASA VARIABLE -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CTRAMOTASAXL"><axis:alt f="axisrea004"
                                                                             c="LIT_TTRAMOTASAXL"
                                                                             lit="9902186"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- INI CONFCC-5 -->
                                <axis:ocultar f="axisrea004" c="PTASAAJUSTE"
                                              dejarHueco="false">
                                    <!--  %TASA AJUSTE -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PTASAAJUSTE"><axis:alt f="axisrea004"
                                                                            c="LIT_PTASAAJUSTE"
                                                                            lit="9902205"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN CONFCC-5 -->
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CTIPTASAXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- TIPO TASA -->
                                        <select name="CTIPTASAXL"
                                                id="CTIPTASAXL" size="1"
                                                class="campowidthselect campo campotexto"
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004"
                                                          c="ALT_TIPTASA_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_TIPTASA_SEL2"
                                                          lit="9902180"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaTipotasa}">
                                                <option value="${element.CATRIBU}"
                                                        <c:if test="${element.CATRIBU == __formdata.OB_IAX_TRAMO.CTIPTASAXL}"> selected </c:if>/>
                                                ${element.TATRIBU}
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PTASAXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % PD -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PTASAXL" onchange=""
                                               name="PTASAXL" style="width:80%" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PTASAXL" lit="9902185"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004" c="PTASAXL" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace('.',objNumero.getSeparadorDecimales())}}"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PTASAXL}'/>"
                                               <axis:atr f="axisrea004" c="PTASAXL" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                
                                <!-- INI BUG CONF-250  Fecha (02/09/2016) - HRE - COntratos Q1, Q2, Q3 -->
                                <axis:ocultar f="axisrea004" c="PPORTRAMO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PPORTRAMO" onchange=""
                                               name="PPORTRAMO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PPORTRAMO" lit="9902205"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>999.99){alert('<axis:alt f="axisrea004" c="PPORTRAMO" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PTRAMO}'/>"
                                               <axis:atr f="axisrea004" c="PPORTRAMO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN BUG CONF-250  - Fecha (02/09/2016) - HRE -->                                                                
                                
                                <axis:ocultar f="axisrea004" c="CTRAMOTASAXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- TASA VARIABLE -->
                                        <select name="CTRAMOTASAXL"
                                                id="CTRAMOTASAXL" size="1"
                                                class="campowidthselect campo campotexto"
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004"
                                                          c="ALT_TASAVAR_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_TASAVAR_SEL2"
                                                          lit="9902186"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaTasaVariable}">
                                                <option value="${element.CCODIGO}"
                                                        <c:if test="${element.CCODIGO == __formdata.OB_IAX_TRAMO.CTRAMOTASAXL}"> selected </c:if>/>
                                                ${element.TDESCRIPCION}
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                
                                <!-- INI CONFCC-5 -->
                                <axis:ocultar f="axisrea004" c="PTASAAJUSTE"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PTASAAJUSTE" onchange=""
                                               name="PTASAAJUSTE" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PTASAAJUSTE" lit="9902205"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>999.99){alert('<axis:alt f="axisrea004" c="PTASAAJUSTE" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PTASAAJUSTE}'/>"
                                               <axis:atr f="axisrea004" c="PTASAAJUSTE" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <!-- FIN CONFCC-5 -->
                            </tr>
                            <!-- v1 -->
                            <tr>
                                <axis:ocultar f="axisrea004" c="IDEPXL"
                                              dejarHueco="false">
                                    <!-- PRIMA DEPÓSITO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IDEPXL"><axis:alt f="axisrea004"
                                                                       c="LIT_IDEPXL"
                                                                       lit="9902187"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCTPDXL"
                                              dejarHueco="false">
                                    <!--  % P DEPOSITO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTPDXL"><axis:alt f="axisrea004"
                                                                        c="LIT_PCTPDXL"
                                                                        lit="9902188"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CFORPAGPDXL"
                                              dejarHueco="false">
                                    <!--  FORMA DE PAGO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CFORPAGPDXL"><axis:alt f="axisrea004"
                                                                            c="LIT_CFORPAGPDXL"
                                                                            lit="100712"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IMINXL"
                                              dejarHueco="false">
                                    <!-- PRIMA MÍNIMA -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IMINXL"><axis:alt f="axisrea004"
                                                                       c="LIT_IMINXL"
                                                                       lit="9902189"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCTMINXL"
                                              dejarHueco="false">
                                    <!-- % P. MIN -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTMINXL"><axis:alt f="axisrea004"
                                                                         c="LIT_PCTMINXL"
                                                                         lit="9902190"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="IDEPXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!--PRIMA DEPOSITO -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IDEPXL" onchange=""
                                               name="IDEPXL" obligatorio="true"
                                               style="width:80%"
                                               value="${__formdata.OB_IAX_TRAMO.IDEPXL}"
                                               <axis:atr f="axisrea004" c="IDEPXL" a="modificable=true"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCTPDXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % PD -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCTPDXL" onchange=""
                                               name="PCTPDXL" style="width:80%"
                                               value="${__formdata.OB_IAX_TRAMO.PCTPDXL}"
                                               <axis:atr f="axisrea004" c="PCTPDXL" a="modificable=true"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CFORPAGPDXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- FORMA PAGO -->
                                        <select name="CFORPAGPDXL"
                                                id="CFORPAGPDXL" size="1"
                                                class="campowidthselect campo campotexto"
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CFORPAGPDXL_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CFORPAGPDXL_SEL2"
                                                          lit="100712"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaFPago}">
                                                <option value="${element.CATRIBU}"
                                                        <c:if test="${element.CATRIBU == __formdata.OB_IAX_TRAMO.CFORPAGPDXL}"> selected </c:if>/>
                                                ${element.TATRIBU}
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IMINXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!--PRIMA MINIMA Importe -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IMINXL" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IMINXL" lit="9902189"/>')){this.value='';this.focus()}"
                                               name="IMINXL" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IMINXL}'/>"
                                               <axis:atr f="axisrea004" c="IMINXL" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCTMINXL"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % PD -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCTMINXL" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IMINXL" lit="9902190"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>999.99){alert('<axis:alt f="axisrea004" c="PCTMINXL" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               name="PCTMINXL" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCTMINXL}'/>"
                                               <axis:atr f="axisrea004" c="PCTMINXL" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <!-- v1 -->
                            <!-- nuevos campos -->
                            <tr>
                                <axis:ocultar f="axisrea004" c="IPMD"
                                              dejarHueco="false">
                                    <!-- Importe mínimo -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IPMD"><axis:alt f="axisrea004"
                                                                     c="LIT_IPMD"
                                                                     lit="9902486"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CFREPMD"
                                              dejarHueco="false">
                                    <!--  % CFREPMD -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CFREPMD"><axis:alt f="axisrea004"
                                                                        c="LIT_CFREPMD"
                                                                        lit="9902487"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="IPMD"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!--PRIMA MINIMA Importe -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IPMD" onchange="" name="IPMD"
                                               style="width:80%" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IPMD" lit="9902486"/>')){this.value='';this.focus()}"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IPMD}'/>"
                                               <axis:atr f="axisrea004" c="IPMD" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CFREPMD"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % CFREPMD -->
                                        <select name="CFREPMD" id="CFREPMD"
                                                size="1"
                                                class="campowidthselect campo campotexto"
                                                style="width:82.5%;">
                                            <option value="">
                                                -
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CFREPMD_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CFREPMD_SEL2"
                                                          lit="100712"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaFrecPago}">
                                                <option value="${element.CATRIBU}"
                                                        <c:if test="${element.CATRIBU == __formdata.OB_IAX_TRAMO.CFREPMD}"> selected </c:if>/>
                                                ${element.TATRIBU}
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="PCTPB"
                                              dejarHueco="false">
                                    <!-- PARTICIPACIÓN BENEFICIOS -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTPB"><axis:alt f="axisrea004"
                                                                      c="LIT_PCTPB"
                                                                      lit="1000495"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CFREBOR"
                                              dejarHueco="false">
                                    <!--  BORDERO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CFREBOR"><axis:alt f="axisrea004"
                                                                        c="LIT_TFREBOR"
                                                                        lit="9000610"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="NANYOSLOSS"
                                              dejarHueco="false">
                                    <!--  AÑOS ARRASTRE SINIESTROS -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_NANYOSLOSS"><axis:alt f="axisrea004"
                                                                           c="LIT_NANYOSLOSS"
                                                                           lit="9902191"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IBONOREC"
                                              dejarHueco="false">
                                    <!-- BONO RECLAMACIÓN -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IBONOREC"><axis:alt f="axisrea004"
                                                                         c="LIT_IBONOREC"
                                                                         lit="9902192"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="ICOSTOFIJO"
                                              dejarHueco="false">
                                    <!-- Costo fijo de la capa -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_ICOSTOFIJO"><axis:alt f="axisrea004"
                                                                           c="LIT_ICOSTOFIJO"
                                                                           lit="9906805"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCOMISINTERM"
                                              dejarHueco="false">
                                    <!-- % de tasa fija/variable -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCOMISINTERM"><axis:alt f="axisrea004"
                                                                             c="LIT_PCOMISINTERM"
                                                                             lit="9905559"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="PCTPB"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- IMPORTE PAGOS CONTADO -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCTPB" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PCTPB" lit="1000495"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004" c="PCTPB" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               name="PCTPB" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCTPB}'/>"
                                               <axis:atr f="axisrea004" c="PCTPB" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CFREBOR"
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
                                                <axis:alt f="axisrea004"
                                                          c="ALT_BORDERO_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
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
                                <axis:ocultar f="axisrea004" c="NANYOSLOSS"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- NAYONSS LOSS -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="NANYOSLOSS" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, false, -1,'<axis:alt f="axisrea004" c="NANYOSLOSS" lit="9902191"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>=100){alert('<axis:alt f="axisrea004" c="NANYOSLOSS" lit="9907685"/>');this.value='';this.focus()}}"
                                               name="NANYOSLOSS"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.NANYOSLOSS}'/>"
                                               <axis:atr f="axisrea004" c="NANYOSLOSS" a="modificable=true&formato=entero"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IBONOREC"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- IBONOREC -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IBONOREC" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IBONOREC" lit="9902192"/>')){this.value='';this.focus()}"
                                               name="IBONOREC" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IBONOREC}'/>"
                                               <axis:atr f="axisrea004" c="IBONOREC" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="ICOSTOFIJO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- Costo fijo de la capa -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="ICOSTOFIJO" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="ICOSTOFIJO" lit="9906805"/>')){this.value='';this.focus()}"
                                               name="ICOSTOFIJO"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.ICOSTOFIJO}'/>"
                                               <axis:atr f="axisrea004" c="ICOSTOFIJO" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCOMISINTERM"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % de tasa fija/variable -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCOMISINTERM" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PCOMISINTERM" lit="9905559"/>')){this.value='';this.focus()}"
                                               name="PCOMISINTERM"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCOMISINTERM}'/>"
                                               <axis:atr f="axisrea004" c="PCOMISINTERM" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CREPOS"
                                              dejarHueco="false">
                                    <!-- REPOSICIONES -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CREPOS"><axis:alt f="axisrea004"
                                                                       c="LIT_TREPOS"
                                                                       lit="9902193"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisrea004" c="PREEST"
                                              dejarHueco="false">
                                    <!--  % REINSTALAMENTOS CONF-1048-->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PREEST"><axis:alt f="axisrea004"
                                                                        c="LIT_PREEST"
                                                                        lit="89905768"/></b>
                                    </td>
                                </axis:ocultar>

                                
                                <axis:ocultar f="axisrea004" c="IMPCONTADO"
                                              dejarHueco="false">
                                    <!--  IMPORTE PAGOS CONTADO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IMPCONTADO"><axis:alt f="axisrea004"
                                                                           c="LIT_IMPCONTADO"
                                                                           lit="9902194"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCTCONTADO"
                                              dejarHueco="false">
                                    <!--  % PAGOS CONTADO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_PCTCONTADO"><axis:alt f="axisrea004"
                                                                           c="LIT_PCTCONTADO"
                                                                           lit="9902195"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IMPAVISO"
                                              dejarHueco="false">
                                    <!-- AVISOS SINIESTROS -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_IMPAVISO"><axis:alt f="axisrea004"
                                                                         c="LIT_IMPAVISO"
                                                                         lit="9902196"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CREPOS"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <%-- REPOSICIONES--%>
                                        <input type="text"
                                               class="campo campotexto"
                                               style="width:70%"
                                               id="REPODESCRIP"
                                               name="REPODESCRIP"
                                               alt="${__formdata.REPODESCRIP}"
                                               title="${__formdata.REPODESCRIP}"
                                               value="${__formdata.REPODESCRIP}"
                                               <axis:atr f="axisrea004" c="CREPOS" a="modificable=false"/>/>
                                        <a id="tramos_abrir_axisrea035"
                                           style="visibility:${canModify}"
                                           href="javascript:f_abrir_axisrea035()">
                                            <img border="0"
                                                 alt='<axis:alt f="axisrea004" c="ICO_EDIT_PER" lit="9902193"/>'
                                                 title='<axis:alt f="axisrea004" c="ICO_EDIT_PER" lit="9902193"/>'
                                                 src="images/lapiz.gif"/>
                                        </a>
                                        <a href="javascript:f_borrar_tramo('${pTRAMOSREA.OB_IAX_TRAMOS_REA.CTRAMO}');">
                                            <img border="0" id="delete_img"
                                                 onclick="f_delete_repos()"
                                                 alt='<axis:alt f="axisrea004" c="ALT_LINK_VAL" lit="9001333"/>'
                                                 title='<axis:alt f="axisrea004" c="ALT_LINK_OPC" lit="9001333"/>'
                                                 src="images/delete.gif"/>
                                        </a>
                                    </td>
                                </axis:ocultar>                                
                                <axis:ocultar f="axisrea004" c="PREEST"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % RESTABLECIMIENTO TRAMO CONF-1048 -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PREEST" onchange=""
                                               name="PREEST" style="width:80%" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PREEST" lit="89905768"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004" c="PREEST" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace('.',objNumero.getSeparadorDecimales())}}"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PREEST}'/>"
                                               <axis:atr f="axisrea004" c="PREEST" a="modificable=true&formato=decimal"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IMPCONTADO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- IMPORTE PAGOS CONTADO -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IMPCONTADO" onchange=""
                                               name="IMPCONTADO" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IMPCONTADO" lit="9902194"/>')){this.value='';this.focus()}"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IMPCONTADO}'/>"
                                               <axis:atr f="axisrea004" c="IMPCONTADO" a="modificable=true&decimal=true"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="PCTCONTADO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- % PAGOS CONTADO -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="PCTCONTADO" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="PCTCONTADO" lit="9902195"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea004" c="PCTCONTADO" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                               name="PCTCONTADO"
                                               style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.PCTCONTADO}'/>"
                                               <axis:atr f="axisrea004" c="PCTCONTADO" a="modificable=true&decimal=true"/>/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="IMPAVISO"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- AVISOS SINIESTROS -->
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IMPAVISO" onchange="" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea004" c="IMPAVISO" lit="9902196"/>')){this.value='';this.focus()}"
                                               name="IMPAVISO" style="width:80%"
                                               value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.OB_IAX_TRAMO.IMPAVISO}'/>"
                                               <axis:atr f="axisrea004" c="IMPAVISO" a="modificable=true&decimal=true"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CLOSSCORRIDOR"
                                              dejarHueco="false">
                                    <!-- LOSS CORRIDOR -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CLOSSCORRIDOR"><axis:alt f="axisrea004"
                                                                              c="LIT_CLOSSCORRIDOR"
                                                                              lit="9902197"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CCAPPEDRATIO"
                                              dejarHueco="false">
                                    <!--  CAPPED RATIO -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_CCAPPEDRATIO"><axis:alt f="axisrea004"
                                                                             c="LIT_CCAPPEDRATIO"
                                                                             lit="9902198"/></b>
                                    </td>
                                </axis:ocultar>
                                <%-- axis:ocultar f="axisrea004" c="ICAPCOASEG"
                                     dejarHueco="false"><!-- % ICAPCOASEG -->
                                     <td class="titulocaja" colspan="1"><b
                                     id="label_ICAPCOASEG"><axis:alt
                                     f="axisrea004" c="LIT_ICAPCOASEG"
                                     lit="9902211"/></b></td> </axis:ocultar--%>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea004" c="CLOSSCORRIDOR"
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
                                                <axis:alt f="axisrea004"
                                                          c="ALT_LOSSCORR_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_LOSSCORR_SEL2"
                                                          lit="9902197"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaLoss}">
                                                <c:if test="${element.CCODIGO != 0}">
                                                    <option value="${element.CCODIGO}"
                                                            <c:if test="${element.CCODIGO == __formdata.OB_IAX_TRAMO.CLOSSCORRIDOR}"> selected </c:if>/>
                                                    ${element.TDESCRIPCION}
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisrea004" c="CCAPPEDRATIO"
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
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CRATIO_SEL1"
                                                          lit="1000348"/>
                                                &nbsp;
                                                <axis:alt f="axisrea004"
                                                          c="ALT_CRATIO_SEL2"
                                                          lit="9902198"/>
                                                -
                                            </option>
                                            <c:forEach var="element"
                                                       items="${__formdata.ListaCapped}">
                                                <c:if test="${element.CCODIGO != 0}">
                                                    <option value="${element.CCODIGO}"
                                                            <c:if test="${element.CCODIGO == __formdata.OB_IAX_TRAMO.CCAPPEDRATIO}"> selected </c:if>/>
                                                    ${element.TDESCRIPCION}
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <%-- axis:ocultar f="axisrea004" c="ICAPCOASEG"
                                     dejarHueco="false"> <td class="campocaja"
                                     colspan="1"> <!-- Capacidad/Coaseguro
                                     Importe --> <input type="text" class="campo
                                     campotexto" id="ICAPCOASEG" onchange=""
                                     name="ICAPCOASEG" style="width:80%"
                                     value="<fmt:formatNumber
                                     pattern='${__formatNumberPatterns[__defaultCMONINT]}'
                                     value='${__formdata.ICAPCOASEG}'/>"
                                     <axis:atr f="axisrea004" c="ICAPCOASEG"
                                     a="modificable=true"/>/> </td>
                                     </axis:ocultar--%>
                            </tr>
                        </table>
                        <!-- ************************* FIN DATOS TRAMOS  ********************* -->
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisrea004</c:param>
                            <c:param name="f">axisrea004</c:param>
                            <c:param name="__botones">cancelar,aceptar</c:param>
                        </c:import>
                    </td>
                </tr>
            </table>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>
