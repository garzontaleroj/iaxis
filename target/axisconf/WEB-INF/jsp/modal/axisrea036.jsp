<%-- 
*  Fichero: axisrea036.jsp
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

        function f_onload_axisrea036() {
        
            var grabaOk = '${__formdata.grabaOK}';
            if(grabaOk==1){
                f_but_cancelar() ;
            }else{
                f_cargar_propiedades_pantalla();
            }
  
        }
                
        function f_but_aceptar() {
           
             if (objValidador.validaEntrada()) {                  
                    f_grabar_datos();
            }
           
        }
        
        function f_but_cancelar() { 
                var CCODIGO = $('#CCODIGO').val();
                var deletedRepos = $('#deletedRepos').val();
               parent.f_cerrar_axisrea036(CCODIGO,deletedRepos);                
        }    
        
         function f_actualitza_plocal()
         {      
                //alert("Antes de cargar***" );
                f_cargar_propiedades_pantalla();
              
               var CTRAMO = objDom.getValorPorId("CTRAMO");   
                
       
         }
         
         function f_actualiza_number(CAMPON){                                             
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(CAMPON),true));
         }       
         
         
        /* ************************************   FUNCIONES  AJAX  *************************************** */
        /* *********************************************************************************************** */
         
         function f_grabar_datos() {
                //Los parametros que le pasamos estan disabled en el formulario
                var params = "?DESCRIPCION="+$('#DESCRIPCION').val()+"&CCODIGO="+$('#CCODIGO').val();

                if($('#ORDEN').prop('disabled')==true){
                    params = params +"&ORDEN="+$('#ORDEN').val();
                }
                
                objUtiles.ejecutarFormulario("modal_axisrea036.do"+params, "guardar", document.miForm, "_self");
                
            }        


        
        /* **********************************  FIN  FUNCIONES  AJAX  ************************************* */
        /* *********************************************************************************************** */
    </script>
  
  
  </head>
  <body onload="f_onload_axisrea036()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea036Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea036.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" name="NVERSIO" id="NVERSIO" value="${__formdata.NVERSIO}"/>
         <input type="hidden" name="SCONTRA" id="SCONTRA" value="${__formdata.SCONTRA}"/>
          <input type="hidden" name="CTRAMO" id="CTRAMO" value="${__formdata.CTRAMO}"/>
        <input type="hidden" name="deletedRepos" id="deletedRepos" value="${__formdata.deletedRepos}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea036" c="LIT_NOMBRE_PANTALLA_TIT" lit="9000570" />&nbsp;<axis:alt f="axisrea036" c="LIT_NOMBRE_PANTALLA" lit="9902193" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea036" c="ALT_NOMBRE_PANTALLA_TITULO" lit="9000570" />&nbsp;<axis:alt f="axisrea036" c="LIT_NOMBRE_PANTALLA_TITULO" lit="9902193" /></c:param>
            <c:param name="form">axisrea036</c:param>
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
                                                  <axis:ocultar f="axisrea036" c="CCODIGO" dejarHueco="false"><!-- CODIGO -->
                                                       <td class="titulocaja" colspan="1"><b id="label_CCODIGO"><axis:alt f="axisrea036" c="LIT_CCODIGO" lit="9902289"/></b></td>
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea036" c="DESCRIPCION" dejarHueco="false"><!-- TIPO-->
                                                       <td class="titulocaja" colspan="2"><b id="label_DESCRIPCION"><axis:alt f="axisrea036" c="LIT_DESCRIPCION" lit="100588"/></b></td>
                                                  </axis:ocultar>
                                                         
                                                                                                                 
                                             </tr>
                                             
                                             <tr>
                                                  <axis:ocultar f="axisrea036" c="CCODIGO" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  <c:if test="${__formdata.MODO=='MOD' || __formdata.MODO=='ALTA_MOD'}" >disabled</c:if>  obligatorio="true" id="CCODIGO" name="CCODIGO" style="width:80%"
                                                                value="${__formdata.CCODIGO}" <axis:atr f="axisrea030" c="CCODIGO" a="modificable=false&formato=decimal"/>/>
                                                           </td>
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea036" c="DESCRIPCION" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="2"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto" <c:if test="${__formdata.MODO=='MOD' || __formdata.MODO=='ALTA_MOD'}" >disabled</c:if> obligatorio="true" id="DESCRIPCION" name="DESCRIPCION" style="width:80%"
                                                                value="${__formdata.DESCRIPCION}" <axis:atr f="axisrea036" c="DESCRIPCION" a="modificable=false"/>/>
                                                           </td>                                               
                                                  </axis:ocultar>
                                                      
                                            </tr>
                                            
                                            <tr>
                                                  <axis:ocultar f="axisrea036" c="ORDEN" dejarHueco="false"><!-- ORDEN -->
                                                       <td class="titulocaja" colspan="1"><b id="label_ORDEN"><axis:alt f="axisrea036" c="LIT_ORDEN" lit="500102"/></b></td>
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea036" c="CAPACIDAD" dejarHueco="false"><!-- CAPACIDAD-->
                                                       <td class="titulocaja" colspan="1"><b id="label_CAPACIDAD"><axis:alt f="axisrea036" c="LIT_CAPACIDAD" lit="9000602"/></b></td>
                                                  </axis:ocultar>
                                                   <axis:ocultar f="axisrea036" c="TASA" dejarHueco="false"><!-- TASA-->
                                                       <td class="titulocaja" colspan="1"><b id="label_TASA"><axis:alt f="axisrea036" c="LIT_TASA" lit="9901974"/></b></td>
                                                  </axis:ocultar>       
                                                                                                                 
                                             </tr>
                                             
                                             <tr>
                                                  <axis:ocultar f="axisrea036" c="ORDEN" dejarHueco="false">
                                                           <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> obligatorio="true" id="ORDEN" name="ORDEN" style="width:80%"
                                                                value="${__formdata.ORDEN}" <axis:atr f="axisrea030" c="ORDEN" a="modificable=true&formato=decimal"/>/>
                                                           </td>
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea036" c="CAPACIDAD" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="CAPACIDAD" name="CAPACIDAD" style="width:80%"
                                                                value="<fmt:formatNumber pattern='##.##' value='${__formdata.CAPACIDAD}' />" <axis:atr f="axisrea036" c="CAPACIDAD" a="modificable=true&formato=decimal"/>/>
                                                           </td>                                               
                                                  </axis:ocultar>
                                                  <axis:ocultar f="axisrea036" c="TASA" dejarHueco="false"> 
                                                            <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                <input type="text" class="campo campotexto"  obligatorio="true" id="TASA" name="TASA" style="width:80%"
                                                                value="<fmt:formatNumber type='number' maxFractionDigits='10' minFractionDigits= '2' value='${__formdata.TASA}' />" <axis:atr f="axisrea036" c="TASA" a="modificable=true&formato=decimal"/> />
                                                           </td>                                               
                                                  </axis:ocultar>
                                                      
                                            </tr>
                                                   
                            </table>
                        </td>
                    </tr>
                </table>
                                                          
                                                                        
                                     <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea036</c:param><c:param name="f">axisrea036</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
     
   </body>
</html>