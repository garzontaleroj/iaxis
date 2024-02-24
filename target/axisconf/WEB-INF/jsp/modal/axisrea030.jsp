<%-- 
*  Fichero: axisrea030.jsp
*  Alta/MOd. reaseguro cláusulas / tramos escalonados
*  Fecha: 11/08/2011
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

        function f_onload_axisrea030() {
           f_cargar_propiedades_pantalla();
                       
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisrea030();             
                
        }
                
        function f_but_aceptar() {
           
             if (objValidador.validaEntrada()) {           
                    //objUtiles.ejecutarFormulario("modal_axisrea026.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                      
                    f_grabar_datos();
            }
           
        }
        
        function f_but_cancelar() { 
               parent.f_cancelar_axisrea030();                
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
               
               
                
                var cadena_valores = "";
                
         
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
               
                               
                objAjax.invokeAsyncCGI("modal_axisrea030.do?"+cadena_valores, callbackActualizarDatos, "operation=ajax_grabar", this, objJsMessages.jslit_cargando,true);
                
            }        
            
          
          
     
        function callbackActualizarDatos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("A la vueltassss");
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        parent.f_aceptar_axisrea030();  
                    }
                         
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }    
         
         
         
         

    </script>
  
  
  </head>
  <body onload="f_onload_axisrea030()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea026Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea030.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="H_MODIF" id="H_MODIF" value="${__formdata.H_MODIF}"/>
        <input type="hidden" name="CTRAMO_MOD" id="CTRAMO_MOD" value="${__formdata.CTRAMO_MOD}"/>
        <input type="hidden" name="NVERSIO" id="NVERSIO" value="${__formdata.NVERSIO}"/>
        <input type="hidden" name="SCONTRA" id="SCONTRA" value="${__formdata.SCONTRA}"/>
        <input type="hidden" name="SCTRXL" id="SCTRXL"  value="${__formdata.SCTRXL}"/>
        <input type="hidden" name="NVERXL" id="NVERXL"  value="${__formdata.NVERXL}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea030" c="LIT_NOMBRE_PANTALLA" lit="9902291" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea030" c="ALT_NOMBRE_PANTALLA" lit="9902291" /></c:param>
            <c:param name="form">axisrea030</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
          
            <tr>
                <td>
                
                    <!-- TRAMOS -->
                    <table class="area">

                                                    <tr>
                                                        <th style="width:33%;height:0px"></th>                                            
                                                        <th style="width:33%;height:0px"></th>
                                                        <th style="width:33%;height:0px"></th>
                                           
                                                    </tr>
                                                    <tr>
                                                         <axis:ocultar f="axisrea030" c="CCODIGO" dejarHueco="false"><!-- CODIGO -->
                                                            <td class="titulocaja" colspan="1"><b id="label_SPRODUC"><axis:alt f="axisrea030" c="LIT_CCODIGO" lit="103465"/></b></td>
                                                         </axis:ocultar>
                                                          <axis:ocultar f="axisrea030" c="DESCRIPCION" dejarHueco="false"><!-- DESCRIPCION -->
                                                            <td class="titulocaja" ><b id="label_DESCRIPCION"><axis:alt f="axisrea030" c="LIT_DESCRIPCION" lit="100588"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea030" c="CTIPO" dejarHueco="false"><!-- TIPO-->
                                                            <td class="titulocaja" ><b id="label_CTIPO"><axis:alt f="axisrea030" c="LIT_CTIPO" lit="100565"/></b></td>
                                                         </axis:ocultar>
                                                         
                                                                                                                 
                                                    </tr>
                                             
                                                    <tr>
                                                      <axis:ocultar f="axisrea030" c="CCODIGO" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="CCODIGO" name="CCODIGO" style="width:80%"
                                                                value="${__formdata.CCODIGO}" <axis:atr f="axisrea030" c="CCODIGO" a="modificable=true"/>/>
                                                           </td>
                                                      </axis:ocultar>
                                                       <axis:ocultar f="axisrea030" c="DESCRIPCION" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="DESCRIPCION" name="DESCRIPCION" style="width:90%"
                                                                value="${__formdata.CCODIGO}" <axis:atr f="axisrea030" c="DESCRIPCION" a="modificable=true"/>/>
                                                           </td>
                                                      </axis:ocultar>
                                                      <axis:ocultar f="axisrea030" c="CTIPO" dejarHueco="false"> 
                                                           <td class="campocaja" > <%-- TIPO --%>
                                                                   <select name="CTIPO" id="CTIPO" size="1" <axis:atr f="axisrea030" c="CTIPO" a="modificable=true&obligatorio=true"/> class="campowidthselect campo campotexto" onchange=""  style="width:82.5%;">
                                                                         <option value=""> - <axis:alt f="axisrea0230" c="ALT_CTIPO_SEl1" lit="108341"/> - </option>
                                                                         <c:forEach var="element" items="${__formdata.listaTipos}">
                                                                         <c:if test="${element.CATRIBU != 0}">
                                                                           <option value = "${element.CATRIBU}"                                                                            
                                                                                <c:if test="${element.CATRIBU == __formdata.CTIPO}"> selected </c:if> />
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
                                                         <axis:ocultar f="axisrea030" c="FEFECTO" dejarHueco="false"><!-- FECHA EFECTO -->
                                                            <td class="titulocaja" colspan="1"><b id="label_FEFECTO"><axis:alt f="axisrea030" c="LIT_FEFECTO" lit="100883"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea030" c="FVENCIM" dejarHueco="false"><!-- FECHA VENCIMIENTO-->
                                                            <td class="titulocaja" colspan="1"><b id="label_FVENCIM"><axis:alt f="axisrea030" c="LIT_FVENCIM" lit="100885"/></b></td>
                                                         </axis:ocultar>
                                                                                                                                                      
                                                    </tr> 
                                                 
                                                    <tr>
                                                       <axis:ocultar f="axisrea030" c="FEFECTO" dejarHueco="false"> 
                                                           <td class="campocaja" colspan="1"> <%-- FECHA EFECTO --%>
                                                                   <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.FEFECTO}' pattern='dd/MM/yyyy'/>" name="FEFECTO" id="FEFECTO" 
                                                                    style="width:55%;" <axis:atr f="axisrea030" c="FEFECTO" a="modificable=true&obligatorio=true&formato=fecha"/> /> 
                                                                    <a style="vertical-align:middle;"><img
                                                                    id="icon_FEFECTO" border=0 alt="<axis:alt f="axisrea030" c="LIT_FEFECTO" lit="100883"/>" title="<axis:alt f="axisrea030" c="LIT_FEFECTO_TIT" lit="100883"/>" src="images/calendar.gif"/></a>
                                                           </td>                                                          
                                                       </axis:ocultar> 
                                                       
                                                       <axis:ocultar f="axisrea030" c="FVENCIM" dejarHueco="false"> 
                                                           <td class="campocaja" colspan="1"> <%-- FECHA VENCIMIENTO --%>
                                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.FVENCIM}' pattern='dd/MM/yyyy'/>" name="FVENCIM" id="FVENCIM" 
                                                                    style="width:55%;" <axis:atr f="axisrea030" c="FVENCIM" a="modificable=true&formato=fecha"/> /> 
                                                                    <a style="vertical-align:middle;"><img
                                                                    id="icon_FVENCIM" border=0 alt="<axis:alt f="axisrea030" c="LIT_FVENCIM" lit="100885"/>" title="<axis:alt f="axisrea030" c="LIT_FVENCIM_TIT" lit="100885"/>" src="images/calendar.gif"/></a>
                                                           </td>                                                          
                                                       </axis:ocultar>

                                                    </tr>
                      
                                                   
                                                                                                 
                            </table>
                        </td>
                    </tr>
                </table>
                                                          
                                                                        
                                     <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea030</c:param><c:param name="f">axisrea030</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
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