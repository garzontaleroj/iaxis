<%/*
*  Fichero: axisfis004.jsp
*  @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a> 
*
*  Fecha: 30/05/2012
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisfis004();
       }       
    
       function f_onload(){
            f_cargar_propiedades_pantalla(); 
            var newfact = document.getElementById('NEWNFACT').value;
            var sfact = document.getElementById('SFACT').value;
            var cagente = document.getElementById('CAGENTE').value;
            if (newfact!=''){
                parent.f_buscar(newfact,sfact,cagente);
            }
       }           
       
       function f_but_aceptar()
       {
          if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario("modal_axisfis004.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
       }
 /* ************************************************************************************************* */
         /* ******************************************* GEDOX *********************************************** */
         /* ************************************************************************************************* */
      
    function f_cerrar_axisgedox() {
        objUtiles.cerrarModal("axisgedox");
    }
    
    function f_anadir_documentacion() { // Añadir documentación
       var params = "&ORIGEN=GENERICO";
       
       f_abrir_modal("axisfileupload", true, params);
    }
    
    function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);                            
        }
        
        function f_aceptar_axisfileupload(IDDOCGEDOX){
             objDom.setValorPorId("IDDOCGEDOX", IDDOCGEDOX); 
             f_cerrar_modal("axisfileupload");
        }
       /***************************************** AJAX ******************************************/
       
            function f_actualizar_agente(){
                 //if (objValidador.validaEntrada()) {
                    var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                    objDom.setValorPorId("CAGENTE",CAGENTE);
                    objDom.setValorPorId("NOMBRE_TEXT", ""); 
                    objAjax.invokeAsyncCGI("modal_axisfis004.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
                 //}
                
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
               
                        var elementos = doc.getElementsByTagName("NLIQMEN");
                        
                        var NLIQMENCombo = document.miForm.NLIQMEN;     
                        objDom.borrarOpcionesDeCombo(NLIQMENCombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisfis004" c="MIN_VALUE" lit="108341"/> - ', NLIQMENCombo, 0);
                        
                       for (i = 0; i < elementos.length; i++) {
                            var NLIQMEN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NLIQMEN"), i, 0);
                            var TITULO = NLIQMEN + ' - ' + objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FLIQUID"), i, 0));                                     
                            objDom.addOpcionACombo(NLIQMEN, TITULO, NLIQMENCombo, i+1);
                       }
                        
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.borrarOpcionesDeCombo(document.miForm.NLIQMEN);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axiscomi010" c="MIN_VALUE" lit="108341"/> - ', document.miForm.NLIQMEN, 0);
                    }
                }
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
           /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGE_5_CTIPMED_5");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisfis004.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
                        

             function f_seleccionar_indice(posicion)           
            {    
                objDom.setValorPorId ("INDICE",posicion);
            }
        
            function f_formatdate(entrada,title){
                var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt c="aler" f="axisadm059" lit="1000421"/>");
                    }
                }
            }
            
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="INDICE" value="${__formdata.INDICE}" id="INDICE">
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">
            <input type="hidden" name="NEWNFACT" value="${__formdata.NEWNFACT}" id="NEWNFACT">
            <input type="hidden" name="SFACT" value="${__formdata.SFACT}" id="SFACT">
            <input type="hidden" name="CONDICION" value="CTIPAGE_5_CTIPMED_5" id="CONDICION">
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form"  f="axisfis004" lit="9903742" /></c:param>
                <c:param name="producto"><axis:alt  c="producto" f="axisfis004" lit="9903742" /></c:param>
                <c:param name="form">axisfis004</c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo14" f="axisfis004" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisfis003" c="TIT_AXISFILEUPLOAD" lit="1000614"/></c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisfis004" c="CEMPRES"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="2" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisfis004" c="CEMPRES" lit="101619"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisfis004" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt c="CAGENTE" f="axisfis004" lit="9901930" /></b>                                   
                                    </td>
                                </axis:ocultar> 
                             </tr>
                             <tr>
                               <axis:ocultar f="axisfis004" c="CEMPRES"  dejarHueco="false"> 
                                   <c:choose>  
                                                <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                                  <td class="campocaja" colspan="2">
                                                        <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                        title="<axis:alt c="CEMPRES" f="axisfis004" lit="101619"/>" onchange="f_recarga_combos('E')"
                                                        <axis:atr f="axisfis004" c="CEMPRES" a="isInputText=false&obligatorio=true"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="SELECC" f="axisfis004" lit="108341"/> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                    <c:otherwise> 
                                                 <td class="campocaja" colspan="2" >
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="TEMPRES" name="TEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                 title="<axis:alt c="CEMPRES" f="axisfis004" lit="101619"/>"
                                                 <axis:atr f="axisfis004" c="TEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                 </axis:ocultar>                                 
                                <%-- AGENTE --%>
                                <axis:ocultar f="axisfis004" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="campocaja" colspan="3">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                         title="<axis:alt  c="CAGENTE" f="axisfis004" lit="100584"/>" 
                                        <axis:atr f="axisfis004" c="CAGENTE" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                    </td>                                    
                                </axis:ocultar>                                
                             </tr>
                             <%-- SECCION 2 --%>
                             <tr> 
                                    <axis:ocultar f="axisfis004" c="NFACT" dejarHueco="false"> 
                                        <td class="titulocaja" colspan="1"><!-- CCOBBAN -->
                                             <b><axis:alt f="axisfis004" c="NFACT" lit="9903744"></axis:alt></b>                                                                          
                                        </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axisfis004" c="FFACT"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- FFACT -->
                                             <b><axis:alt f="axisfis004" c="FFACT" lit="9000956"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                    <axis:ocultar f="axisfis004" c="CTIPIVA"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- CTIPIVA -->
                                             <b><axis:alt f="axisfis004" c="CTIPIVA" lit="101340"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                     <axis:ocultar f="axisfis004" c="NLIQMEN"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- NLIQMEN -->
                                             <b><axis:alt f="axisfis004" c="NLIQMEN" lit="9904002"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                    <axis:ocultar f="axisfis004" c="CTIPDOC"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- 150996 Tipo documento -->
                                             <b><axis:alt f="axisfis004" c="CTIPDOC" lit="150996"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar> 
                                  
                               </tr>
                               <tr>
                                  
                                  <axis:ocultar f="axisfis004" c="NFACT" dejarHueco="false"> 
                                    <td class="campocaja" colspan="1"> 
                                        <input type="text" class="campo campotexto" id="NFACT" name="NFACT" size="40" maxlength="40"    title="<axis:alt f="axisfis004" c="NFACT" lit="9903744"/>"                                                       
                                               value = "${__formdata.NFACT}" <axis:atr f="axisfis004" c="NFACT" a="obligatorio=true&modificable=true"/>/>  
                                    </td>                             
                                </axis:ocultar> 
                                <axis:ocultar f="axisfis004" c="FFACT"  dejarHueco="false"> 
                                    <td class="campocaja">                             
                                        <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFACT}"/>" name="FFACT" id="FFACT"
                                        title="<axis:alt f="axisfis004" c="FFACT" lit="9000956"/>"
                                        onblur="javascript:f_formatdate(this,'')"
                                        <axis:atr f="axisfis004" c="FFACT" a="formato=fecha&obligatorio=true"/> /><a style="vertical-align:middle;"><img
                                        id="icon_FFACT" alt="<axis:alt f="axisadm001" c="FFACT" lit="108341"/>" title="<axis:alt f="axisfis004" c="FFACT" lit="1000554"/>" src="images/calendar.gif"/></a>
                                    </td> 
                                  </axis:ocultar>  
                                    <axis:ocultar f="axisfis004" c="CTIPIVA"  dejarHueco="false"> 
                                        <td class="campocaja"  ><!-- CTIPIVA -->
                                            <select title="<axis:alt c="CTIPIVA" f="axisfis004" lit='101340' />" alt="<axis:alt c="CTIPIVA" f="axisfis004" lit='101340' />" name = "CTIPIVA" id="CTIPIVA" size="1" 
                                                class="campowidthselect campo campotexto" style="width:200px;"
                                                <axis:atr f="axisfis004" c="CTIPIVA" a="modificable=true&obligatorio=true"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfis004" c="MINVAL" lit="1000348"/> - </option>
                                                <c:forEach var="estadofact" items="${__formdata.LISTVALORES.LSTTIPOIVA}">
                                                    <option value = "${estadofact.CTIPIVA}"
                                                        <c:choose>
                                                            <c:when test="${__formdata.list_CTIPIVA == estadofact.CTIPIVA}">selected</c:when>
                                                        </c:choose>>
                                                        ${estadofact.TTIPIVA}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axisfis004" c="NLIQMEN"  dejarHueco="false"> 
                                         <td class="campocaja"  ><!-- NLIQMEN 9904002 Nº Liquidación -->
                                            <select title="<axis:alt c="NLIQMEN" f="axisfis004" lit='9904002' />" alt="<axis:alt c="NLIQMEN" f="axisfis004" lit='9904002' />" name = "NLIQMEN" id="NLIQMEN" size="1" 
                                                class="campowidthselect campo campotexto" style="width:200px;"
                                                <axis:atr f="axisfis004" c="NLIQMEN" a="modificable=true"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfis004" c="MINVAL" lit="1000348"/> - </option>
                                                <c:forEach var="LSTNLIQMEN" items="${sessionScope.axisctr_nliqs}">
                                                    <option value = "${LSTNLIQMEN.NLIQMEN}"
                                                        <c:choose>
                                                            <c:when test="${__formdata.NLIQMEN == LSTNLIQMEN.NLIQMEN}">selected</c:when>
                                                        </c:choose>>
                                                        ${LSTNLIQMEN.NLIQMEN} - <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTNLIQMEN.FLIQUID}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar> 
                                    
                                    
                                    <axis:ocultar f="axisfis004" c="CTIPDOC"  dejarHueco="false"> 
                                         <td class="campocaja"  ><!-- CTIPDOC  9902391 Tipo documentación-->
                                            <select title="<axis:alt c="CTIPDOC" f="axisfis004" lit='150996' />" alt="<axis:alt c="CTIPDOC" f="axisfis004" lit='150996' />" name = "CTIPDOC" id="CTIPDOC" size="1" 
                                                class="campowidthselect campo campotexto" style="width:200px;"
                                                <axis:atr f="axisfis004" c="CTIPDOC" a="modificable=true&obligatorio=true"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfis004" c="MINVAL" lit="1000348"/> - </option>
                                                <c:forEach var="tipodoc" items="${__formdata.LISTVALORES.LSTCTIPDOC}">
                                                    <option value = "${tipodoc.CATRIBU}"
                                                        <c:choose>
                                                            <c:when test="${__formdata.CTIPDOC == tipodoc.CATRIBU}">selected</c:when>
                                                        </c:choose>>
                                                        ${tipodoc.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar> 
                                   
                                   
                               </tr> 
                                <tr> 
                                     <axis:ocultar f="axisfis004" c="IDDOCGEDOX"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- 1000431  -->
                                             <b><axis:alt f="axisfis004" c="IDDOCGEDOX" lit="1000431"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                   
                                </tr>
                                <tr>
                                 <axis:ocultar f="axisfis004" c="IDDOCGEDOX" dejarHueco="false"> 
                                    <td class="campocaja" style="white-space:nowrap;" > 
                                        <input type="text" class="campo campotexto" id="IDDOCGEDOX" name="IDDOCGEDOX" size="15" style="width:90%" 
                                               value =  "${__formdata.IDDOCGEDOX}" />  
                                               <img border="0"  onclick="f_anadir_documentacion();" alt="<axis:alt f="axisfis004" c="IDDOCGEDOX" lit="9902713"/>" title="<axis:alt f="axisfis004" c="IDDOCGEDOX" lit="9902713"/>" src="images/document.gif"/>
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
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisfis004</c:param>        
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            
            <script type="text/javascript">
                Calendar.setup({
                inputField     :    "FFACT",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFACT", 
                singleClick    :    true,
                firstDay       :    1
                });             
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

