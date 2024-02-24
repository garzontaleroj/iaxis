<%--
      NOMBRE:    axisadm077.jsp
      @author <a href = "mailto:autor@csi-ti.com">Autor creación</a>
      Fecha: DD/MM/YYYY
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla de Busqueda de pólizas
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        DD/MM/YYYY   XXX(iniciales)     1. Creación de la pantalla. Bug.9296
      2.0        DD/MM/YYYY   XXX(iniciales)     2. Ejemplo : Añadir funcionalidad Ramo - Producto . Bug.: XXXX
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                  var kk = '${sessionScope.axisctr_agente.CODI}'; 
                  if (objUtiles.estaVacio(kk)){
                    objDom.setValorPorId("BLOQAGENTE", 0);
                  }else{
                    objDom.setValorPorId("BLOQAGENTE", 1);
                  }
                f_cargar_propiedades_pantalla();
            }
            

           function f_but_buscar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("modal_axisadm077.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
           }
           
           function f_but_aceptar(SRELACION) {
           
          
            if (objUtiles.estaVacio(SRELACION) &&!objUtiles.estaVacio(document.miForm.checked_rel)) {
                // Checkeada por el radio button
                SRELACION = objUtiles.f_GuardaCasillasChecked("checked_rel");
            } 
            
            if (typeof SRELACION == 'boolean' || objUtiles.estaVacio (SRELACION)) 
                alert(objJsMessages.jslit_selecciona_registro);
            else
                parent.f_aceptar_axisadm077(SRELACION,document.miForm.CAGENTE.value);
           
               // parent.f_aceptar_modal('axisadm077',objDom.getValorPorId("CRAMO"));
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisadm077');
           }
        
             function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
            }
            
          
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            
          
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
              function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
              
                
            }
            
                 
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
                if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE_TEXT"))) {
                    var mensajesAlert = "<axis:alt f='axisctr001' c='MENSAAGE' lit='9903266'/>";
                    alert(mensajesAlert);
                }
                
                
                }
                
                
             
            }
            function f_actualizar_agente(){
                 //alert("En actualizar agente");
                 if(document.miForm.CAGENTE_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) , this, objJsMessages.jslit_cargando);
                }else{
                        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT_AUX), this, objJsMessages.jslit_cargando);
                
                }
                
            }

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
   <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        <input type="hidden" name="CAGENTE_TEXT_AUX" id="CAGENTE_TEXT_AUX" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" />
        
        <input type="hidden" name="BLOQAGENTE" id="BLOQAGENTE" value="${__formdata.BLOQAGENTE}"/>
        <input type="hidden" name="MODCONSULTA" id="MODCONSULTA" value="${__formdata.MODCONSULTA}"/>
       
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisadm077" lit="9904036"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisadm077" lit="9904036"/></c:param>
                <c:param name="form">axisadm077</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                
                            </tr>
                             <tr>
                                          <axis:visible f="axisadm077" c="CAGENTE"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm077" c="CAGENTE" lit="100584" /></b>
                                            </td>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisadm077" c="TAGENTE" lit="105940" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                          <axis:visible f="axisadm077" c="SRELACION"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm077" c="SRELACION" lit="9001604" /></b>
                                            </td>
                                        </axis:visible>
                                         <axis:visible f="axisadm077" c="FINI"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm077" c="FINI" lit="100890" /></b>
                                            </td>
                                        </axis:visible>
                                         <axis:visible f="axisadm077" c="FFIN"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm077" c="FFIN" lit="9001159" /></b>
                                            </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm077" c="CAGENTE"> 
                                                <td class="campocaja">
                                                    <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axisadm077" c="CAGENTE" lit="100584" />" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                    <axis:atr f="axisadm077" c="CAGENTE_TEXT" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"  height="13px" width="13px" name="CAGENTE_BUT" id="CAGENTE_BUT" />
                                                </td>
                                                 <td class="campocaja" colspan="2" >    
                                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                                </td>
                                          </axis:visible>
                                        
                                       
                                            <axis:visible f="axisadm077" c="SRELACION"> 
                                                <td class="campocaja">
                                                    <input formato="entero" type="text" name="SRELACION"  class="campowidthinput campo campotexto" value="${__formdata.SRELACION}"
                                                    <axis:atr f="axisadm077" c="SRELACION" a="modificable=true"/>  />
                                                </td>
                                                  </axis:visible>
                                                      <axis:visible f="axisadm077" c="FINI"> 
                                              
                                                         <td class="campocaja">                             
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:70%;"
                                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINI}"/>" name="FINI" id="FINI"
                                                                title="<axis:alt f="axisadm077" c="FINI" lit="100890"/>"
                                                                <axis:atr f="axisadm001" c="FINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                                                id="icon_FINI" alt="<axis:alt f="axisadm077" c="FINI" lit="100890"/>" title="<axis:alt f="axisadm077" c="FINI" lit="100890"/>" src="images/calendar.gif"/></a>
                                                            </td>
                                                </axis:visible>
                                                      <axis:visible f="axisadm077" c="FFIN"> 
                                                         <td class="campocaja" >    
                                                                                     
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:70%;"
                                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" name="FFIN" id="FFIN"
                                                                title="<axis:alt f="axisadm077" c="FFIN" lit="9001159"/>"
                                                                <axis:atr f="axisadm001" c="FFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                                                id="icon_FFIN" alt="<axis:alt f="axisadm077" c="FFIN" lit="9001159"/>" title="<axis:alt f="axisadm077" c="FFIN" lit="9001159"/>" src="images/calendar.gif"/></a>
                                                            </td>
                                                        </td>
                                                      </axis:visible>
                                        </tr>
                                        
                          </table>
                       
                       <axis:visible f="axisadm077" c="DSP_RESULTAT">
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt c="RECIBOS" f="axisadm077" lit="102118"/></c:set>
                            <c:set var="title3"><axis:alt c="FINIEFE" f="axisadm077" lit="100562"/></c:set>
                            <c:set var="title2"><axis:alt c="TTIPO" f="axisadm077" lit="100565"/></c:set>
                            <c:set var="title6"><axis:alt c="SRELACION" f="axisadm077" lit="9001604"/></c:set>
                            <c:set var="title7"><axis:alt c="LIQUIDO" f="axisadm077" lit="110332"/></c:set>
                            <c:set var="title8"><axis:alt c="IIMPORTE" f="axisadm077" lit="100563"/></c:set>
                            
                            <div class="seccion displayspaceGrande">
                           
                                <display:table name="${__formdata.resultado}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  requestURI="modal_axisadm077.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                     <axis:visible f="axisadm077" c="CHECK">
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['checked_rel']}">checked</c:if> type="radio" id="checked_rel" name="checked_rel" value="${miListaId['SRELACION']}"/></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm077" c="SRELACION">
                                    <display:column title="${title6}" sortable="true" sortProperty="SPRODUC" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')">${miListaId['SRELACION']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisadm077" c="FINIEFE">
                                    <display:column title="${title3}" sortable="true" sortProperty="FINIEFE" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FINIEFE']}"/></a></div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisadm077" c="TTIPO">
                                    <display:column title="${title2}" sortable="true" sortProperty="TTIPO" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')">${miListaId['TTIPO']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisadm077" c="RECIBOS">
                                    <display:column title="${title1}" sortable="true" sortProperty="RECIBOS" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')">${miListaId['RECIBOS']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisadm077" c="LIQUIDO">
                                    <display:column title="${title7}" sortable="true" sortProperty="LIQUIDO" headerClass="sortable fixed" media="html" autolink="false" >
//                                        <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')"><fmt:formatNumber pattern="###,##0.00" value="${miListaId['LIQUIDO']}"/></a></div>
                                        <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['LIQUIDO']}"/></a></div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisadm077" c="ITOTALR">
                                    <display:column title="${title8}" sortable="true" sortProperty="ITOTALR" headerClass="sortable fixed" media="html" autolink="false" >
//                                        <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')"><fmt:formatNumber pattern="###,##0.00" value="${miListaId['ITOTALR']}"/></a></div>
                                        <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['SRELACION']}')"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['ITOTALR']}"/></a></div>
                                    </display:column>
                                    </axis:visible>
                                     
                                    
                                </display:table>
                            </div>
                         </axis:visible>
                    </td>
                </tr>
            </table>
    
     </form>
    
     <script type="text/javascript">
      
        
         Calendar.setup({
            inputField     :    "FINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FINI",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FFIN",  
            singleClick    :    true,
            firstDay       :    1
        });        
    </script>

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisadm077</c:param>
            <c:param name="__botones"><axis:ocultar f="axisadm077" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisadm077" c = "BT_BUSCAR" dejarHueco="false">,buscar</axis:ocultar><axis:ocultar f="axisadm077" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>