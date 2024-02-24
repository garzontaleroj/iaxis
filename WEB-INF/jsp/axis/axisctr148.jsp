<%/***Fichero: axisctr148.jsp,Autos*/%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr148" c="TITULO" lit="1000231"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
        <script type="text/javascript">
        var globalcclaveh;
        var suplementohomologacion;
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             window.scrollTo(0,0);
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
          function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
            
                objDom.setValorPorId("CPAISORIGEN", CODIGO);
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
              }
            }
            
            
             function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAISORIGEN", "");
                        }else{
                            objDom.setValorPorId("CPAISORIGEN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                            }
                        }
                    }
                    
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
            
        }

            function f_but_cancelar() {
                //Esborrem les vars de session
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr148", "cancelar", document.axisctr148, "_self");
            }
            function f_but_salir() {
                //Esborrem les vars de session
                parent.f_cerrar_axisctr148();
            }
            
            function f_but_anterior() {
            CTIPVEH =  objDom.getValorPorId("CTIPVEH");
                objUtiles.ejecutarFormulario("axis_axisctr148.do?CTIPVEHx="+CTIPVEH, "anterior", document.axisctr148, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_siguiente() {
                if (objValidador.validaEntrada()) {
                	f_habilitar_campos();
                    objUtiles.ejecutarFormulario ("axis_axisctr148.do", "siguiente", document.axisctr148, "_self", objJsMessages.jslit_cargando);
                    
                }
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("axis_axisctr148.do", "guardar_simulacion", document.axisctr148, "_self", objJsMessages.jslit_cargando);
                }
            }
            function f_abrir_axisctr058(cmarca,cmodelo,ccombustible) {
                if (!objUtiles.estaVacio(cmarca) ){//&& !objUtiles.estaVacio(cmodelo)){
                    objDom.setVisibilidadPorId("but_cerrar_modal_axisctr058", "hidden");
                    var ctipveh = document.axisctr148.CTIPVEH.value;
                    var cclaveh ='';
                      <axis:visible c="CCLAVEH" f="axisctr148">
                           cclaveh = document.axisctr148.CCLAVEH.value;
                      </axis:visible>
                    var cversion = '';//document.axisctr148.CVERSION.value;
                    var npuertas='' ;
                    <axis:visible c="NPUERTAS" f="axisctr148">
                        npuertas = document.axisctr148.NPUERTAS.value;
                    </axis:visible>
                    objUtiles.abrirModal("axisctr058", "src", "modal_axisctr058.do?operation=form&xCVERSION="+cversion+"&xCCLAVEH="+cclaveh+"&xCTIPVEH="+ctipveh+"&XCMARCA="+cmarca+"&XCMODELO="+cmodelo+"&NPUERTAS="+npuertas+"&CCOMBUSTIBLE="+ccombustible);            
                }
                else
                    alert('<axis:alt f="axisctr148" c="LIT_ERROR_MARCA" lit="9001260"/>'); 
            }
            
            function f_abrir_axisctr059(cversion,nriesgo){
               if (!objUtiles.estaVacio(cversion)) 
                    objUtiles.abrirModal("axisctr059", "src", "modal_axisctr059.do?operation=form&CVERSION="+cversion+"&NRIESGO="+nriesgo); 
               else
                    alert('<axis:alt f="axisctr148" c="LIT_ERROR_VERSION" lit="9001452"/>');
            }
            
               function f_abrir_axisctr206(cversion,nriesgo){
               if (!objUtiles.estaVacio(cversion)) 
                    objUtiles.abrirModal("axisctr206", "src", "modal_axisctr206.do?operation=form&CVERSION="+cversion+"&NRIESGO="+nriesgo); 
               else
                    alert('<axis:alt f="axisctr148" c="LIT_ERROR_VERSION" lit="9001452"/>');
            }
            
            function f_cerrar_axisctr058(){
                objUtiles.cerrarModal("axisctr058");
            }
            
            function f_cerrar_axisctr065(){
                objUtiles.cerrarModal("axisctr058");
            }
            
            function f_cerrar_axisctr059(total){
                document.axisctr148.TOTALACC.value = total;
                objUtiles.cerrarModal("axisctr059");
            }
             function f_cerrar_axisctr206(){
                objUtiles.cerrarModal("axisctr206");
            }
            
            function f_aceptar_axisctr058(cversion){
               f_cerrar_axisctr058();
               f_recuperar_version(cversion);
               //document.axisctr148.CVERSION.value = cversion;
              // objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarVersion, "operation=ajax_recuperar_version&CVERSION="+cversion, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_recuperar_version(cversion,on_load){                
                if(objUtiles.estaVacio(on_load)){
                    on_load = false;
                }
                document.axisctr148.CVERSION.value = cversion;
                document.axisctr148.TVERSION.value = '';
                var strURL="axis_axisctr148.do?operation=recuperar_version_json&CVERSION="+cversion+"&on_load="+on_load;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarVersion, ajaxTexto)
            
            }
            
            function f_aceptar_axisctr059(vtotal){
                f_cerrar_axisctr059(vtotal);
                
            }
              function f_aceptar_axisctr206(){
                f_cerrar_axisctr206();
                
            }
            
            
            function f_triesgo(){
                var vmarca = document.axisctr148.CMARCA.value;
                
                if ( !objUtiles.estaVacio(vmarca) && vmarca == 99999){
                        <axis:visible c="CMODELO" f="axisctr148">
                        document.axisctr148.CMODELO.setAttribute("obligatorio",false);
                        
                        objDom.setVisibilidadPorId("CMODELO","hidden");
                        objDom.setDisplayPorId("CMODELO","none");
                        objDom.setVisibilidadPorId("LCMODELO","hidden");
                        objDom.setDisplayPorId("LCMODELO","none");
                        </axis:visible>
                        <axis:visible c="TVERSION" f="axisctr148">
                        document.axisctr148.TVERSION.setAttribute("obligatorio",false);
                        objDom.setVisibilidadPorId("TVERSION","hidden");
                        objDom.setDisplayPorId("TVERSION","none");
                        </axis:visible>
                        if (!document.axisctr148.CMARCA.disabled){
                        <axis:visible c="NPUERTAS" f="axisctr148">
                        
                            document.axisctr148.NPUERTAS.setAttribute("obligatorio",false);
                            objDom.setVisibilidadPorId("NPUERTAS","hidden");
                            objDom.setDisplayPorId("NPUERTAS","none");
                            objDom.setVisibilidadPorId("LNPUERTAS","hidden");
                            objDom.setDisplayPorId("LNPUERTAS","none");
                            </axis:visible>
                           <axis:visible c="CMOTOR" f="axisctr148">
                            <!--document.axisctr148.CMOTOR.setAttribute("obligatorio",false); -->
                            objDom.setVisibilidadPorId("CMOTOR","hidden");
                            objDom.setDisplayPorId("CMOTOR","none");
                            objDom.setVisibilidadPorId("LCMOTOR","hidden");
                            objDom.setDisplayPorId("LCMOTOR","none");
                            </axis:visible>
                            <axis:visible c="EDIT_VERSION" f="axisctr148">
                            objDom.setVisibilidadPorId("BUT_EDIT","hidden");
                            objDom.setDisplayPorId("BUT_EDIT","none");
                            </axis:visible>
                            <axis:visible c="DSP_OTROS" f="axisctr148">
                                <axis:visible c="CUSO" f="axisctr148">
                                document.axisctr148.CUSO.setAttribute("obligatorio",false);
                                </axis:visible>
                                <axis:visible c="CSUBUSO" f="axisctr148">
                                document.axisctr148.CSUBUSO.setAttribute("obligatorio",false);
                                </axis:visible>
                            </axis:visible>
                            <axis:visible c="TRIESGO" f="axisctr148">
                            document.axisctr148.TRIESGO.disabled = false;
                            </axis:visible>
                             <axis:visible c="CVERSION" f="axisctr148">
                            document.axisctr148.CVERSION.value = '';
                            </axis:visible>
                            <axis:visible c="CMODELO" f="axisctr148">
                            document.axisctr148.CMODELO.value = '';
                            </axis:visible>
                        }else{
                           <axis:visible c="TRIESGO" f="axisctr148">
                            document.axisctr148.TRIESGO.disabled = true;
                           </axis:visible>
                        }
                        f_cargar_propiedades_pantalla();
                }
                else{
                   <axis:visible c="CMODELO" f="axisctr148">
                        document.axisctr148.CMODELO.setAttribute("obligatorio","true");
                        objDom.setVisibilidadPorId("CMODELO","visible");
                        objDom.setDisplayPorId("CMODELO","block");
                        objDom.setVisibilidadPorId("LCMODELO","visible");
                        objDom.setDisplayPorId("LCMODELO","block");
                        </axis:visible>
                           <axis:visible c="TVERSION" f="axisctr148">
                        document.axisctr148.TVERSION.setAttribute("obligatorio","false");
                        objDom.setVisibilidadPorId("TVERSION","visible");
                        objDom.setDisplayPorId("TVERSION","block");
                        </axis:visible>
                        if (!document.axisctr148.CMARCA.disabled){
                        <axis:visible c="NPUERTAS" f="axisctr148">
                            document.axisctr148.NPUERTAS.setAttribute("obligatorio","true");
                            objDom.setVisibilidadPorId("NPUERTAS","visible");
                            objDom.setDisplayPorId("NPUERTAS","block");
                            
                            objDom.setVisibilidadPorId("LNPUERTAS","visible");
                            objDom.setDisplayPorId("LNPUERTAS","block");
                            
                            </axis:visible>
                               <axis:visible c="CMOTOR" f="axisctr148">
                            <!--document.axisctr148.CMOTOR.setAttribute("obligatorio","true"); -->
                            objDom.setVisibilidadPorId("CMOTOR","visible");
                            objDom.setDisplayPorId("CMOTOR","block");
                            objDom.setVisibilidadPorId("LCMOTOR","visible");
                            objDom.setDisplayPorId("LCMOTOR","block");
                            </axis:visible>
                             <axis:visible c="EDIT_VERSION" f="axisctr148">
                            objDom.setVisibilidadPorId("BUT_EDIT","visible");
                            objDom.setDisplayPorId("BUT_EDIT","block");
                            </axis:visible>
                             <axis:visible c="DSP_OTROS" f="axisctr148">
                              <axis:visible c="CUSO" f="axisctr148">
                            document.axisctr148.CUSO.setAttribute("obligatorio","true");
                            </axis:visible>
                            <axis:visible c="CSUBUSO" f="axisctr148">
                            document.axisctr148.CSUBUSO.setAttribute("obligatorio","true");
                            </axis:visible>
                            </axis:visible>
                             <axis:visible c="TRIESGO" f="axisctr148">
                              if ( objUtiles.estaVacio(document.axisctr148.CVERSION.value))
                                 document.axisctr148.TRIESGO.value = "";
                                 
                                
                                objDom.setDisabledPorId("TRIESGO",false);
                            </axis:visible>
                            
                        }else{
                        <axis:visible c="TRIESGO" f="axisctr148">
                           document.axisctr148.TRIESGO.disabled = true;
                           </axis:visible>
                        }
                        f_cargar_propiedades_pantalla();
                }
                f_cargar_propiedades_pantalla();
            }
            
         function f_errores_validacion(codError){ 
                <axis:visible c="FOCUS_CAMPOS" f="axisctr148">
                  switch(codError){
                    case "1":
                        document.getElementById("CMATRIC").focus();
                      break;
                    case "2":
                        document.getElementById("NBASTID").focus();                    
                      break;
                    case "3":
                        document.getElementById("CCHASIS").focus();
                      break;
                    case "4":
                        document.getElementById("CODMOTOR").focus();
                      break;
                  }
      </axis:visible>
            }
            
            function f_on_load(){
             var ok = "${__formdata.OK}";
                       
                           
                if ( !objUtiles.estaVacio(ok))
                    parent.f_aceptar_axisctr148();
                
                <axis:visible c="CUSOREM" f="axisctr148">
                var ver_remolque = "${__formdata.CUSOREM}";
                if ( !objUtiles.estaVacio(ver_remolque) && ver_remolque == 1){ 
                    objDom.setVisibilidadPorId("DESREMOLQUE","visible");
                    objDom.setVisibilidadPorId("TDREMOLQUE","visible");
                    }
                else{
                    objDom.setVisibilidadPorId("DESREMOLQUE","hidden");
                    objDom.setVisibilidadPorId("TDREMOLQUE","hidden");
                }
                
                </axis:visible>
                <axis:visible c="CVERSION" f="axisctr148">
                var ver="${__formdata.CVERSION}";
                
                if (!objUtiles.estaVacio(ver)){
                    objDom.setVisibilidadPorId("TVERSION","visible");
                    
                    //Si en la carga de la página traemos el campo CVERSION, cargamos los campos que dependen
                    //Bug 28455/0156829 - JSV - 24/10/2013
                    //f_recuperar_version(ver,true);
                }
                else{
                    objDom.setVisibilidadPorId("TVERSION","hidden");
                }
                </axis:visible>
                var  ver_matricula="${__formdata.CTIPMAT}";
                f_matricula(ver_matricula);
                
                f_triesgo();
                <axis:visible c="CPAISORIGEN" f="axisctr148">
                  formdataPAIS = '${__formdata.CPAISORIGEN}';
       
                if (!objUtiles.estaVacio(formdataPAIS)){
                    if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                        objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                    }
                }
                </axis:visible>
                
                <axis:visible c="HOMOLOGO_VERSION" f="axisctr148">
                    //se comprueba si la versión que se carga tiene una versión homologa.
                    var msgVersionHomologa = "${msgVersionHomologa}";               
                    
                    if (!objUtiles.estaVacio(msgVersionHomologa)){
                        if (confirm( msgVersionHomologa )){                       
                           var strURL="axis_axisctr148.do?operation=recuperar_version_json&CVERSION=${__formdata.CVERSION}&mostrarAlert=false";
                           objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarVersion, objJsMessages.jslit_cargando); 
                        }
                    }                   
                </axis:visible>
                var codError = "${errores_validacion}";
                f_errores_validacion(codError);
                f_cargar_propiedades_pantalla();
            }
            
            
             function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
             }
            
            function f_descremolque(valor){
                document.axisctr148.CUSOREMOLQUE.value = valor;
                if(valor == 1){
                    objDom.setVisibilidadPorId("DESREMOLQUE","visible");
                    objDom.setVisibilidadPorId("TDREMOLQUE","visible");
                }
                else if (valor == 0){
                    objDom.setVisibilidadPorId("DESREMOLQUE","hidden");
                    objDom.setVisibilidadPorId("TDREMOLQUE","hidden");
                }
            }
            
            function f_vehnuevo(valor){
                document.axisctr148.CNUEVO.value = valor;
            }
            
            function f_limpiar(valor){
            
                //Si el valor es 1 limpiamos todo, 2 todo menos puertas, 3 todo menos combustible
                
                if (valor != 2){
                 <axis:visible c="NPUERTAS" f="axisctr148">
                    document.axisctr148.NPUERTAS.selectedIndex = 0;
                </axis:visible>
                }if (valor != 3){
                    <axis:visible c="CMOTOR" f="axisctr148">
                    document.axisctr148.CMOTOR.selectedIndex = 0;
                    </axis:visible>
                }
                <axis:visible c="CVERSION" f="axisctr148">
                document.axisctr148.CVERSION.value = '';
                </axis:visible>
                <axis:visible c="TVERSION" f="axisctr148">
                document.axisctr148.TVERSION.value = "";
                 objDom.setVisibilidadPorId("TVERSION","hidden");
                </axis:visible>
                <axis:visible c="TRIESGO" f="axisctr148">
                document.axisctr148.TRIESGO.value = "";
                </axis:visible>
                <axis:visible c="CUSOREMOLQUE" f="axisctr148">
                document.axisctr148.CUSOREMOLQUE.value = null;
                </axis:visible>
                document.axisctr148.CNUEVO.value = null;
                if (objUtiles.estaVacio(   document.axisctr148.CMARCASEL.value))
                    document.axisctr148.CTIPMAT.selectedIndex = 0;
                if (valor == 5){
                 document.axisctr148.CMARCA.selectedIndex = 0;
                 document.axisctr148.CMODELO.selectedIndex = 0;
                 document.axisctr148.CTIPVEH.selectedIndex = 0;
                 
                 }
                if (objUtiles.estaVacio(   document.axisctr148.CMARCASEL.value))
                 document.axisctr148.CMATRIC.value = "";
                <axis:visible c="IVEHICU" f="axisctr148">
                document.axisctr148.IVEHICU.value = "";
                </axis:visible>
                <axis:visible c="TTIPVEH" f="axisctr148">
                document.axisctr148.TTIPVEH.value = "";
                </axis:visible>
                <axis:visible c="TCLAVEH" f="axisctr148">
                document.axisctr148.TCLAVEH.value = "";
                </axis:visible>
                 <axis:visible c="NBASTID" f="axisctr148">
                document.axisctr148.NBASTID.value = "";
                </axis:visible>
                 <axis:visible c="CCOLOR" f="axisctr148">
                document.axisctr148.CCOLOR.selectedIndex = 0;
                </axis:visible>
                 <axis:visible c="NPMA" f="axisctr148">
                document.axisctr148.NPMA.value = "";
                </axis:visible>
                 <axis:visible c="NTARA" f="axisctr148">
                document.axisctr148.NTARA.value = "";
                </axis:visible>
                 <axis:visible c="NPLAZAS" f="axisctr148">
                document.axisctr148.NPLAZAS.value = "";
                </axis:visible>
                
                <axis:visible c="ANYO" f="axisctr148">
                    var tipvehcombo = document.axisctr148.ANYO;     
                    if (document.getElementById("ANYO").tagName.toUpperCase()=='SELECT') {
                    objDom.borrarOpcionesDeCombo(tipvehcombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                    }
                    else {
                    document.getElementById("ANYO").value="";
                    }
                </axis:visible>
                <axis:visible c="KMANY" f="axisctr148">
                document.axisctr148.KMANY.selectedIndex = 0;
                </axis:visible>
                 <axis:visible c="CUSOREMOLQUE" f="axisctr148">
                document.axisctr148.DESREMOLQUE.value = "";
                   document.axisctr148.CREMOLQUE[0].checked = false;
                document.axisctr148.CREMOLQUE[1].checked = false;
               
                objDom.setVisibilidadPorId("DESREMOLQUE","hidden");
                objDom.setVisibilidadPorId("TDREMOLQUE","hidden");
                </axis:visible>
                 <axis:visible c="DSP_OTROS" f="axisctr148">
                 <axis:visible c="CUSO" f="axisctr148">
                
                document.axisctr148.CUSO.selectedIndex = 0;
                </axis:visible>
                <axis:visible c="CSUBUSO" f="axisctr148">
                document.axisctr148.CSUBUSO.selectedIndex = 0;
                </axis:visible>
                 <axis:visible c="FLANZAM" f="axisctr148">
                document.axisctr148.FLANZAM.value = "";
                </axis:visible>
                </axis:visible>
                 <axis:visible c="CODMOTOR" f="axisctr148">
                document.axisctr148.CODMOTOR.value = "";
                </axis:visible>
                 <axis:visible c="CCHASIS" f="axisctr148">
                document.axisctr148.CCHASIS.value = "";
                </axis:visible>
                 <axis:visible c="CPINTURA" f="axisctr148">
                document.axisctr148.CPINTURA.selectedIndex =0;
                </axis:visible>
                 <axis:visible c="CPESO" f="axisctr148">
                document.axisctr148.CPESO.selectedIndex =0;
                </axis:visible>
                <axis:visible c="CTRANSMISION" f="axisctr148">
                document.axisctr148.CTRANSMISION.selectedIndex =0;
                </axis:visible>
                 <axis:visible c="IVEHINUE" f="axisctr148">
                document.axisctr148.IVEHINUE.value = "";
                </axis:visible>
                 <axis:visible c="IVEHICUFASECOLDANUE" f="axisctr148">
                document.axisctr148.IVEHICUFASECOLDANUE.value = "";
                </axis:visible>
                <axis:visible c="IVEHICUFASECOLDA" f="axisctr148">
                document.axisctr148.IVEHICUFASECOLDA.value = "";
                </axis:visible>
                <axis:visible c="NKILOMETRAJE" f="axisctr148">
                document.axisctr148.NKILOMETRAJE.value = "";
                </axis:visible>
                <axis:visible c="CCILINDRAJE" f="axisctr148">
                document.axisctr148.CCILINDRAJE.value = "";
                </axis:visible>
                <axis:visible c="CCAJA" f="axisctr148">
                 document.axisctr148.CCAJA.selectedIndex =0;
                </axis:visible>
                <axis:visible c="CCAMPERO" f="axisctr148">
                 document.axisctr148.CCAMPERO.selectedIndex =0;
                </axis:visible>
                <axis:visible c="CTIPCARROCERIA" f="axisctr148">
                 document.axisctr148.CTIPCARROCERIA.selectedIndex =0;
                </axis:visible>
                 <axis:visible c="CSERVICIO" f="axisctr148">
                 document.axisctr148.CSERVICIO.selectedIndex =0;
                </axis:visible>
                 <axis:visible c="CORIGEN" f="axisctr148">
                 document.axisctr148.CORIGEN.selectedIndex =0;
                </axis:visible>
                  <axis:visible c="CTRANSPORTE" f="axisctr148">
                 document.axisctr148.CTRANSPORTE.selectedIndex =0;
                </axis:visible>
               
                 <axis:visible c="DSP_OTROS" f="axisctr148">
                 <axis:visible c="CGARAJE" f="axisctr148">
                document.axisctr148.CGARAJE.selectedIndex = 0;
                </axis:visible>
                document.axisctr148.VEHICLE_NOU[0].checked = false;
                document.axisctr148.VEHICLE_NOU[1].checked = false;
                </axis:visible>
             
         
                if(document.getElementById("CMATRIC").style.visibility=="hidden"){
                    objDom.setVisibilidadPorId("CMATRIC","visible");
                    objDom.setVisibilidadPorId("TCMATRIC","visible");
                }
                 <axis:visible c="CPAISORIGEN" f="axisctr148">
                objDom.setValorPorId("CPAISORIGEN", "");
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "");
                </axis:visible>
               
                f_cargar_propiedades_pantalla();
            }
            
            function f_llenar_modelo(valor){
            
              //  f_limpiar(1);
                f_triesgo();
                f_cargar_propiedades_pantalla();
                if(valor != 99999){
                var ctipveh = document.axisctr148.CTIPVEH.value;
                var cclaveh = '';
                <axis:visible c="CCLAVEH" f="axisctr148">
                     cclaveh = document.axisctr148.CCLAVEH.value;
                </axis:visible>
                    objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarModelo, "operation=ajax_recuperar_modelo&CVALOR="+valor+"&CTIPVEH="+ctipveh+"&CCLAVEH="+cclaveh, this, objJsMessages.jslit_actualizando_registro);
                    f_cargar_propiedades_pantalla();
                }
                
                
            }
            
             function f_llenar_modelo_porclase(valor){
            
                var ctipveh = document.axisctr148.CTIPVEH.value;
                document.axisctr148.CCLAVEH.value= valor;
                var cmarca = document.axisctr148.CMARCA.value;
                    objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarModelo, "operation=ajax_recuperar_modelo&CVALOR="+cmarca+"&CTIPVEH="+ctipveh+"&CCLAVEH="+valor, this, objJsMessages.jslit_actualizando_registro);
                    f_cargar_propiedades_pantalla();
                
                
            }
              function f_buscar_matric(DONDE){
             
             if($("#CMODO").val() != "GENERAL")
             {
                 if (!objUtiles.estaVacio(document.axisctr148.CMATRIC) || 
                 !objUtiles.estaVacio(document.axisctr148.CODMOTOR) ||
                 !objUtiles.estaVacio(document.axisctr148.CCHASIS) ||
                 !objUtiles.estaVacio(document.axisctr148.NBASTID))  {
		              var ctipmat = document.axisctr148.CTIPMAT.value;
		              var cmatric = document.axisctr148.CMATRIC.value;
		              var psseguro = document.axisctr148.SSEGURO.value;
		              var nbastid = document.axisctr148.NBASTID.value;
		              var codmotor = document.axisctr148.CODMOTOR.value;
		              var cchasis = document.axisctr148.CCHASIS.value;
		               var strURL="axis_axisctr148.do?operation=vehiculo_matricula_json&CMATRIC="+cmatric+"&CTIPMAT="+ctipmat+"&SSEGURO="+psseguro+"&NBASTID="+nbastid+"&CCHASIS="+cchasis+"&CODMOTOR="+codmotor+"&DONDE="+DONDE;
		                var ajaxTexto=objJsMessages.jslit_cargando;
		                objAjax.invokeAsyncCGI_JSON(strURL, callbackvehmatric, ajaxTexto)
                 }
             }
             
            }
            
            function f_llenar_anyos(version){
               var strURL="axis_axisctr148.do?operation=anyos_version_json&CVERSION="+version;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackanyo_version, ajaxTexto)
            
            }
            function f_cambiar_anyo(anyo){
                 var strURL="axis_axisctr148.do?operation=anyos_version_json&CVERSION="+document.axisctr148.CVERSION.value;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackanyo_version, ajaxTexto)
            
            }
            function f_llenar_clase(tipo){
                var strURL="axis_axisctr148.do?operation=clases_vehiculo_json&CTIPVEH="+tipo+"&CMARCA="+document.axisctr148.CMARCA.value;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackclase_vehiculo, ajaxTexto)
            }
             function f_llenar_soloclase(tipo){
                var strURL="axis_axisctr148.do?operation=clases_vehiculo_json&CTIPVEH="+tipo+"&CMARCA="+document.axisctr148.CMARCA.value;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbacksoloclase_vehiculo, ajaxTexto)
            }
            function f_llenar_tipo(marca){
                var strURL="axis_axisctr148.do?operation=tipos_vehiculo_json&cmarca="+marca;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbacktipos_vehiculo, ajaxTexto)
            }
            function f_llenar_tipo_xmod(marca, modelo){
                 var strURL="axis_axisctr148.do?operation=tipos_vehiculo_json_xmod&cmarca="+marca+"&cmodelo="+modelo;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbacktipos_vehiculo_xmod, ajaxTexto)
            }
         function formateaTimeStampx  (timeStamp) {
            if (!objUtiles.estaVacio(timeStamp) && timeStamp.length >= 10) {
                if (timeStamp.indexOf("-") > 0){
                    
                    var year  = timeStamp.substring(0,4);
                    var month = timeStamp.substring(5,7);
                    var day   = timeStamp.substring(8,10);
                    return (day + "/" + month + "/" + year);
                }else{
                    var year  = timeStamp.substring(0,4);
                    var month = timeStamp.substring(4,6);
                    var day   = timeStamp.substring(6,8);
                    return (day + "/" + month + "/" + year);                
                }
            } else{
                    var year  = timeStamp.substring(0,4);
                    var month = timeStamp.substring(4,6);
                    var day   = timeStamp.substring(6,8);
                    
                    return (day + "/" + month + "/" + year);                
                }
        }
            
            function callbackvehmatric(p){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                try{
                    if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                                                 
                        if (!objUtiles.estaVacio(p.JSON2.MATRICULAKO)){
                            document.axisctr148.CMATRIC.value="";
                            document.axisctr148.CMATRIC.focus();    
                        }
                        
                    
                        if (!objUtiles.estaVacio(p.JSON2.CCOMPANI))
                            document.axisctr148.CIAANT.value =p.JSON2.CCOMPANI;
                       
                        if (!objUtiles.estaVacio(p.JSON2.FECHAULTIMAVIG)){
                            document.axisctr148.FFINCIANT.value =formateaTimeStampx(p.JSON2.FECHAULTIMAVIG);
                        }
                    
                        if (!objUtiles.estaVacio(p.JSON2.riesgoauto)){
                 try{
                 if (!objUtiles.estaVacio(p.JSON2.TOTALACC)){
                            document.axisctr148.TOTALACC.value=p.JSON2.TOTALACC;
                            
                        }
                     }catch(e)   {}
                 <axis:visible c="INSPECCION_VIGENTE" f="axisctr148">
                
                 if (!objUtiles.estaVacio(p.JSON2.riesgoauto.INSPECCION_VIGENTE))
                  document.axisctr148.INSPECCION_VIGENTE.value =p.JSON2.riesgoauto.INSPECCION_VIGENTE;
                  else
                  document.axisctr148.INSPECCION_VIGENTE.value =0;
                 </axis:visible>
                            <axis:visible c="CTIPVEH" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.listatipos)){
                                  var tipvehcombo = document.axisctr148.CTIPVEH;     
                                    objDom.borrarOpcionesDeCombo(tipvehcombo);
                                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                                     if (!objUtiles.estaVacio(p.JSON2.listatipos)){
                                         for (i = 0; i < p.JSON2.listatipos.length; i++) {
                                                var codigo = p.JSON2.listatipos[i].CTIPVEH;
                                                var desc   = p.JSON2.listatipos[i].TTIPVEH;
                                              /*  <axis:visible f="axisctr148" c="CODIGOS">
                                                desc = desc +"      ("+codigo+")";
                                                </axis:visible>*/
                                                objDom.addOpcionACombo(codigo, desc, tipvehcombo, i+1);
                                         }
                                     }
                                }
                            </axis:visible>
                            <axis:visible c="CCLAVEH" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.listaclases)){
                                  var clasecombo = document.axisctr148.CCLAVEH;     
                                    objDom.borrarOpcionesDeCombo(clasecombo);
                                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                     if (!objUtiles.estaVacio(p.JSON2.listaclases)){
                                          for (i = 0; i < p.JSON2.lista.length; i++) {
                                                var codigo = p.JSON2.listaclases[i].CCLAVEH;
                                                var desc   = p.JSON2.listaclases[i].TCLAVEH;
                                               /* <axis:visible f="axisctr148" c="CODIGOS">
                                                desc = desc +"      ("+codigo+")";
                                                </axis:visible>*/
                                                objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                         }  
                                    }       
                            
                            }
                            </axis:visible>
                            <axis:visible c="CMODELO" f="axisctr148">
                             if (!objUtiles.estaVacio(p.JSON2.listamodelos)){
                                  var clasecombo = document.axisctr148.CMODELO;     
                                    objDom.borrarOpcionesDeCombo(clasecombo);
                                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                     if (!objUtiles.estaVacio(p.JSON2.listamodelos)){
                                          for (i = 0; i < p.JSON2.listamodelos.length; i++) {
                                                var codigo = p.JSON2.listamodelos[i].CMODELO;
                                                var desc   = p.JSON2.listamodelos[i].TMODELO;
                                              /*  <axis:visible f="axisctr148" c="CODIGOS">
                                                desc = desc +"      ("+codigo+")";
                                                </axis:visible>*/
                                                objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                         }  
                                    }       
                            
                            }
                            </axis:visible>
                            <axis:visible c="ANYO" f="axisctr148">
                            
                             if (!objUtiles.estaVacio(p.JSON2.listaanyos)){
                               
                                var clasecombo = document.axisctr148.ANYO;     
                                    objDom.borrarOpcionesDeCombo(clasecombo);
                                    valorcomercial = '';
                                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                     if (!objUtiles.estaVacio(p.JSON2.listaanyos)){
                                          for (i = 0; i < p.JSON2.listaanyos.length; i++) {
                                                var codigo = p.JSON2.listaanyos[i].ANYO;
                                                var desc   = p.JSON2.listaanyos[i].ANYO;
                                                 var VNUEVO = p.JSON2.listaanyos[i].VNUEVO;
                                                 var valor = p.JSON2.listaanyos[i].VCOMERCIAL;
                                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.ANYO)){
                                                 if (p.JSON2.riesgoauto.ANYO == codigo ){
                                                    valorcomercial=valor;
                                                  }
                                                }
                                                objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                         }  
                                    }     
                                    
                                     <axis:visible f="axisctr148" c="IVEHICUFASECOLDA">   
                                        document.axisctr148.IVEHICUFASECOLDA.value =valorcomercial;
                                        document.axisctr148.IVEHICUFASECOLDANUE.value =VNUEVO;
                                     </axis:visible>
                            }
                            </axis:visible>
                            <axis:visible c="NPUERTAS" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.listapuertas)){
                            
                                 var clasecombo = document.axisctr148.NPUERTAS;     
                                    objDom.borrarOpcionesDeCombo(clasecombo);
                                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                     if (!objUtiles.estaVacio(p.JSON2.listapuertas)){
                                          for (i = 0; i < p.JSON2.listapuertas.length; i++) {
                                                var codigo = p.JSON2.listapuertas[i].NPUERTA;
                                                var desc   = p.JSON2.listapuertas[i].NPUERTA;
                                              
                                                objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                         }  
                                    }  
                            }
                            </axis:visible>
                            <axis:visible c="CUSO" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.listausos)){
                                
                                     var clasecombo = document.axisctr148.CUSO;     
                                        objDom.borrarOpcionesDeCombo(clasecombo);
                                        
                                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                         if (!objUtiles.estaVacio(p.JSON2.listausos)){
                                              for (i = 0; i < p.JSON2.listausos.length; i++) {
                                                    var codigo = p.JSON2.listausos[i].CUSO;
                                                    var desc   = p.JSON2.listausos[i].TUSO;
                                                    objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                             }  
                                        }  
                                }
                            </axis:visible>
                        
                           <axis:visible c="CMARCA" f="axisctr148">
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CMARCA))
                                 document.axisctr148.CMARCA.value =p.JSON2.riesgoauto.CMARCA;
                               
                           </axis:visible>
                           <axis:visible c="CTIPVEH" f="axisctr148">
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CTIPVEH))
                                document.axisctr148.CTIPVEH.value=p.JSON2.riesgoauto.CTIPVEH;
                            </axis:visible>
                           <axis:visible c="CMODELO" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CMODELO))
                                document.axisctr148.CMODELO.value=p.JSON2.riesgoauto.CMODELO;
                           </axis:visible>
                           <%--axis:visible c="CMARCA" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CMARCA)){
                                    document.axisctr148.CMARCASEL.value=p.JSON2.riesgoauto.CMARCA;
                                   // f_llenar_tipo(document.axisctr148.CMARCA.value);
                                }
                              </axis:visible--%>
                           <axis:visible c="CMOTOR" f="axisctr148">
                             
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CMOTOR))
                              document.axisctr148.CMOTOR.value=p.JSON2.riesgoauto.CMOTOR;
                             </axis:visible>
                           <axis:visible c="ANYO" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.ANYO))
                              document.axisctr148.ANYO.value=p.JSON2.riesgoauto.ANYO;
                               </axis:visible>
                           <axis:visible c="CTRANSPORTE" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CTRANSPORTE))
                              document.axisctr148.CTRANSPORTE.value=p.JSON2.riesgoauto.CTRANSPORTE;
                            </axis:visible>
                           <axis:visible c="CORIGEN" f="axisctr148"> 
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CORIGEN))
                              document.axisctr148.CORIGEN.value=p.JSON2.riesgoauto.CORIGEN;
                            </axis:visible>
                           <axis:visible c="CSERVICIO" f="axisctr148">   
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CSERVICIO))
                              document.axisctr148.CSERVICIO.value=p.JSON2.riesgoauto.CSERVICIO;
                             </axis:visible>
                           <axis:visible c="CTIPCARROCERIA" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CTIPCARROCERIA))
                              document.axisctr148.CTIPCARROCERIA.value=p.JSON2.riesgoauto.CTIPCARROCERIA;
                             </axis:visible>
                           <axis:visible c="CCAMPERO" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CCAMPERO))
                              document.axisctr148.CCAMPERO.value=p.JSON2.riesgoauto.CCAMPERO;
                             </axis:visible>
                           <axis:visible c="CCAJA" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CCAJA))
                              document.axisctr148.CCAJA.value=p.JSON2.riesgoauto.CCAJA;
                             </axis:visible>
                           <axis:visible c="CPINTURA" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CPINTURA))
                              document.axisctr148.CPINTURA.value=p.JSON2.riesgoauto.CPINTURA;
                              </axis:visible>
                            <axis:visible c="CPESO" f="axisctr148">  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CPESO))
                              document.axisctr148.CPESO.value=p.JSON2.riesgoauto.CPESO;
                           </axis:visible>
                           <%--axis:visible c="CTRANSMISION" f="axisctr148"--%>  
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CTRANSMISION))
                                document.axisctr148.CTRANSMISION.value=p.JSON2.riesgoauto.CTRANSMISION;
                           <%--/axis:visible--%>
                           <axis:visible c="CODMOTOR" f="axisctr148"> 
                              if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CODMOTOR))
                              document.axisctr148.CODMOTOR.value=p.JSON2.riesgoauto.CODMOTOR;
                              </axis:visible>
                           <axis:visible c="CGARAJE" f="axisctr148">
                               if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CGARAJE))
                              document.axisctr148.CGARAJE.value=p.JSON2.riesgoauto.CGARAJE;
                             </axis:visible>
                 
                           try{
                               <axis:visible c="CUSOREM" f="axisctr148">  
                                    if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CUSOREM)){
                                        document.axisctr148.CUSOREM.value=p.JSON2.riesgoauto.CUSOREM;
                                        if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CUSOREM) && p.JSON2.riesgoauto.CUSOREM == 1)
                                            f_descremolque(1)
                                    }
                                </axis:visible>
                               <axis:visible c="CREMOLQUE" f="axisctr148"> 
                                    if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CREMOLQUE))
                                  document.axisctr148.CREMOLQUE.value=p.JSON2.riesgoauto.CREMOLQUE;
                                </axis:visible>
                            }catch(e){}
                            <axis:visible c="TRIESGO" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.TRIESGO))
                              document.axisctr148.TRIESGO.value=p.JSON2.riesgoauto.TRIESGO;
                              </axis:visible>
                              
                           <%--axis:visible c="NPUERTAS" f="axisctr148"--%> 
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NPUERTAS)){
                              document.axisctr148.NPUERTAS.value=p.JSON2.riesgoauto.NPUERTAS;
                              document.axisctr148.NPUERTAS_HIDDEN.value=p.JSON2.riesgoauto.NPUERTAS;
                            }
                            <%--/axis:visible--%>
                            
                           <axis:visible c="CPAISORIGEN" f="axisctr148">   
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CPAISORIGEN))
                              document.axisctr148.CPAISORIGEN.value=p.JSON2.riesgoauto.CPAISORIGEN;
                               </axis:visible>
                                   
                           <axis:visible c="CCHASIS" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CCHASIS))
                              document.axisctr148.CCHASIS.value=p.JSON2.riesgoauto.CCHASIS;
                               </axis:visible>
                           <axis:visible c="IVEHINUE" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.IVEHINUE))
                              document.axisctr148.IVEHINUE.value=p.JSON2.riesgoauto.IVEHINUE;
                               </axis:visible>
                                         
                           <axis:visible c="NKILOMETRAJE" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NKILOMETRAJE))
                              document.axisctr148.NKILOMETRAJE.value=p.JSON2.riesgoauto.NKILOMETRAJE;
                               </axis:visible>
                           <axis:visible c="CCILINDRAJE" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CCILINDRAJE))
                              document.axisctr148.CCILINDRAJE.value=p.JSON2.riesgoauto.CCILINDRAJE;
                              </axis:visible>
                                        
                           <axis:visible c="CCOLOR" f="axisctr148">
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CCOLOR))
                              document.axisctr148.CCOLOR.value=p.JSON2.riesgoauto.CCOLOR;
                              </axis:visible>
                           <%--axis:visible c="NTARA" f="axisctr148"--%>
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NTARA))
                              document.axisctr148.NTARA.value=p.JSON2.riesgoauto.NTARA;
                             <%--/axis:visible--%>
                           <axis:visible c="NPMA" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NPMA))
                              document.axisctr148.NPMA.value=p.JSON2.riesgoauto.NPMA;
                              </axis:visible>
                                        
                           <axis:visible c="IVEHICU" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.IVEHICU))
                              document.axisctr148.IVEHICU.value=p.JSON2.riesgoauto.IVEHICU;
                              </axis:visible>
                            try{
                               <axis:visible c="NKILOMETROS" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NKILOMETROS))
                                  document.axisctr148.NKILOMETROS.value=p.JSON2.riesgoauto.NKILOMETROS;
                                 </axis:visible>                                           
                             }catch(e){}
                            try{
                               <axis:visible c="FLANZAM" f="axisctr148">
                                if (!objUtiles.estaVacio(p.JSON2.riesgoauto.FMATRIC))
                                  document.axisctr148.FLANZAM.value=p.JSON2.riesgoauto.FMATRIC;
                                 </axis:visible>
                             }catch(e){}
                                       
                           <axis:visible c="CSUBUSO" f="axisctr148"> 
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CSUBUSO))
                              document.axisctr148.CSUBUSO.value=p.JSON2.riesgoauto.CSUBUSO; 
                             </axis:visible>
                           <axis:visible c="CUSO" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CUSO))
                              document.axisctr148.CUSO.value=p.JSON2.riesgoauto.CUSO;
                             </axis:visible>
                                       
                           <axis:visible c="CVEHNUE" f="axisctr148"> 
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CVEHNUE)){
                               document.axisctr148.CNUEVO.value=p.JSON2.riesgoauto.CVEHNUE;
                               document.axisctr148.VEHICLE_NOU.value=p.JSON2.riesgoauto.CVEHNUE;
                            }
                          </axis:visible>
                           <axis:visible c="NPLAZAS" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NPLAZAS))
                                document.axisctr148.NPLAZAS.value=p.JSON2.riesgoauto.NPLAZAS;
                             </axis:visible>
                                       
                           <axis:visible c="NBASTID" f="axisctr148">    
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.NBASTID))
                                document.axisctr148.NBASTID.value=p.JSON2.riesgoauto.NBASTID;
                             </axis:visible>
                             
                           <axis:visible c="CTIPMAT" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CTIPMAT))
                                document.axisctr148.CTIPMAT.value=p.JSON2.riesgoauto.CTIPMAT;
                             </axis:visible>
                             
                           <axis:visible c="CVERSION" f="axisctr148">    
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.CVERSION))
                                document.axisctr148.CVERSION.value=p.JSON2.riesgoauto.CVERSION;
                             </axis:visible>   
                             
                             <axis:visible c="TVERSION" f="axisctr148">    
                             if (!objUtiles.estaVacio(p.JSON2.riesgoauto.TVERSION))
                                document.axisctr148.TVERSION.value=p.JSON2.riesgoauto.TVERSION;
                             </axis:visible>   
                        }
             }
             
             f_errores_validacion(p.JSON2.errores_validacion);
             f_cargar_propiedades_pantalla();
            }catch(e){}
            }
            
             function callbacktipos_vehiculo(p) {
    	
             objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	   
                 try{
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                        var tipvehcombo = document.axisctr148.CTIPVEH;     
                        objDom.borrarOpcionesDeCombo(tipvehcombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                         if (!objUtiles.estaVacio(p.JSON2.lista)){
                             for (i = 0; i < p.JSON2.lista.length; i++) {
                                    var codigo = p.JSON2.lista[i].CTIPVEH;
                                    var desc   = p.JSON2.lista[i].TTIPVEH;
                                  /*  <axis:visible f="axisctr148" c="CODIGOS">
                                    desc = desc +"      ("+codigo+")";
                                    </axis:visible>*/
                                    objDom.addOpcionACombo(codigo, desc, tipvehcombo, i+1);
                             }
                         }
                         
                         if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                             var codigo = p.JSON2.lista[0].CTIPVEH;
                              document.axisctr148.CTIPVEH.value =codigo;
                                <axis:visible c="CCLAVEH" f="axisctr148">
                              f_llenar_clase(codigo);
                              </axis:visible>
                                if (!objUtiles.estaVacio(document.axisctr148.CTIPVEHSEL.value) ){
                                     document.axisctr148.CTIPVEH.value = document.axisctr148.CTIPVEHSEL.value;
                                        
                                }
                                f_llenar_modelo( document.axisctr148.CMARCA.value);
                         }else{
                          <axis:visible c="CCLAVEH" f="axisctr148">
                              var clasecombo = document.axisctr148.CCLAVEH;     
                        objDom.borrarOpcionesDeCombo(clasecombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                        </axis:visible>
                        
                                if (!objUtiles.estaVacio(document.axisctr148.CTIPVEHSEL.value) ){
                                     document.axisctr148.CTIPVEH.value = document.axisctr148.CTIPVEHSEL.value;
                                       
                                }
                    
                        
                            f_llenar_modelo( document.axisctr148.CMARCA.value);
                         }
      
                }
                
                }catch(e){}
            
            }
            
             function callbacktipos_vehiculo_xmod(p) {
    	
             objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	   
                 try{
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                        var tipvehcombo = document.axisctr148.CTIPVEH; 
                         if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                             var codigo = p.JSON2.lista[0].CTIPVEH;
                              document.axisctr148.CTIPVEH.value =codigo;
                }
                }
                }catch(e){}
            
            } 
            
  function callbackanyo_version(p) {
    	
             objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	    var anyoact = document.axisctr148.ANYO.value;
                 
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                 <axis:visible c="ANYO" f="axisctr148">
                        valorcomercial = '';
                        var clasecombo = document.axisctr148.ANYO;     
                        objDom.borrarOpcionesDeCombo(clasecombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                         if (!objUtiles.estaVacio(p.JSON2.lista)){
                              for (i = 0; i < p.JSON2.lista.length; i++) {
                                    var codigo = p.JSON2.lista[i].ANYO;
                                    var desc   = p.JSON2.lista[i].ANYO;
                                    var valor = p.JSON2.lista[i].VCOMERCIAL;
                                    var VNUEVO = p.JSON2.lista[i].VNUEVO;
                                    objDom.addOpcionACombo(codigo, desc, clasecombo, i+1);
                                    
                                    if (anyoact == codigo ){
                                        valorcomercial=valor;
                                    }
                             }  
                        }                         
                         
                         if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                             var codigo = p.JSON2.lista[0].ANYO;
                                document.axisctr148.ANYO.value =codigo;
	                            if (objUtiles.estaVacio(suplementohomologacion)){
	                              document.axisctr148.IVEHICU.value =valor;
	                              document.axisctr148.IVEHINUE.value =VNUEVO;
                            	}
                              document.axisctr148.IVEHICUFASECOLDA.value =valor;
                              document.axisctr148.IVEHICUFASECOLDANUE.value =VNUEVO;
                              
                         }else{
                             if (!objUtiles.estaVacio(valorcomercial) && !objUtiles.estaVacio(anyoact)){
                             	document.axisctr148.ANYO.value =anyoact;
                              if (objUtiles.estaVacio(suplementohomologacion)){
	                              document.axisctr148.IVEHICU.value =valorcomercial;
	                              document.axisctr148.IVEHINUE.value =VNUEVO;
                            	}
                              document.axisctr148.IVEHICUFASECOLDA.value =valorcomercial;
                              document.axisctr148.IVEHICUFASECOLDANUE.value =VNUEVO;
                                
                             }
                         
                         }
                         </axis:visible>
                         suplementohomologacion = '';
                         if (!objUtiles.estaVacio(p.JSON2.lista)){
                             document.axisctr148.NPUERTAS.value =  p.JSON2.lista[0].NPUERTA;
                             document.axisctr148.NPUERTAS_HIDDEN.value = p.JSON2.lista[0].NPUERTA;
                             document.axisctr148.CPESO.value = p.JSON2.lista[0].CPESO;
                             document.axisctr148.CTRANSMISION.value =  p.JSON2.lista[0].CTRANSMISION;
                         }
      
                }
                 try{
                        f_llenar_usos(document.axisctr148.CTIPVEH.value,document.axisctr148.CCLAVEH.value);
                        }catch(e){
                        f_llenar_usos(document.axisctr148.CTIPVEH.value,'');}
                       
                   
            }
            
    function callbackclase_vehiculo(p) {
    	//alert(JSON.stringify(p))
             objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	   
                 
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                 <axis:visible c="CCLAVEH" f="axisctr148">
               
                        var clasecombo = document.axisctr148.CCLAVEH;     
                        objDom.borrarOpcionesDeCombo(clasecombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                         if (!objUtiles.estaVacio(p.JSON2.lista)){
                              for (i = 0; i < p.JSON2.lista.length; i++) {
                                    var codigo = p.JSON2.lista[i].CCLAVEH;
                                    var desc   = p.JSON2.lista[i].TCLAVEH;
                                   /* <axis:visible f="axisctr148" c="CODIGOS">
                                    desc = desc +"      ("+codigo+")";
                                    </axis:visible>*/
                                    objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                             }  
                        }                         
                         
                         if (!objUtiles.estaVacio(p.JSON2.lista) && p.JSON2.lista.length == 1){
                             var codigo = p.JSON2.lista[0].CCLAVEH;
                              document.axisctr148.CCLAVEH.value =codigo;
                         }
                         </axis:visible>
                         
      
                }
                   f_llenar_modelo( document.axisctr148.CMARCA.value);
                         
            
            }
            
            
    function callbacksoloclase_vehiculo(p) {
    	
             objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	   
                 
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                        var clasecombo = document.axisctr148.CCLAVEH;     
                        objDom.borrarOpcionesDeCombo(clasecombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                         if (!objUtiles.estaVacio(p.JSON2.lista)){
                              for (i = 0; i < p.JSON2.lista.length; i++) {
                                    var codigo = p.JSON2.lista[i].CCLAVEH;
                                    var desc   = p.JSON2.lista[i].TCLAVEH;
                                   /* <axis:visible f="axisctr148" c="CODIGOS">
                                    desc = desc +"      ("+codigo+")";
                                    </axis:visible>*/
                                    objDom.addOpcionACombo(codigo, desc, clasecombo, i+1);
                             }  
                        document.axisctr148.CCLAVEH.value = globalcclaveh
                        }   
                        
                         
                        
                          
      
                }
            
            }
            
            
            function f_llenar_puertas(vmarca,vmodelo){
               // f_limpiar(1);
                objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarPuertas, "operation=ajax_recuperar_puertas&CMARCA="+vmarca+"&CMODELO="+vmodelo, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_llenar_usos(vttipveh,vtclaveh,on_load){
                objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarUsos, "operation=ajax_recuperar_usos&TTIPVEH="+vttipveh+"&TCLAVEH="+vtclaveh+"&on_load="+on_load, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_llenar_subusos(vttipveh,vtclaveh,vcuso){
                objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarSubUsos, "operation=ajax_recuperar_subusos&TTIPVEH="+vttipveh+"&TCLAVEH="+vtclaveh+"&CUSO="+vcuso, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function callbackAjaxRecuperarModelo(ajaxResponseText){
            //alert(ajaxResponseText)
                try {  
                    var doc = objAjax.domParse(ajaxResponseText);
                    
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.axisctr148.CMODELO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            var elementos = doc.getElementsByTagName("element");
                            var modelocombo = document.axisctr148.CMODELO;     
                            objDom.borrarOpcionesDeCombo(modelocombo);
                            
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', modelocombo, 0);
                      
                            
                            for (i = 0; i < elementos.length; i++) {
                                var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CMODELO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CMODELO"), 0, 0) : "";
                                var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TMODELO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TMODELO"), 0, 0): "";
                                  /*  <axis:visible f="axisctr148" c="CODIGOS">
                                    	desc = desc +"      ("+codigo+")";
                                    </axis:visible>*/
                                objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                            }
                         if (!objUtiles.estaVacio(document.axisctr148.CMODELOSEL.value))
                            document.axisctr148.CMODELO.value = document.axisctr148.CMODELOSEL.value;
                              <axis:visible f="axisctr148" c="NPUERTAS">
                            objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarPuertas, "operation=ajax_recuperar_puertas&CMARCA="+document.axisctr148.CMARCA.value+"&CMODELO="+document.axisctr148.CMODELO.value, this, objJsMessages.jslit_actualizando_registro);
                            </axis:visible>
                        }
                        if (elementos.length == 0){
                            objDom.addOpcionACombo(null, "Seleccione", modelocombo, 0);
                            var elementos = doc.getElementsByTagName("element");
                            var versioncombo = document.axisctr148Form.CMODELO;     
                            objDom.borrarOpcionesDeCombo(versioncombo);
                            objDom.addOpcionACombo(null, "Seleccione", versioncombo, 0);
                        }
                        
                    } 
                 } catch (e) {
                        if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                 }
            }
            
            function callbackAjaxRecuperarPuertas(ajaxResponseText){
                try {  
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                        var elementos = doc.getElementsByTagName("element");
                        <axis:visible c="NPUERTAS" f="axisctr148">
                        var modelocombo = document.axisctr148.NPUERTAS;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            var elementos = doc.getElementsByTagName("element");
                            var modelocombo = document.axisctr148.NPUERTAS;     
                            objDom.borrarOpcionesDeCombo(modelocombo);
                            objDom.addOpcionACombo(null, "<axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/>", modelocombo, 0);
                            for (i = 0; i < elementos.length; i++) {
                                var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("NPUERTA")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("NPUERTA"), 0, 0) : "";
                                var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("NPUERTA")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("NPUERTA"), 0, 0): "";
                                objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                            }
                            
                            if (!objUtiles.estaVacio(globalnpuertas))
                            document.axisctr148.NPUERTAS.value =  globalnpuertas;
                            
                        }
                        if (elementos.length == 0){
                            objDom.addOpcionACombo(null, "Seleccione", modelocombo, 0);
                            var elementos = doc.getElementsByTagName("element");
                            var versioncombo = document.axisctr148Form.NPUERTAS;     
                            objDom.borrarOpcionesDeCombo(versioncombo);
                            objDom.addOpcionACombo(null, "Seleccione", versioncombo, 0);
                        }
                        
                        </axis:visible>
                        
                    } 
                        
                 } catch (e) { 
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                 }
           }
           
           
           function callbackjsonRecuperarVersion(p){
           var ocultaErrores =  true;
           //Si estamos en carga de página, no ocultaremos los errores produccidos al validar
           if(p.JSON2.on_load=='true'){                
                ocultaErrores = false;
           }
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	   try{
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, ocultaErrores, "resultado")){
                   if (!objUtiles.estaVacio(p.JSON2.lista)){
                        if(!objUtiles.estaVacio(p.JSON2.resultado.MENSAJES)){
                            var msg = p.JSON2.resultado.MENSAJES[0].OB_IAX_MENSAJES.TERROR;                            
                            if (!objUtiles.estaVacio(msg) && objUtiles.estaVacio(p.JSON2.resultado.mostrarAlert)){
                                //Si hay algun error/aviso se muestra un alert.
                                alert(msg);
                            }
                        }
                        <axis:visible c="CTIPVEH" f="axisctr148">
                        if (!objUtiles.estaVacio(p.JSON2.listatipos)){
                              var tipvehcombo = document.axisctr148.CTIPVEH;     
                                objDom.borrarOpcionesDeCombo(tipvehcombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', tipvehcombo, 0);
                                 if (!objUtiles.estaVacio(p.JSON2.listatipos)){
                                     for (i = 0; i < p.JSON2.listatipos.length; i++) {
                                            var codigo = p.JSON2.listatipos[i].CTIPVEH;
                                            var desc   = p.JSON2.listatipos[i].TTIPVEH;
                                          /*  <axis:visible f="axisctr148" c="CODIGOS">
                                            desc = desc +"      ("+codigo+")";
                                            </axis:visible>*/
                                            objDom.addOpcionACombo(codigo, desc, tipvehcombo, i+1);
                                     }
                                 }
                        }
                        </axis:visible>
                        <axis:visible c="CCLAVEH" f="axisctr148">
                        if (!objUtiles.estaVacio(p.JSON2.listaclases)){
                              var clasecombo = document.axisctr148.CCLAVEH;     
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                 if (!objUtiles.estaVacio(p.JSON2.listaclases)){
                                      for (i = 0; i < p.JSON2.lista.length; i++) {
                                            var codigo = p.JSON2.listaclases[i].CCLAVEH;
                                            var desc   = p.JSON2.listaclases[i].TCLAVEH;
                                         /*   <axis:visible f="axisctr148" c="CODIGOS">
                                            desc = desc +"      ("+codigo+")";
                                            </axis:visible>*/
                                            objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                     }  
                                }       
                        
                        }
                        </axis:visible>
                        <axis:visible c="CMODELO" f="axisctr148">
                         if (!objUtiles.estaVacio(p.JSON2.listamodelos)){
                              var clasecombo = document.axisctr148.CMODELO;     
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                 if (!objUtiles.estaVacio(p.JSON2.listamodelos)){
                                      for (i = 0; i < p.JSON2.listamodelos.length; i++) {
                                            var codigo = p.JSON2.listamodelos[i].CMODELO;
                                            var desc   = p.JSON2.listamodelos[i].TMODELO;
                                          /*  <axis:visible f="axisctr148" c="CODIGOS">
                                            desc = desc +"      ("+codigo+")";
                                            </axis:visible>*/
                                            objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                     }  
                                }       
                        
                        }
                        </axis:visible>
                        
                         <axis:visible c="CVERSION" f="axisctr148">
                             objDom.setValorPorId("CVERSION", objUtiles.estaVacio( p.JSON2.lista[0].CVERSION ) ?"" :  p.JSON2.lista[0].CVERSION  );
                        </axis:visible>
                        
                        
                        <axis:visible c="ANYO" f="axisctr148">
                         if (!objUtiles.estaVacio(p.JSON2.listaanyos)){
                                
                         	var clasecombo = document.axisctr148.ANYO;     
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                 if (!objUtiles.estaVacio(p.JSON2.listaanyos)){
                                      for (i = 0; i < p.JSON2.listaanyos.length; i++) {
                                            var codigo = p.JSON2.listaanyos[i].ANYO;
                                            var desc   = p.JSON2.listaanyos[i].ANYO;
                                          
                                            objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                     }  
                                } 
                                var anyoanterior = '${__formdata.ANYO}';
                                //Si venimos de la carga de la página y tenemos algun valor en el campo ANYO, lo setearemos
                                if(p.JSON2.on_load=='true' && !objUtiles.estaVacio(anyoanterior)){
                                    document.axisctr148.ANYO.value= anyoanterior;
                                }
                                
                                if ( !objUtiles.estaVacio(p.JSON2.resultado.mostrarAlert) ){
                                               	document.axisctr148.ANYO.value= anyoanterior;
                                		f_cambiar_anyo(anyoanterior);
                                		suplementohomologacion = '1';
                                }
                        
                        }
                        </axis:visible>
                        <axis:visible c="NPUERTAS" f="axisctr148">
                        if (!objUtiles.estaVacio(p.JSON2.listapuertas)){
                        
                             var clasecombo = document.axisctr148.NPUERTAS;     
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                 if (!objUtiles.estaVacio(p.JSON2.listapuertas)){
                                      for (i = 0; i < p.JSON2.listapuertas.length; i++) {
                                            var codigo = p.JSON2.listapuertas[i].NPUERTA;
                                            var desc   = p.JSON2.listapuertas[i].NPUERTA;
                                          
                                            objDom.addOpcionACombo(codigo,desc, clasecombo, i+1);
                                     }  
                                }  
                        }
                        </axis:visible>
                         objDom.setVisibilidadPorId("TVERSION","visible");
                         
                      
                         
                         <%--axis:visible c="NPUERTAS" f="axisctr148"--%>
                         objDom.setValorPorId("NPUERTAS", objUtiles.estaVacio( p.JSON2.lista[0].NPUERTA ) ?"" :  p.JSON2.lista[0].NPUERTA  );
                         <%--/axis:visible--%>
                         
                            
                            <axis:visible c="CMARCA" f="axisctr148">
                            
                             objDom.setValorPorId("CMARCA", objUtiles.estaVacio( p.JSON2.lista[0].CMARCA ) ?"" :  p.JSON2.lista[0].CMARCA  );
                         </axis:visible>
                            
                            <axis:visible c="CMOTOR" f="axisctr148">
                             objDom.setValorPorId("CMOTOR",objUtiles.estaVacio( p.JSON2.lista[0].CMOTOR ) ?"" :  p.JSON2.lista[0].CMOTOR);
                            </axis:visible>
                            <axis:visible c="TVERSION" f="axisctr148">
                             objDom.setValorPorId("TVERSION",objUtiles.estaVacio( p.JSON2.lista[0].TVERSION ) ?"" :  p.JSON2.lista[0].TVERSION);
                            </axis:visible>
                            <axis:visible c="TTIPVEH" f="axisctr148">
                             objDom.setValorPorId("TTIPVEH", objUtiles.estaVacio( p.JSON2.lista[0].TTIPVEH ) ?"" :  p.JSON2.lista[0].TTIPVEH);
                            </axis:visible>
                             <axis:visible c="TCLAVEH" f="axisctr148">
                             objDom.setValorPorId("TCLAVEH", objUtiles.estaVacio( p.JSON2.lista[0].TCLAVEH ) ?"" :  p.JSON2.lista[0].TCLAVEH);
                            </axis:visible>
                            
                             <%--axis:visible c="NTARA" f="axisctr148"--%>
                             objDom.setValorPorId("NTARA",objUtiles.estaVacio( p.JSON2.lista[0].NTARA ) ?"" :  p.JSON2.lista[0].NTARA   );
                             //if (objUtiles.estaVacio(objDom.getValorPorId("NTARA")) )
                             //    objDom.setValorPorId("NTARA", objUtiles.estaVacio( p.JSON2.lista[0].NTARA ) ?"" :  p.JSON2.lista[0].NTARA  );
                             
                            <%--/axis:visible--%>
                            
                            <axis:visible c="CPESO" f="axisctr148">
                             objDom.setValorPorId("CPESO",objUtiles.estaVacio( p.JSON2.lista[0].CPESO ) ?"" :  p.JSON2.lista[0].CPESO   );
                             //if (objUtiles.estaVacio(objDom.getValorPorId("CPESO")) )
                             //    objDom.setValorPorId("CPESO", objUtiles.estaVacio( p.JSON2.lista[0].NTARA ) ?"" :  p.JSON2.lista[0].NTARA  );
                             
                            </axis:visible>

                            <%-- Inici BUG 30256/168637 - RCL - 05/03/2014 --%>
                            <axis:visible c="CTRANSMISION" f="axisctr148">
                            if (!objUtiles.estaVacio(p.JSON2.listatransmision))
                            {
                                var clasecombo = document.axisctr148.CTRANSMISION;
                                objDom.borrarOpcionesDeCombo(clasecombo);
                                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr148" c="SNV_VALOR" lit="108341"/> - ', clasecombo, 0);
                                 if (!objUtiles.estaVacio(p.JSON2.listatransmision)){
                                      for (i = 0; i < p.JSON2.listatransmision.length; i++) {
                                            var codigo = p.JSON2.listatransmision[i].CATRIBU;
                                            var desc   = p.JSON2.listatransmision[i].TATRIBU;
                                          
                                            objDom.addOpcionACombo(codigo, desc, clasecombo, i+1);
                                     }  
                                }  
                            }
                            </axis:visible>
                            objDom.setValorPorId("CTRANSMISION", objUtiles.estaVacio( p.JSON2.lista[0].CTRANSMISION ) ?"" :  p.JSON2.lista[0].CTRANSMISION  );
                            <%-- Fi BUG 30256/168637 - RCL - 05/03/2014 --%>
                           
                            <axis:visible c="CSERVICIO" f="axisctr148">
                            objDom.setValorPorId("CSERVICIO",objUtiles.estaVacio( p.JSON2.lista[0].CSERVICIO ) ?"" :  p.JSON2.lista[0].CSERVICIO);
                            </axis:visible>
                            <axis:visible c="CCAJA" f="axisctr148">
                            objDom.setValorPorId("CCAJA", objUtiles.estaVacio( p.JSON2.lista[0].CCAJA ) ?"" :  p.JSON2.lista[0].CCAJA);
                            </axis:visible>
                            
                            
                             <axis:visible c="CCILINDRAJE" f="axisctr148">
                            objDom.setValorPorId("CCILINDRAJE", objUtiles.estaVacio( p.JSON2.lista[0].CCILINDRAJE ) ?"" :  p.JSON2.lista[0].CCILINDRAJE);
                            </axis:visible>
                            <axis:visible c="CORIGEN" f="axisctr148">
                            objDom.setValorPorId("CORIGEN",objUtiles.estaVacio( p.JSON2.lista[0].CORIGEN ) ?"" :  p.JSON2.lista[0].CORIGEN);
                            </axis:visible>
                            
                              <axis:visible c="NPMA" f="axisctr148">
                            objDom.setValorPorId("NPMA", objUtiles.estaVacio( p.JSON2.lista[0].NPMA ) ?"" :  p.JSON2.lista[0].NPMA);
                            </axis:visible> 
                            
                            <axis:visible c="NPLAZAS" f="axisctr148">
                            objDom.setValorPorId("NPLAZAS", objUtiles.estaVacio( p.JSON2.lista[0].NPLAZAS ) ?"" :  p.JSON2.lista[0].NPLAZAS);
                            </axis:visible>
                            
                               
                                 <axis:visible c="FLANZAM" f="axisctr148">
                               objDom.setValorPorId("FLANZAM", objUtiles.estaVacio( p.JSON2.lista[0].FLANZAM ) ?"" :  p.JSON2.lista[0].FLANZAM);
                                   if (!objUtiles.estaVacio(objDom.getValorPorId("FLANZAM")) )
                                        objDom.setValorPorId("FLANZAM", objUtiles.formateaTimeStamp2(p.JSON2.lista[0].FLANZAM));
                            </axis:visible>
                             
                             
                            
                                 <axis:visible c="CTIPVEH" f="axisctr148">
                                  objDom.setValorPorId("CTIPVEH", objUtiles.estaVacio( p.JSON2.lista[0].CTIPVEH ) ?"" :  p.JSON2.lista[0].CTIPVEH);
                              
                                 </axis:visible>
                                 <axis:visible c="CCLAVEH" f="axisctr148">
                                  objDom.setValorPorId("CCLAVEH", objUtiles.estaVacio( p.JSON2.lista[0].CCLAVEH ) ?"" :  p.JSON2.lista[0].CCLAVEH);
                                </axis:visible>
                                 <axis:visible c="CMODELO" f="axisctr148">
                                  objDom.setValorPorId("CMODELO", objUtiles.estaVacio( p.JSON2.lista[0].CMODELO ) ?"" :  p.JSON2.lista[0].CMODELO);
                                </axis:visible>
                                try{
                        f_llenar_usos(document.axisctr148.CTIPVEH.value,document.axisctr148.CCLAVEH.value,p.JSON2.on_load);
                        }catch(e){
                        f_llenar_usos(document.axisctr148.CTIPVEH.value,'',p.JSON2.on_load);}
                 
                 }else{
                    objDom.setValorPorId("CVERSION","");
				 }
                 
                 }else{
                    f_limpiar(5);
                 }
           
                }catch(e){
                 CVERSION = objDom.getValorPorId("CVERSION");
                 
                  if (isDebugAjaxEnabled == "true")
                     alert (e.name + " " + e.message);
                     
                     f_limpiar(5);
                      objDom.setValorPorId("CVERSION",CVERSION);
                }       
           }
           
           function callbackAjaxRecuperarVersion(ajaxResponseText){
            try {  
                  var doc = objAjax.domParse(ajaxResponseText);
                  //alert(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc))  {                 
                    objDom.setVisibilidadPorId("TVERSION","visible");
                    <axis:visible c="CVERSION" f="axisctr148">
                      objDom.setValorPorId("CVERSION", objUtiles.existeObjetoXml(doc.getElementsByTagName("CVERSION")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVERSION"), 0, 0) : "");
                    </axis:visible>
                    <axis:visible c="NPUERTAS" f="axisctr148">
                    objDom.setValorPorId("NPUERTAS", objUtiles.existeObjetoXml(doc.getElementsByTagName("NPUERTA")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPUERTA"), 0, 0) : "");
                    </axis:visible>
                    <axis:visible c="CMARCA" f="axisctr148">
                    objDom.setValorPorId("CMARCA", objUtiles.existeObjetoXml(doc.getElementsByTagName("CMARCA")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMARCA"), 0, 0) : "");
                    </axis:visible>
                    //f_llenar_tipo(document.axisctr148.CMARCA.value);
                    objDom.setValorPorId("CMOTOR", objUtiles.existeObjetoXml(doc.getElementsByTagName("CMOTOR")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMOTOR"), 0, 0) : "");
                    objDom.setValorPorId("TVERSION", objUtiles.existeObjetoXml(doc.getElementsByTagName("TVERSION")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVERSION"), 0, 0) : "");
                    <axis:visible c="TTIPVEH" f="axisctr148">
                    objDom.setValorPorId("TTIPVEH", objUtiles.existeObjetoXml(doc.getElementsByTagName("TTIPVEH")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPVEH"), 0, 0) : "");
                    </axis:visible>
                    <axis:visible c="TCLAVEH" f="axisctr148">
                    objDom.setValorPorId("TCLAVEH", objUtiles.existeObjetoXml(doc.getElementsByTagName("TCLAVEH")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCLAVEH"), 0, 0) : "");
                    </axis:visible>
                    <axis:visible c="NTARA" f="axisctr148">
                    objDom.setValorPorId("NTARA", objUtiles.existeObjetoXml(doc.getElementsByTagName("NTARA")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("NTARA"), 0, 0) : "");
                    </axis:visible>
                    
                    <axis:visible c="CPESO" f="axisctr148">
                    objDom.setValorPorId("CPESO", objUtiles.existeObjetoXml(doc.getElementsByTagName("CPESO")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPESO"), 0, 0) : "");
                    </axis:visible>
                    
                    <axis:visible c="CSERVICIO" f="axisctr148">
                    objDom.setValorPorId("CSERVICIO", objUtiles.existeObjetoXml(doc.getElementsByTagName("CSERVICIO")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CSERVICIO"), 0, 0) : "");
                    </axis:visible>
                    <axis:visible c="CCAJA" f="axisctr148">
                    objDom.setValorPorId("CCAJA", objUtiles.existeObjetoXml(doc.getElementsByTagName("CVEHCAJ")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVEHCAJ"), 0, 0) : "");
                    </axis:visible>
                    
                    
                     <axis:visible c="CCILINDRAJE" f="axisctr148">
                    objDom.setValorPorId("CCILINDRAJE", objUtiles.existeObjetoXml(doc.getElementsByTagName("NCILIND")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCILIND"), 0, 0) : "");
                    </axis:visible>
                    <axis:visible c="CORIGEN" f="axisctr148">
                    objDom.setValorPorId("CORIGEN", objUtiles.existeObjetoXml(doc.getElementsByTagName("CORIGEN")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CORIGEN"), 0, 0) : "");
                    </axis:visible>
                    objDom.setValorPorId("NPMA",objUtiles.existeObjetoXml(doc.getElementsByTagName("NPMA")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPMA"), 0, 0) : "");                   
                    objDom.setValorPorId("NPLAZAS", objUtiles.existeObjetoXml(doc.getElementsByTagName("NPLAZAS")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPLAZAS"), 0, 0) : "");   
                                 <axis:visible c="FLANZAM" f="axisctr148">
                    if(doc.getElementsByTagName("FLANZAM").value!=null){
                        if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FLANZAM"), 0, 0)!=null){
                            objDom.setValorPorId("FLANZAM", objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FLANZAM"), 0, 0)));
                            }                        
                        }                   
                        </axis:visible>
                     
                     
                    
                        objDom.setValorPorId("CTIPVEH", objUtiles.existeObjetoXml(doc.getElementsByTagName("CTIPVEH")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPVEH"), 0, 0) : "");   
                         <axis:visible c="CCLAVEH" f="axisctr148">
               
                        objDom.setValorPorId("CCLAVEH",objUtiles.existeObjetoXml(doc.getElementsByTagName("CCLAVEH")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCLAVEH"), 0, 0) : "");  
                    </axis:visible>
                    
                        objDom.setValorPorId("CMODELO", objUtiles.existeObjetoXml(doc.getElementsByTagName("CMODELO")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMODELO"), 0, 0) : "");  
                         
                         globalcclaveh =  objUtiles.existeObjetoXml(doc.getElementsByTagName("CCLAVEH")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCLAVEH"), 0, 0) : "";  
                         globalnpuertas = objUtiles.existeObjetoXml(doc.getElementsByTagName("NPUERTAS")[0]) ?
                                 objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPUERTAS"), 0, 0) : "";  
                        try{
                        f_llenar_usos(document.axisctr148.CTIPVEH.value,document.axisctr148.CCLAVEH.value);
                        }catch(e){
                        f_llenar_usos(document.axisctr148.CTIPVEH.value,'');}
                        
                          objAjax.invokeAsyncCGI("axis_axisctr148.do", callbackAjaxRecuperarPuertas, "operation=ajax_recuperar_puertas&CMARCA="+document.axisctr148.CMARCA.value+"&CMODELO="+document.axisctr148.CMODELO.value, this, objJsMessages.jslit_actualizando_registro);
                    f_llenar_anyos( objDom.getValorPorId("CVERSION"));
                    
                    
                    
                    
                    }else{
                    f_limpiar(5);}
                } catch (e) { 
                 CVERSION = objDom.getValorPorId("CVERSION");
                 
                  if (isDebugAjaxEnabled == "true")
                     alert (e.name + " " + e.message);
                     
                     f_limpiar(5);
                      objDom.setValorPorId("CVERSION",CVERSION);
                }
                    <axis:visible c="CCLAVEH" f="axisctr148">
               
                if (!objUtiles.estaVacio(objDom.getValorPorId("CTIPVEH")) &&  !objUtiles.estaVacio(globalcclaveh) )
                    f_llenar_soloclase(objDom.getValorPorId("CTIPVEH"))
                    </axis:visible>
           }
           
           function callbackAjaxRecuperarUsos(ajaxResponseText){
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                
                var ocultaErrores = true;
                if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("on_load"),0,0)=="true"){
                    ocultaErrores = false;
                }
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc,ocultaErrores)) {                                
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.axisctr148.CUSO;     
                     vuso =document.axisctr148.CUSO.value;
                      objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.axisctr148.CUSO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        objDom.addOpcionACombo(null, "<axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/>", modelocombo, 0);
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CUSO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CUSO"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TUSO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TUSO"), 0, 0): "";
                            objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                        }
                            if (!objUtiles.estaVacio(vuso))
                                document.axisctr148.CUSO.value = vuso ;
                      
                            <axis:visible c="CSUBUSO" f="axisctr148">
               
                      f_llenar_subusos(document.axisctr148.CTIPVEH.value,document.axisctr148.CCLAVEH.value,document.axisctr148.CUSO.value)
                      </axis:visible>
                    }
                    if (elementos.length == 0){
                        objDom.addOpcionACombo(null, "<axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/>", modelocombo, 0);
                        var elementos = doc.getElementsByTagName("element");
                        var versioncombo = document.axisctr148Form.CUSO;     
                        objDom.borrarOpcionesDeCombo(versioncombo);
                        objDom.addOpcionACombo(null, "<axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/>", versioncombo, 0);
                    }
                    
                    //Si en el form viene un CUSO, lo cargaremos
                    var cuso_form =  '${__formdata.CUSO}';
                    if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("on_load"),0,0)=="true" && !objUtiles.estaVacio(cuso_form)){
                        document.axisctr148.CUSO.value=  cuso_form;
                    }
                    
                    
                } 
             } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
               }
            }
            
            function callbackAjaxRecuperarSubUsos(ajaxResponseText){
                try {  
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.axisctr148.CSUBUSO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            var elementos = doc.getElementsByTagName("element");
                            var modelocombo = document.axisctr148.CSUBUSO;     
                            objDom.borrarOpcionesDeCombo(modelocombo);
                            objDom.addOpcionACombo(null, "<axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/>", modelocombo, 0);
                            for (i = 0; i < elementos.length; i++) {
                                var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CSUBUSO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CSUBUSO"), 0, 0) : "";
                                var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TSUBUSO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TSUBUSO"), 0, 0): "";
                                objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                            }
                        }
                        if (elementos.length == 0){
                            objDom.addOpcionACombo(null, "Seleccione", modelocombo, 0);
                            var elementos = doc.getElementsByTagName("element");
                            var versioncombo = document.axisctr148Form.CSUBUSO;     
                            objDom.borrarOpcionesDeCombo(versioncombo);
                            objDom.addOpcionACombo(null, "Seleccione", versioncombo, 0);
                        }
                    } 
                 } catch (e) {
                        if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                   }
            }
            
            function f_matricula(vctipmat){
            
                if (vctipmat == 2 ){
                    objDom.setVisibilidadPorId("CMATRIC","hidden");
                    objDom.setVisibilidadPorId("TCMATRIC","hidden");
                    
                    }
                else{
                    objDom.setVisibilidadPorId("CMATRIC","visible");
                    objDom.setVisibilidadPorId("TCMATRIC","visible");
                    
                    }
                    
                    f_cargar_propiedades_pantalla();
            }
            
            
            function f_onchange_CPAIS() {
            var CPAIS_RESIDENCIA=objDom.getValorPorId("CPAISORIGEN");
            
            if (!objUtiles.estaVacio(CPAIS_RESIDENCIA)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_RESIDENCIA";
                qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAISORIGEN", "");
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "");
               
            }
        }        
        
        function conMayusculas(field) {
            field.value = field.value.toUpperCase()
        } 
        
        
          function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
        }
        		
                
        function f_valida_campo(ths, TDESC) { //TDESC es opcional y es el titulo del campo en idioma de pantalla. Si esta informado, sobre-escribe el ths.title
			var CIDCAMPO=ths.id;
			var TDESCCAMPO="";
			if (ths.title!=undefined) {TDESCCAMPO=ths.title;}
			if (TDESC!=undefined && TDESC.length>0) {TDESCCAMPO=TDESC;}
			var CAMPO=ths.value;
			var url="axis_axisctr148.do?operation=f_valida_campo_ajaxjson&CIDCAMPO="+encodeURIComponent(CIDCAMPO)+"&TDESCCAMPO="+escape(TDESCCAMPO)+"&CAMPO="+encodeURIComponent(CAMPO);
            //alert(url)
			jQuery.ajax({
				url: url,
                success: callBack_f_valida_campo_ajaxjson ,
				dataType: 'json',
                encoding:'UTF-8',
                contentType: 'text/json; charset=UTF-8'			
			});
		}

		function callBack_f_valida_campo_ajaxjson(p) {
            //alert(JSON.stringify(p))
			try {
				if (p.JSON2.F_VALIDA_CAMPO.RETURN!="0") {
					alert("<axis:alt f="axisctr148" c="LIT_FORMATOINCORRECTO" lit="50000"/> - <axis:alt f="axisctr148" c="LIT_FORMATOINCORRECTO_CAMPO" lit="109373"/>: "+p.JSON2.TDESCCAMPO);
					document.getElementById(p.JSON2.CIDCAMPO).value="";
					document.getElementById(p.JSON2.CIDCAMPO).focus();
				}else{
                    if(p.JSON2.CIDCAMPO =="CVERSION"){f_recuperar_version(p.JSON2.CAMPO)};
                }
			}
			catch(Exception) {
			//si peta la llamada al JSON, se lo dejamos pasar sin hacer nada
			}
		}
        
        function f_reset_version(){
            document.getElementById("CVERSION").value='';
            document.getElementById("TVERSION").value='';
        }
        
        function f_validaCaracter(campo){
            var x = "\'";          
            var text = campo.value.toString();
            while (text.indexOf(x) != -1)
                text = text.replace(x,'');
            campo.value=text;
        }
        
        </script>
    </head>
    
    <body onload="f_on_load()">
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr148" c="TITULO_VERSION" lit="9001258" /></c:param>
        <c:param name="nid" value="axisctr058" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr148" c="TITULO_ACCESORIOS" lit="9001362" /></c:param>
        <c:param name="nid" value="axisctr059" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr148" c="TITULO_DISPOSITIVOS" lit="9904763" /></c:param>
        <c:param name="nid" value="axisctr206" />
        </c:import>
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
    <c:set var="pantalla" value="axisctr148"/>
    <form name="axisctr148" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        <input type="hidden" id="CTIPVEHSEL" name="CTIPVEHSEL" value="" />
        <input type="hidden" id="CMODELOSEL" name="CMODELOSEL" value="" />
        <input type="hidden" id="CMARCASEL" name="CMARCASEL" value="" />
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}" />
        <input type="hidden" name="CUSOREMOLQUE" id="CUSOREMOLQUE" value="${__formdata.CUSOREM}" />
        <input type="hidden" name="CNUEVO" id="CNUEVO" value="${__formdata.CVEHNUE}" />
        <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
         <input type="hidden" name="INSPECCION_VIGENTE" id="INSPECCION_VIGENTE" value="${__formdata.INSPECCION_VIGENTE}" />
        <input type="hidden" name="CIAANT" id="CIAANT" value="${__formdata.CIAANT}" />
        <input type="hidden" name="FFINCIANT" id="FFINCIANT" value="<fmt:formatDate value="${__formdata.FFINCIANT}" pattern="dd/MM/yyyy" />" />
        
    <c:set var="pantalla" value="axisctr148"/>
    <c:set var="literalPantalla" value="9001037"/>
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt c="TITULO" f="axisctr148" lit="101110"/></c:param>
            <c:param name="formulario"><axis:alt f="axisctr148" c="TITULO_FORM" lit="${literalPantalla}"/></c:param>
            <c:param name="form">${pantalla}</c:param>
    </c:import>

    <table>
    <tr>
     <td>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <c:if test="${Mostrar!=1}">
        <tr>
          <td>
            <div  class="titulo"><img src="images/flecha.gif"/><b><axis:alt c="TITULO_FORM" f="axisctr148" lit="${literalPantalla}" /></div>
            <!--campos-->
             <table class="seccion">
              <tr>
               <td align="left" >
                <table class="area" align="center">
                 <tr>
                  <th style="width:25%;height:0px">
                    &nbsp;
                  </th>
                  <th style="width:25%;height:0px">
                    &nbsp;
                  </th>
                  <th style="width:25%;height:0px">
                    &nbsp;
                  </th>
                  <th style="width:25%;height:0px">
                    &nbsp;
                  </th>
                 </tr>
                 <tr>
                  <axis:ocultar f="axisctr148" c="CVERSION" dejarHueco="false">
                     <td class="titulocaja">
                         <b><axis:alt c="CVERSION" f="axisctr148" lit="9001146" /></b>
                     </td>
                  </axis:ocultar>   
                 </tr>
                 <tr>                 
                     <axis:ocultar f="axisctr148" c="CVERSION" dejarHueco="false">
                        <td class="campocaja">
                                <input type="text" name="CVERSION" id="CVERSION" onchange="f_valida_campo(this)" 
                                value="${__formdata.CVERSION}"  class="campowidthinput campo campotexto"
                                 title="<axis:alt c="CVERSION" f="axisctr148" lit="9001146" />"
                                <axis:atr f="axisctr148" c="CVERSION" a="obligatorio=true&modificable=true"/>/>
                        </td>  
                    </axis:ocultar>  
                     <axis:ocultar f="axisctr148" c="TVERSION" dejarHueco="false">                    
                      <td class="campocaja">
                        <input type="text" name="TVERSION" id="TVERSION"  value="${__formdata.TVERSION}" <axis:atr f="axisctr148" c="TVERSION" a="modificable=false&isInputText=true"/> style="background-color:transparent;border:0px;font-weight:bold;color:orange" class="campowidthinput campo campotexto"/> 
                      </td>
                    </axis:ocultar>
                 
                 </tr>
                 <tr>
                   <axis:ocultar f="axisctr148" c="CMARCA" dejarHueco="false">
                        <!-- Marca -->
                        <td class="titulocaja">
                            <b><axis:alt c="CMARCA" f="axisctr148" lit="9001046" /></b>
                        </td>
                   </axis:ocultar>
                     <axis:ocultar f="axisctr148" c="CTIPVEH" dejarHueco="false">
                    <!-- tipo vehicle -->
                    <td class="titulocaja">
                        <b><axis:alt c="CTIPVEH" f="axisctr148" lit="9001059" /></b>
                    </td>
                  </axis:ocultar>
                   
                   <axis:ocultar f="axisctr148" c="CMODELO" dejarHueco="false">
                        <!-- Model -->
                        <td class="titulocaja" id="LCMODELO">
                            <b><axis:alt c="CMODELO" f="axisctr148" lit="108515" /></b>
                        </td> 
                   </axis:ocultar>
                  
                 
                 
                 </tr>
                 <tr>
                   <axis:ocultar f="axisctr148" c="CMARCA" dejarHueco="false">
                          <td class="campocaja">
                             <select name = "CMARCA" id="CMARCA"   size="1" onchange="f_reset_version();f_llenar_tipo(this.value)" title="<axis:alt c="CMARCA" f="axisctr148" lit="9001046" />"
                             class="campowidthselect campo campotexto"  <axis:atr f="axisctr148" c="CMARCA" a="modificable=true&isInputText=false&obligatorio=true"/> >
                              <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>                              
                                <c:forEach var="marcas" items="${MARCAS}">
                                 <option value = "${marcas.CMARCA}"
                                  <c:if test="${(!empty __formdata.CMARCA)&& marcas.CMARCA == __formdata.CMARCA}"> selected </c:if> value="${marcas.TMARCA}">
                                  ${marcas.TMARCA}<axis:visible f="axisctr148" c="CODIGOS">&nbsp&nbsp(${marcas.CMARCA})</axis:visible>  </option>
                                 </c:forEach>
                             </select>
                          </td>
                    </axis:ocultar>   
                    
                <axis:ocultar f="axisctr148" c="CTIPVEH" dejarHueco="false">
                        <td class="campocaja">
                                        <select name = "CTIPVEH" id="CTIPVEH" size="1" onchange="f_reset_version();f_llenar_clase(this.value)" class="campowidthselect campo campotexto"
                                         title="<axis:alt c="CTIPVEH" f="axisctr148" lit="9001059" />" <axis:atr f="axisctr148" c="CTIPVEH" a="modificable=true&obligatorio=true&isInputText=false"/>>
                                            <option value = "${axisctr065_Version.CTIPVEH}"> - <axis:alt f="axisctr148" c="CTIPVEH_1V" lit="108341"/> - </option>
                                            <c:forEach var="tipveh" items="${LSTCTIPVEH}">
                                             <option value = "${tipveh.CTIPVEH}"
                                                   <c:if test="${tipveh.CTIPVEH == __formdata.CTIPVEH}"> selected </c:if>>
                                                    ${tipveh.TTIPVEH}</option>  
                                            </c:forEach>
                                         </select>
                                </td>
                   </axis:ocultar>
                      
                    
                 <axis:ocultar f="axisctr148" c="CMODELO" dejarHueco="false">
                          <td class="campocaja">
                             <select name = "CMODELO" id="CMODELO"  size="1" onchange="f_reset_version();f_llenar_puertas(document.axisctr148.CMARCA.value,this.value)" class="campowidthselect campo campotexto"
                              title="<axis:alt c="CMODELO" f="axisctr148" lit="108515" />"
                             <axis:atr f="axisctr148" c="CMODELO" a="obligatorio=true&modificable=true&isInputText=false"/>>
                             <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>                              
                               <c:forEach var="modelos" items="${MODELOS}">
                                <option value = "${modelos.CMODELO}"
                                 <c:if test="${(!empty __formdata.CMODELO) && modelos.CMODELO == __formdata.CMODELO}"> selected </c:if>>
                                 ${modelos.TMODELO}</option>
                               </c:forEach>
                             </select>
                          </td>
                    </axis:ocultar>
                   
                    
                     
                                
                     <axis:visible c="EDIT_VERSION" f="axisctr148">
                    <td colspan=2 id="BUT_EDIT">
                        <b><axis:alt c="EDIT_VERSION" f="axisctr148" lit="9001051" /></b>&nbsp&nbsp&nbsp<a href="javascript:f_abrir_axisctr058(document.axisctr148.CMARCA.value,document.axisctr148.CMODELO.value,document.axisctr148.CMOTOR.value)"><img title="<axis:alt c="BUT_EDIT" f="axisctr148" lit="9001051" />" border="0" src="images/car.gif" /></a>
                    </td>
                    </axis:visible>
                 </tr>
                 
                 <tr>
                      <axis:ocultar f="axisctr148" c="CCLAVEH" dejarHueco="false">
                  <!-- clase vehicle -->
                    <td class="titulocaja">
                        <b><axis:alt c="CCLAVEH" f="axisctr148" lit="9001060" /></b>
                    </td> 
                </axis:ocultar>
                
                    <axis:ocultar f="axisctr148" c="ANYO" dejarHueco="false">
                        <!-- Model -->
                        <td class="titulocaja" id="td_ANYO">
                            <b><axis:alt c="ANYO" f="axisctr148" lit="101606" /></b>
                        </td> 
                   </axis:ocultar>
                 </tr>
                <tr>
                
                   <axis:ocultar f="axisctr148" c="CCLAVEH" dejarHueco="false">
                  
                       <td class="campocaja" >
                                        <select name = "CCLAVEH" id="CCLAVEH" size="1" onchange="f_llenar_modelo_porclase(this.value)" 
                                        title="<axis:alt c="CCLAVEH" f="axisctr148" lit="9001060" />" <axis:atr f="axisctr148" c="CCLAVEH" a="modificable=true&isInputText=false&obligatorio=true"/>
                                        class="campowidthselect campo campotexto" >
                                            <option value = "${__formdata.CCLAVEH}"> - <axis:alt f="axisctr148" c="CCLAVEH_1V" lit="108341"/> - </option>
                                            <c:forEach var="claveh" items="${LSTCCLAVEH}">
                                             <option value = "${claveh.CCLAVEH}"
                                                   <c:if test="${__formdata.CCLAVEH != 'null' && claveh.CCLAVEH == __formdata.CCLAVEH}"> selected </c:if>>
                                                       ${claveh.TCLAVEH}<axis:visible f="axisctr148" c="CODIGOS">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(${claveh.CCLAVEH})</axis:visible> </option>  
                                            </c:forEach>
                                         </select>                                
                                 </td>
                                 </axis:ocultar>
                                 
<axis:ocultar f="axisctr148" c="ANYO" dejarHueco="false">
                          
<c:choose>
<c:when test="${empty AUT_ANYOTEXTO || (!empty AUT_ANYOTEXTO && AUT_ANYOTEXTO == 0)}">
<td class="campocaja">
                             <select name = "ANYO" id="ANYO" size="1" onchange="f_cambiar_anyo(this.value)" class="campowidthselect campo campotexto"
                             title="<axis:alt c="ANYO" f="axisctr148" lit="101606" />"
                             <axis:atr f="axisctr148" c="ANYO" a="obligatorio=true&modificable=true&isInputText=false"/>>
                             <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option> 
                               <c:forEach var="modelos" items="${LSTANYOS}">
                                <option value = "${modelos.ANYO}"
                                 <c:if test="${(!empty __formdata.ANYO) && modelos.ANYO == __formdata.ANYO}"> selected </c:if>>
                                 ${modelos.ANYO}</option>
                               </c:forEach>
                             </select>
</td>
</c:when>
<c:otherwise>
<td class="campocaja">
       <input type="text" name="ANYO"
                            title="<axis:alt c="ANYO" f="axisctr148" lit="101606" />"
                            id="ANYO" <axis:atr f="axisctr148" c="ANYO" a="obligatorio=false"/> value="${__formdata.ANYO}" class="campowidthinput campo campotexto" formato="entero" maxlength="4"  />
</td>
</c:otherwise>
</c:choose>

</axis:ocultar>
                </tr>
                 
                 <tr>
                 <axis:ocultar c="NPUERTAS" f="axisctr148">
                    <!-- Nº de puertas -->
                    <td class="titulocaja"  id="LNPUERTAS">
                        <b><axis:alt c="NPUERTAS" f="axisctr148" lit="9001053" /></b>
                    </td>
                 </axis:ocultar>
                
                 </tr>
                 <tr> 
                    <td class="campocaja"> 
                        <input type="hidden" name = "NPUERTAS_HIDDEN" id="NPUERTAS_HIDDEN"  value="${__formdata.NPUERTAS}" />
                    </td>
                 <axis:ocultar c="NPUERTAS" f="axisctr148" dejarHueco="false">
                    <td class="campocaja"> 
                        <select name = "NPUERTAS" id="NPUERTAS"  value="${__formdata.NPUERTAS}" size="1" onchange="f_limpiar(2)" class="campowidthselect campo campotexto"
                         title="<axis:alt c="NPUERTAS" f="axisctr148" lit="9001053" />"
                            <axis:atr f="axisctr148" c="NPUERTAS" a="modificable=true&isInputText=false&obligatorio=false"/>>
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>                                
                                <c:forEach var="puertas" items="${PUERTAS}">
                                    <option value = "${puertas.NPUERTA}"
                                        <c:if test="${(!empty __formdata.NPUERTAS) && puertas.NPUERTA == __formdata.NPUERTAS}"> selected </c:if>>
                                        ${puertas.NPUERTA}
                                    </option>  
                                </c:forEach>
                        </select>
                    </td>  
                     </axis:ocultar>
                 </tr>
                 <tr>
                     <axis:visible c="TRIESGO" f="axisctr148">
                        <!-- Desc -->
                        <td class="titulocaja" colspan=2>
                            <b><axis:alt c="TRIESGO" f="axisctr148" lit="100588" /></b>
                        </td>  
                     </axis:visible>
                 </tr>
                 <tr>
                    <axis:ocultar f="axisctr148" c="TRIESGO" dejarHueco="false">
                        <td class="campocaja" colspan=2>
                            <input type="text" name="TRIESGO"
                            title="<axis:alt c="TRIESGO" f="axisctr148" lit="100588" />"
                            id="TRIESGO" <axis:atr f="axisctr148" c="TRIESGO" a="obligatorio=false"/> value="${__formdata.TRIESGO}"  class="campowidthinput campo campotexto"/>
                        </td>
                    </axis:ocultar>  
                 </tr>
             </table>
          </td>
        </tr>   
       </table>
     </td>
    </tr></c:if>
    <tr>
     <td colspan="4">
      <div  class="titulo"><img src="images/flecha.gif"/><b><axis:alt c="IDENT_VEHICULO" f="axisctr148" lit="9001055" /></div>
      <!--campos-->
                   <c:import url="axisctr148_identificacion_vehiculo.jsp"/> 
     </td>
    </tr>
                                 <c:import url="axisctr148_a.jsp"/> 
                                 <c:import url="axisctr148_b.jsp"/>
                                </table>
</td>
</tr>
</table>
</form>

        
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp">
    <c:param name="f">axisctr148</c:param>
    <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr148">cancelar</axis:visible><axis:visible c="BT_SALIR" f="axisctr148">,salir</axis:visible><axis:visible c="BT_ANTERIOR" f="axisctr148">,anterior</axis:visible><axis:visible c="BT_SIGUIENTE" f="axisctr148">,siguiente</axis:visible><axis:visible c="BT_ACEPTAR" f="axisctr148">,aceptar</axis:visible> </c:param>
</c:import>

<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FLANZAM",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FLANZAM", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>


<c:import url="../include/mensajes.jsp" />


</body>
</html>