<%/**
*  Fichero: axissin005.jsp
*  Incluye nuevo formato con títulos en la parte superior
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>  
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>  
*  Fecha: 23/04/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axissin005" c="TITULO_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                                
                //Si se ha entrado por segunda vez no mostrar el alert
                if (objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA"))){
                    f_abrir_axisctr019();
                }
                 
                <c:if test="${sessionScope.ESTADO==4}">
                      document.miForm.IMPCAPRIS.disabled="true";
                      document.miForm.IMPCAPRIS.setAttribute('obligatorio','false'); 
                </c:if>
                    
                <c:if test="${sessionScope.ESTADO==5}">
                      //document.miForm.but_simular.disabled=false;
                      //document.miForm.IMPCAPRIS.disabled="false";
                </c:if>

                f_cargar_propiedades_pantalla();
            }
            
            function cambiaCalculo(){ 
                var i,valor;
                for (i=0;i<document.miForm.radioTotalParcial.length;i++){ 
                   if (document.miForm.radioTotalParcial[i].checked) 
                      break; 
                } 

                if(i==0){
                    document.miForm.IMPCAPRIS.disabled=true;
                    //document.miForm.but_simular.disabled=true;
                    document.miForm.IMPCAPRIS.setAttribute('obligatorio','false');
                     objUtiles.ejecutarFormulario("axis_axissin005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else if(i==1){
                    document.miForm.IMPCAPRIS.value="";
                    document.miForm.IMPCAPRIS.disabled=false;     
                    document.miForm.IMPCAPRIS.setAttribute('obligatorio','true');
                    revisarEstilos();
                    document.miForm.IMPPRIMASCONS.value="";
                    document.miForm.IMPRETENCION.value="";
                    document.miForm.IMPRENDBRUTO.value="";
                    document.miForm.IMPRESCATE.value="";
                    document.miForm.IMPREDUCCION.value="";
                    document.miForm.IMPREGTRANS.value="";
                    document.miForm.IMPRCM.value="";
                    document.miForm.IMPPENALI.value="";
                    document.miForm.IMPRESNETO.value="";
                }else{
                  alert("<axis:alt f="axissin005" c="LIT_IMPORTE" lit="100563"/>");
                }
                
            } 
                     
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_general", "cancelar", document.miForm, "_self");
            }
            
            function f_but_1000531(){
                f_but_simular();
            }
            
            function f_but_simular() {
            
                if(objValidador.validaEntrada()){
        
                    var i,valor;
                    for (i=0;i<document.miForm.radioTotalParcial.length;i++){ 
                         if (document.miForm.radioTotalParcial[i].checked) 
                            break; 
                    }
                        
                    var importe = objDom.getValorPorId("IMPCAPRIS");
                    
                    <%--    if(importe!=null && importe!=""){ --%>
                    
                            if(i==0){
                                valor=4;
                                objAjax.invokeAsyncCGI("axis_axissin005.do", callbackSimular, "operation=simular" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+ "&IMPCAPRIS="+objDom.getValorPorId("IMPCAPRIS")
                                 + "&CCAUSIN="+ valor + "&NRIESGO="+objDom.getValorPorId("NRIESGO")+ "&FECHA="+ objDom.getValorPorId("FECHA"), this,  objJsMessages.jslit_cargando, false);
                         
                         
                            }else{                            
                                valor=5;
                                objAjax.invokeAsyncCGI("axis_axissin005.do", callbackSimular, "operation=simular" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+ "&IMPCAPRIS="+objDom.getValorPorId("IMPCAPRIS")
                                + "&CCAUSIN="+ valor + "&FECHA="+ objDom.getValorPorId("FECHA") + "&NRIESGO="+objDom.getValorPorId("NRIESGO"), this,  objJsMessages.jslit_cargando, false);
                     
                   }
                }
           }
            
            function f_but_aceptar(){
              var at=document.getElementById('mensajes_table'); 
             if (at != null){
                at.style.visibility='hidden';
             }
             toggleMensajes(); 
              if(objValidador.validaEntrada()){
                 
                 var importe = objDom.getValorPorId("IMPCAPRIS");
                 
                 var neto = objDom.getValorPorId("IMPRESNETO");
                 var i,valor;

                 for (i=0;i<document.miForm.radioTotalParcial.length;i++){ 
                     if (document.miForm.radioTotalParcial[i].checked) 
                        break; 
                 }

                 if(importe!=null && importe!=""){ 
                
                    if(i==0){
                        valor=4;
                    }else{
                        valor=5;
                    }

                    if(neto!=null && neto!=""){ 
                        objAjax.invokeAsyncCGI("axis_axissin005.do", callbackAceptarSim, "operation=aceptar" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+ "&IMPCAPRIS="+objDom.getValorPorId("IMPCAPRIS")
                        + "&CCAUSIN="+ valor + "&FECHA="+ objDom.getValorPorId("FECHA") + "&NRIESGO="+objDom.getValorPorId("NRIESGO")+ "&IMPPENALI="+objDom.getValorPorId("IMPPENALI"), this,  objJsMessages.jslit_cargando, false);
                    }else{
                        alert("<axis:alt f="axissin005" c="MSG_SIMUL" lit="9000544"/>");
                    }
                 }else{
                        alert("<axis:alt f="axissin005" c="LIT_IMPORTE" lit="100563"/> "+objJsMessages.jslit_campo_obligatorio);
                 }
               }
            }
            
            /****************************************************************************************/
            /*********************************** MODALES    *****************************************/
            /****************************************************************************************/
            function f_abrir_axisctr019() {
               objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=RESCA");               
            }
            
            function f_cerrar_axisctr019(){
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr019(SSEGURO){
                objDom.setValorPorId("SSEGURO", SSEGURO);
                f_cerrar_axisctr019();
                objDom.setValorPorId("BORRAR", "true");
                            
                objUtiles.ejecutarFormulario("axis_axissin005.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
                
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_general", "cancelar", document.miForm, "_self");
            }    
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            function callbackSimular(ajaxResponseText) {
              //alert(ajaxResponseText);  
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   
                    //objDom.setVisibilidadPorId("but_emitir", "hidden");
                    //recogemos mensaje con el número de poliza y lo enviamos a
                    //impresion Axisimprimir
                                   
                    //if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                      //  var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                        //alert(mensaje);
                    //}else{
                            
                        //if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            //var elementos = doc.getElementsByTagName("element");
                          
                            var IMPRETEN = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRETENCION")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRETENCION"), 0, 0) : "";
                            var importe_IMPRETEN = objNumero.cambiarSeparadorMilesPorDecimales(IMPRETEN);
                            objDom.setValorPorId("IMPRETENCION", objValidador.valorFormateadoCampoNumerico(importe_IMPRETEN,true,true)); 
                         
                            
                            var IMPRESCATE = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRESCATE")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRESCATE"), 0, 0) : "";
                            var importe_IMPRESCATE = objNumero.cambiarSeparadorMilesPorDecimales(IMPRESCATE);
                            objDom.setValorPorId("IMPRESCATE",objValidador.valorFormateadoCampoNumerico(importe_IMPRESCATE,true,true) );

                            
                            var IMPPRIMASCONS = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPPRIMASCONS")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPRIMASCONS"), 0, 0) : "";
                            var importe_IMPPRIMASCONS = objNumero.cambiarSeparadorMilesPorDecimales(IMPPRIMASCONS);
                            objDom.setValorPorId("IMPPRIMASCONS", objValidador.valorFormateadoCampoNumerico(importe_IMPPRIMASCONS,true,true));
                           
                            
                            var IMPRENDBRUTO = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRENDBRUTO")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRENDBRUTO"), 0, 0) : "";
                            var importe_IMPRENDBRUTO = objNumero.cambiarSeparadorMilesPorDecimales(IMPRENDBRUTO);
                            objDom.setValorPorId("IMPRENDBRUTO",objValidador.valorFormateadoCampoNumerico(importe_IMPRENDBRUTO,true,true) );
                           
                            var IMPREDUCCION = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPREDUCCION")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPREDUCCION"), 0, 0) : "";
                            var importe_IMPREDUCCION = objNumero.cambiarSeparadorMilesPorDecimales(IMPREDUCCION);
                            objDom.setValorPorId("IMPREDUCCION",objValidador.valorFormateadoCampoNumerico(importe_IMPREDUCCION,true,true));
                            
                            var IMPREGTRANS = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPREGTRANS")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPREGTRANS"), 0, 0) : "";
                            var importe_IMPREGTRANS = objNumero.cambiarSeparadorMilesPorDecimales(IMPREGTRANS);
                            objDom.setValorPorId("IMPREGTRANS", objValidador.valorFormateadoCampoNumerico(importe_IMPREGTRANS,true,true));
                          
                            
                            var IMPPROVISION = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPPROVISION")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPROVISION"), 0, 0) : "";
                            var importe_IMPPROVISION = objNumero.cambiarSeparadorMilesPorDecimales(IMPPROVISION);
                            objDom.setValorPorId("IMPPROVISION", objValidador.valorFormateadoCampoNumerico(importe_IMPPROVISION,true,true)); 
                      
                            
                            var IMPCAPFALL = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPCAPFALL")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPCAPFALL"), 0, 0) : "";
                            var importe_IMPCAPFALL = objNumero.cambiarSeparadorMilesPorDecimales(IMPCAPFALL);
                            objDom.setValorPorId("IMPCAPFALL",objValidador.valorFormateadoCampoNumerico(importe_IMPCAPFALL,true,true) );
                         
                            
                            var IMPCAPGARAN = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPCAPGARAN")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPCAPGARAN"), 0, 0) : "";
                            var importe_IMPCAPGARAN = objNumero.cambiarSeparadorMilesPorDecimales(IMPCAPGARAN);
                            objDom.setValorPorId("IMPCAPGARAN", objValidador.valorFormateadoCampoNumerico(importe_IMPCAPGARAN,true,true));
                          
                            
                            var IMPPENALI = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPPENALI")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPENALI"), 0, 0) : "";
                            var importe_IMPPENALI = objNumero.cambiarSeparadorMilesPorDecimales(IMPPENALI);
                            objDom.setValorPorId("IMPPENALI",objValidador.valorFormateadoCampoNumerico(importe_IMPPENALI,true,true) );
                         
                            
                            var IMPRESNETO = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRESNETO")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRESNETO"), 0, 0) : "";
                            var importe_IMPRESNETO = objNumero.cambiarSeparadorMilesPorDecimales(IMPRESNETO);
                            objDom.setValorPorId("IMPRESNETO",objValidador.valorFormateadoCampoNumerico(importe_IMPRESNETO,true,true));
                     
                            
                            var IMPRCM = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRCM")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRCM"), 0, 0) : "";
                            var importe_IMPRCM = objNumero.cambiarSeparadorMilesPorDecimales(IMPRCM);
                            objDom.setValorPorId("IMPRCM", objValidador.valorFormateadoCampoNumerico(importe_IMPRCM,true,true));
                            
                            var IMPCAPRIS = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPCAPRIS")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPCAPRIS"), 0, 0) : "";
                            var importe_IMPCAPRIS = objNumero.cambiarSeparadorMilesPorDecimales(IMPCAPRIS);
                            objDom.setValorPorId("IMPCAPRIS", objValidador.valorFormateadoCampoNumerico(importe_IMPCAPRIS,true,true));
                        
                            //alert("final");
                             objDom.setDisabledPorId("but_aceptar",false);
                            
                        //}
                            
                  // }     
                            
                } else{
                     var at=document.getElementById('mensajes_table'); 
                     if (at != null){
                        at.style.visibility='hidden';
                     }
                     toggleMensajes();
                     objDom.setDisabledPorId("but_aceptar",true);
                     
                     if(document.miForm.IMPCAPRIS){
                         var IMPCAPRIS = document.miForm.IMPCAPRIS.value;
                         objDom.setValorPorId("IMPCAPRIS", objValidador.valorFormateadoCampoNumerico(IMPCAPRIS,true,true));
                     }
                }
            }
           
            function callbackTarifar(ajaxResponseText) {
                //alert(ajaxResponseText);
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                //alert("EN ACEPTAR");
                    // Si todo ha ido bien, desactivar botones.
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("RESULTADO")[0])){
                        var valor = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RESULTADO"), 0, 0);
                        var error = objDom.getValorNodoDelComponente(doc.getElementsByTagName("MENSAJE"), 0, 0);
                    }
                        
                    if(valor==0){
                        objDom.setDisabledPorId("but_aceptar",false);
                        objDom.setDisabledPorId("but_1000531",false);
                        alert("<axis:alt f="axissin005" c="LIT_PROCESO_OK" lit="111313"/>");
                    }else{
                    }
                 }
             }
            
            ////////////////////////////////////////////////////////////
            
            function callbackAceptarSim(ajaxResponseText) {
                try{
                
                    var doc = objAjax.domParse(ajaxResponseText);
                   
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                              
                        //alert(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0]));
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                          
                            var elementos = doc.getElementsByTagName("element");
                           
                            var CODIGO = objUtiles.existeObjetoXml(elementos[0].getElementsByTagName("CODIGO")[0]) ?
                            objDom.getValorNodoDelComponente(elementos[0].getElementsByTagName("CODIGO"), 0, 0) : "";
                           
                            if(CODIGO==0){
                               
                               objDom.setDisabledPorId("but_aceptar",true);
                               objDom.setDisabledPorId("but_1000531",true);
                            }
                        }
                     objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=RESCATE");    
                    } 
                }
                catch(e){
                    alert("error:"+e);
                }
            }
            
            //////////////////////////////////////////////////////////////
            function callbackAceptar(ajaxResponseText) {
              
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
              
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        //alert("En if");
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                        //alert(mensaje);
                    }else{
                        //alert("En else");
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CODIGO")[0])){

                            var valor = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODIGO"), 0, 0);
                            if(valor==0){
                                document.miForm.but_simular.disabled=true;
                                document.miForm.but_aceptar.disabled=true;
                            }
                        }
                    }
                }
             }
             
          function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
          }
             
             
            
        </script>
    </head>
    <body  onload="f_onload()">
        
        
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
        
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="BORRAR" id="BORRAR" value="" />

            <!--input type="hidden" name="CCAUSIN" id="CCAUSIN" value="" /-->
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axissin005" c="TITULO" lit="152061" /></c:param>
                <c:param name="formulario"><axis:alt f="axissin005" c="TITULO" lit="152061" /></c:param>
                <c:param name="form">axissin005</c:param>
            </c:import>
            <!-- pantallas modales -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin005" c="TITULO_BUSC_POL" lit="1000188" /></c:param>
                <c:param name="nid" value="axisctr019"></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin005" c="TITULO_IMPRESION" lit="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir"></c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axissin005" c="LIT_DATOS_POL" lit="104925"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="NPOLIZA">                                    
                                               <td class="titulocaja" ><b><axis:alt f="axissin005" c="NPOLIZA" lit="100836"/></b></td>
                                            </axis:ocultar>                                               
                                               
                                            <axis:ocultar f="axissin005" c="NCERTIF">                                                
                                               <td class="titulocaja" ><b><axis:alt f="axissin005" c="NCERTIF" lit="101168"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="NRIESGO">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="NRIESGO" lit="100649"/></b></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin005" c="FEFECTO">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="FEFECTO" lit="100883"/></b></td>
                                            </axis:ocultar>                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="NPOLIZA"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"  style="width:90%"
                                                    value="${__formdata.NPOLIZA}" <axis:atr f="axissin005" c="NPOLIZA" a="modificable=false"/> />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="NCERTIF"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"  style="width:40%"
                                                    value="${__formdata.NCERTIF}" <axis:atr f="axissin005" c="NCERTIF" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="NRIESGO"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NRIESGO" name="NRIESGO" size="15"  style="width:40%"
                                                    value="${__formdata.NRIESGO}" <axis:atr f="axissin005" c="NRIESGO" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="FEFECTO"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"  style="width:40%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" <axis:atr f="axissin005" c="FEFECTO" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <!--TABLE     ASEGURADOS -->
                                            <tr>
                                                <td colspan="4">

                                                    <c:set var="title0"><axis:alt f="axissin005" c="LIT_ASEGURADOS" lit="100645" /></c:set>

                                                    <div class="separador">&nbsp;</div>
                                                    <div class="displayspace">
                                                    <display:table name="${sessionScope.axissin_asegurados}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_plantilla.do?operation=general&paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                        
                                                        <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspText">${lista.OB_IAX_ASEGURADOS.TAPELLI1}&nbsp;${lista.OB_IAX_ASEGURADOS.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_ASEGURADOS.TNOMBRE}</div>
                                                        </display:column>
                                                     
                                                    </display:table>
                                                    </div>
                                                    <div class="separador">&nbsp;</div>
                                                          
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td><!-- en tres columnas-->
                                                
                                            </tr>
                                            <!--FIN TABLE ASGURADOS-->
                                        </tr>
                                        
                                        <tr>
                                            <!--TABLE     TOMADORES-->
                                            <tr>
                                                <td colspan="4">

                                                    <c:set var="title0"><axis:alt f="axissin005" c="LIT_TOMADORES" lit="1000181" /></c:set>
                                                   
                                                    <div class="separador">&nbsp;</div>
                                                    <div class="displayspace">
                                                    <display:table name="${sessionScope.axissin_tomadores}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_plantilla.do?operation=general&paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                        
                                                        <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspText">${lista.OB_IAX_TOMADORES.TAPELLI1}&nbsp;${lista.OB_IAX_TOMADORES.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_TOMADORES.TNOMBRE}</div>
                                                        </display:column>
                                                        
                                                    </display:table>
                                                    </div>
                                                    <div class="separador">&nbsp;</div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td><!-- en tres columnas-->
                                                
                                            </tr>
                                            <!--FIN TABLE TOMADORES -->
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                            
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin005" c="LIT_DATOS_ECON" lit="1000097"/></div>
                        <!-- Sección 2 -->
                        <table class="seccion">
                            <!--tr>
                                <td>
                                   
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="LIT_APORTACIONES" lit="108230"/>/<axis:alt f="axissin005" c="IMPRIMAPER" lit="1000512"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPAPORTACUM" lit="1000513"/></b></td>
                                                                               
                                        </tr>
                                        <tr>
                                            <axis:visible f="axissin005" c="IMPRIMAPER"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPRIMAPER" name="IMPRIMAPER" size="15"  
                                                    value="${__formdata.IMPRIMAPER}" <axis:atr f="axissin005" c="IMPRIMAPER" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axissin005" c="IMPAPORTACUM"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPAPORTACUM" name="IMPAPORTACUM" size="15"  
                                                    value="${__formdata.IMPAPORTACUM}" <axis:atr f="axissin005" c="ImpAportAcum" a="modificable=false"/> />
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTACUMTOT" name="IMPAPORTACUMTOT" size="15" 
                                                    value="${__formdata.IMPAPORTACUMTOT}" <axis:atr f="axissin005" c="IMPAPORTACUMTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                                <tr>
                                <td>
                                   
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPRIMAACTUAL" lit="1000514"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPAPORTMAX" lit="1000515"/></b></td>
                                                                               
                                        </tr>
                                        <tr>
                                             <axis:visible f="axissin005" c="IMPPRIMAINICIAL"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPRIMAINICIAL" name="IMPPRIMAINICIAL" size="15"  
                                                    value="${__formdata.IMPPRIMAINICIAL}" <axis:atr f="axissin005" c="IMPPRIMAINICIAL" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                             <axis:visible f="axissin005" c="IMPAPORTMAX"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPAPORTMAX" name="IMPAPORTMAX" size="15"  
                                                    value="${__formdata.IMPAPORTMAX}" <axis:atr f="axissin005" c="IMPAPORTMAX" a="modificable=false"/> />
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTMAXTOT" name="IMPAPORTMAXTOT" size="15"  
                                                    value="${__formdata.IMPAPORTMAXTOT}" <axis:atr f="axissin005" c="IMPAPORTMAXTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPRIMAINICIAL" lit="1000516"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPAPORTPEND" lit="1000517"/></b></td>
                                                                               
                                        </tr>
                                        <tr>
                                            <axis:visible f="axissin005" c="IMPPRIMAACTUAL"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPRIMAACTUAL" name="IMPPRIMAACTUAL" size="15"  
                                                    value="${__formdata.IMPPRIMAACTUAL}" <axis:atr f="axissin005" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axissin005" c="IMPAPORTPEND"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPAPORTPEND" name="IMPAPORTPEND" size="15"
                                                    value="${__formdata.IMPAPORTPEND}" <axis:atr f="axissin005" c="IMPAPORTPEND" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            </tr>
                        </table-->
                        <tr>
                            <td>
                        <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <!--th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th-->
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPRIMAPER">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="LIT_APORTACIONES" lit="108230"/>&nbsp;<axis:alt f="axissin005" c="IMPRIMAPER" lit="1000512"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="IMPPRIMAACTUAL">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPRIMAACTUAL" lit="1000514"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="IMPPRIMAINICIAL">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPRIMAINICIAL" lit="1000516"/></b></td>
                                            </axis:ocultar>
                                            
                                            <td>&nbsp;</td>
                                            
                                            <axis:ocultar f="axissin005" c="IMPAPORTMAX">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPAPORTMAX" lit="1000515"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="IMPAPORTACUM">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPAPORTACUM" lit="1000513"/></b></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin005" c="IMPAPORTPEND">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPAPORTPEND" lit="1000517"/></b></td>
                                            </axis:ocultar>                                        
                                        
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPRIMAPER"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidth campo campotexto" id="IMPRIMAPER" name="IMPRIMAPER" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAPER}' />" <axis:atr f="axissin005" c="IMPRIMAPER" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="ImpPrimaActual"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPPRIMAACTUAL" name="IMPPRIMAACTUAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAACTUAL}' />" <axis:atr f="axissin005" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="ImpPrimaInicial"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPPRIMAINICIAL" name="IMPPRIMAINICIAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAINICIAL}' />" <axis:atr f="axissin005" c="IMPPRIMAINICIAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <td></td>
                                             <axis:ocultar f="axissin005" c="ImpAportMax"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTMAX" name="IMPAPORTMAX" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTMAX}' />" <axis:atr f="axissin005" c="IMPAPORTMAX" a="modificable=false"/> />
                                                    <input type="text" class="campowidthsmall campo campotexto" id="IMPAPORTMAXTOT" name="IMPAPORTMAXTOT" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTMAXTOT}' />" <axis:atr f="axissin005" c="IMPAPORTMAXTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="IMPAPORTACUM"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTACUM" name="IMPAPORTACUM" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTACUM}' />" <axis:atr f="axissin005" c="ImpAportAcum" a="modificable=false"/> />
                                                    <input type="text" class="campowidthsmall campo campotexto" id="IMPAPORTACUMTOT" name="IMPAPORTACUMTOT" size="15" 
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTACUMTOT}' />" <axis:atr f="axissin005" c="IMPAPORTACUMTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="IMPAPORTPEND"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTPEND" name="IMPAPORTPEND" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTPEND}' />" <axis:atr f="axissin005" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            </table>
                        <!-- tercera seccion -->
                        <!--div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin005" c="LIT_PROVISIONES" lit="102656"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPROVISION" lit="1000518"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPCAPFALL" lit="1000519"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPCAPGARAN" lit="1000521"/></b></td>
                                            
                                        </tr>
                                        <tr>
                                         
                                            <axis:visible f="axissin005" c="IMPPROVISION"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                                                    value="${__formdata.IMPPROVISION}" <axis:atr f="axissin005" c="IMPPROVISION" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axissin005" c="IMPCAPFALL"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPFALL" name="IMPCAPFALL" size="15"
                                                    value="${__formdata.IMPCAPFALL}" <axis:atr f="axissin005" c="IMPCAPFALL" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axissin005" c="IMPCAPGARAN"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPGARAN" name="IMPCAPGARAN" size="15"
                                                    value="${__formdata.IMPCAPGARAN}" <axis:atr f="axissin005" c="IMPCAPGARAN" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table--> 
                        
                        <!-- tercera seccion -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin005" c="LIT_PROVISIONES" lit="102656"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                     
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPPROVISION">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPROVISION" lit="1000518"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="IMPCAPFALL">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPCAPFALL" lit="1000519"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin005" c="IMPCAPGARAN">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPCAPGARAN" lit="1000521"/></b></td>
                                            </axis:ocultar>                                            
                                            
                                        </tr>
                                        <tr>
                                         
                                            <axis:ocultar f="axissin005" c="IMPPROVISION"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPROVISION}' />" <axis:atr f="axissin005" c="IMPPROVISION" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="IMPCAPFALL"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPFALL" name="IMPCAPFALL" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPCAPFALL}' />" <axis:atr f="axissin005" c="IMPCAPFALL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin005" c="IMPCAPGARAN"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPGARAN" name="IMPCAPGARAN" size="15"
                                                   value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPCAPGARAN}' />" <axis:atr f="axissin005" c="IMPCAPGARAN" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                        <!-- tercera seccion -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin005" c="LIT_SIMUL_RESCATE" lit="1000528"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            
                                            <th style="width:40%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:40%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                 <!-- Área radio buttons total o parcial -->
                                                <table class="seccion" align="center">
                                                <tr>                                                
                                                  <axis:visible f="axissin005" c="OPE_TOTAL"> 
                                                    <td><b><axis:alt f="axissin005" c="OPE_TOTAL" lit="1000529"/></b><input  <c:if test="${sessionScope.ESTADO==4 ||( __configform.axissin005__OPE_PARCIAL__visible == 'false' && __configform.axissin005__OPE_TOTAL__visible == 'true') }">checked</c:if> onClick="javascript:cambiaCalculo()" 
                                                    value="4" type="radio" id="radioTotalParcial" name="radioTotalParcial"/></td>
                                                  </axis:visible>  
                                                    <td>
                                                    </td>
                                                  <axis:visible f="axissin005" c="OPE_PARCIAL"> 
                                                    <td><b><axis:alt f="axissin005" c="OPE_PARCIAL" lit="1000530"/></b>&nbsp;&nbsp;<input  <c:if test="${sessionScope.ESTADO==5}">checked</c:if> onClick="javascript:cambiaCalculo()" 
                                                    value="5" type="radio" id="radioTotalParcial" name="radioTotalParcial"/></td>
                                                  </axis:visible>  
                                                </tr>
                                                
                                                </table>
                                                <div class="separador">&nbsp;</div>
                                            </td>
                                        </tr>    
                                        
                                        <tr>
                                            <!--th style="width:40%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:40%;height:0px"></th-->
                                        <tr>
                                            <axis:ocultar f="axissin005" c="FECHA" dejarHueco="false">
                                                <td class="titulocaja"><b><axis:alt f="axissin005" c="FECHA" lit="100883"/></b></td>
                                                <td></td>
                                                <td></td>
                                            </axis:ocultar>     
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axissin005" c="FECHA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <jsp:useBean id="today" class="java.util.Date" /> 
                                                    <c:set var="FECHA"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.FECHA}"/></c:set>
                                                    <input  type="text" class="campowidthbig campo campotexto" onchange="javascript:f_but_simular();" id="FECHA" name="FECHA" size="15" style="width:25%"
                                                    <axis:atr f="axissin005" c="FECHA" a="modificable=true&obligatorio=true&formato=fecha"/>
                                                    value="${FECHA} <c:if test="${empty FECHA}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                                    title="<axis:alt f="axissin005" c="FECHA" lit="100883"/>"/><a id="icon_FECHA" style="vertical-align:middle;"><img 
                                                    alt="<axis:alt f="axissin005" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin005" c="FECHA" lit="100883" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar> 
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        
                                        
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPCAPRIS">                                         
                                               <td class="titulocaja">
                                                    <b><axis:alt f="axissin005" c="IMPCAPRIS" lit="100563"/></b></td>
                                               <td></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin005" c="IMPPRIMASCONS">                                             
                                               <td class="titulocaja">
                                                    <b><axis:alt f="axissin005" c="IMPPRIMASCONS" lit="1000523"/></b></td>                        
                                            </axis:ocultar>                                        
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPCAPRIS"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPCAPRIS}' />" name="IMPCAPRIS" id="IMPCAPRIS"
                                                    style="width:25%;" <axis:atr f="axissin005" c="IMPCAPRIS" a="formato=decimal"/> 
                                                    title="<axis:alt f="axissin005" c="IMPCAPRIS" lit="100563"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPPRIMASCONS"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPRIMASCONS" name="IMPPRIMASCONS" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMASCONS}' />" <axis:atr f="axissin005" c="IMPPRIMASCONS" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPPENALI">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPPENALI" lit="109713"/></b></td>
                                               <td></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin005" c="IMPRENDBRUTO">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPRENDBRUTO" lit="1000524"/></b></td>                        
                                            </axis:ocultar>                                                                                    
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPPENALI"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPENALI" name="IMPPENALI" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPENALI}' />" <axis:atr f="axissin005" c="IMPPENALI" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPRENDBRUTO"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPRENDBRUTO" name="IMPRENDBRUTO" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPRENDBRUTO}' />" <axis:atr f="axissin005" c="IMPRENDBRUTO" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPRESCATE"> 
                                               <td class="titulocaja_totales"><b><axis:alt f="axissin005" c="IMPRESCATE" lit="1000533"/></b></td>
                                               <td></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin005" c="IMPREDUCCION">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPREDUCCION" lit="1000525"/></b></td>                        
                                            </axis:ocultar>                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin005" c="IMPRESCATE"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPRESCATE" name="IMPRESCATE" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPRESCATE}' />" <axis:atr f="axissin005" c="IMPRESCATE" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPREDUCCION"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPREDUCCION" name="IMPREDUCCION" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPREDUCCION}' />" <axis:atr f="axissin005" c="IMPREDUCCION" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>                                           
                                            <td class="campocaja">
                                           
                                            </td>
					    <td></td>

                                            <axis:ocultar f="axissin005" c="IMPREGTRANS"> 
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPREGTRANS" lit="1000532"/></b></td>
                                            </axis:ocultar>
                                             </tr>
                                        <tr>
                                            <td class="campocaja">
                                            </td>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPREGTRANS"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPREGTRANS" name="IMPREGTRANS" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPREGTRANS}' />" <axis:atr f="axissin005" c="IMPREGTRANS" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"></td>
                                            <td></td>

                                           <axis:ocultar f="axissin005" c="IMPRCM"> 
                                              <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPRCM" lit="1000526"/></b></td>                        
                                           </axis:ocultar>                                              
                                              
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                            </td>
                                            <td></td>
                                           <axis:ocultar f="axissin005" c="IMPRCM"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPRCM" name="IMPRCM" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPRCM}' />" <axis:atr f="axissin005" c="IMPRCM" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                         <tr>
                                            <td class="titulocaja"></td>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPRETENCION">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin005" c="IMPRETENCION" lit="101714"/></b></td>                        
                                            </axis:ocultar>                                               
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                            </td>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPRETENCION"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPRETENCION" name="IMPRETENCION" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPRETENCION}' />" <axis:atr f="axissin005" c="IMPRETENCION" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                         <tr>
                                            <td class="titulocaja"></td>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPRESNETO">                                             
                                               <td class="titulocaja_totales"><b><axis:alt f="axissin005" c="IMPRESNETO" lit="1000527"/></b></td>                        
                                            </axis:ocultar>                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                            </td>
                                            <td></td>
                                            <axis:ocultar f="axissin005" c="IMPRESNETO" dejarHueco="false"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPRESNETO" name="IMPRESNETO" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPRESNETO}' />" <axis:atr f="axissin005" c="IMPNETO" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                    </td>
                </tr>
            </table>
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin005</c:param><c:param name="f">axissin005</c:param><c:param name="__botones">salir,1000531,aceptar</c:param></c:import>
        </form>
        <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FECHA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHA", 
            singleClick    :    true,
            firstDay       :    1
        });
    

        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>