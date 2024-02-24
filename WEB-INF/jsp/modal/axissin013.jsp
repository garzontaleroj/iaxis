<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%--
/**
*  Fichero: axissin013.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*  
*  T?tulo: Siniestros ALTA MOV. PAGO/RECOBRO 
*
*  Fecha: 20/02/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
    <title><axis:alt f="axissin013" c="lit_100913" lit="100913"/> <axis:alt f="axissin013" c="lit_109479" lit="109479"/>/<axis:alt f="axissin013" c="lit_9000897" lit="9000897"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            var val1 = "<%=request.getAttribute("OK")%>"; 
            var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
           
            if (val1=="OK"){
              <!-- LCOL -->       
                var vCAUSIN = document.miForm.CCAUSIN.value;
                var vMOTSIN= document.miForm.CMOTSIN.value;
                if (document.miForm.CCAUSIN.value==""){
                    vCAUSIN=0;
                }
                if (document.miForm.CMOTSIN.value==""){
                    vMOTSIN=0;
                }        
                
               <axis:visible c="LCOL_PAGOS"  f="axissin013">
                <c:if test="${__formdata.CESTVAL_AUX==1 && __formdata.CESTPAG==1}">  
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_pagosini&SSEGURO="+document.miForm.SSEGURO.value+"&SIDEPAG="+document.miForm.SIDEPAG.value+"&TIPO=SINIES_PAGO"+"&CCAUSIN="+ vCAUSIN +"&CMOTSIN="+vMOTSIN);
                </c:if>
                <!--LCOL CUENTA DE COBRO DE AUTOS SI CTIPPAG =  7 Y ESTADO = ACEPTADO-->
                <c:if test="${__formdata.CTIPPAG==7 && __formdata.CESTPAG==1}">  
                     objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_pagosini&SSEGURO="+document.miForm.SSEGURO.value+"&SIDEPAG="+document.miForm.SIDEPAG.value+"&TIPO=SINIES_COBRO"+"&CCAUSIN="+vCAUSIN+"&CMOTSIN="+vMOTSIN);
                </c:if>                  
                <c:if test="${__formdata.CESTPAG!=1}">  
                    parent.f_aceptar_axissin013(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                    this.f_but_cancelar(); 
                </c:if>
              
                
                
                    <%--
                    <axis:ocultar c="ESTPAGADO" f="axissin013">
                  <c:if test="${__formdata.CESTVAL_AUX==1 && __formdata.CESTPAG==2}">  
                     objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_pagosini&SSEGURO="+document.miForm.SSEGURO.value+"&SIDEPAG="+document.miForm.SIDEPAG.value+"&TIPO=SINIES_PAGO"+"&CCAUSIN="+document.miForm.CCAUSIN.value+"&CMOTSIN="+document.miForm.CMOTSIN.value);
                  </c:if>
                 </axis:ocultar>
                    --%>
                </axis:visible>
                
               <!-- RESTO --> 
                <axis:visible c="RESTO_EMP"  f="axissin013">
                    parent.f_aceptar_axissin013(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                    this.f_but_cancelar(); 
                </axis:visible>  
            }
            //if (val1=="!OK") alert("<axis:alt f='axissin013' c='lit_9901225' lit='9901225' />");  
            
           
                var valida = "${__formdata.ULTMOVPAG.CESTVAL}";
                if (valida == 1){
                    document.miForm.CESTVAL.value = 1;
                    document.miForm.VCESTVAL.value = 1;
                    
                    if (val1!="!OK")
                        f_carga_pago();
                        
                    objDom.setDisabledPorId("CESTVAL",true);
                   }
           
            f_cargar_propiedades_pantalla();
        }
        
        
        function f_cerrar_axisimprimir(){
            //alert("En cerrar");
            var NSINIES = "${__formdata.NSINIES}";
            parent.f_aceptar_axissin013(NSINIES); //TODO: Dato EJ. para volver a la pantalla
            this.f_but_cancelar();
            
        }
        
        
        
        function f_but_aceptar(){
            if ($("#CESTPAG").val()==1){ 
                /*Si se va a cambiar el estado a ACEPTADO, se llama a la nueva interficie de contratos*/
                var qs="operation=ajax_carga_parametro";
                qs=qs+"&CPARAM="+"SIN_PAGOS_CONTRA";
                
                if (objValidador.validaEntrada()) { 
                    objAjax.invokeAsyncCGI("modal_axissin013.do", callbackajaxCargaParametro, qs, this, objJsMessages.jslit_cargando);
                }
            }else{
                if (objValidador.validaEntrada()) { 
                   objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                   objUtiles.ejecutarFormulario ("modal_axissin013.do?CESTVAL_AUX="+document.miForm.CESTVAL.value, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
        }
        
        function callbackajaxCargaParametro(ajaxResponseText){
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
            try{ 
                var SIN_PAGOS_CONTRA = 0;
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            SIN_PAGOS_CONTRA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("NVALPAR")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("NVALPAR")[0].childNodes[0].nodeValue : "");
                        }  
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                        
            if (SIN_PAGOS_CONTRA == 1){
                f_interficie_contratos();
            }else{
                /*Si se va a cambiar el estado a ACEPTADO, se verifica si hay recibos con prima pendiente
                  y se cumplen las condiciones para compensar el pago*/
                  
                var qs="operation=ajax_valida_compensacion";
                qs=qs+"&SSEGURO="+$("#SSEGURO").val();
                qs=qs+"&NSINIES="+$("#NSINIES").val();
                qs=qs+"&NRIESGO="+$("#NRIESGO").val();
                qs=qs+"&SIDEPAG="+$("#SIDEPAG").val();
                
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                objAjax.invokeAsyncCGI("modal_axissin013.do", callbackajaxValidaCompensacion, qs, this);
            }
        }
        
        function f_interficie_contratos(){
            var qs="operation=ajax_cargar_contratos";
            qs=qs+"&IPAGO="+"${__formdata.PAGO.ISINRET}";
            qs=qs+"&SPERSON="+"${__formdata.PAGO.DESTINATARI.PERSONA.SPERSON}";
            qs=qs+"&SSEGURO="+$("#SSEGURO").val();
            qs=qs+"&NSINIES="+$("#NSINIES").val();
            
            objAjax.invokeAsyncCGI("modal_axissin013.do", callbackajaxCargaContratos, qs, this, objJsMessages.jslit_cargando);
        }
        
        function callbackajaxCargaContratos(ajaxResponseText){
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            try{ 
                var CONTRATOS;
                var STATUS = 0;
                var MENSAJE;
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            STATUS = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("STATUS")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("STATUS")[0].childNodes[0].nodeValue : "");
                            MENSAJE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("MENSAJE")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("MENSAJE")[0].childNodes[0].nodeValue : "");
                        }  
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                        
            if (STATUS == 0){
                var qs="&IPAGO="+"${__formdata.PAGO.ISINRET}";
                qs=qs+"&SPERSON="+"${__formdata.PAGO.DESTINATARI.PERSONA.SPERSON}";
                qs=qs+"&SSEGURO="+$("#SSEGURO").val();
                qs=qs+"&NSINIES="+$("#NSINIES").val();
                qs=qs+"&SIDEPAG="+$("#SIDEPAG").val();
                objUtiles.abrirModal("axissin060", "src", "modal_axissin060.do?operation=init"+qs);
            }else if (STATUS == 1){
                /*Si se va a cambiar el estado a ACEPTADO, se verifica si hay recibos con prima pendiente
                  y se cumplen las condiciones para compensar el pago*/
                  
                var qs="operation=ajax_valida_compensacion";
                qs=qs+"&SSEGURO="+$("#SSEGURO").val();
                qs=qs+"&NSINIES="+$("#NSINIES").val();
                qs=qs+"&NRIESGO="+$("#NRIESGO").val();
                qs=qs+"&SIDEPAG="+$("#SIDEPAG").val();
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                objAjax.invokeAsyncCGI("modal_axissin013.do", callbackajaxValidaCompensacion, qs, this);
            }else if (STATUS == 2){
                alert(MENSAJE);
            }
        }
        
        function callbackajaxValidaCompensacion(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            try{
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
					var PTLITERA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTLITERA")[0]))? 
					objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTLITERA"), 0, 0) : "");                    
					if (!objUtiles.estaVacio(PTLITERA)){
						toogle('block','modal','ventana',PTLITERA);
					}else{
						/* Se procede normal, como hasta ahora. */
                        objUtiles.ejecutarFormulario ("modal_axissin013.do?CESTVAL_AUX="+document.miForm.CESTVAL.value, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
					}
				}
            }
            catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
        }  
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin013");
        }
        
        function f_carga_pago(){
        
            var qs="operation=ajax_pago";
            qs=qs+"&ESTVALANT="+document.miForm.VTESTVAL.value;
            qs=qs+"&ESTPAGANT="+document.miForm.VTESTPAG.value;
            qs=qs+"&ESTVAL="+document.miForm.CESTVAL.value;
            
            objAjax.invokeAsyncCGI("modal_axissin013.do", callbackajaxPago, qs, this, objJsMessages.jslit_cargando);
        
        }
        
        
        function callbackajaxPago(ajaxResponseText){
            try{ 
              
                var doc = objAjax.domParse(ajaxResponseText);
                var comboPago = document.miForm.CESTPAG;  
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        //alert("Existe elemento 0");
                            objDom.borrarOpcionesDeCombo(comboPago);
                            objDom.addOpcionACombo(null, " - " + objJsMessages.jslit_seleccionar + " - ", comboPago, 0);
                                    for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                        var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                        var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                        objDom.addOpcionACombo(CATRIBU, TATRIBU, comboPago, i+1);
                                        //alert(CGARANT);
                                        //alert(TGARANT);
                                    }  

                    }else{
                            objDom.borrarOpcionesDeCombo(comboPago);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboPago, null);
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }  
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axissin060'){
                if (objValidador.validaEntrada()) { 
                   objUtiles.ejecutarFormulario ("modal_axissin013.do?CESTVAL_AUX="+document.miForm.CESTVAL.value, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
        }
        function toogle(a,b,c,texto){
          document.getElementById(b).style.display=a;
          document.getElementById(c).style.display=a;          
          document.getElementById("modal_texto").innerHTML=texto;
        }
        function f_si(){
            toogle('none','modal','ventana');
            objUtiles.ejecutarFormulario ("modal_axissin013.do?CESTVAL_AUX="+document.miForm.CESTVAL.value, "compensacion_pagos", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_no(){
            toogle('none','modal','ventana');
            objUtiles.ejecutarFormulario ("modal_axissin013.do?CESTVAL_AUX="+document.miForm.CESTVAL.value, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }        
    </script>
</head>
<body onload="javascript:f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin012.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" name="SIDEPAG" id="SIDEPAG" value="${__formdata.SIDEPAG}"/>
    <input type="hidden" name="indexTramitacio" id="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CTIPPAG" id="CTIPPAG" value="${__formdata.CTIPPAG}"/>
    <input type="hidden" name="subpantalla" value="${subpantalla}"/>
    <input type="hidden" name="seccion" value="${seccion}"/>   
    <input type="hidden" name="NMOVPAG" id="NMOVPAG" value="${__formdata.NMOVPAG}"/>
    <input type="hidden" name="CCAUSIN" id="CCAUSIN" value="${__formdata.CCAUSIN}"/>
    <input type="hidden" name="CMOTSIN" id="CMOTSIN" value="${__formdata.CMOTSIN}"/>
    <input type="hidden" name="VTESTVAL" id="VTESTVAL" value="${__formdata.ULTMOVPAG.CESTVAL}"> 
    <input type="hidden" id="VTESTPAG" name="VTESTPAG" value="${__formdata.ULTMOVPAG.CESTPAG}"> 
    <input type="hidden" id="VTSUBPAG" name="VTSUBPAG" value="${__formdata.ULTMOVPAG.CSUBPAG}"> 
    <input type="hidden" name="VCESTVAL" id="VCESTVAL" value="${__formdata.CESTVAL}"> 
    <input type="hidden" name="VCSUBPAG" id="VCSUBPAG" value="${__formdata.CSUBPAG}"> 
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin013" c="lit_1000205" lit="1000205" /></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axissin060|<axis:alt f="axissin013" c="lit_109452" lit="109452" /></c:param>
    </c:import>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin013" c="lit_100913" lit="100913"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin013" c="lit_100913" lit="100913"/></c:param>
        <c:param name="form">axissin013</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <div id="modal" style="position:relative;display:none" >
        <div id="ventana" class="seccion" style="border-width:15px; border:solid; position:absolute; display:none; left: 25%; z-index: 1; width:500px; height:120px; padding-left:10%; padding-right:10%; opacity: 0.9; filter: alpha(opacity=90)">        
            <br><br>
            <b><div id="modal_texto"></div></b>
            <br><br>
            <div class="baseboton">
                <input type="button" class="boton" onclick="toogle('none','modal','ventana')" value="<axis:alt f="axissin013" c="lit_108211" lit="108211"/>"/>
                <input type="button" class="boton" style="float:right; margin-left:10px;" onclick="f_no()" value="<axis:alt f="${formulari}" c="lit_101779" lit="101779"/>"/>
                <input type="button" class="boton" style="float:right;" onclick="f_si()" value="<axis:alt f="${formulari}" c="lit_101778" lit="101778"/>"/>
            </div>
        </div>
    </div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr>
                    <tr>
                       <axis:ocultar f="axissin013" c="NSINIES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin013" c="NSINIES_LIT" lit="101298"/></b><!-- Numero de Siniestro-->
                            </td>
                       </axis:ocultar>    
                        <axis:ocultar c="TTIPTRA" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TTIPTRA" lit="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                    </axis:ocultar>
                    <axis:ocultar c="TTRAMIT" f="axissin013">
                       <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TTRAMIT" lit="100588"/></b><!-- Tipus dany  -->
                        </td>
                    </axis:ocultar>
                    <axis:ocultar c="TTCAUSIN" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TTCAUSIN" lit="9000901"/></b><!-- Tipus dany  -->
                        </td>
                    </axis:ocultar>
                    <axis:ocultar c="CINFORM" f="axissin013">
                       <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="CINFORM" lit="9000905"/></b><!-- Tramitación informativa -->
                            
                        </td>  
                    </axis:ocultar>
                        
                    </tr>
                    
                    <tr>
                     <axis:ocultar f="axissin013" c="NSNIES" dejarHueco="false"> 
                     <td class="campocaja">
                          <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        </axis:ocultar>
                    <axis:ocultar c="TTIPTRA" f="axissin013">
                        <td class="campocaja">
                         <input type="text" name="TTIPTRA" id="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TTIPTRA" a="modificable=false"/> />
                            
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="TTRAMIT" f="axissin013">
                        <td class="campocaja">
                         <input type="text" name="TTRAMIT" id="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TTRAMIT" a="modificable=false"/> />
                            
                        </td>    
                       </axis:ocultar>
                        <axis:ocultar c="TTCAUSIN" f="axissin013">
                        <td class="campocaja">
                            <input type="text" name="TTCAUSIN" id="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TTCAUSIN" a="modificable=false"/> />
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="CINFORM" f="axissin013">
                        <td class="campocaja" align="left">
                        <input type="checkbox"   id="CINFORM" name="CINFORM" <axis:atr f="axissin013" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                        <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                        </td>  
                        </axis:ocultar>
                        

                    </tr>
                    
                    <tr>
                        <axis:ocultar c="TESTTRA" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TESTTRA" lit="100587"/></b><!-- Estado -->
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TSUBTRA" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TSUBTRA" lit="9000852"/></b><!--Subestado -->
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="TUNITRA" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TUNITRA" lit="9000900"/></b><!-- Unidad tramitacion -->
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="TTRAMITAD" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TTRAMITAD" lit="140769"/></b><!-- Tramitador -->
                        </td>
                        </axis:ocultar>
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                    <axis:ocultar c="TESTTRA" f="axissin013">
                         <td class="campocaja">
                            <input type="text" name="TESTTRA" id="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TESTTRA" a="modificable=false"/> />
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TSUBTRA" f="axissin013">
                        <td class="campocaja">
                            <input type="text" name="TSUBTRA" id="TSUBTRA"  value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TSUBTRA" a="modificable=false"/> />                        
                        </td>   
                           </axis:ocultar>
                         <axis:ocultar c="TUNITRA" f="axissin013">
                        <td class="campocaja">
                            <input type="text" name="TUNITRA" id="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TUNITRA" a="modificable=false"/> />
                        
                            
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="TTRAMITAD" f="axissin013">
                        <td class="campocaja">
                           <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin013" c="TTRAMITAD" a="modificable=false"/> />
                        </td>
                         </axis:ocultar>
                                          
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <axis:ocultar c="TTIPPAG" f="axissin013">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin013" c="TTIPPAG" lit="100565"/></b><!-- Tipo -->
                            </td>
                        </axis:ocultar>
                         <axis:ocultar c="TTRAMITAD" f="axissin013">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axissin013" c="DESTINATARI" lit="9000909"/></b><!-- Destinatario -->
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="TCONPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TCONPAG" lit="9001284"/></b><!-- Concepto Pago -->
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TCAUIND" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TCAUIND" lit="9001199"/></b><!-- Causa Indemnizacion -->
                        </td>
                         </axis:ocultar>
                         
                        <td></td>
                    </tr>
                    <tr>
                        <axis:ocultar c="TTIPPAG" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TTIPPAG"  name="TTIPPAG" 
                            <axis:atr f="axissin013" c="TTIPPAG" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;" value="${__formdata.PAGO.TTIPPAG}">
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="DESTINATARI" f="axissin013">
                        <td class="campocaja" colspan="2">
                            <input type="text" id="DESTINATARI"  name="DESTINATARI" 
                            <axis:atr f="axissin013" c="DESTINATARI" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:95%;"
                            value="${__formdata.PAGO.DESTINATARI.PERSONA.SPERSON} - ${__formdata.PAGO.DESTINATARI.PERSONA.TNOMBRE}  ${__formdata.PAGO.DESTINATARI.PERSONA.TAPELLI1} ${__formdata.PAGO.DESTINATARI.PERSONA.TAPELLI2}">
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TCONPAG" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TCONPAG"  name="TCONPAG" 
                            <axis:atr f="axissin013" c="TCONPAG" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.PAGO.TCONPAG}">                        
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TCAUIND" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TCAUIND"  name="TCAUIND" 
                            <axis:atr f="axissin013" c="TCAUIND" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.PAGO.TCAUIND}">                                                
                        </td>
                         </axis:ocultar>
                        <td></td>
                    </tr>
                    
                    
                    <tr>
                        <axis:ocultar c="FORDPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="FORDPAG" lit="9000910"/></b><!-- Fecha orden -->
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="NFACREF" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="NFACREF" lit="9001285"/></b><!-- Referencia -->
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="FFACREF" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="FFACREF" lit="9000956"/></b><!-- data factura -->
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="TFORPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TFORPAG" lit="100712"/></b><!-- Forma Pago -->
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="CBANCAR" f="axissin013">
                        <td class="titulocaja">
                        <c:if test="${__formdata.CFORPAG == 1}">
                            <b><axis:alt f="axissin013" c="CBANCAR" lit="100965"/></b><!-- cta bancaria -->
                        </c:if>
                        </td>   
                        </axis:ocultar>
                    </tr>
                    <tr>
                         <axis:ocultar c="FORDPAG" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="FORDPAG"  name="FORDPAG" 
                            <axis:atr f="axissin013" c="FORDPAG" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PAGO.FORDPAG}"/>">                          
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="NFACREF" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="NFACREF"  name="NFACREF"
                            <axis:atr f="axissin013" c="NFACREF" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.PAGO.NFACREF}">    

                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="FFACREF" f="axissin013">
                        <td class="campocaja">
                            <input type="text"  id="FFACREF" name="FFACREF" 
                            <axis:atr f="axissin013" c="FFACREF" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PAGO.FFACREF}"/>">                          
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TFORPAG" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TFORPAG"  name="TFORPAG" 
                            <axis:atr f="axissin013" c="TFORPAG" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.PAGO.TFORPAG}">                         
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="CBANCAR" f="axissin013">
                        <td class="campocaja">
                        <c:if test="${__formdata.PAGO.CFORPAG == 1}">
                            <input type="text" id="CBANCAR"  name="CBANCAR" 
                            <axis:atr f="axissin013" c="CBANCAR" a="modificable=false"/>
                            class="campowidthselect campo campotexto" style="width:90%;"
                            value="<axis:masc f="axissin013" c="CBANCAR" value="${__formdata.PAGO.CBANCAR}" />">   
                            <input type="hidden" id="CBANCARx" name="CBANCARx" value="${__formdata.CBANCAR}">
                            <input type="hidden" id="CTIPBAN" name="CTIPBAN" value="${__formdata.CTIPBAN}">
                        </c:if>
                        </td>
                           </axis:ocultar>                      

                    </tr>
                    
                    

                    </table>
                    </td>
                    </tr>
                    <!-- Segunda seccion -->
                    <div class="separador">&nbsp;</div>
                    <tr>
                    <td>
                    <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                      
                    </tr>
                    <tr>
                        <axis:ocultar c="TESTVAL" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TESTVAL" lit="9001325"/></b><!-- Estado Val. Anterior -->
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="TESTPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TESTPAG" lit="9001327"/></b><!-- Estado Pago anterior  -->
                        </td>
                        </axis:ocultar>
                          <axis:ocultar c="TSUBPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="TSUBPAG" lit="9902489"/></b><!-- Estado Pago  -->
                        </td>
                         </axis:ocultar>
                        <td class="titulocaja">
                            
                        </td>
                        
                    </tr>  
                    
                    <tr>
                     <axis:ocultar c="TESTVAL" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TESTVAL" 
                            <axis:atr f="axissin013" c="TESTVAL" a="modificable=false"/>
                            name="TESTVAL" class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.ULTMOVPAG.TESTVAL}"> 
                        </td>
                         </axis:ocultar>
                         <axis:ocultar c="TESTPAG" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TESTPAG" 
                            <axis:atr f="axissin013" c="TESTPAG" a="modificable=false"/>
                            name="TESTPAG" class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.ULTMOVPAG.TESTPAG}"> 
                        </td>
                         </axis:ocultar>
                          <axis:ocultar c="TSUBPAG" f="axissin013">
                        <td class="campocaja">
                            <input type="text" id="TSUBPAG" 
                            <axis:atr f="axissin013" c="TSUBPAG" a="modificable=false"/>
                            name="TESTPAG" class="campowidthselect campo campotexto" style="width:90%;"
                            value="${__formdata.ULTMOVPAG.TSUBPAG}"> 
                        </td>
                         </axis:ocultar>
                         
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                     <axis:ocultar c="CESTVAL" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="CESTVAL" lit="9000948"/></b><!-- Estado Validación -->
                        </td>
                          </axis:ocultar>
                         <axis:ocultar c="CESTPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="CESTPAG" lit="9001326"/></b><!-- Estado Pago  -->
                        </td>
                         </axis:ocultar>
                         
                          <axis:ocultar c="CSUBPAG" f="axissin013">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin013" c="CSUBPAG" lit="9000852"/></b><!-- Estado Pago  -->
                        </td>
                         </axis:ocultar>
                        <td class="titulocaja">
                            
                        </td>
                        
                    </tr>
                    
                    <tr>
                     <axis:ocultar c="CESTVAL" f="axissin013">
                        <td class="campocaja">
                            <select name="CESTVAL" id="CESTVAL" size="1" class="campowidthselect campo campotexto_ob" 
                            <axis:atr f="axissin013" c="CESTVAL" a="modificable=true&isInputText=false&obligatorio=true"/>
                            style="width:90%;" onchange="f_carga_pago()">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin013" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipoval" items="${__formdata.listvalores.lstestval}">
                                    <option value = "${tipoval.CATRIBU}" 
                                    <c:if test="${tipoval.CATRIBU == __formdata.CESTVAL}"> selected </c:if> />
                                        ${tipoval.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                         <axis:ocultar c="CESTPAG" f="axissin013">
                         
                       
                         
                        <td class="campocaja">
                            <select name="CESTPAG" id="CESTPAG" size="1"  class="campowidthselect campo campotexto_ob"
                            <axis:atr f="axissin013" c="CESTPAG" a="modificable=true&isInputText=false&obligatorio=true"/>
                            style="width:90%;">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin013" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipopag" items="${__formdata.listValores.lcestpag}">
                                    <option value = "${tipopag.CATRIBU}" 
                                    <c:if test="${tipopag.CATRIBU == __formdata.CESTPAG}"> selected </c:if> />
                                        ${tipopag.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        
                          <axis:ocultar c="CSUBPAG" f="axissin013">
                         
                       
                         
                        <td class="campocaja">
                            <select name="CSUBPAG" id="CSUBPAG" size="1"  class="campowidthselect campo campotexto_ob"
                            <axis:atr f="axissin013" c="CSUBPAG" a="modificable=true&isInputText=false"/>
                            style="width:90%;">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin013" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="tipopag" items="${__formdata.listvalores.lcsubpag}">
                                    <option value = "${tipopag.CATRIBU}" 
                                    <c:if test="${tipopag.CATRIBU == __formdata.CSUBPAG}"> selected </c:if> />
                                        ${tipopag.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <td></td>
                        <td></td>
                    </tr>
                    
                    </table>
                    </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin013</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
