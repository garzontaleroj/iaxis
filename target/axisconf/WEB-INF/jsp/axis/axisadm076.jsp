<%--
      NOMBRE:    axisadm077.jsp
      @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
      Fecha: 30/07/2012
      PROPÓSITO (descripción Service): 
      Ejemplo : Búsqueda de relaciones
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        30/07/2012   XPL                1. 22494: MDP_A001- Modulo de relacion de recibos
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
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                  var kk = ${fn:length(resultado)}; 
                  if (kk == 0){
                    objDom.setValorPorId("BLOQRELACIONES", 0);
                  }else{
                    objDom.setValorPorId("BLOQRELACIONES", 1);
                  }
                  f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                  
                  var consulta =  document.miForm.MODCONSULTA.value;
                  if (!objUtiles.estaVacio(consulta)&& kk == 0){
                    f_abrir_modal("axisadm077");
                  }
 	        }
 	    
            
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
                objUtiles.ejecutarFormulario("axis_axisadm076.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm076", "cancelar", document.miForm, "_self");
            }
            function f_but_guardar() {
                var tmp = document.miForm.BLOQRELACIONES.value;
                if (tmp == 1)
                    objUtiles.ejecutarFormulario("axis_axisadm076.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                else
                    alert("<axis:alt f='axisadm076' c='ALERT_GUARDAR' lit='180261' />");
            }
            
             function f_but_marcar_desmarcar(NRECIBO,thiss) {
             var check_nrecibo = thiss.checked ? 1:0;
              objUtiles.ejecutarFormulario("axis_axisadm076.do?NRECIBOsel="+NRECIBO+"&MARCAR_DESMARCAR="+check_nrecibo, "marcar_desmarcar", document.miForm, "_self", objJsMessages.jslit_cargando);
               
            }
            
            function f_but_marcar_todos() {
             
              objUtiles.ejecutarFormulario("axis_axisadm076.do?TODOS="+1, "marcar_desmarcar", document.miForm, "_self", objJsMessages.jslit_cargando);
               
            }
            function f_but_desmarcar_todos() {
             
              objUtiles.ejecutarFormulario("axis_axisadm076.do?TODOS="+0, "marcar_desmarcar", document.miForm, "_self", objJsMessages.jslit_cargando);
               
            }
            
            function f_but_limpiar() {
                    objUtiles.ejecutarFormulario("axis_axisadm076.do", "limpiar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
             function f_but_anadir() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    if (document.miForm.BUSCAR.value != 1){
                        objDom.setValorPorId("SRELACION_OUT", "");
                    }else{
                        objDom.setValorPorId("BUSCAR", "");
                    }
                    objUtiles.ejecutarFormulario("axis_axisadm076.do", "anadir", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_abrir_axisadm077() {
                if (objValidador.validaEntrada()){
                    f_abrir_modal("axisadm077");
                }
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
            
              function f_aceptar_modal_recerca_rebut(NRECIBO){
                f_cerrar_modal('axisadm001');
                document.miForm.NRECIBO.value = NRECIBO;
            }
            
            
            function f_aceptar_axisadm077(SRELACION,CAGENTE){
                 f_cerrar_modal('axisadm077');
                 document.miForm.SRELACION.value = SRELACION;
                 document.miForm.SRELACION_OUT.value = SRELACION;
                 document.miForm.BUSCAR.value = 1;
                 var tmp = document.miForm.MODCONSULTA.value;
                 if(!objUtiles.estaVacio(tmp)){
                     document.miForm.CAGENTE.value = CAGENTE;
                     document.miForm.CAGENTE_TEXT.value = CAGENTE;
                     objDom.setValorPorId("CTIPO", "1");//document.miForm.CTIPO.value = '1';
                     f_but_anadir();
                 }
                 
            }
            
            function f_but_imprimir(){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso&SPROCES=" + document.miForm.SRELACION_OUT.value + "&CTIPO=RECIBOSREL", 0, 0);
            }
            
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
            }
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
           
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisadm077|<axis:alt f="axisadm076" c="TIT_AXISADM077" lit="9904036" /></c:param>
    </c:import>
    
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisadm076" c="TIT_AXISADM077" lit="9903614" /></c:param>
    </c:import>
   
   <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm076" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        <input type="hidden" name="SRELACION_OUT" id="SRELACION_OUT" value="${__formdata.SRELACION_OUT}"/>
        <input type="hidden" name="BUSCAR" id="BUSCAR" value="${__formdata.BUSCAR}"/>
        
        <input type="hidden" name="BLOQRELACIONES" id="BLOQRELACIONES" value="${__formdata.BLOQRELACIONES}"/>
        <input type="hidden" name="MODCONSULTA" id="MODCONSULTA" value="${__formdata.MODCONSULTA}"/>
        
        <input type="hidden" name="CAGENTE_TEXT_AUX" id="CAGENTE_TEXT_AUX" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" />
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisadm076" lit="9904035"/></c:param>
                <c:param name="producto"><axis:alt f="axisadm076" c="LIT_FORM" lit="9904035"/></c:param>
                <c:param name="form">axisadm076</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm076" c="cam_impressio_doc" lit="1000205" />|true</c:param>
            </c:import>   
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <axis:visible c="SEC_MANT1" f="axisadm076">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO1" f="axisadm076" lit="9904035"/>
                        <axis:visible f="axisadm076" c="BT_FIND"> 
                            <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm076" c="LIT_ABRIR_MODAL" lit="100797" />" onclick="f_abrir_axisadm077();" style="cursor:pointer"/>
                        </axis:visible>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <tr>
                                          <axis:visible f="axisadm076" c="CAGENTE"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm076" c="CAGENTE" lit="100584" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm076" c="TAGENTE" lit="105940" /></b>
                                            </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm076" c="CAGENTE"> 
                                                <td class="campocaja">
                                                    <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axisadm076" c="CAGENTE" lit="100584" />" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                    <axis:atr f="axisadm076" c="CAGENTE_TEXT" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                                    <axis:visible f="axisadm076" c="CAGENTE_BUT">
                                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer" height="13px" width="13px" name="CAGENTE_BUT" id="CAGENTE_BUT" />
                                                    </axis:visible>
                                                </td>
                                                 <td class="campocaja" colspan="3">    
                                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                                </td>
                                          </axis:visible>
                                        </tr>
                                       
                                        <tr>
                                        <axis:ocultar f="axisadm076" c="RECPEND" dejarHueco="false"> 
                                            <td class="titulocaja" colspan="4">
                                              <table>
                                                <tr>
                                                    <th style="width:45%;height:0px"></th>
                                                    <th style="width:5%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="radio" id="CTIPO"
                                                               name="CTIPO" value="0"
                                                               <c:if test="${__formdata['CTIPO'] == '0' || empty __formdata['CTIPO']}">checked</c:if>/>
                                                        <b><axis:alt f="axisadm076" c="RECPEND" lit="9904037"/>?</b>
                                                    </td>
                                                </tr>
                                              </table>
                                            </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axisadm076" c="RELACION" dejarHueco="false"> 
                                            <td class="titulocaja" colspan="4">
                                                <table>
                                                <tr>
                                                     <tr>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:30%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                </tr>
                                                    <tr>
                                                        <td>
                                                        <input type="radio" id="CTIPO"
                                                               name="CTIPO" value="1"
                                                               <c:if test="${__formdata['CTIPO'] == '1'}">checked</c:if>/>
                                                        <b><axis:alt f="axisadm076" c="RELACION" lit="9001604"/></b>
                                                        </td>
                                                    
                                                        <td>
                                                              <input formato="entero" type="text" name="SRELACION" id="SRELACION" title="<axis:alt f="axisadm076" c="SRELACION" lit="9001604" />" style="width:80%" value="${__formdata.SRELACION}" class="campowidthinput campo campotexto"/>
                                                              <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm077()" style="cursor:pointer"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            </axis:ocultar>
                                            <td>
                                            </td>
                                              <td class="titulocaja" colspan="2">
                                                 <axis:visible f="axisadm076" c="BT_LIMPIAR">
                                                    <input type="button" onclick="f_but_limpiar()" class="boton" style="margin-right:20px;" value="<axis:alt f="axisadm076" c="BT_LIMPIAR" lit="9904040"/>"/>
                                                 </axis:visible>
                                                 <axis:visible f="axisadm076" c="BT_ANADIR">
                                                    <input type="button" onclick="f_but_anadir()" class="boton" style="margin-right:20px;" value="<axis:alt f="axisadm076" c="BT_ANADIR" lit="104825"/>"/>
                                                 </axis:visible>
                                              </td>
                                          </tr>
                                          
                                           <tr>
                                        <axis:ocultar f="axisadm076" c="RECIBO" dejarHueco="false"> 
                                            <td class="titulocaja" colspan="4">
                                                 <table>
                                                  <tr>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:30%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                </tr>
                                                    <tr>
                                                        <td> 
                                                            <input type="radio" id="CTIPO"
                                                                   name="CTIPO" value="2"
                                                                   <c:if test="${__formdata['CTIPO'] == '2'}">checked</c:if>/>
                                                            <b><axis:alt f="axisadm076" c="RECIBO" lit="100895"/></b>
                                                        </td>
                                                  
                                                        <td>                                                     
                                                             <input formato="entero" type="text" name="NRECIBO" id="NRECIBO" style="width:80%"  title="<axis:alt f="axisadm076" c="NRECIBO" lit="100895" />" value="${__formdata.NRECIBO}" class="campowidthinput campo campotexto"/>
                                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_modal('axisadm001')" style="cursor:pointer"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            </axis:ocultar>
                                          </tr>
                                          
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>
                     
                        <axis:visible c="SEC_MANT3" f="axisadm076">
                        <!-- Seccion 3 : Lista -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/>
                         <b><axis:alt c="LIT_TITULO3" f="axisadm076" lit="111046"/></b>
                        </div>
                        <table class="seccion" align="center">
                            <tr>
                                    <td>
                                            <table class="area" align="center">
                                                <tr>
                                                    <td>
                                                    <c:set var="title1"><axis:alt c="NRECIBO" f="axisadm076" lit="100895"/></c:set>
                                                    <c:set var="title3"><axis:alt c="FEFECTO" f="axisadm076" lit="111625"/></c:set>
                                                    <c:set var="title2"><axis:alt c="TOMADOR" f="axisadm076" lit="101027"/></c:set>
                                                    <c:set var="title4"><axis:alt c="NPOLIZA" f="axisadm076" lit="9001875"/></c:set>
                                                    <c:set var="title5"><axis:alt c="RIESGO" f="axisadm076" lit="100649"/></c:set>
                                                    <c:set var="title6"><axis:alt c="SRELACION" f="axisadm076" lit="9001604"/></c:set>
                                                    <c:set var="title7"><axis:alt c="LIQUIDO" f="axisadm076" lit="110332"/></c:set>
                                                    <c:set var="title8"><axis:alt c="IIMPORTE" f="axisadm076" lit="100563"/></c:set>
                                                    <div class="separador">&nbsp;</div>
                                                    <div class="displayspaceMaximo">
                                                     <c:set var="totalliq" value="0"/>
                                                     <c:set var="totalimp" value="0"/>
                                                     
                                                      <display:table name="${resultado}" id="miListaId" export="false" class="dsptgtable" style="width:98%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                       requestURI="axis_axisadm076.do?operation=general&paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        
                                                         <display:column title="" sortable="true" sortProperty="CHECK" headerClass="sortable fixed"  media="html" autolink="false" >    
                                                            <axis:visible c="SEL_REC" f="axisadm076">
                                                                <div class="dspNumber">
                                                                      <input  type="checkbox" onclick="f_but_marcar_desmarcar('${miListaId.OB_IAX_RELACIONES.NRECIBO}',this)" id="COBLIGA" name="COBLIGA" <c:if test="${miListaId.OB_IAX_RELACIONES.COBLIGA == 1}">checked</c:if>                                        
                                                                        value=""/>
                                                                </div>
                                                            </axis:visible>
                                                        </display:column>
                                                           <axis:visible c="NRECIBO" f="axisadm076">
                                                        <display:column title="${title1}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.OB_IAX_RELACIONES.NRECIBO}</div>
                                                        </display:column>
                                                          </axis:visible>
                                                           <axis:visible c="FEFECTO" f="axisadm076">
                                                        <display:column title="${title3}" sortable="true" sortProperty="FEFECTO" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_RELACIONES.FEFECTO}"/></div>
                                                        </display:column>
                                                          </axis:visible>
                                                           <axis:visible c="NPOLIZA" f="axisadm076">
                                                        <display:column title="${title4}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.OB_IAX_RELACIONES.NPOLIZA}</div>
                                                        </display:column>
                                                          </axis:visible>
                                                          
                                                           <axis:visible c="TOMADOR" f="axisadm076">
                                                            <display:column title="${title2}" sortable="true" sortProperty="TOMADOR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                <div class="dspText">${miListaId.OB_IAX_RELACIONES.TOMADOR}</div>
                                                            </display:column>
                                                              </axis:visible>
                                                                <axis:visible c="RIESGO" f="axisadm076">
                                                                    <display:column title="${title5}" sortable="true" sortProperty="RIESGO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId.OB_IAX_RELACIONES.RIESGO}</div>
                                                                    </display:column>
                                                              </axis:visible>
                                                                  <axis:visible c="SRELACION" f="axisadm076">
                                                                    <display:column title="${title6}" sortable="true" sortProperty="SRELACION" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId.OB_IAX_RELACIONES.SRELACION}</div>
                                                                    </display:column>
                                                              </axis:visible>
                                                                  <axis:visible c="LIQUIDO" f="axisadm076">
                                                                    <display:column title="${title7}" sortable="true" sortProperty="LIQUIDO" headerClass="sortable fixed" media="html" autolink="false" >
//                                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_RELACIONES.LIQUIDO}"/></div>
                                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_RELACIONES.LIQUIDO}"/></div>
                                                                    </display:column>
                                                              </axis:visible>
                                                                  <axis:visible c="IMPORTE" f="axisadm076">
                                                                    <display:column title="${title8}" sortable="true" sortProperty="IMPORTE" headerClass="sortable fixed" media="html" autolink="false" >
//                                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_RELACIONES.IMPORTE}"/></div>
                                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_RELACIONES.IMPORTE}"/></div>
                                                                    </display:column>
                                                              </axis:visible>
                                                              <c:if test="${!empty resultado}">
                                                                <c:if test="${miListaId.OB_IAX_RELACIONES.COBLIGA == 1 || (!empty __formdata.MODCONSULTA && __formdata.MODCONSULTA==0)}">
                                                                  <c:set var="totalliq">${totalliq + miListaId.OB_IAX_RELACIONES.LIQUIDO}</c:set>
                                                                  <c:set var="totalimp">${totalimp + miListaId.OB_IAX_RELACIONES.IMPORTE}</c:set>
                                                                </c:if>
                                                                <display:footer>
                                                                    <tr><td colspan="6"> </td>
                                                                      <td class="sortable">
                                                                      <div class="dspText"><b><axis:alt c="TOTAL" f="axisadm076" lit="101093"/></b></div>
                                                                      </td>
                                                                      <td class="sortable">
                                                                     
                                                                      <div class="dspNumber">
//                                                                         <b> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${totalliq}"/> </b></div>
                                                                         <b> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${totalliq}"/> </b></div>                                                                         
                                                                      </td>
                                                                      <td class="sortable">
                                                                     
                                                                      <div class="dspNumber">
//                                                                         <b> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${totalimp}"/> </b></div>
                                                                         <b> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${totalimp}"/> </b></div>
                                                                      </td>
                                                                    <tr>
                                                                </display:footer>
                                                            </c:if>
                                                    </display:table>
                                                    </div>
                                                    <div class="separador">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                </td>
                                              <td class="titulocaja" colspan="2">
                                                 <axis:visible f="axisadm076" c="BT_MARCAR">
                                                    <input type="button" onclick="f_but_marcar_todos()" class="boton" style="margin-right:20px;" value="<axis:alt f="axisadm076" c="BT_MARCAR" lit="9000756"/>"/>
                                                 </axis:visible>
                                                 <axis:visible f="axisadm076" c="BT_DESMARCAR">
                                                    <input type="button" onclick="f_but_desmarcar_todos()" class="boton" style="margin-right:20px;" value="<axis:alt f="axisadm076" c="BT_DESMARCAR" lit="9000757"/>"/>
                                                 </axis:visible>
                                              </td>
                                              </tr>
                                        </table>
                                    </td>
                                </tr>
                        </table> 
                        </axis:visible>
                    </td> 
                </tr>
            </table>
        
             <div class="separador">&nbsp;</div>
    </form>
   

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisadm076</c:param>
   <c:param name="__botones"><axis:ocultar f="axisadm076" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisadm076" c = "BT_GUARDAR" dejarHueco="false">,guardar</axis:ocultar><axis:ocultar f="axisadm076" c = "BT_IMPRIMIR" dejarHueco="false"><c:if test="${!empty __formdata.SRELACION_OUT}">,imprimir</c:if></axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>