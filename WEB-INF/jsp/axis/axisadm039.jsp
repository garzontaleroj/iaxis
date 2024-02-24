<%/* Revision:# GfjOOLp4/jQo5N77qtX9LA== # */%>
<%--/**
*  Fichero: axisadm029.jsp
*  Pantalla de generaciones de domiciliaciones de recibos.
*
*  Fecha: 26/02/2009
*/
--%>
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
        <title><axis:alt f="axisadm039" c="TITLE" lit="9001844"/></title> <!--Gestió Transferències-->
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css">
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

        <script type="text/javascript">        
        
            function f_onload() {
               
               f_cargar_propiedades_pantalla();
            
               SALIR = "${__formdata.SALIR}";
               if (!objUtiles.estaVacio(SALIR) ){
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm039", "cancelar", document.miForm, "_self");
         	 }
           
                transferencias = "";
                <c:if test="${!empty __formdata.transferencias}">
                    transferencias = "NO_VACIO";
                </c:if>
                PHAYREGISTROSPENDIENTES = "${__formdata.PHAYREGISTROS}";
                if (!objUtiles.estaVacio(PHAYREGISTROSPENDIENTES) 
                    && PHAYREGISTROSPENDIENTES > 0){
                    if(confirm("<axis:alt f='axisadm039' c='CONFIRM1' lit='9001848'/>")){
                    	  document.miForm.CTRANSFERIDOS_cerca.value = 0;
                        objUtiles.ejecutarFormulario ("axis_axisadm039.do", "recargar_registrespendents", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    }else{
                         objUtiles.abrirModal("axisadm038","src","modal_axisadm038.do?operation=init");
                    }
                }else{
                 if (objUtiles.estaVacio(transferencias) ){
                    objUtiles.abrirModal("axisadm038","src","modal_axisadm038.do?operation=init");
                }
                }
                
                /*TRANSFERITS = "${__formdata.TRANSFERIT}";
                
                 if (!objUtiles.estaVacio(TRANSFERITS)){
                   document.getElementById("BT_TRANSFERIR").disabled =objUtiles.utilEquals(TRANSFERITS, 0) ? false : true;
                 }
                 
                 GENERATS = "${__formdata.GENERAT}";
                 if (!objUtiles.estaVacio(TRANSFERITS)){
                    document.getElementById("BT_GENERAR").disabled=objUtiles.utilEquals(GENERATS, 0) ? objUtiles.utilEquals(TRANSFERITS, 0) ? true : false : true;
                 }*/
                 NREMESA = "${__formdata.NREMESA}";
                 try{
                 document.getElementById("BT_TRANSFERIR").disabled =objUtiles.estaVacio(NREMESA) ? false : true;
                 document.getElementById("BT_GENERAR").disabled=objUtiles.estaVacio(NREMESA) ? true : false;
                 
                  CTRANSFERIDOS = "${__formdata.CTRANSFERIDOS_cerca}";
                 if (!objUtiles.estaVacio(CTRANSFERIDOS) && objUtiles.estaVacio(NREMESA))
                   document.getElementById("BT_TRANSFERIR").disabled =objUtiles.utilEquals(CTRANSFERIDOS, 1) ? true : false;                 
                   }catch(e){}
                   
                 <c:if test="${__formdata.CTRANSFERIDOS_cerca == 0}" >
                 var numdias = "${NUMDIAS}";
                 if(numdias != 0){
                    objDom.setVisibilidadPorId("FABONO", "visible");
                    objDom.setVisibilidadPorId("TFABONO", "visible");
                    objDom.setVisibilidadPorId("icon_FABONO", "visible");
                } else{
                    objDom.setVisibilidadPorId("FABONO", "hidden");
                    objDom.setVisibilidadPorId("TFABONO", "hidden");
                    objDom.setVisibilidadPorId("icon_FABONO", "hidden");
                }
                </c:if>
                f_cargar_propiedades_pantalla();
            }

            function f_buscar_transferencias (CEMPRES, CAGRUP,CRAMO,SPRODUC,
                FABONOINI,FABONOFIN,FTRANSINI,FTRANSFIN,CTRANSFERIDOS,tipos,NREMESA, origen){
                objUtiles.cerrarModal("axisadm038");
                 document.miForm.CEMPRES_cerca.value = CEMPRES;
                 document.miForm.CAGRUP_cerca.value = CAGRUP;
                 document.miForm.CRAMO_cerca.value = CRAMO;
                 document.miForm.SPRODUC_cerca.value = SPRODUC;
                 document.miForm.FABONOINI_cerca.value = FABONOINI;
                 document.miForm.FABONOFIN_cerca.value = FABONOFIN;
                 document.miForm.FTRANSINI_cerca.value = FTRANSINI;
                 document.miForm.FTRANSFIN_cerca.value = FTRANSFIN;
                
                 document.miForm.CTRANSFERIDOS_cerca.value = CTRANSFERIDOS;
                 document.miForm.tipos_cerca.value = tipos;
                 document.miForm.NREMESA_cerca.value = NREMESA;
                 document.miForm.NREMESA.value = NREMESA;
                 document.miForm.VNREMESA.value = NREMESA;

                 objUtiles.ejecutarFormulario ("axis_axisadm039.do?origen="+origen, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
    
            function f_seleccionar_todos(seleccionarTodos) {         
                objUtiles.ejecutarFormulario ("axis_axisadm039.do?seleccionar="+seleccionarTodos, "updateMarcados", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
               
            function f_seleccionar_1x1(SREMESA,seleccionar){
                 objAjax.invokeAsyncCGI("axis_axisadm039.do?SREMESA="+SREMESA+"&seleccionar="+seleccionar, callbackAjaxMarcar, "operation=ajax_updateMarcados", this);
            }
           
            /////////////////// funcion ajax_continuar() //////////////////
            function callbackAjaxMarcar(ajaxResponseText) {
              try{
                var doc = objAjax.domParse(ajaxResponseText);
                var error = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                if (error == 0) {
                     if ( !objUtiles.estaVacio(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTOTAL"), 0, 0)) ){
                         objDom.setValorPorId("TOTALTRANS1", objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTOTAL"), 0, 0));
                         objDom.setValorPorId("TOTALTRANS2", objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTOTAL"), 0, 0));
                     }else{
                         objDom.setValorPorId("TOTALTRANS1", '0,00');
                         objDom.setValorPorId("TOTALTRANS2",'0,00');
                     }
                }
              } catch (e) {
                   objDom.setValorPorId("TOTALTRANS1", '0.00');
                   objDom.setValorPorId("TOTALTRANS2", '0.00');
              }finally{
                    objUtiles.ejecutarFormulario ("axis_axisadm039.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);    
              }
            }

            function f_but_salir() {
            	objUtiles.ejecutarFormulario ("axis_axisadm039.do", "salir", document.miForm, "_self", objJsMessages.jslit_cargando);    
             //   objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm039", "cancelar", document.miForm, "_self");
            } 
            
            function f_cerrar_axisadm038(){
                objUtiles.cerrarModal("axisadm038");
                //f_but_salir();
            }
            
            function f_transferir(){
                document.miForm.CTRANSFERIDOS_cerca.value = '';
                objUtiles.ejecutarFormulario ("axis_axisadm039.do", "transferir", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            function f_but_105488(){
                document.miForm.CTRANSFERIDOS_cerca.value = '';
                document.miForm.FABONO.value = document.getElementById("FABONO").value;
                if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("axis_axisadm039.do", "transferir", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
            }
            
               function f_but_9906853(){
           
                if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("axis_axisadm039.do", "genfitxerexcelpre", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
            }
            
            function f_but_9901004(){ //9901004
                //alert("generar fichero Excel");
                objUtiles.ejecutarFormulario ("axis_axisadm039.do", "genfitxerexcel", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            function f_genfitxer(){
                objUtiles.ejecutarFormulario ("axis_axisadm039.do", "genfitxer", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            function f_but_102803(){
            	  objUtiles.ejecutarFormulario ("axis_axisadm039.do", "genfitxer", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            function f_abrir_axisadm038(){
            	  document.miForm.PARAMS.value = '';
                objUtiles.abrirModal("axisadm038","src","modal_axisadm038.do?operation=init&PARAMS=");
            }

            function f_abrirArchivo(FILE){
                //var fichero = document.miForm.PATH.value;
                fichero = FILE;
                objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+fichero);
            }

            function f_imprimir_fitxer(pfitxer){
    
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
            } 

        /****************************************************************************************/
        /************************************** DETALLE *****************************************/
        /****************************************************************************************/
        
            function mostrar(nombreCapa,nombreDIV){ 
                objUtiles.scrollPoll(nombreCapa,nombreDIV);
            } 
    
            function ocultar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            }   
            
            function f_canviar_agrup(vremesa,vccc){
                //alert(vremesa+'#'+vccc);
                document.miForm.VNREMESA.value = vremesa;
                document.miForm.VCCC.value = vccc;
                objUtiles.ejecutarFormulario ("axis_axisadm039.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_guardar_fcambio(vremesa){
                ocultar('SECCION_C'+vremesa);
                var vfcambio = document.getElementById('FCAMBIO'+vremesa).value;
                //alert(vfcambio+' - '+vremesa);
                objUtiles.ejecutarFormulario ("axis_axisadm039.do?NSREMESA="+vremesa+"&NFCAMBIO="+vfcambio, "fcambio", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function mostrarContent(contentFrame, NRECIBO, NSINIES, SIDEPAG, NRENTAS, NREEMB, NFACT, NLINEA, FTRANSF, NREMESA) {
                var cad = "";
                var layer = document.getElementById(contentFrame);
            
                cad += '                                                                        <!-- INICIO SECCION -->\n';
                cad += '                                                                        <table class="area" align="center">\n';
                cad += '                                                                             <tr>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                             </tr>\n';
                if (NRECIBO != '') {
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                <%-- Rebut --%>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NRECIBO" lit="100895"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- Rebut --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NRECIBO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             </tr>\n';
                }
                if (NSINIES != '' || SIDEPAG != '') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Sinistre --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NSINIES" lit="101298"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                 <%--Pagament --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="SIDEPAG" lit="103463"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NSINIES --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NSINIES + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- SIDEPAG --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + SIDEPAG + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                if (NRENTAS != '') {
                    cad += '                                                                            <tr> \n';                                                                           
                    cad += '                                                                                <%-- Rendes --%>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NRENTAS" lit="109005"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- NRENTA --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NRENTAS + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                }
                if (NREEMB != '' || NFACT != '' || NLINEA != '') {
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NREEMB" lit="9000433"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- nfact --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NFACT" lit="9000469"/></b>\n';
                    cad += '                                                                                </td>  \n';
                    cad += '                                                                                 <%-- linea--%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NLINEA" lit="9001727"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                            </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- NREEMB --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NREEMB + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                 <%-- nfact --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NFACT + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%--linea --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NLINEA + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                }
                if (FTRANSF != '' || NREMESA != '') {
                    cad += '                                                                             <tr>\n';
                    cad += '                                                                                <%-- F trans --%>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="FTRANS" lit="9000465"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- Nremesa --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NREMESAO" lit="108527"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- F trans --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + FTRANSF + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                 <%--nremesa --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NREMESA + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                }
                cad += '                                                                            </table> \n';
                
                layer.innerHTML = cad;
            }
        </script>
    </head>
 
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="tipos_cerca" value="${__formdata.tipos_cerca}"/>
            <input type="hidden" name="CEMPRES_cerca" value="${__formdata.CEMPRES_cerca}"/>
            <input type="hidden" name="CAGRUP_cerca" value="${__formdata.CAGRUP_cerca}"/>
            <input type="hidden" name="CRAMO_cerca" value="${__formdata.CRAMO_cerca}"/>
            <input type="hidden" name="SPRODUC_cerca" value="${__formdata.SPRODUC_cerca}"/>
            <input type="hidden" name="FABONOINI_cerca" value="${__formdata.FABONOINI_cerca}"/>
            <input type="hidden" name="FABONOFIN_cerca" value="${__formdata.FABONOFIN_cerca}"/>
            <input type="hidden" name="FTRANSINI_cerca" value="${__formdata.FTRANSINI_cerca}"/>
            <input type="hidden" name="FTRANSFIN_cerca" value="${__formdata.FTRANSFIN_cerca}"/>
            <input type="hidden" name="CTRANSFERIDOS_cerca" value="${__formdata.CTRANSFERIDOS_cerca}"/>
            <input type="hidden" name="NREMESA_cerca" value="${__formdata.NREMESA_cerca}"/>
            <input type="hidden" name="NREMESA" value="${__formdata.NREMESA}"/>
            <input type="hidden" name="TRANSFERIT" value="${__formdata.TRANSFERIT}"/>
            <input type="hidden" name="GENERAT" value="${__formdata.GENERAT}"/>
            <input type="hidden" name="PATH" value="${__formdata.PATH}"/>
            <input type="hidden" name="NOMFITXER" value="${__formdata.NOMFITXER}"/>
            <input type="hidden" name="PARAMS" id="PARAMS"  value="${__formdata.PARAMS}"/>
            <input type="hidden" name="VNREMESA" value="${__formdata.VNREMESA}"/>
            <input type="hidden" name="VCCC" value="${__formdata.VCCC}"/>
            <input type="hidden" name="NOVER_FABONO" id="NOVER_FABONO" <axis:atr f="axisadm039" c="NOVER_FABONO"/> />
            <c:import url="../include/titulo_nt.jsp">
                    <c:param name="modalidad"><axis:alt f="axisadm039" c="TITLE" lit="9001844" /></c:param>
                    <c:param name="titulo"></c:param>
                    <c:param name="formulario"><axis:alt f="axisadm039" c="TITLE" lit="9001844" /></c:param>
                    <c:param name="form">axisadm039</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm039" c="TIT038" lit="9001847" /></c:param>
                <c:param name="nid" value="axisadm038" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm039" c="TITIMP" lit="1000205" />|true</c:param>
            </c:import>      
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                <c:if test="${__formdata.CTRANSFERIDOS_cerca != 0}">
                                    <tr>
                                        <td class = "campocaja" colspan="5" >
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm039" c="TRANSF_GAR" lit="9001844"/> </div>
                                            
                                            <c:set var="title0"><axis:alt f="axisadm039" c="NREMESA" lit="9902649"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisadm039" c="CCC" lit="9000533"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm039" c="IIMPORTT" lit="9000474"/></c:set>
                                            <div class="displayspaceGrande" id="TRANSF_AGR">
                                            
                                                <display:table name="${__formdata.transferencias_agrup}" id="miListaId" style="width:98%;" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axisadm039.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${(__formdata.VNREMESA==miListaId.NREMESA) && (__formdata.VCCC==miListaId.CCC)}">checked="checked"</c:if> type="radio" id="selected" onclick="javascript:f_canviar_agrup('${miListaId.NREMESA}','${miListaId.CCC}')" name="selected" /></div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" style="width:20%;" sortProperty="NREMESA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.NREMESA}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" style="width:55%;" sortProperty="CCC" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.CCC}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" style="width:20%;" sortProperty="IIMPORT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IIMPORT}"/></div>    
                                                    </display:column>
                                                </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>

                                <tr>
                                    <td class = "campocaja" colspan="5" >
                                        <div class="separador">&nbsp;</div>     
                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm039" c="TRANSF" lit="9902654"/>
                                        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm038()" style="cursor:pointer"/> </div>
                                        
                                        <c:set var="title0">${__formdata.PTLITERA}</c:set>
                                        <c:set var="title1"><axis:alt f="axisadm039" c="NPOLIZA" lit="100836"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisadm039" c="TCONCEPTE" lit="9000715"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisadm039" c="FABONO" lit="9001861"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisadm039" c="CCC" lit="9000533"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisadm039" c="CABONO" lit="9001849"/></c:set>
                                        <c:set var="title6"><axis:alt f="axisadm039" c="IIMPORT" lit="100563"/></c:set>
                                        <c:set var="title7"><axis:alt f="axisadm039" c="OTROS" lit="1000310"/></c:set>  <%-- Altres dades --%>
                                        <c:set var="title8"><axis:alt f="axisadm039" c="BT_EDIT" lit="9902660"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisadm039" c="CMONEDA_T" lit="108645"/></c:set>
                                        <c:set var="title10"><axis:alt f="axisadm039" c="CHIIMPORT" lit="9902656"/></c:set>
                                        <% int contador = 0;%>
                                        <div class="displayspaceGrande" id="TRANSF">
                                        
                                            <display:table name="${__formdata.transferencias}" id="miListaId" style="width:98%;" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisadm039.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:if test="${__formdata.CTRANSFERIDOS_cerca == 0}">
                                                    <display:column style="width:5%;" title=" " headerClass="sortable fixed" media="html" autolink="false" sortable="false">
                                                        <div class="dspIcons">
                                                        <input <c:if test="${miListaId.CMARCADO == 1}">checked</c:if> onclick="f_seleccionar_1x1('${miListaId['SREMESA']}',((this.checked)?1:0) ) ;" type="checkbox" name="checkRemesa_<%=contador%>" id="checkRemesa_<%=contador%>"/></div>
                                                    </display:column>
                                                </c:if>
                                                <display:column title="${title0}" sortable="true" style="width:21%;" sortProperty="TTITULO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                     <div class="dspText">${miListaId['TTITULO']}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" style="width:9%;" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['NPOLIZA']}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="true" style="width:14%;" sortProperty="TCONCEPTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId['TCONCEPTE']}</div>
                                                </display:column>
                                                <display:column title="${title3}" sortable="true" style="width:9%;" sortProperty="FABONO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FABONO}"/></div>
                                                </display:column>
                                                <display:column title="${title4}" sortable="true" style="width:14%;" sortProperty="CCC" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.CCC}</div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="true" style="width:14%;" sortProperty="CABONO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><axis:masc f="axisadm039" c="CABONO" value="${miListaId.CABONO}" /></div>
                                                </display:column>
                                                <display:column title="${title6}" sortable="true" style="width:9%;" sortProperty="IIMPORT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IIMPORT}"/></div>    
                                                </display:column>
                                                
                                                <axis:visible f="axisadm039" c="CMONEDA_T"> 
                                                    <display:column title="${title9}" sortable="true" style="width:5%;" sortProperty="CABONO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.CMONEDA_T}</div>
                                                    </display:column>
                                                </axis:visible>
                                                
                                                <axis:visible f="axisadm039" c="CHIIMPORT"> 
                                                    <display:column title="${title10}" sortable="true" style="width:9%;" sortProperty="IIMPORT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber  pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.CHIIMPORT}"/></div>    
                                                    </display:column>
                                                </axis:visible>
                                                
                                                <axis:visible f="axisadm039" c="OTROS"> 
                                                 <display:column title="${title7}" sortable="false" style="width:5%;" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                        <a href="javascript:void(0)" onmouseout="ocultar('SECCION_B${miListaId['SREMESA']}');" onmouseover="javascript:mostrar('SECCION_B${miListaId['SREMESA']}','TRANSF');mostrarContent('SECCION_B${miListaId['SREMESA']}', '${miListaId['NRECIBO']}', '${miListaId['NSINIES']}', '${miListaId['SIDEPAG']}', '${miListaId['NRENTAS']}', '${miListaId['NREEMB']}', '${miListaId['NFACT']}', '${miListaId['NLINEA']}', '<fmt:formatDate pattern='dd/MM/yyyy' value='${miListaId.FTRANSF}'/>', '${miListaId['NREMESA']}');"> 
                                                            <img border="0" alt="<axis:alt f="axisadm039" c="INFO" lit="100002"/>" title="${title7}" src="images/informacion.gif" width="11px" height="11px" style="cursor:pointer;"/>
                                                        </a>
                                                    </div>
                                                 </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisadm039" c="BT_EDIT"> 
                                                    <display:column title="${title8}" sortable="false" style="width:5%;" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspIcons">
                                                            <img border="0" alt="<axis:alt f="axisadm039" c="INFO" lit="100002"/>" title="${title8}" src="images/lapiz.gif" style="cursor:pointer;" onclick="javascript:mostrar('SECCION_C${miListaId['SREMESA']}','TRANSF')"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                                                <display:column class="seccion_informacion">
                                                                  <div id="SECCION_B${miListaId['SREMESA']}" class="seccion_informacion"></div>
                                                                </display:column>

                                                <axis:visible f="axisadm039" c="CHIIMPORT"> 
                                                <!-- *************************** SECCION CAMBIO MONEDA ********************************* -->
                                                                <display:column class="seccion_informacion">
                                                                    <div id="SECCION_C${miListaId['SREMESA']}" class="seccion_informacion">
                                                                        <!-- INICIO SECCION -->
                                                                        <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                             </tr>
                                                                             <tr>
                                                                                <td class="titulocaja" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisadm039" c="FCAMBIO" lit="9900897"/></b>
                                                                                </td>
                                                                                <td class="titulocaja" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisadm039" c="IIMPORTC" lit="100563"/></b>
                                                                                </td>   
                                                                                <td class="titulocaja" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisadm039" c="CMONEDAT" lit="108645"/></b>
                                                                                </td>  
                                                                                <td class="titulocaja" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisadm039" c="ITASA" lit="9901974"/></b>
                                                                                </td>  
                                                                                <td class="titulocaja" class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                    <b><axis:alt f="axisadm039" c="CHIIMPORT" lit="9902656"/></b>
                                                                                </td>  
                                                                             </tr>
                                                                             <tr>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="FCAMBIO${miListaId['SREMESA']}" name="FCAMBIO${miListaId['SREMESA']}" style="width:70%"
                                                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${miListaId.FCAMBIO}'/>" />
                                                                                    <a id="icon_FCAMBIO${miListaId['SREMESA']}" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm039" c="DATE" lit="108341" />" title="<axis:alt f="axisadm039" c="DATE" lit="108341" />" src="images/calendar.gif"/></a>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="IIMPORT${miListaId['SREMESA']}" name="IIMPORT${miListaId['SREMESA']}" style="width:100%"
                                                                                    value="<fmt:formatNumber  pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IIMPORT}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" style="width:100%"
                                                                                    value="${miListaId['CMONEDA_T']}" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" style="width:100%"
                                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.ITASA}"/>" readonly="readonly"/>
                                                                                </td>
                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" style="width:100%"
                                                                                    value="<fmt:formatNumber  pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.CHIIMPORT}"/>" readonly="readonly"/>
                                                                                </td>
                                                                             </tr>
                                                                             <tr>
                                                                                <td colspan = 5 style="background-color:white;border-right-width: 0px;">
                                                                                    <div class="separador">&nbsp;</div>
                                                                                </td>
                                                                             </tr>
                                                                             <tr>
                                                                                <td colspan = 5 style="background-color:white;border-right-width: 0px;">
                                                                                    <div class="separador">&nbsp;</div>
                                                                                </td>
                                                                             </tr>
                                                                             <tr>
                                                                                <td  style="background-color:white;border-right-width: 0px;" align="right">
                                                                                    <input type="button" id="but_canc" class="boton" value="<axis:alt f="axisadm039" c="BT_CANC" lit="108211"/>" onclick="javascript:ocultar('SECCION_C${miListaId['SREMESA']}');"/>
                                                                                </td>
                                                                                <td style="background-color:white;border-right-width: 0px;"></td>
                                                                                <td style="background-color:white;border-right-width: 0px;"></td>
                                                                                <td style="background-color:white;border-right-width: 0px;"></td>
                                                                                <td style="background-color:white;border-right-width: 0px;" align="left">
                                                                                    <input type="button" id="but_accep" class="boton" value="<axis:alt f="axisadm039" c="BT_ACCEP" lit="100009"/>" onclick="javascript:f_guardar_fcambio('${miListaId['SREMESA']}');"/>
                                                                                </td>
                                                                             </tr>
                                                                             
                                                                            </table>
                                                                            <script type="text/javascript">
                                                                                Calendar.setup({
                                                                                    inputField     :    "FCAMBIO${miListaId['SREMESA']}",     
                                                                                    ifFormat       :    "%d/%m/%Y",      
                                                                                    button         :    "icon_FCAMBIO${miListaId['SREMESA']}", 
                                                                                    singleClick    :    true,
                                                                                    firstDay       :    1
                                                                                });
                                                                            </script>
                                                                    </div>
                                                                </display:column>
                                                <!-- *************************** SECCION CAMBIO MONEDA ********************************* -->
                                                </axis:visible>
                                                
                                                <%contador++;%>
                                            </display:table>
                                        </div>
                                        
                                        </td>
                                     </tr>
                                     <tr>
                                     
                                         <td class = "campocaja" colspan="2" >
                                         <c:if test="${__formdata.CTRANSFERIDOS_cerca == 0}">
                                            <input type="button" onclick="f_seleccionar_todos(1)" class="boton" value="<axis:alt f="axisadm039" c="BOT1" lit="9000756"/>"/>
                                            <input type="button" onclick="f_seleccionar_todos(0)" class="boton" value="<axis:alt f="axisadm039" c="BOT2" lit="9000757"/>"/>
                                         </c:if>
                                         </td>
                                         
                                         <axis:ocultar f="axisadm039" c="FABONO" dejarHueco="false" > 
                                            <td class="campocaja" >
                                            <c:if test="${__formdata.CTRANSFERIDOS_cerca == 0}" >
                                                <jsp:useBean id="today" class="java.util.Date" /> 
                                                <c:set var="FABONO"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:set>
                                                <b id="TFABONO"><axis:alt f="axisadm039" c="TFABONO" lit="9001861"  />  </b>&nbsp;&nbsp;
                                                <input style="width:35%" onchange="" type="text" class="campowidthinput campo campotexto" id="FABONO" name="FABONO" size="15" 
                                                <axis:atr f="axisadm039" c="FABONO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                                value="<c:choose><c:when test='${empty __formdata.FABONO && empty param.NOVER_FABONO}'><fmt:formatDate pattern='dd/MM/yyyy' value='${today}'/></c:when><c:otherwise><fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FABONO}'/></c:otherwise></c:choose>"
                                                title="<axis:alt f="axisadm039" c="TFABONO" lit="9001861"/>" />
                                                <a id="icon_FABONO" style="vertical-align:middle;"><img alt="<axis:alt f="axisadm039" c="DATE" lit="108341"/>" 
                                                title="<axis:alt f="axisadm039" c="TFABONO" lit="9001861" />" src="images/calendar.gif"/></a>
                                            </c:if>
                                            </td>
                                         </axis:ocultar>
                                         
                                         <td  class = "campocaja" align="right" colspan="2" >
                                           <b><axis:alt f="axisadm039" c="TOTALTRANS1" lit="1000529" /></b>&nbsp;&nbsp;
                                           <input type="text" class="campo campotexto" style="width:35%" size="15" value="<fmt:formatNumber  pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.TOTALTRANS}"/>" name="TOTALTRANS1" id="TOTALTRANS1"
                                           title="<axis:alt f="axisadm039" c="TOTALTRANS1" lit="1000529"/>" <axis:atr f="axisadm039" c="TOTALTRANS1" a="modificable=false"/> />
                                         </td>
                                     </tr>
                                      <tr>
                                    
                                        <td class = "campocaja" colspan="5" >
                                        <div class="separador">&nbsp;</div>     
                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm039" c="FLECHA" lit="102803"/></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class = "campocaja" colspan="5">
                                      
                                        <c:set var="title0"><axis:alt f="axisadm039" c="NCUENTA" lit="9000533"/></c:set>
                                        <c:set var="title1"><axis:alt f="axisadm039" c="DESCRIPCION" lit="9000964"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisadm039" c="IIMPORT" lit="100563"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisadm039" c="TFICHERO" lit="1000574"/></c:set>

                                       <% contador = 0;%>
                                        <div class="displayspace">
                                            <display:table name="${__formdata.cuentas}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisadm039.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" style="width:25%;" sortProperty="NCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                     <div class="dspText"><axis:masc f="axisadm039" c="NCUENTA" value="${miListaId['NCUENTA']}" /></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" style="width:25%;" sortProperty="DESCRIPCION" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText">${miListaId['DESCRIPCION']}</div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="true" style="width:15%;" sortProperty="IIMPORT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatNumber  pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IIMPORT}"/></div>    
                                                </display:column>
                                                <display:column title="${title3}" sortable="true" style="width:35%;" sortProperty="TFICHERO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                       <a href="javascript:void(0)" xonclick="f_abrirArchivo('${miListaId['TFICHERO']}')" onclick="f_abrirArchivo(this.id)"  id="${miListaId['TFICHERO']}">  
                                                    ${miListaId['TFICHERO']}
                                                    </a></div>
                                                </display:column>
                                                <%contador++;%>
                                            </display:table>
                                        </div>
                                        
                                        </td>
                                        </tr>
                                         <tr>
                                            <td class = "campocaja" colspan="5">
                                                <table cellpadding="0" class="dsptgtable grid" cellspacing="0" id="miListaId">
                                                <tbody>
                                                <tr>
                                                    <td style="width:25%;">&nbsp;</td>
                                                    <td style="width:25%;">&nbsp;</td>
                                                    <td style="width:15%;">
                                                        <b><axis:alt f="axisadm039" c="TOTALTRANS2" lit="1000529" />   </b>&nbsp;
                                                        <input type="text" class="campo campotexto" style="width:50%" size="15" value="<fmt:formatNumber   pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.TOTALTRANS}'/>" name="TOTALTRANS2" id="TOTALTRANS2"
                                                        title="<axis:alt f="axisadm039" c="TOTALTRANS2" lit="1000529"/>" <axis:atr f="axisadm039" c="TOTALTRANS2" a="modificable=false"/> />
                                                    </td>
                                                    <td style="width:35%;">&nbsp;</td>
                                                </tr>
                                                
                                                </table>
                                            </td>
                                         </tr>
                                         <c:if test="${!empty __formdata.PARAMS}">
                                            <tr>    
                                               <td class = "campocaja" colspan="3">
                                                    <div class="separador">&nbsp;</div>     
                                                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm039" c="FLECHA2" lit="112247"/></div>
                                               </td>
                                            </tr>
                                            <tr>
                                               <td class = "campocaja" colspan="3">
                                                 <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(document.getElementById('PARAMS').value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                   title="<axis:alt f="axisadm039" c="SORTIDA" lit="107913"/>" value="${__formdata.PARAMS}"/> 
                                                 <div class="separador">&nbsp;</div>
                                               </td>
                                            </tr>   
                                        </c:if>
                                   </table>
                                </td>
                            </tr>
                        </table>
                   </td>
                </tr>
            </table>
            
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm039</c:param><c:param name="f">axisadm039</c:param>
            <c:param name="f">axisadm039</c:param>
            <c:param name="__botones">salir<c:if test="${__formdata.CTRANSFERIDOS_cerca == 0}"><axis:visible f="axisadm039" c="BPREVIO">,9906853</axis:visible>,105488</c:if><c:if test="${__formdata.CTRANSFERIDOS_cerca == 1}">,9901004</c:if><c:if test="${__formdata.CTRANSFERIDOS_cerca == 2}">,102803</c:if></c:param>
             
        </c:import>
                
        </form>

        <script type="text/javascript">
            <axis:ocultar f="axisadm039" c="FABONO" dejarHueco="false">
            Calendar.setup({
                inputField     :    "FABONO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FABONO", 
                singleClick    :    true,
                firstDay       :    1
            });
            </axis:ocultar>
        </script>
    
        <c:import url="../include/mensajes.jsp"/>
    
    </body>

</html>
