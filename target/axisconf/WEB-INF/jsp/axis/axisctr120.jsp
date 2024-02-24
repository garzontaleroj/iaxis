<%--/**
*  Fichero: axisctr120.jsp
*  
*  Primara pantalla del flujo de trabajo "Consulta Póliza".
*  Título: Consulta de Pólizas
*
*  Fecha: 27/11/2007
*/
--%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="axis.mvc.model.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%
UsuarioBean usuario=(UsuarioBean)session.getAttribute("__usuario");
String CONTINUE=(String)usuario.getContenedor().remove("CONTINUE");
usuario.getContenedor().remove("CONTINUE");
%>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr120"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr120" c="TITULO_PANTALLA" lit="101908"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">
           
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
			var but_emitir_clicked=false;
			function f_onload(){
                
               f_cargar_suplementos ();
                f_cargar_propiedades_pantalla('axisctr120');
                
          
                
                
                <% if (request.getAttribute("__formdata") != null &&
                       ((java.util.Map) request.getAttribute("__formdata")).get("SSEGURO") == null) { %>
                    f_abrir_axisctr019();
                <% } %>
                
               
                
                                
                // Desplegar siempre riesgos
                
                <% if (request.getAttribute("DSP_RIESGOS") != null) { %>
                    objEstilos.toggleDisplay("DSP_RIESGOS", document.getElementById("DSP_RIESGOS_parent"));
                    if (!objUtiles.estaVacio(document.getElementById("GARANTIAS_parent")))
                        objEstilos.toggleDisplay("DSP_GARANTIAS", document.getElementById("DSP_GARANTIAS_parent"));
                <% } %>

                 
                // Desplegar la tabla que estábamos ordenando
                <% if (request.getAttribute("tabla_ordenada") != null) { %>
                    var tabla_ordenada = '<%=request.getAttribute("tabla_ordenada")%>';
                    if (tabla_ordenada == 'clausulasesp' || tabla_ordenada == 'clausulasprod')
                        objEstilos.toggleDisplay("DSP_CLAUSULAS", document.getElementById("DSP_CLAUSULAS_parent"));
                    else
                        objEstilos.toggleDisplay(tabla_ordenada, document.getElementById(tabla_ordenada + "_parent"));
                <% } %>
                
 // Desplegar la seccin correspondiente si volvemos despues de editar_suplemento.
                <% 
                    
                    if(request.getAttribute("SECACTIVA") != null){
                        java.util.List SECACTIVA = (java.util.List)request.getAttribute("SECACTIVA");
                        for(int i=0;i<SECACTIVA.size();i++){
                    %>      
                        var seccion = '<%=SECACTIVA.get(i)%>';
                        
                        if (!objUtiles.utilEquals (seccion,'DSP_RIESGOS') && !objUtiles.utilEquals (seccion,'DSP_GARANTIAS'))                        
                             objEstilos.toggleDisplay(seccion, document.getElementById(seccion + "_parent"));
                 <% 
                        }
                    } %>                    
                 
                // Desplegar la seccin correspondiente si volvemos despues de editar_suplemento.
                <% 
                    
                    if(request.getAttribute("SECACTIVA") != null){
                        java.util.List SECACTIVA = (java.util.List)request.getAttribute("SECACTIVA");
                        for(int i=0;i<SECACTIVA.size();i++){
                    %>      
                        var seccion = '<%=SECACTIVA.get(i)%>';
                        
                        if (!objUtiles.utilEquals (seccion,'DSP_RIESGOS') && !objUtiles.utilEquals (seccion,'DSP_GARANTIAS'))                        
                             objEstilos.toggleDisplay(seccion, document.getElementById(seccion + "_parent"));
                 <% 
                        }
                    } %>    
             
             <% 
             
            if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
            %>       
                var subpantalla = '<%=request.getAttribute("subpantalla")%>';        
                objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla + "_parent"));
            <% } %>
        <%     
                      if (request.getAttribute("subpantalla_b") != null && !"null".equals(request.getAttribute("subpantalla_b")) && !"".equals(request.getAttribute("subpantalla_b"))) { 
            %>       
                var subpantalla_b = '<%=request.getAttribute("subpantalla_b")%>';                        
                objEstilos.toggleDisplay(subpantalla_b, document.getElementById(subpantalla_b + "_parent"));
            <% } %>   

<%
if (CONTINUE!=null) {
    if (CONTINUE.startsWith("axismenu:axisctr120|SSEGURO=")) { 
             String CONTINUE_substring_28=CONTINUE.substring(28); //justamente despues del =
             if (CONTINUE_substring_28.startsWith("-1")) {
                    %>
                    f_abrir_axisctr019 ();
                    <%
             }
             else {
                    %>
                    f_aceptar_axisctr019 ("<%=CONTINUE.substring(28)%>");
                    <%
             }
     } //end-if CONTINUE tipo axismenu:axisctr120|SSEGURO=
}
%>   
           

            
                f_cargar_propiedades_pantalla();
                
                if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisctr120");}
                objSeccion.abrirSeccionesPorAbrir("axisctr120");
            }
            
   
            
            
            function f_dummy() {
                return;
            }
            
            function mostrar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
            function mostrar_ocultar(nombreCapa){ 
                if(document.getElementById(nombreCapa).style.visibility=="visible"){
                    document.getElementById(nombreCapa).style.visibility="hidden"; 
                }else{
                    document.getElementById(nombreCapa).style.visibility="visible"; 
                }
            } 
                       
            function f_but_anterior() {
            }
            

            
            function f_but_cancelar() {

                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr120", "cancelar", document.miForm, "_self");

            }            

            function f_but_salir() {

                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr120", "cancelar", document.miForm, "_self");

            }

            
             function f_inicializar_suplemento(CMOTMOV, seccion_activa,CMOTMOV_ALT) {
                document.miForm.CMOTMOV.value = CMOTMOV;
                
                document.miForm.SECACTIVA.value = seccion_activa;
                if (CMOTMOV_ALT==undefined || CMOTMOV_ALT==null) {
                objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackInicializaSuplemento, "operation=inicializar_suplemento&SSEGURO=" + objDom.getValorPorId("SSEGURO") + "&CMOTMOV=" + CMOTMOV, this,  objJsMessages.jslit_cargando, false);
                }
                else {
                    document.miForm.CMOTMOV_ALT.value = CMOTMOV_ALT;
                    objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackInicializaSuplemento, "operation=inicializar_suplemento&SSEGURO=" + objDom.getValorPorId("SSEGURO") + "&CMOTMOV=" + CMOTMOV+"&CMOTMOV_ALT="+CMOTMOV_ALT, this,  objJsMessages.jslit_cargando, false);
                }
            }
            
            function LOCAL_invokeAsyncCGI(strURL, callback, qs, self, ajaxTexto, optionalCallBackParam) {
                try{
                    // Muestra la precarga ajax
                    if(!objUtiles.estaVacio(ajaxTexto)) {
                        LOCAL_showHideLoader("01",  ajaxTexto, "inline");
                    }
                    // Recodificar la QueryString
                    qs = objAjax.tratarEncodingQs(qs);
                    var xmlHttpReq = false;
                    if (window.XMLHttpRequest) { // Mozilla
                        self.xmlHttpReq = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) { //IE
                        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (strURL.indexOf("?")>=0) {
                        self.xmlHttpReq.open('POST', strURL+"&"+qs, true);
                    }
                    else {
                        self.xmlHttpReq.open('POST', strURL+"?"+qs, true);
                    }
                    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    self.xmlHttpReq.onreadystatechange = function() {
                        if (self.xmlHttpReq != null && self.xmlHttpReq.readyState == 4) {
                            if (!objUtiles.estaVacio(callback)) callback(self.xmlHttpReq.responseText, optionalCallBackParam);
                            //Esconde la precarga ajax (el setTimeOut es para que sea apreciable mientras no estamos en producción)
                            //if( !objUtiles.estaVacio(ajaxTexto)) LOCAL_showHideLoader("01", "", "none");
                        }
                    }
                    self.xmlHttpReq.send(null);
                }catch(e){
                    alert(e);
                    LOCAL_showHideLoader("01",  "", "none");
                }
            }
            
            function LOCAL_showHideLoader(localid,  valorTexto, visualizar){
                try {
                    var loader="LOCAL"+localid+"ajaxLoader"
                    var content="LOCAL"+localid+"ajaxContent"
                    var text="LOCAL"+localid+"ajaxText"
                    document.getElementById("LOCAL"+localid+"ajax4ie").style.display=visualizar;
                    document.getElementById(loader).style.display=visualizar;
                    document.getElementById(content).style.display=visualizar;
                    document.getElementById(text).innerHTML= valorTexto;
                }
                catch(excep) {
                    alert(excep)
                }
            }
            
            
            function f_getRiesgo (NRIESGO) {
                document.miForm.NRIESGO.value = NRIESGO;
                objUtiles.ejecutarFormulario ("axis_axisctr120.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            function f_getMotivo (SSEGURO, NMOVIMI) {
                document.miForm.NMOVIMI.value = NMOVIMI;
                document.miForm.SSEGURO.value = SSEGURO;
                objUtiles.ejecutarFormulario ("axis_axisctr120.do?canviNmovimi=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            


            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
            
            
            /* IMPRESION */
            function f_but_100001() {
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value);
            }

            
            function  f_but_docdetalleprimas()  {
            
               <c:if test="${!empty informes}" >
                 var strURL="axis_axisctr120.do?operation=imprimir_detalle_primas_json&SSEGURO="+document.miForm.SSEGURO.value+"&NRIESGO="+ objDom.getValorPorId("NRIESGO")+"&PTABLAS=POL";
                 var ajaxTexto=objJsMessages.jslit_cargando;
                 objAjax.invokeAsyncCGI_JSON(strURL, callbackdetalle_primas, ajaxTexto)
                        
              </c:if>
              
           }
            
            
           function callbackdetalle_primas(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    
                    if (!objUtiles.estaVacio( p.JSON2.lstinforme))      {
                      for (var i = 0 ; i<p.JSON2.lstinforme.length;i++){
                   
                        var informe = p.JSON2.lstinforme[i];
                        var ficherolist = informe.OB_IAX_IMPRESION.FICHERO;
                         var str2 = ficherolist.replace(/barrainvertida/gi, "\\");    
                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist020.jsp",600,200);
                    
                       }
                       
                    }
                }
            }
             
            function f_cerrar_axisimprimir() {
             objUtiles.cerrarModal("axisimprimir");
               <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr120_suplementosPendientes"))) { %>
               <%--     <c:if test="${empty mvtretencion_sup}" >--%>
                        objUtiles.ejecutarFormulario ("axis_axisctr120.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    <%--</c:if>--%>
                <% } else { %>
                        objUtiles.ejecutarFormulario ("axis_axisctr120.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
                <% } %>
            }
            
            /* GEDOX */
           // function f_but_gedox(NMOVIMI) {
           //     objUtiles.abrirModal("axisgedox", "src", 
           //         "modal_axisgedox.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI);
            //}   
           // function f_cerrar_axisgedox() {
           //     objUtiles.cerrarModal("axisgedox");
           // }

            // Modal Buscador
            function f_abrir_axisctr019 () {
                objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
            }
              function f_cerrar_axisctr019() {                 
                objUtiles.cerrarModal("axisctr019");
                if(objUtiles.estaVacio(document.miForm.SSEGURO.value)){
                f_but_salir();
                }                           
                }
                
            function f_aceptar_axisctr019 (SSEGURO) {
                objUtiles.cerrarModal("axisctr019");
                if (objUtiles.estaVacio(SSEGURO)){
                    return false;
                }
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.NMOVIMI.value= -9999;//Le ponemos un valor imposible para conseguir que, al cambiar de póliza, salga siempre cargado el primer movimiento del multiregistro
                objUtiles.ejecutarFormulario ("axis_axisctr120.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            //bug  22839 ini
             function f_aceptar_certif_axisctr019 (SSEGURO,NPOLIZA,NCERTIF) {
                objUtiles.cerrarModal("axisctr019");
                
                document.miForm.SSEGURO_ORIG.value=document.miForm.SSEGURO.value;
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.NPOLIZA.value=NPOLIZA;
                document.miForm.NCERTIF.value=NCERTIF;
                
                objUtiles.ejecutarFormulario ("axis_axisctr120.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            
            }
            
        function f_seleccionar_certif(SSEGURO){
            objAjax.invokeAsyncCGI("axis_axisctr120.do?SSEGURO_HIJO="+SSEGURO, miresppermisup, "operation=permitesuplem", this,  objJsMessages.jslit_cargando,SSEGURO);
         }     
         
            
         function miresppermisup (ajaxResponseText,SSEGURO) { 
                var doc = objAjax.domParse(ajaxResponseText);    
           if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                  
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PERMITESUPLEM")[0])){
                         var permite_suplem = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PERMITESUPLEM"), 0, 0);
           
                      if (permite_suplem !=0 || permite_suplem != null || objUtiles.estaVacio(SSEGURO) ) {    
                                alert(permite_suplem); //ENSEAMOS MENSAJE
                                //permite_suplem ponerla vacia
                        }
                           
                  }
             else{
                 objUtiles.ejecutarFormulario("axis_axisctr120.do?SSEGURO_BAJA="+SSEGURO, "consultarBajacertif", document.miForm, "_self", objJsMessages.jslit_cargando);   
             }
                              
                
           }    
         }
        //bug  22839 fin 
            // Modal Importes Garantías ACTR030
            function f_abrir_axisctr030 (CGARANT, NRIESGO, NDETGAR) {
            var SPRODUC = '${datos_poliza.SPRODUC}';
                objUtiles.abrirModal("axisctr030", "src", "modal_axisctr030.do?operation=form&CGARANT=" + CGARANT + "&NRIESGO=" + NRIESGO+"&SPRODUC="+SPRODUC + "&NDETGAR=" + NDETGAR);
            }
            function f_cerrar_axisctr030() {
                objUtiles.cerrarModal("axisctr030");
            }    
            
  
            
  
            
            /* DETALLE MOVIMIENTO 025  */
            function f_but_detailmov (NMOVIMI, CMOTMOV, NCERTIF) {
                objUtiles.abrirModal("axisctr025", "src", "modal_axisctr025.do?operation=form&SSEGURO=" + document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI + 
                    "&CMOTMOV=" + CMOTMOV + "&NCERTIF=" + NCERTIF);
            }       
            
            function f_but_deletemov (NMOVIMI, CMOTMOV, TOBSERV) {
                var mensaje = "<axis:alt f="axisctr120" c="ALERT1_PANTALLA" lit="9901090"/>";
                if (confirm(mensaje)){
                    objUtiles.ejecutarFormulario ("axis_axisctr120.do?NMOVIMI_REGISTRO="+NMOVIMI+"&CMOTMOV_REGISTRO="+CMOTMOV+"&TOBSERV_REGISTRO="+TOBSERV, "deletemov", document.miForm, "_self", objJsMessages.jslit_cargando);  
                }
          
            } 


            
            // Gestin recibos
            
            /* Realiza una llamada a F_GET_ACCIONES para saber si el recibo seleccionado tiene acciones.
            * Si tiene exactamente 1 accin a realizar, devuelve va Ajax su CFORM (pantalla destino de la accin)
            * para que la pantalla axisctr120 pueda navegar a esa pantalla. Si no, no devolver CFORM, y la pantalla
            * axisctr120 sabr que tiene que abrir el modal AXISADM028 para escoger accin.
            */
            function f_gestionar_recibos(NRECIBO, TESTREC) {
                objAjax.invokeAsyncCGI("modal_axisadm028.do", callbackAjaxGestionarRecibos, 
                    "operation=gestionar_recibos&NRECIBO=" + NRECIBO, this, null, TESTREC);
            }
            

            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            

            
            function callbackAceptar (ajaxResponseText) {
                 // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    // Si todo ha ido bien, desactivar botones.
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                                var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                    }else{
                        var mensaje="";
                    }
                    //Se anyade una llamada a impresiones
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                } 
            }
            
            function callbackInicializaSuplemento (ajaxResponseText){
                var doc = objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var PFEFECTO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PFEFECTO")[0])) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PFEFECTO"), 0, 0) : null );
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PMODFEFE")[0])){
                        PMODFEFE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PMODFEFE"), 0, 0);
                        if(objUtiles.utilEquals(PMODFEFE, 1)){
                            f_abrir_axisctr039 (PFEFECTO);
                        } else{
                            f_editar_suplemento(PFEFECTO);
                        }   
                    }
                }
            }
            
            function callbackEmitir(ajaxResponseText) {
                
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                    var hayError = 0;
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                      hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                    }
                  
                    if (hayError != 1){
                         // Si todo ha ido bien, desactivar botones.
                         //recogemos mensaje con el nmero de poliza y lo enviamos a
                         //impresion Axisimprimir
                         if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                             var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                         }else{
                             var mensaje="";
                         }
           
                         //Se anyade una llamada a impresiones
                         LOCAL_showHideLoader("01", "", "none");
                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                    }else{
                        objUtiles.ejecutarFormulario ("axis_axisctr120.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    }
                } 
            }
            
            /* Callback de la llamada a F_GET_ACCIONES para saber si el recibo seleccionado tiene acciones.
            * Si tiene exactamente 1 accin a realizar, devuelve va Ajax su CFORM (pantalla destino de la accin)
            * para que la pantalla axisctr120 pueda navegar a esa pantalla. Si no, no devolver CFORM, y la pantalla
            * axisctr120 sabr que tiene que abrir el modal AXISADM028 para escoger accin.
            */
            function callbackAjaxGestionarRecibos(ajaxResponseText, TESTREC) {
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRECIBO")[0])) {
                        var NRECIBO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), 0, 0);                                                
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSALTAR")[0])) {
                            var PSALTAR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSALTAR"), 0, 0);
                            if (PSALTAR == 0) {
                                var mensaje="";
                                alert("<axis:alt f="axisctr120" c="ALERT2_PANTALLA" lit="9000790"/>");    
                            } else if (PSALTAR == 1) {
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CFORM")[0])) {
                                    var CFORM = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CFORM"), 0, 0);
                                    f_aceptar_axisadm028(NRECIBO, CFORM);                    
                                }
                            } else {    
                                f_abrir_axisadm028(NRECIBO, TESTREC);
                            }
                        }
                    }
                } 
            }
            
            //Modal axisopen URL
            function f_cancelar_axisopenurl() {
                  f_abrir_axisctr019();
            } 
            
            /****************************************************************************************/
            /*********************************** ORDENACION TABLAS **********************************/
            /****************************************************************************************/
         
            function f_ordenar(campo, tabla, outerMap) {
                <% request.setAttribute(axis.util.Constantes.FORMDATA, request.getAttribute(axis.util.Constantes.FORMDATA)); %>
                objUtiles.ejecutarFormulario ("axis_axisctr120.do?ordenar=true&campo=" + campo + "&tabla=" + tabla + "&outerMap=" + outerMap, "form", document.miForm, "_self");         
            }
            
          

      
            
   
        // MODALES GENERICAS    
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
						
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);   
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
  
        }

     

        
   

   

        /****************************************************************************************/
        /************************************ CALLBACKS AJAX ************************************/
        /****************************************************************************************/

        function callbackAjaxActualizarProvisiones(ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {

                    var tableM = document.getElementById("GARANDEF");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    var columns = 0;

                    if (objDom.numeroDeTags(doc, "OB_IAX_GARANTIAS")>0){
                        objLista.borrarFilasDeLista ("GARANDEF", "3", '<axis:alt f="axisctr120" c="MENSA2" lit="1000254"/>');
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICAPITAL")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("IPRIANU")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDETGAR")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PROVMAT")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("IREDUCC")[0]))
                        columns = columns + 1;
                    
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_GARANTIAS") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                        objLista.borrarFilaVacia(tbodyM, trM);
                        
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(columns);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        if (columns == 7){ // APRA
                            var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0) : "");
                            newtd[0] = objLista.addTextoEnLista(CGARANT);
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
                            newtd[1] = objLista.addTextoEnLista(TGARANT);
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var ICAPITAL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICAPITAL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("ICAPITAL"), i, 0) : null);
                            var FORMAT = f_truncator(ICAPITAL,2);
                            newtd[2] = objLista.addTextoEnLista(f_formatNumber(ICAPITAL));
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var IPRIANU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IPRIANU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPRIANU"), i, 0) : "");
                            newtd[3] = objLista.addTextoEnLista(IPRIANU);
            
                            var NDETGAR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDETGAR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDETGAR"), i, 0) : null);
                            newtd[4] = objLista.addTextoEnLista(NDETGAR);
            
                            var PROVMAT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PROVMAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PROVMAT"), i, 0) : "");
                            FORMAT = f_truncator(PROVMAT,2);
                            newtd[5] = objLista.addTextoEnLista(f_formatNumber(PROVMAT));
                            
                            var IREDUCC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IREDUCC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IREDUCC"), i, 0) : "");
                            newtd[6] = objLista.addTextoEnLista(IREDUCC);
                        }else{
                            var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0) : "");
                            newtd[0] = objLista.addTextoEnLista(CGARANT);
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
                            newtd[1] = objLista.addTextoEnLista(TGARANT);

                            var PROVMAT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PROVMAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PROVMAT"), i, 0) : null);
                            var FORMAT = f_truncator(PROVMAT,2);
                            newtd[2] = objLista.addTextoEnLista(f_formatNumber(FORMAT));
                        }
            
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                    } // Fi for
                 
                    for (var i = 0; i < objDom.numeroDeTags(doc, "PROVPOL") ; i++) {
                        var PROVPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IMPPROVISION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPROVISION"), i, 0) : "");
                        document.miForm.PROVPOL.value = PROVPOL;
                    } // Fi for
                    
                    objEstilos.toggleDisplay('DSP_PROVGAR1', document.getElementById("DSP_PROVGAR_parent")); 
                    objEstilos.toggleDisplay('DSP_PROVGAR2', document.getElementById("DSP_PROVGAR_parent")); 
                    objEstilos.toggleDisplay('DSP_PROVGAR3', document.getElementById("DSP_PROVGAR_parent"));
                }
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }     
        
        function callbackAjaxObtenerImpagados(ajaxResponseText) {
        var jDate = new JsFecha();
        
            try {
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {

                    var tableM = document.getElementById("IMPAGOS");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");

                    objLista.borrarFilasDeLista ("IMPAGOS", "5", '<axis:alt f="axisctr120" c="MENSA3" lit="1000254"/>');
                    
                    if(objDom.numeroDeTags(doc, "CCARTA")>0){
                   
                        if(document.getElementById("seccion_impagados")){
                            var seccion =document.getElementById("seccion_impagados");
                            seccion.style.display ="";
                        } 
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CCARTA") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(5);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CTRACTAT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTRACTAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTRACTAT"), i, 0) : "");
                        newtd[0] = objLista.addTextoEnLista(CTRACTAT);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var FFEJECU = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFEJECU")[i]) ? 
                        objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFEJECU"), i, 0)) : "";
                        //var FFEJECU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFEJECU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFEJECU"), i, 0) : "");
                        //FFEJECU = f_transform_date(FFEJECU);
                        newtd[1] = objLista.addTextoEnLista(FFEJECU);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CACTIMP = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CACTIMP")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIMP"), i, 0) : "");
                        newtd[2] = objLista.addTextoEnLista(CACTIMP);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CCARTA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCARTA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCARTA"), i, 0) : "");
                        newtd[3] = objLista.addTextoEnLista(CCARTA);
        
                        var FIMPRES = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FIMPRES")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FIMPRES"), i, 0) : "");
                        if (FIMPRES != "") 
                            FIMPRES = objUtiles.formateaTimeStamp2(FIMPRES);
                        
                        //var FIMPRES = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FIMPRES")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FIMPRES"), i, 0) : "");
                        //FIMPRES = f_transform_date(FIMPRES);
                        newtd[4] = objLista.addTextoEnLista(FIMPRES);
                        
                        //alert("Antes de aadir fila");
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                    } // Fi for
                    
                    } else {   // fi else
                    
                         if(document.getElementById("seccion_impagados")){
                             var seccion =document.getElementById("seccion_impagados");
                             seccion.style.display ="none";
                         }
                    }

                    objEstilos.toggleDisplay('DSP_PROVGAR1', this); 
                }
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }     
        
   
         
         function callbackAjaxActEstado(ajaxResponseText) {
            try {
         
                var doc = objAjax.domParse(ajaxResponseText);
                
                objAppMensajes.existenErroresEnAplicacion(doc, false)
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }  
        
  
        
 
 

        function toggleDisplay2 (ths, objeto, img_mes, img_menys) {
         
            var pimg_mes="images/mes.gif"
            var pimg_menys="images/menys.gif"
            
            if (img_mes!=undefined || img_mes!=null) pimg_mes=img_mes;
            if (img_menys!=undefined || img_menys!=null) pimg_menys=img_menys;
            
	   			  var thisChildrenId=ths+"_children";
            if (document.getElementById(thisChildrenId)!=null){
                var actualDisplayValue=document.getElementById(thisChildrenId).style.display;
            }
                
            var resto = document.getElementsByTagName("tr");
		
            for (i=0; i < resto.length; i++) {            
                if(resto[i].getAttribute("tipo")=='cont'){
                     resto[i].style.display="none";
                }
            }

            if (actualDisplayValue=="none"){ 
                  actualDisplayValue="";// en vez de "block", mejor "" para evitar FireFox bug
                  var imagen =	document.getElementById("img_"+ths);
                  
                  
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_menys;//"images/menys.gif";
                
            }else{ 
                actualDisplayValue="none";
                 var imagen =	document.getElementById("img_"+ths);
                 
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_mes;//"images/mes.gif";
            }
            if (document.getElementById(thisChildrenId)!=null){
                document.getElementById(thisChildrenId).style.display=actualDisplayValue;
            }
         }   

          
    
        
         function f_but_9904239() {
              objAjax.invokeAsyncCGI("axis_axisctr120.do", callbackEmitirColectivo, "operation=emitirPropuestaColectiva&SSEGURO="+objDom.getValorPorId("SSEGURO"), this,  objJsMessages.jslit_cargando, false);
         }
        
         function callbackEmitirColectivo(ajaxResponseText) {
            
            // Recibe la respuesta Ajax de emitir propuesta colectiva.
            // Y escribe los mensajes de info/error correspondientes.
            var doc = objAjax.domParse(ajaxResponseText);

            // Hacemos la llamada para pintar los errores/infos
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
                var hayError = 0;
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                  hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                }
              
                if (hayError != 1){
                     // Si todo ha ido bien, desactivar botones.
                   
                   
                     //recogemos mensaje con el nmero de poliza y lo enviamos a
                     //impresion Axisimprimir
                     if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                         var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                     }else{
                         var mensaje="";
                     }
                     var continuaEmitir = objDom.getValorNodoDelComponente(doc.getElementsByTagName("continuaEmitir"), 0, 0);                                          
                     if (continuaEmitir == '0'){
                        //en este caso, se puede continuar emitiendo.
                        //Se anyade una llamada a impresiones
                        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                     }else{                        
                        objUtiles.ejecutarFormulario ("axis_axisctr120.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                     }       
                }
            } 
         }
            
         function f_but_9904240() {
              objAjax.invokeAsyncCGI("axis_axisctr120.do", callbackSuplemColectivo, "operation=abrirSuplemColectivo&SSEGURO="+objDom.getValorPorId("SSEGURO"), this,  objJsMessages.jslit_cargando, false);
         }
        
         function callbackSuplemColectivo(ajaxResponseText) {
            
            // Recibe la respuesta Ajax de emitir propuesta colectiva.
            // Y escribe los mensajes de info/error correspondientes.
            var doc = objAjax.domParse(ajaxResponseText);

            // Hacemos la llamada para pintar los errores/infos
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
                var hayError = 0;
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                  hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                }
              
                if (hayError != 1){
                     // Si todo ha ido bien, desactivar botones.
                    
                 
                     //recogemos mensaje con el nmero de poliza y lo enviamos a
                     //impresion Axisimprimir
                     if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                         var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                     }else{
                         var mensaje="";
                     }
                     objUtiles.ejecutarFormulario ("axis_axisctr120.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } 
        }
        

	
        </script>
    </head>
    <body onload="f_onload();">
    
        <iframe id="LOCAL01ajax4ie" class="precarga_fija" src="" style="top:0px;left:0px;z-index:100;display:none;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');" frameborder="0"></iframe>
    <div id="LOCAL01ajaxLoader" class="precarga_fija" style="z-index:101;display:none;width:100%;height:100%;background-color:#ffffff;filter:alpha(opacity=75);-moz-opacity:.75;opacity:.75;">&nbsp;</div>
    <div id="LOCAL01ajaxContent" class="precarga_fija" style="z-index:102;display:none;width:300px;height:100px;margin:10% 0 0 36%;background-color:#ededed;border:4px solid #000000;">
    <div style="float:left;padding:8% 0 0 10px;"><img border="0" src="images/ajax-loader.gif"/></div>
    <div style="float:left;padding:8% 0 0 10px;width:200px;height:50px;"><span id="LOCAL01ajaxText" style="font-size:14px;color:#000000;font-weight:bold;">&nbsp;</span></div>
    <div style="clear:both;">&nbsp;</div>
    </div>    
    
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="axis_axisctr120.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="IDOBS" name="IDOBS" value="${__formdata.IDOBS}"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NRECIBO" name="NRECIBO" value=""/>
            
            <input type="hidden" id="CTIPBAN" name="CTIPBAN" value=""/>
            <input type="hidden" id="CBANCAR1" name="CBANCAR1" value=""/>
            <input type="hidden" id="CTIPCOB" name="CTIPCOB" value=""/>
            <input type="hidden" id="CMOTMOV" name="CMOTMOV" value=""/>
            <input type="hidden" id="CMOTMOV_ALT" name="CMOTMOV_ALT" value=""/>
            <input type="hidden" id="PFEFECTO" name="PFEFECTO" value="${__formdata.PFEFECTO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="NMOVIMI_ULTIMO" name="NMOVIMI_ULTIMO" value="${__formdata.NMOVIMI_ULTIMO}"/>
            <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata['SSEGURO']}" />
            <input type="hidden" id="SECACTIVA" name="SECACTIVA" value="" />
            <input type="hidden" id="NRECIBO_sel" name="NRECIBO_sel" value="${__formdata.NRECIBO_sel}"/>
            <input type="hidden" id="SELECTEDGARANTIAS" name="SELECTEDGARANTIAS" value="${__formdata.selectedGarantias}"/>
            <input type="hidden" id="BAJA" name="BAJA" value="${__formdata.BAJA}"/>
            <input type="hidden" id="CRETENI" name="CRETENI" value="${__formdata.CRETENI}"/>
            <input type="hidden" name="NCONTADOR" id="NCONTADOR" value="${__formdata.NCONTADOR}"/>        
            <input type="hidden" id="COBJASE" name="COBJASE" value="${datos_poliza.COBJASE}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${datos_poliza.SPRODUC}"/>
            <input type="hidden" name="SSEGURO_ORIG" id="SSEGURO_ORIG" value="${__formdata.SSEGURO_ORIG}" />
            <input type="hidden" id="PERMITESUPLEM" name="PERMITESUPLEM" value="${__formdata.PERMITESUPLEM}"/>
            <input type="hidden" name="ES_COL_ADMIN" id="ES_COL_ADMIN" value="${__formdata.ES_COL_ADMIN}"/>
            <input type="hidden" name="ES_AGE_LIDER" id="ES_AGE_LIDER" value="${__formdata.ES_AGE_LIDER}"/>
            <input type="hidden" name="NCERTIF_COL" id="NCERTIF_COL" value="${__formdata.NCERTIF_COL}"/>
            <input type="hidden" name="CSITUAC_COL" id="CSITUAC_COL" value="${__formdata.CSITUAC_COL}"/>
            
            <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${__formdata.NNUMCASO}"/>
            <input type="hidden" name="NCASO_BPM" id="NCASO_BPM" value="${__formdata.NCASO_BPM}"/>
            <input type="hidden" name="NSOLICI_BPM" id="NSOLICI_BPM" value="${__formdata.NSOLICI_BPM}"/>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr120" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr120" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr120" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr120" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr120" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr120" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr120" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr120" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
            </c:import>
      
   
            <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisctr120" c="FORM_PANTALLA" lit="9906263"/></c:param>
                    <c:param name="form">axisctr120</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <!-- De datos póliza a tomadores -->        
                <c:import url="axisctr120_a.jsp"/>
                  <c:import url="axisctr120_b1.jsp"/>		

                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr120</c:param>
                <c:param name="f">axisctr120</c:param>
                <c:param name="__botones">salir,100001</c:param></c:import>
           </table>
        </form>
        <c:import url="../include/mensajes.jsp"/>
    </body>
</html>