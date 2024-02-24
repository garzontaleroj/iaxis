<%-- 
*  Fichero: axisrea032.jsp
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

        function f_onload_axisrea032() {
           f_cargar_propiedades_pantalla();
           
              var grabarOK = '${requestScope.grabarOK}';
              if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisrea033();       
  
        }
                
        function f_but_aceptar() {
           
             if (objValidador.validaEntrada()) {           
                    //objUtiles.ejecutarFormulario("modal_axisrea032.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                      
                    f_grabar_datos();
            }
           
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_axisrea032();                
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
                
         
                        var CIDIOMA = null;
                        if(document.miForm.CIDIOMA){ CIDIOMA = document.miForm.CIDIOMA.value; }else{ CIDIOMA = document.miForm.CIDIOMA_AUX.value;}
                        var DESCRIPCION = null;
                        if(document.miForm.DESCRIPCION){ DESCRIPCION = document.miForm.DESCRIPCION.value; }
                        var CCODIGO = null;
                        if(document.miForm.CCODIGO){ CCODIGO = document.miForm.CCODIGO.value; }
                        
                
                
                cadena_valores = "CIDIOMA=" + CIDIOMA +"&DESCRIPCION="+DESCRIPCION +"&CCODIGO="+CCODIGO;
                               
                objAjax.invokeAsyncCGI("modal_axisrea032.do?"+cadena_valores, callbackActualizarDatos, "operation=ajax_grabar", this, objJsMessages.jslit_cargando,true);
                
            }        

     
        function callbackActualizarDatos(ajaxResponseText) {
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                //alert("A la vueltassss");
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        parent.f_aceptar_axisrea032();  
                    }
                         
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }    

    </script>
  
  
  </head>
  <body onload="f_onload_axisrea032()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea032Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea032.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" name="CCODIGO" id="CCODIGO" value="${__formdata.CCODIGO}"/>
        <input type="hidden" name="CTIPO" id="CTIPO" value="${__formdata.CTIPO}"/>
        
        <c:if test="${__formdata.MODO=='MOD'}"> 
            <input type="hidden" name="CIDIOMA_AUX" id="CIDIOMA_AUX"  value="${__formdata.CIDIOMA}"/>
         
        </c:if>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea032" c="LIT_NOMBRE_PANTALLA" lit="9902291" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea032" c="ALT_NOMBRE_PANTALLA" lit="9902291" /></c:param>
            <c:param name="form">axisrea032</c:param>
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
                                                  <axis:ocultar f="axisrea032" c="CIDIOMA" dejarHueco="false"><!-- IDIOMA -->
                                                       <td class="titulocaja" colspan="1"><b id="label_CIDIOMA"><axis:alt f="axisrea032" c="LIT_CIDIOMA" lit="100654"/></b></td>
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea032" c="DESCRIPCION" dejarHueco="false"><!-- TIPO-->
                                                       <td class="titulocaja" colspan="2"><b id="label_DESCRIPCION"><axis:alt f="axisrea032" c="LIT_DESCRIPCION" lit="100588"/></b></td>
                                                  </axis:ocultar>
                                                         
                                                                                                                 
                                             </tr>
                                             
                                             <tr>
                                                  <axis:ocultar f="axisrea032" c="CIDIOMA" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- IDIOMA -->
                                                                <select name="CIDIOMA" id="CIDIOMA" size="1" class="campowidthselect campo campotexto" onchange=""  <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> style="width:82.5%;">
                                                                         <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea031" c="ALT_CIDIOMA_SEl1" lit="108341"/> - </option>
                                                                         <c:forEach var="element" items="${__formdata.listaIdiomas}">
                                                                         <c:if test="${element.CIDIOMA != 0}">
                                                                           <option value = "${element.CIDIOMA}"                                                                            
                                                                                <c:if test="${element.CIDIOMA == __formdata.CIDIOMA}"> selected </c:if> />
                                                                                ${element.TIDIOMA} 
                                                                           </option>
                                                                         </c:if>  
                                                                         </c:forEach>
                                                                   </select>  
                                                           </td>
                                                           
                                                           
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea032" c="DESCRIPCION" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="DESCRIPCION" name="DESCRIPCION" style="width:80%"
                                                                value="${__formdata.DESCRIPCION}" <axis:atr f="axisrea032" c="DESCRIPCION" a="modificable=true"/>/>
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
                                                          
                                                                        
                                     <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea032</c:param><c:param name="f">axisrea032</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
     
   </body>
</html>