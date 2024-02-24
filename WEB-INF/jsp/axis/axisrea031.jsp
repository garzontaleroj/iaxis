<%-- 
*  Fichero: axisrea031.jsp
*  Alta/Mod. Asociación de fórmulas a Contratos
*  Fecha: 09/08/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
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

        function f_onload_axisrea031() {
           f_cargar_propiedades_pantalla();
           var PROCEDE = "${__formdata.PROCEDE}"+"";    
           //alert("valor variable PROCEDE="+PROCEDE);
           //alert("valor variable PROCEDE="+"${__formdata.PROCEDE}");
           <c:if test="${ empty __formdata.CCODIGO }">  
                    objUtiles.abrirModal("axisrea029", "src", "axis_axisrea029.do?operation=form&PROCEDE="+PROCEDE);  
           </c:if>
           
                     
                
        }
                
        function f_but_aceptar() {
           
             if (objValidador.validaEntrada()) {           
                    //objUtiles.ejecutarFormulario("modal_axisrea026.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                      
                    f_grabar_datos();
            }
           
        }
        
        function f_but_cancelar() { 
               objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea031", "cancelar", document.miForm, "_self");
        }    
        
         function f_actualitza_plocal()
         {      
                //alert("Antes de cargar***" );
                f_cargar_propiedades_pantalla();
              
               var CTRAMO = objDom.getValorPorId("CTRAMO");   

         }
         
         function f_actualiza_number(CAMPON){                                             
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroMoneda(objDom.getValorPorId(CAMPON),null));
         }       
         
         /* ************************************   *********************************** */
         /* *********************************************************************************************** */
         
         function f_grabar_datos() {

                               
                        
                        var CCODIGO = null;
                        if(document.miForm.CCODIGO){ CCODIGO = document.miForm.CCODIGO.value; }
                        var CTIPO = null;
                        if(document.miForm.CTIPO){ CTIPO = document.miForm.CTIPO.value; }
                        var FEFECTO = null;
                        if(document.miForm.FEFECTO){ FEFECTO = document.miForm.FEFECTO.value; }
                        var FVENCIM = null;
                        if(document.miForm.FVENCIM){ FVENCIM = document.miForm.FVENCIM.value; }
                        
                
                
                cadena_valores = "CCODIGO=" + CCODIGO + "&CTIPO=" + CTIPO +
                "&FEFECTO=" + FEFECTO + "&FVENCIM=" + FVENCIM ;
               
                               //alert("cadena de valores ="+cadena_valores);
                objAjax.invokeAsyncCGI("axis_axisrea031.do?"+cadena_valores, callbackActualizarDatos, "operation=ajax_grabar", this, objJsMessages.jslit_cargando,true);
                
                        
        }        
            
        function callbackActualizarDatos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                objDom.setDisabledPorId("but_aceptar", true);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        //parent.f_aceptar_axisrea032();  
                        //alert("Antes 1");
                        objDom.setDisabledPorId("but_aceptar", true);
                    }
                    
                } catch (e) {
                    //alert("Antes 2");
                    objDom.setDisabledPorId("but_aceptar", false);
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }    
         
         
         /* ************************************ MODAL 032 ***************************************/
        function f_abrir_axisrea032() {
                var CCODIGO = document.miForm.CCODIGO.value;
                var CTIPO = document.miForm.CTIPO.value;
                //alert(CCODIGO);
                //alert(CTIPO);
                objUtiles.abrirModal("axisrea032", "src", "modal_axisrea032.do?operation=form&CCODIGO="+CCODIGO+"&CTIPO="+CTIPO);  
        }
        
        function f_modificar_axisrea032(CIDIOMA,DESCRIPCION,MODO) {
                var CCODIGO = document.miForm.CCODIGO.value;
                var CTIPO = document.miForm.CTIPO.value;
                objUtiles.abrirModal("axisrea032", "src", "modal_axisrea032.do?operation=form&CCODIGO="+CCODIGO+"&CTIPO="+CTIPO +"&MODO="+MODO+"&CIDIOMA="+CIDIOMA+"&DESCRIPCION="+DESCRIPCION);  
        }
            
        function f_cerrar_axisrea032() {
                objUtiles.cerrarModal('axisrea032');
                objUtiles.ejecutarFormulario("axis_axisrea031.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
        }  
        
         function f_aceptar_axisrea032() {
               f_cerrar_axisrea032();           
               objUtiles.ejecutarFormulario("axis_axisrea031.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
            
      
        function f_delete_axisrea032(CIDIOMA) {  
                //alert(CIDIOMA);
                document.miForm.CCODIGO_DEL.value = document.miForm.CCODIGO.value;
                document.miForm.CIDIOMA_DEL.value = CIDIOMA;
                if(confirm("<axis:alt f='axisrea031' c='CONFIRM_DESC' lit='1000167'/>")){                
                objUtiles.ejecutarFormulario("axis_axisrea031.do", "borrar_desc", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
         }
            
            /* ************************************ MODAL 033 ***************************************/
        function f_abrir_axisrea033(MODO) {
                var CCODIGO = document.miForm.CCODIGO.value;
                var CTIPO = document.miForm.CTIPO.value;
                //alert(CCODIGO);
                //alert(CTIPO);
                objUtiles.abrirModal("axisrea033", "src", "modal_axisrea033.do?operation=form&CCODIGO="+CCODIGO+"&CTIPO="+CTIPO+"&MODO="+MODO);  
        }
        
        function f_modificar_axisrea033(TRAMO,ORDEN,LIM_INF,LIM_SUP,PCTPART,PCT,PCTMIN,PCTMAX,MODO) {
                var CCODIGO = document.miForm.CCODIGO.value;
                var CTIPO = document.miForm.CTIPO.value;
                objUtiles.abrirModal("axisrea033", "src", "modal_axisrea033.do?operation=form&CCODIGO="+CCODIGO+"&CTIPO="+CTIPO+"&CTRAMO="+TRAMO+"&ORDEN="+ORDEN+"&LIM_INF="+LIM_INF+"&LIM_SUP="+LIM_SUP+"&PCTPART="+PCTPART+"&PCT="+PCT+"&PCTMIN="+PCTMIN+"&PCTMAX="+PCTMAX+"&MODO="+MODO);  
        }
        
        function f_cerrar_axisrea033() {
                objUtiles.cerrarModal('axisrea033');
                objUtiles.ejecutarFormulario("axis_axisrea031.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }   
        
        function f_aceptar_axisrea033() {
               f_cerrar_axisrea033();   
               objUtiles.ejecutarFormulario("axis_axisrea031.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_delete_axisrea033(TRAMO) {  
                
                document.miForm.CCODIGO_DEL.value = document.miForm.CCODIGO.value;
                document.miForm.CTRAMO_DEL.value = TRAMO;
            
                  if(confirm("<axis:alt f='axisrea031' c='CONFIRM_TRAMO' lit='1000167'/>")){
                    objUtiles.ejecutarFormulario("axis_axisrea031.do", "borrar_tramo", document.miForm, "_self", objJsMessages.jslit_cargando);
                  }
         }
         
         
         /* *********************************   ************************************************** */
         
         function f_cerrar_axisrea029(CCODIGO){
             objUtiles.cerrarModal('axisrea029'); 
             document.miForm.CCODIGO_MOD.value=CCODIGO;
             objUtiles.ejecutarFormulario("axis_axisrea031.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
             
         }
         
         function f_cancelar_axisrea029(){
            objUtiles.cerrarModal('axisrea029'); 
            //objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea031", "cancelar", document.miForm, "_self");
         }
         
         function f_abrir_aux_axisrea029(){
            var PROCEDE = "${__formdata.PROCEDE}"+"";    
            objUtiles.abrirModal("axisrea029", "src", "axis_axisrea029.do?operation=form&PROCEDE="+PROCEDE);
         }
    </script>
  
  
  </head>
  <body onload="f_onload_axisrea031()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <!--form name="axisrea031Form" action="" method="POST"-->
    <form name="miForm" action="axis_axisrea031.do" method="POST">
        <input type="hidden" name="operation" value=""/>
       
        <input type="hidden" name="CCODIGO_DEL" id="CCODIGO_DEL" value="${__formdata.CCODIGO_DEL}"/>
        <input type="hidden" name="CTRAMO_DEL" id="CTRAMO_DEL" value="${__formdata.CTRAMO_DEL}"/>
        <input type="hidden" name="CIDIOMA_DEL" id="CIDIOMA_DEL" value="${__formdata.CIDIOMA_DEL}"/>
        <input type="hidden" name="PROCEDE" id="PROCEDE" value="${__formdata.PROCEDE}"/>
        <input type="hidden" name="CCODIGO_MOD" id="CCODIGO_MOD" value="${__formdata.CCODIGO_MOD}"/>
              
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea031" c="LIT_NOMBRE_PANTALLA" lit="9902469" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea031" c="ALT_NOMBRE_PANTALLA" lit="9902469" /></c:param>
            <c:param name="form">axisrea031</c:param>
        </c:import>
        <!-- Pantallas modales -->
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea032|<axis:alt f="axisrea030" c="LIT_MODAL_AXISREA032" lit="9902291" /></c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea033|<axis:alt f="axisrea030" c="LIT_MODAL_AXISREA033" lit="9902291" /></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea029|<axis:alt f="axisrea030" c="LIT_MODAL_AXISREA033" lit="9902291" /></c:param>
        </c:import>
        <!-- Area de campos  -->
         <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
          
            <tr>
                <td>
                <!-- TRAMOS -->
                    <div class="titulo">
                    <img src="images/flecha.gif"/>
                    &nbsp;<axis:alt f="axisrea031" c="LIT_DAT_GEN" lit="9902274"/>&nbsp;
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrea029" c="LIT_IMG_BUSCAR" lit="100002" />" onclick="f_abrir_aux_axisrea029();" style="cursor:pointer"/>
                        
                  </div>
                        <table class="seccion">
                            <tr>
                            <td>
                                 <table class="area" align="center">
                                    <tr>
                                            <th style="width:33%;height:0px"></th>                                            
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                    </tr>
                                    <tr>
                                             <axis:ocultar f="axisrea031" c="CCODIGO" dejarHueco="false"><!-- CODIGO -->
                                                <td class="titulocaja" colspan="1"><b id="label_SPRODUC"><axis:alt f="axisrea031" c="LIT_SPRODUC" lit="103465"/></b></td>
                                             </axis:ocultar>
                                             <axis:ocultar f="axisrea031" c="CTIPO" dejarHueco="false"><!-- TIPO-->
                                                <td class="titulocaja" ><b id="label_CACTIVI"><axis:alt f="axisrea031" c="LIT_CACTIVI" lit="100565"/></b></td>
                                             </axis:ocultar>
                                    </tr>
                                 
                                    <tr>
                                          <axis:ocultar f="axisrea031" c="CCODIGO" dejarHueco="false">
                                               <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                    <input type="text" class="campo campotexto"  obligatorio="true" readonly id="CCODIGO" name="CCODIGO" style="width:80%"
                                                    value="${__formdata.POBJ_CLAUSULAS_REAS.CCODIGO}" <axis:atr f="axisrea031" c="CCODIGO" a="modificable=true"/>/>
                                               </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisrea031" c="CTIPO" dejarHueco="false"> 
                                               <td class="campocaja" > <%-- TIPO --%>
                                                       <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo campotexto" onchange="" disabled="true" style="width:82.5%;">
                                                             <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea031" c="ALT_CCODIGO_SEl1" lit="108341"/>&nbsp;<axis:alt f="axisrea031" c="ALT_CFORMULA_SEl2" lit="9902181"/> - </option>
                                                             <c:forEach var="element" items="${__formdata.listaTipos}">
                                                             <c:if test="${element.CATRIBU != 0}">
                                                               <option value = "${element.CATRIBU}"                                                                            
                                                                    <c:if test="${element.CATRIBU == __formdata.POBJ_CLAUSULAS_REAS.CTIPO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                               </option>
                                                             </c:if>  
                                                             </c:forEach>
                                                       </select>     
                                               </td>                                                          
                                           </axis:ocultar>
                                          
                                    </tr>
                                        <!-- Sección combos -->
                                    <tr>
                                             <axis:ocultar f="axisrea031" c="FEFECTO" dejarHueco="false"><!-- FECHA EFECTO -->
                                                <td class="titulocaja" colspan="1"><b id="label_FEFECTO"><axis:alt f="axisrea031" c="LIT_FEFECTO" lit="100883"/></b></td>
                                             </axis:ocultar>
                                             <axis:ocultar f="axisrea031" c="FVENCIM" dejarHueco="false"><!-- FECHA VENCIMIENTO-->
                                                <td class="titulocaja" colspan="1"><b id="label_FVENCIM"><axis:alt f="axisrea031" c="LIT_FVENCIM" lit="100885"/></b></td>
                                             </axis:ocultar>
                                                                                                                                          
                                    </tr> 
                                     
                                    <tr>
                                           <axis:ocultar f="axisrea031" c="FEFECTO" dejarHueco="false"> 
                                               <td class="campocaja" colspan="1"> <%-- FECHA EFECTO --%>
                                                       <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.POBJ_CLAUSULAS_REAS.FEFECTO}' pattern='dd/MM/yyyy'/>" name="FEFECTO" id="FEFECTO" 
                                                        style="width:55%;" <axis:atr f="axisrea031" c="FEFECTO" a="modificable=true&obligatorio=true&formato=fecha"/> /> 
                                                        <a style="vertical-align:middle;"><img
                                                        id="icon_FEFECTO" border=0 alt="<axis:alt f="axisrea031" c="TIT_FEFEC" lit="100883"/>" title="<axis:alt f="axisrea031" c="ALT_FEFEC" lit="100883"/>" src="images/calendar.gif"/></a>
                                               </td>                                                          
                                           </axis:ocultar> 
                                           
                                           <axis:ocultar f="axisrea0310" c="FVENCIM" dejarHueco="false"> 
                                               <td class="campocaja" colspan="1"> <%-- FECHA VENCIMIENTO --%>
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.POBJ_CLAUSULAS_REAS.FVENCIM}' pattern='dd/MM/yyyy'/>" name="FVENCIM" id="FVENCIM" 
                                                        style="width:55%;" <axis:atr f="axisrea031" c="FVENCIM" a="modificable=true&formato=fecha"/> /> 
                                                        <a style="vertical-align:middle;"><img
                                                        id="icon_FVENCIM" border=0 alt="<axis:alt f="axisrea031" c="TIT_FEFIN" lit="100885"/>" title="<axis:alt f="axisrea031" c="TIT_FEFIN" lit="100885"/>" src="images/calendar.gif"/></a>
                                               </td>                                                          
                                           </axis:ocultar>
    
                                     </tr>
                                     <tr>
                                                <td colspan="3">
                                                    <axis:visible f="axisrea031" c="ALTA_DESC">
                                                                   <a href="javascript:f_abrir_axisrea032()"><img style="float:right;" border="0"  title="<axis:alt f="axisrea031" c="ALT_IMG_NUEVO_OPER" lit="9001816"/>&nbsp;<axis:alt f="axisrea031" c="ALT_IMG_NUEVO_OP" lit="100654"/>" src="images/new.gif"/></a>
                                                    </axis:visible>
                                                </td>
                                      </tr>
                                      <tr>
                                            <td colspan="3">
                                            <!-- **************************** PRIMERA LISTA *****************************-->
                                            <table class="area" align="left"> <!-- multirregistro de tramos -->
                                                <tr>
                                                  <td> 
                                                    <c:set var="title1"><axis:alt f="axisrea031" c="ALT_TRAMO_TIT" lit="100654"/></c:set>  <%-- Idioma --%>
                                                    <c:set var="title2"><axis:alt f="axisrea031" c="ALT_NRODEN_TIT" lit="100588"/></c:set>   <%-- Descripción --%>
                                                    <c:set var="title3"><axis:alt f="axisrea031" c="ALT_BORDERO_TIT" lit="9000552"/></c:set>   <%-- Modificar --%>
                                                    <c:set var="title4"><axis:alt f="axisrea031" c="ALT_IMPTRAMO_TIT" lit="9001333"/></c:set>   <%-- Borrar --%>
                                                    <div class="displayspace" id="dt_tramos">
                                                      <display:table name="${__formdata.POBJ_CLAUSULAS_REAS.CDESCRI}" id="T_IAX_DESC" export="false" class="dsptgtable" 
                                                      pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                      requestURI="axis_axisrea031.do?operation=form&paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                                                                           
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DESCCLAUSULAS_REAS.CIDIOMA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText">${T_IAX_DESC.OB_IAX_DESCCLAUSULAS_REAS.CIDIOMA} - ${T_IAX_DESC.OB_IAX_DESCCLAUSULAS_REAS.TIDIOMA}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DESCCLAUSULAS_REAS.DESCRIPCION" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText">${T_IAX_DESC.OB_IAX_DESCCLAUSULAS_REAS.TDESCRIPCION}</div>
                                                        </display:column>
                                                        <axis:visible f="axisrea031" c="BT_EDIT_DESC">
                                                            <display:column title="${title3}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspIcon"><a href="javascript:f_modificar_axisrea032('${T_IAX_DESC.OB_IAX_DESCCLAUSULAS_REAS.CIDIOMA}','${T_IAX_DESC.OB_IAX_DESCCLAUSULAS_REAS.TDESCRIPCION}','MOD');"><img border="0"  title="<axis:alt f="axisrea031" c="ALT_IMG_ISCONTA_DESC" lit="9000552"/>&nbsp;<axis:alt f="axisrea003" c="ALT_ISONTA_TIT" lit="100654"/>" src="images/lapiz.gif"/></a> </div>
                                                            </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisrea031" c="BT_BORRAR_DESC">
                                                             <display:column title="${title4}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspIcon"><a href="javascript:f_delete_axisrea032('${T_IAX_DESC.OB_IAX_DESCCLAUSULAS_REAS.CIDIOMA}');"><img border="0"  title="<axis:alt f="axisrea031" c="ALT_ISONTA_LIT_DESC" lit="9001333"/>&nbsp;<axis:alt f="axisrea003" c="ALT_ISONTA_LIT" lit="100654"/>" src="images/delete.gif"/></a> </div>
                                                            </display:column>
                                                        </axis:visible>
                                                      </display:table>                                                                                                    
                                                    </div>  
                                                  </td>
                                                </tr>
                                            </table>
                                            </td>
                                       </tr>
                                       
                                       <tr>
                                        <td></td>
                                       </tr>
                                       
                                    <tr>
                                             <axis:ocultar f="axisrea031" c="TRAMOS" dejarHueco="false"><!-- Título tramos -->
                                                <td class="titulo" colspan="3"><b id="label_TRAMOS_TIT"><axis:alt f="axisrea031" c="LIT_TRAMOS_TIT" lit="108676"/></b></td>
                                             </axis:ocultar>
                                    </tr>
                                       
                                       <tr>
                                                <td colspan="3">
                                                    <axis:visible f="axisrea031" c="ALTA_TRAM">
                                                                   <a href="javascript:f_abrir_axisrea033('ALTA')"><img style="float:right;" border="0" alt="<axis:alt f="axisrea031" c="ALT_IMG_NUEVO" lit="9000422"/>" title="<axis:alt f="axisrea031" c="ALT_IMG_NUEVO_TIT" lit="9002223"/>" src="images/new.gif"/></a>
                                                    </axis:visible>
                                                </td>
                                           
                                      </tr>
                                      <tr>
                                            <td colspan="3">
                                            <!-- **************************** SEGUNDA LISTA *****************************-->
                                            <table class="area" align="left"> <!-- multirregistro de tramos -->
                                                <tr>
                                                   <td>
                                                    <c:set var="title1"><axis:alt f="axisrea031" c="ALT_TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>
                                                    <c:set var="title2"><axis:alt f="axisrea031" c="ALT_NRODEN" lit="500102"/></c:set>   <%-- Orden --%>
                                                    <c:set var="title3"><axis:alt f="axisrea031" c="ALT_BORDERO" lit="9901561"/></c:set>   <%-- Límite inferior --%>
                                                    <c:set var="title4"><axis:alt f="axisrea031" c="ALT_IMPTRAMO" lit="9901562"/></c:set>   <%-- Límite superior --%>
                                                    <c:set var="title5"><axis:alt f="axisrea031" c="ALT_QUOTE" lit="104818"/></c:set>   <%-- % Participación --%>
                                                    <c:set var="title6"><axis:alt f="axisrea031" c="ALT_BORRAR" lit="9001333"/></c:set>   <%-- Borrar --%>
                                                    <c:set var="title7"><axis:alt f="axisrea031" c="ALT_MODIFICAR" lit="9000552"/></c:set>   <%-- Modificar --%>
    
                                                    <div class="displayspace" id="dt_tramos">
                                                      <display:table name="${__formdata.POBJ_CLAUSULAS_REAS.CDETALLE}" id="T_IAX_TRAMOS" export="false" class="dsptgtable" 
                                                      pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                      requestURI="axis_axisrea031.do?operation=form&paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                                                                              
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CLAUSULAS_REAS_DET.TRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText">${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.CTRAMO}</div>
                                                        </display:column>
                                                        <%--display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CLAUSULAS_REAS_DET.ORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText">${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.ORDEN}</div>
                                                        </display:column--%>
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CLAUSULAS_REAS_DET.LIM_INF" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.ILIM_INF}"/></div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CLAUSULAS_REAS_DET.LIM_SUP" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.ILIM_SUP}"/></div>
                                                        </display:column>
                                                        <%--display:column title="${title5}" sortable="true" sortProperty="OB_IAX_CLAUSULAS_REAS_DET.PCTPART" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.PCTPART}"/></div>
                                                        </display:column--%>
                                                        <axis:visible f="axisrea031" c="BT_EDIT_TRAM">
                                                            <display:column title="${title7}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspIcon"><a href="javascript:f_modificar_axisrea033('${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.CTRAMO}','${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.ORDEN}','${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.ILIM_INF}', '${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.ILIM_SUP}' ,'${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.PCTPART}' , '${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.PCTPART}', '${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.PCTMIN}', '${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.PCTMAX}','MOD');"><img border="0"  title="<axis:alt f="axisrea003" c="ALT_ISONTA_OUT" lit="9000552"/>&nbsp;<axis:alt f="axisrea003" c="TIT_ISONTA_LIT" lit="108676"/>" src="images/lapiz.gif"/></a> </div>
                                                            </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisrea031" c="BT_BORRAR_TRAM">
                                                            <display:column title="${title6}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspIcon"><a href="javascript:f_delete_axisrea033('${T_IAX_TRAMOS.OB_IAX_CLAUSULAS_REAS_DET.CTRAMO}');"><img border="0"  title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT_DESC" lit="9001333"/>&nbsp;<axis:alt f="axisrea003" c="ALT_ISONTA_LIT2" lit="108676"/>" src="images/delete.gif"/></a> </div>
                                                            </display:column>
                                                        </axis:visible>
                                                      </display:table>                                                                                                    
                                                    </div>  
                                                  </td>
                                                </tr>
                                            </table>
                                            </td>
                                       </tr>
            
                            </table>
                          </td>  
                        <tr>
                    </table>    
               </td>
            </tr>
        </table>
        <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea031</c:param><c:param name="f">axisrea031</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisrea031" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
     <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFECTO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTO", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FVENCIM",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FVENCIM", 
               singleClick    :    true,
              firstDay       :    1
        });
        </script>
   </body>
</html>