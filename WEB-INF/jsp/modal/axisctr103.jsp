<%/**
*  Fichero: axisctr103.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*
*   pantalla del flujo de trabajo "Contratación póliza". 
*
* 	
*  Pantalla de contratación para el producto de saldo deutores.
*
*
*  Fecha: 27/07/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                var OK = "${__formdata.OK}";
                
                if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisctr103();
                
                revisarEstilos();
            }
            
            function f_but_cancelar() {
                 parent.f_cerrar_axisctr103();
            }
            function f_but_nuevo(){
                document.miForm.ISALDO.value  = objNumero.cambiarSeparadorMilesPorDecimales(document.miForm.ISALDO.value);
               if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario ("modal_axisctr103.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }             
            
  		/**
        * Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
        * @param {Object} valor a validar
        * @param {Boolean} isDecimal: true->es decimal, false->no es decimal
        * @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
        * @return {String} Valor obtenido de la validación y formateo
        */
        function valorFormateadoCampoNumerico (entrada, isDecimal, tienePuntoMiles){
            if (objNumero.validaNumero(entrada, isDecimal)){
                // Validación correcta, formatear valor 
                entrada = objNumero.formateaNumero(entrada, isDecimal);  
                if(!tienePuntoMiles) entrada = objNumero.quitarSeparadorMiles(entrada);
                
            }else{
                return '';
            }
            
            return entrada;
        }
                
        function reformatearImportes(){
             objDom.setValorPorId("ISALDO",valorFormateadoCampoNumerico(objDom.getValorPorId("ISALDO"),true,false));
        }
                    
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
            <input type="hidden" name="isSimul" value="${__formdata.isSimul}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><axis:alt c="TTITULO" f="axisctr103" lit="9900870"/></c:param>
                <c:param name="form">axisctr103</c:param>
            </c:import>
            <!-- Area de campos  -->
             <div class="separador">&nbsp;</div>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              
                <tr>
                    <td>
                     <div class="titulo">
                         <div style="float:left;">
                               <img src="images/flecha.gif"/> <axis:alt c="TTITULO" f="axisctr103" lit="9900870"/>
                            </div>
                            
                            <div style="clear:both;">
                                
                            </div>
                      </div>
                     <table class="seccion">
                           <tr>
                           <td align="left">
                   
                        <!--campos-->
                         
                        <table class="area" align="center">
                            <tr>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                            </tr>
                          <tr>
                             <axis:ocultar c="IDCUENTA" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><fmt:message key="1000109" /></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar c="CTIPIMP" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><fmt:message key="9002015" /></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar c="CTIPCON" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt c="LIT_CTIPCON" f="axisctr103" lit="9900883"/></b>
                                </td>
                             </axis:ocultar>
                              <axis:ocultar c="ISALDO" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="LIT_ISALDO" f="axisctr103" lit="1000073"/></b>
                                </td>
                             </axis:ocultar>
                             
                               
                            </tr>
                            <tr>
                           
                                <axis:ocultar c="IDCUENTA" f="axisctr103" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text"  class="campo campotexto" style="width:90%;" size="15" value="${__formdata.IDCUENTA}" name="IDCUENTA" id="IDCUENTA"
                                         <axis:atr f="axisctr103" c="IDCUENTA" a="obligatorio=true&modificable=true"/> />
                                 </td>                            
                                </axis:ocultar>
                                 <axis:ocultar c="CTIPIMP" f="axisctr103" dejarHueco="false">
                                  <td class = "campocaja" >
                                     <select name = "CTIPIMP" id="CTIPIMP" 
                                            class="campowidthselect campo campotexto" title=""
                                            <axis:atr f="axisctr103" c="CTIPIMP" a="obligatorio=true&isInputText=false"/>>
                                        &nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option> 
                                        <c:forEach var="element"
                                                   items="${__formdata.listvalores.lsttipimp}">
                                            <option value="${element.CATRIBU}"
                                                    <c:if test="${__formdata.CTIPIMP == element.CATRIBU}"> selected="selected"</c:if>>
                                                ${element.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                 </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="CTIPCON" f="axisctr103" dejarHueco="false">
                                  <td class = "campocaja" colspan="2" >
                                     <select name = "CTIPCON" id="CTIPCON" 
                                            class="campowidthselect campo campotexto" title=""
                                            <axis:atr f="axisctr103" c="CTIPCON" a="obligatorio=true&isInputText=false"/>>
                                        &nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option> 
                                        <c:forEach var="element"
                                                   items="${__formdata.listvalores.lsttipcon}">
                                            <option value="${element.CATRIBU}"
                                                    <c:if test="${__formdata.CTIPCON == element.CATRIBU}"> selected="selected"</c:if>>
                                                ${element.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                 </td>
                                 </axis:ocultar>
                                 <axis:ocultar f="axisctr103" c="ISALDO" dejarHueco="false">
                                      <td class = "campocaja">
                                                <input type="text"  class="campo campotexto" style="width:90%;"  value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISALDO}"/>" name="ISALDO" id="ISALDO"
                                                 <axis:atr f="axisctr103" c="ISALDO" a="obligatorio=true&modificable=true"/> />
                                      </td>    
                                 </axis:ocultar>
                                  
                            </tr>
                            <tr>
                            	<axis:ocultar c="DESCRIPCION" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><fmt:message key="100588" /></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar c="FINIPRES" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="LIT_FINIPRES" f="axisctr103" lit="9000526"/></b>
                                </td>
                             </axis:ocultar>
                             
                               <axis:ocultar c="FFINPRES" f="axisctr103" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="LIT_FFINPRES" f="axisctr103" lit="9000527"/></b>
                                </td>
                             </axis:ocultar>  
                            </tr>
                            <tr>
                            	<axis:ocultar c="DESCRIPCION" f="axisctr103" dejarHueco="false">
                                     <td class = "campocaja" colspan="2" >
                                            <input type="text"  class="campo campotexto" style="width:90%;" size="500" value="${__formdata.DESCRIPCION}" name="DESCRIPCION" id="DESCRIPCION"
                                             <axis:atr f="axisctr103" c="DESCRIPCION" a="obligatorio=true&modificable=true"/> />
                                     </td>                            
                                </axis:ocultar>
                            
                           <axis:ocultar f="axisctr103" c="FINIPREST">
                                            <td class="campocaja">
                                                <input type="text" style="width:60%" class="campowidthinput campo campotexto" id="FINIPREST" name="FINIPREST" size="15"
                                                value="<fmt:formatDate value='${__formdata.FINIPREST}' pattern='dd/MM/yyyy'/>" style="width:90%"
                                                <axis:atr f="axisctr103" c="FINIPRES" a="obligatorio=true&formato=fecha"/> /><a id="icon_FINIPRES" style="vertical-align:middle;" href="#"><img id="popup_calendario_FINIPRES" border="0" alt="<fmt:message key="108341" />" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
                                            </td>                                  
                             </axis:ocultar>
                               <axis:ocultar f="axisctr103" c="FFINPREST">
                                            <td class="campocaja">
                                                <input type="text" style="width:60%" class="campowidthinput campo campotexto"  id="FFINPREST" name="FFINPREST" size="15"
                                                value="<fmt:formatDate value='${__formdata.FFINPREST}' pattern='dd/MM/yyyy'/>" style="width:90%"
                                                <axis:atr f="axisctr103" c="FFINPRES" a="obligatorio=true&formato=fecha"/> /><a id="icon_FFINPRES" style="vertical-align:middle;" href="#"><img id="popup_calendario_FFINPRES" border="0" alt="<fmt:message key="108341" />" title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
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
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINIPREST",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIPRES", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FFINPREST",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINPRES",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>            
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr103</c:param>
                <c:param name="__botones"><axis:visible f="axisctr103" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisctr103" c="BT_NUEVO">,nuevo</axis:visible></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

