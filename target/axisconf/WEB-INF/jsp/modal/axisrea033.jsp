<%-- 
*  Fichero: axisrea033.jsp
*  Alta/Mod. descripciones
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

        function f_onload_axisrea033() {
              objDependencias.cargaPropiedadesPantalla();
              f_cargar_propiedades_pantalla();
           
              var grabarOK = '${requestScope.grabarOK}';
                if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisrea033();       
  
        }
                
        function f_but_aceptar() {
           
            if (objValidador.validaEntrada()) {           
                    f_grabar_datos();
            }
           
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_axisrea033();                
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
         
         
         /* ************************************ *********************  *********************************** */
         /* *********************************************************************************************** */
         
         function f_grabar_datos() {

                var cadena_valores = "";

                        var CTRAMO = null;
                        if(document.miForm.CTRAMO){ CTRAMO = document.miForm.CTRAMO.value; }else{ CTRAMO = document.miForm.CTRAMO_AUX.value; }
                        
                         var CCODIGO = null;
                        if(document.miForm.CCODIGO){ CCODIGO = document.miForm.CCODIGO.value; }
                        
                        
                       
                        var LIM_INF = null;
                        if(document.miForm.LIM_INF1.value != null&&document.miForm.LIM_INF1.value != '')
                        { 
                                LIM_INF = document.miForm.LIM_INF1.value; 
                        }else{
                                LIM_INF = document.miForm.LIM_INF2.value; 
                        }
                        
                        var LIM_SUP = null;
                        if(document.miForm.LIM_SUP1.value != null && document.miForm.LIM_SUP1.value != '')
                            { 
                                LIM_SUP = document.miForm.LIM_SUP1.value; 
                            }else{
                                LIM_SUP = document.miForm.LIM_SUP2.value; 
                            }
                                     
                         var PCTPART = null;
                        if(document.miForm.PCTPART){ PCTPART = document.miForm.PCTPART.value; }
                        
                          var PCTMIN = null;
                        if(document.miForm.PCTMIN){ PCTMIN = document.miForm.PCTMIN.value; }
                        
                          var PCTMAX = null;
                        if(document.miForm.PCTMAX){ PCTMAX = document.miForm.PCTMAX.value; }
                        
                          var MODO = null;
                        if(document.miForm.MODO){ MODO = document.miForm.MODO.value; }
                        
                
                
                cadena_valores = "CCODIGO=" + CCODIGO + "&CTRAMO=" + CTRAMO + "&LIM_INF=" + LIM_INF + "&LIM_SUP=" + LIM_SUP + "&PCTMIN=" + PCTMIN + "&PCTMAX=" + PCTMAX + "&PCTPART=" + PCTPART +"&MODO="+MODO; 
                //alert(cadena_valores);
                               
                objAjax.invokeAsyncCGI("modal_axisrea033.do?"+cadena_valores, callbackActualizarDatos, "operation=ajax_grabar", this, objJsMessages.jslit_cargando,true);
                
            }        
            
          
          
     
        function callbackActualizarDatos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("A la vueltassss");
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        parent.f_aceptar_axisrea033();  
                    }
                         
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }    
         
         
         
         

    </script>
  
  
  </head>
  <body onload="f_onload_axisrea033()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea032Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea033.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" name="CCODIGO" id="CCODIGO" value="${__formdata.CCODIGO}"/>
        <input type="hidden" name="CTIPO" id="CTIPO" value="${__formdata.CTIPO}" />
        
        <input type="hidden" name="LIM_INF" id="LIM_INF" value="${__formdata.CTIPO}"/>
        <input type="hidden" name="LIM_SUP" id="LIM_SUP" value="${__formdata.CTIPO}"/>
       
        <c:if test="${__formdata.MODO=='MOD'}" >
            <input type="hidden" name="CTRAMO_AUX" id="CTRAMO_AUX"  value="${__formdata.CTRAMO}"/>
            <input type="hidden" name="NORDEN_AUX" id="NORDEN_AUX"  value="${__formdata.NORDEN}"/>
        </c:if>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea033" c="LIT_NOMBRE_PANTALLA" lit="9902291" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea033" c="ALT_NOMBRE_PANTALLA" lit="9902291" /></c:param>
            <c:param name="form">axisrea033</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
          
            <tr>
                <td>
                    <!-- TRAMOS -->
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
                                                         <axis:ocultar f="axisrea033" c="CTRAMO" dejarHueco="false"><!-- TRAMO -->
                                                            <td class="titulocaja" colspan="1"><b id="label_CTRAMO"><axis:alt f="axisrea032" c="LIT_CTRAMO" lit="9000609"/></b></td>
                                                         </axis:ocultar>
                                                         <%--axis:ocultar f="axisrea033" c="ORDEN" dejarHueco="false"><!-- ORDEN-->
                                                            <td class="titulocaja" colspan="2"><b id="label_ORDEN"><axis:alt f="axisrea032" c="LIT_ORDEN" lit="500102"/></b></td>
                                                         </axis:ocultar--%>
                                                         
                                                                                                                 
                                                    </tr>
                                             
                                                    <tr>
                                                      <axis:ocultar f="axisrea033" c="CTRAMO" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- TRAMO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="CTRAMO" name="CTRAMO" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> style="width:80%"
                                                                value="${__formdata.CTRAMO}" <axis:atr f="axisrea033" c="CTRAMO" a="modificable=true"/>/>
                                                           </td>
                                                      </axis:ocultar>
                                                      <%--axis:ocultar f="axisrea033" c="NORDEN" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- ORDEN -->
                                                                <input type="text" class="campo campotexto"   id="NORDEN" name="NORDEN" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> style="width:80%"
                                                                value="${__formdata.ORDEN}" <axis:atr f="axisrea033" c="NORDEN" a="modificable=true"/>/>
                                                           </td>                                               
                                                       </axis:ocultar--%>
                                                      
                                                    </tr>
                                                    
                        </table> 
                        </td>
                        </tr>
                        
                        <tr>
                        <td id="td_DSP_CLAUS">
                      
                         <table class="area" align="center">
                         
                                                    <tr>
                                                        <th style="width:33%;height:0px"></th>                                            
                                                        <th style="width:33%;height:0px"></th>
                                                        <th style="width:33%;height:0px"></th>
                                           
                                                    </tr>
                                                    <!-- ****************************** CASO CLAUSULAS *************************** -->
                                                    
                                                    <axis:ocultar f="axisrea033" c="SEC_CLAUS" dejarHueco="false"><!-- VISIBLE SECCION CLAUSULAS -->
                                                    <tr>
                                                         <axis:ocultar f="axisrea033" c="PCTPART" dejarHueco="false"><!-- % Participación-->
                                                            <td class="titulocaja" colspan="1"><b id="label_PCTPART"><axis:alt f="axisrea033" c="LIT_PCTPART" lit="104818"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea033" c="LIM_INF1" dejarHueco="false"><!-- Límite Inferior -->
                                                            <td class="titulocaja" colspan="1"><b id="label_LIM_INF1"><axis:alt f="axisrea033" c="LIT_LIM_INF1" lit="9901561"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea033" c="LIM_SUP1" dejarHueco="false"><!-- Límite Superior -->
                                                            <td class="titulocaja" colspan="1"><b id="label_LIM_SUP1"><axis:alt f="axisrea033" c="LIT_LIM_SUP1" lit="9901562"/></b></td>
                                                         </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                      <axis:ocultar f="axisrea033" c="PCTPART" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- ORDEN -->
                                                                <input type="text" class="campo campotexto"  id="PCTPART" name="PCTPART" style="width:80%"
                                                                value="${__formdata.PCTPART}" <axis:atr f="axisrea033" c="PCTPART" a="modificable=true&obligatorio=true"/>/>
                                                           </td>                                               
                                                       </axis:ocultar>
                                                      <axis:ocultar f="axisrea033" c="LIM_INF1" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- TRAMO -->
                                                                <input type="text" class="campo campotexto"   id="LIM_INF1" name="LIM_INF1" style="width:80%"
                                                                value="${__formdata.LIM_INF}" <axis:atr f="axisrea033" c="LIM_INF" a="modificable=true&obligatorio=true"/>/>
                                                           </td>
                                                      </axis:ocultar>
                                                      <axis:ocultar f="axisrea033" c="LIM_SUP1" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- ORDEN -->
                                                                <input type="text" class="campo campotexto"   id="LIM_SUP1" name="LIM_SUP1" style="width:80%"
                                                                value="${__formdata.LIM_SUP}" <axis:atr f="axisrea033" c="LIM_SUP" a="modificable=true&obligatorio=true"/>/>
                                                           </td>                                               
                                                       </axis:ocultar>
                                                    </tr>
                                                   </axis:ocultar>
                            </table>
                            </td>
                            </tr>
                            
                            <tr>
                            <td id="td_DSP_TRAM">
                            <table class="area" align="center">
                         
                                                    <tr>
                                                        <th style="width:33%;height:0px"></th>                                            
                                                        <th style="width:33%;height:0px"></th>
                                                        <th style="width:33%;height:0px"></th>
                                           
                                                    </tr>
                                                   
                                                    <!-- ****************************** CASO TRAMOS *************************** -->
                                                  
                                                    <axis:ocultar f="axisrea033" c="SEC_TRAM_DET" dejarHueco="false"><!-- VISIBLE SECCION TRAMOS -->
                                                   
                                                    <tr>
                                                         <axis:ocultar f="axisrea033" c="LIM_INF2" dejarHueco="false"><!-- Límite Inferior Siniestralidad -->
                                                            <td class="titulocaja" id="td_LIM_INF" colspan="1"><b id="label_LIM_INF2"><axis:alt f="axisrea033" c="LIT_PCTMIN_DES" lit="9902285"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea033" c="LIM_SUP2" dejarHueco="false"><!-- <!-- Límite Superior Siniestralidad -->
                                                            <td class="titulocaja" id="td_LIM_SUP" colspan="2"><b id="label_LIM_SUP2"><axis:alt f="axisrea033" c="LIT_PCTSUP" lit="9902286"/></b></td>
                                                         </axis:ocultar>
                                                                                                                 
                                                    </tr>
                                                    
                                                    <tr>
                                                      <axis:ocultar f="axisrea033" c="LIM_INF2" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- TRAMO -->
                                                                <input type="text" class="campo campotexto"   id="LIM_INF2" name="LIM_INF2" style="width:80%"
                                                                value="${__formdata.LIM_INF}" <axis:atr f="axisrea033" c="LIM_INF" a="modificable=true&obligatorio=true"/>/>
                                                           </td>
                                                      </axis:ocultar>
                                                      <axis:ocultar f="axisrea033" c="LIM_SUP2" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- ORDEN -->
                                                                <input type="text" class="campo campotexto"   id="LIM_SUP2" name="LIM_SUP2" style="width:80%"
                                                                value="${__formdata.LIM_SUP}" <axis:atr f="axisrea033" c="LIM_SUP" a="modificable=true&obligatorio=true"/>/>
                                                           </td>                                               
                                                       </axis:ocultar>
                                                                                                           
                                                    </tr>
                                                    <tr>
                                                         <axis:ocultar f="axisrea033" c="PCTMIN" dejarHueco="false"><!-- Límite Superior Siniestralidad -->
                                                            <td class="titulocaja" colspan="1"><b id="label_PCTMIN"><axis:alt f="axisrea033" c="LIT_PCTMIN" lit="9902287"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea033" c="PCTMAX" dejarHueco="false"><!-- % Máximo-->
                                                            <td class="titulocaja" colspan="2"><b id="label_PCTMAX"><axis:alt f="axisrea033" c="LIT_PCTMAX" lit="9902288"/></b></td>
                                                         </axis:ocultar>
                                                                                                                 
                                                    </tr>
                                                    
                                                    <tr>
                                                      <axis:ocultar f="axisrea033" c="PCTMIN" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- TRAMO -->
                                                                <input type="text" class="campo campotexto"  id="PCTMIN" name="PCTMIN" style="width:80%"
                                                                value="${__formdata.PCTMIN}" <axis:atr f="axisrea033" c="LIM_SUP" a="modificable=true&obligatorio=true"/>/>
                                                           </td>
                                                      </axis:ocultar>
                                                      <axis:ocultar f="axisrea033" c="PCTMAX" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- ORDEN -->
                                                                <input type="text" class="campo campotexto"   id="PCTMAX" name="PCTMAX" style="width:80%"
                                                                value="${__formdata.PCTMAX}" <axis:atr f="axisrea033" c="PCTMAX" a="modificable=true&obligatorio=true"/>/>
                                                           </td>                                               
                                                       </axis:ocultar>
                                                                                                           
                                                    </tr>
                                                   </axis:ocultar>
                                                  
                            </table>
                            </td>
                            </tr>
                        </table>
                            
                        </td>
                    </tr>
                </table>
                                                          
                                                                        
                                     <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea032</c:param><c:param name="f">axisrea032</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
     
   </body>
</html>