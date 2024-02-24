<%/**
*  Fichero: axiscaj017.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*  
*  Detalle cuenta técnica
*
*
*  Fecha: 09/07/2009
*/
%>

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
    <title><axis:alt f="axiscaj017" c="TRATAMIENTOS" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
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
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
          //  reformatearImportes();
            ok = "${__formdata.OK}";
             if (!objUtiles.estaVacio(ok) ){
                parent.f_aceptar_axiscaj017();
             }
            
          }
          
   
          
          function f_recargar(){
               //  f_validaImport();
                 //reformatearImportes();
                 objUtiles.ejecutarFormulario ("modal_axiscaj017.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    

          }
       

        function f_but_cancelar() {
          //  f_validaImport();
            //reformatearImportes();
            objAjax.invokeAsyncCGI("modal_axiscaj017.do", callbackSalir, "operation=salir", this);
        }
        
        function callbackSalir() {
           parent.f_cerrar_axiscaj017();
        }
        
        function f_but_aceptar(){
          
         if (objValidador.validaEntrada()) {
              //   f_validaImport();
               // reformatearImportes();
                 objUtiles.ejecutarFormulario ("modal_axiscaj017.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
         }
        }
        function f_but_guardar(){
         
             if (objValidador.validaEntrada()) {
             //  var error =  f_validaImport();
                //  if (error == 0){
                 objUtiles.ejecutarFormulario ("modal_axiscaj017.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                // }
            }
        }
        function f_abrir_axisadm002(){
        objUtiles.abrirModal("axisadm002","src","axis_axisadm002.do?operation=init&isModal=1");
        }
    
        function f_abrir_sinistres(){
        objUtiles.abrirModal("axissin002","src","modal_axissin002.do?operation=form");
        }
        
        function f_seleccionarRecibo(NRECIBO){
            objUtiles.cerrarModal("axisadm002");
            document.miForm.NRECIBO.value = NRECIBO;
        }
        
        function f_aceptar_axissin002(NSINIES,SSEGURO){
            objUtiles.cerrarModal("axissin002");
            document.miForm.NSINIES.value = NSINIES;
        }
        
        function f_cerrar_axisadm002(){
            objUtiles.cerrarModal("axisadm002");
        }
        
        function f_cerrar_axissin002(){
            objUtiles.cerrarModal("axissin002");
        }
        
        function f_cerrar_axisctr019(){
            objUtiles.cerrarModal("axisctr019");
        }
        
        function f_aceptar_axisctr019(SSEGURO){
            objUtiles.cerrarModal("axisctr019");
            document.miForm.SSEGURO.value = SSEGURO;
            f_recargar();
        }
        
        function f_abrir_axisctr019(){
            objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
        
        function f_actSSEGURO(){
           document.miForm.SSEGURO.value = '';
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
                
        function f_cambiar(){
            f_cargar_propiedades_pantalla();
        }
        
        function reformatearImportes(){
             objDom.setValorPorId("IIMPORT",valorFormateadoCampoNumerico(objDom.getValorPorId("IIMPORT"),true,true));
        } 
        
        
            function f_stripInvalidChars( str ){
                str =str.toUpperCase() + '';
                var rgx = /^[\060-\071]|[\101-\132]|[\141-\172]|[\055]$/i;
                var out = '';
                for( var i = 0; i < str.length; i++ ){
                    if( rgx.test( str.charAt(i) ) ){
                        out += str.charAt(i);
                    }
                }
                return out;
            }
            
            function f_cleanInvalidChars(idobject){
                var value="";
                value=f_stripInvalidChars(objDom.getValorPorId(idobject));
                objDom.setValorPorId(idobject,value);
            }
    </script>    
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="PMODO"  id="PMODO"   value="${__formdata.PMODO}"/>
        <input type="hidden" name="CMANUAL"  id="CMANUAL"   value="${__formdata.CMANUAL}"/>
        <input type="hidden" name="CEMPRES"   value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="SSEGURO"   value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="MEDIOPAGO" name="MEDIOPAGO" value="${__formdata.MEDIOPAGO}"/>   

        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axiscaj017" c="PAGOS" lit="109479"/></c:param>     <%-- Detall compta tècnica --%>
                <c:param name="form">axiscaj017</c:param>
        </c:import>        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947" /></c:param>
                <c:param name="nid" value="axisadm002" />
         </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947" /></c:param>
                <c:param name="nid" value="axissin002" />
         </c:import>
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947" /></c:param>
                <c:param name="nid" value="axisctr019" />
         </c:import>
           
           
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                          <table class="area" align="center">                             
                            <tr>
                                        <td class = "campocaja" colspan="5" >
                                      <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axiscob001" c="PAG_MASIV" lit="9902938"/>
                </div>
                                        </td>
                                     </tr>
                            <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>                                
                                <th style="width:25%;height:0px"></th>   
                            </tr>
                             
                            <tr>
                                <axis:ocultar f="axiscaj017" c="CMETMOV" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CMETMOV">
                                       <b id="label_CMETMOV" ><axis:alt f="axiscaj001" c="CMETMOV" lit="9902938"/></b>
                                    </td>
                                </axis:ocultar>
                                  <axis:ocultar f="axiscaj017" c="IMOVIMI" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj017" c="IMOVIMI" lit="9000475"/></b>
                                    </td>
                                </axis:ocultar>                               
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CMETMOV" dejarHueco="false"> 
                                    <td class="campocaja"  id = "td_CMETMOV">
                                        <select name="CMETMOV" id="CMETMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axiscaj001" c="CMETMOV" lit="9902938"/>" onchange="f_cambiar();"
                                            <axis:atr f="axiscaj001" c="CMETMOV" a="obligatorio=true&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
                                                <option value="${medio_mov.CATRIBU}"
                                                <c:if test="${__formdata.CMETMOV == medio_mov.CATRIBU}">selected</c:if>>
                                                ${medio_mov.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj017" c="IMOVIMI" >
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  name="IMOVIMI" id="IMOVIMI" 
                                             title="<axis:alt f="axiscaj001" c="IMOVIMI" lit="9000475"/>"
                                                 <axis:atr f="axiscaj001" c="IMOVIMI" a="obligatorio=true&formato=decimal"/> 
                                                 formato="decimal"
                                               size="15"  
                                               value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMOVIMI}"/>" />
                                    </td>                                    
                                </axis:ocultar>
                            </tr>
                           
                            <tr>
                             <axis:ocultar f="axiscaj001" c="NCHEQUE" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_NCHEQUE">
                                       <b id="label_NCHEQUE" ><axis:alt f="axiscaj001" c="NCHEQUE" lit="9905071"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCHQORI" dejarHueco="false"> 
                                    <td class="titulocaja" id="tit_CCHQORI">
                                       <b id="label_CCHQORI"><axis:alt f="axiscaj001" c="CCHQORI" lit="9905072"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                             <axis:ocultar f="axiscaj001" c="NCHEQUE" dejarHueco="false" >
                                    <td class="campocaja" id = "td_NCHEQUE">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" 
                                              <axis:atr f="axiscaj001" c="NCHEQUE" a="obligatorio=true"/> 
                                               onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                               title="<axis:alt f="axiscaj001" c="NCHEQUE" lit="9905071"/>" size="15" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCHQORI" >
                                    <td class="campocaja" id = "td_CCHQORI">
                                        <select name="CCHQORI" id="CCHQORI" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CCHQORI" lit="9905072"/>"
                                            <axis:atr f="axiscaj001" c="CCHQORI" a="obligatorio=true&isInputText=false"/> >
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="cheque_ori" items="${__formdata.BANCOS}">
                                                <option value="${cheque_ori.CBANCO}"
                                                <c:if test="${__formdata.CCHQORI == cheque_ori.CBANCO}">selected</c:if>>
                                                ${cheque_ori.TBANCO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                           
                            
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CBANTRANS" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CBANTRANS">
                                       <b id="label_CBANTRANS"><axis:alt f="axiscaj001" c="CBANTRANS" lit="9000964"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCC" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CCC"> 
                                       <b id="label_CCC"><axis:alt f="axiscaj001" c="CCC" lit="9903154"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CBANTRANS" >
                                    <td class="campocaja" id = "td_CBANTRANS">
                                        <select name="CBANTRANS" id="CBANTRANS" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CBANTRANS" lit="9000964"/>"
                                            <axis:atr f="axiscaj001" c="CBANTRANS" a="obligatorio=true&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="bancos" items="${__formdata.BANCOS}">
                                                <option value="${bancos.CBANCO}"
                                                <c:if test="${__formdata.CBANTRANS == bancos.CBANCO}">selected</c:if>>
                                                ${bancos.TBANCO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="CCC" >
                                    <td class="campocaja" id = "td_CCC">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCC}" name="CCC" id="CCC" 
                                              <axis:atr f="axiscaj001" c="CCC" a="obligatorio=true"/> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axiscaj001" c="CCC" lit="9903154"/>"  size="15" />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CTIPTAR" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CTIPTAR"> 
                                       <b id="label_CTIPTAR"><axis:alt f="axiscaj001" c="CTIPTAR" lit="9902671"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="NTARGET" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_NTARGET"> 
                                       <b id="label_NTARGET"><axis:alt f="axiscaj001" c="NTARGET" lit="9902646"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="FCADTAR" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_FCADTAR"> 
                                       <b id="label_FCADTAR"><axis:alt f="axiscaj001" c="FCADTAR" lit="9902236"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axiscaj001" c="CTIPTAR" >
                                    <td class="campocaja" id = "td_CTIPTAR">
                                        <select name="CTIPTAR" id="CTIPTAR" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CTIPTAR" lit="9902671"/>"
                                            <axis:atr f="axiscaj001" c="CTIPTAR" a="obligatorio=true&modificable=false&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="tiposTar" items="${__formdata.LSTCTIPTAR}">
                                                <option value="${tiposTar.CATRIBU}"
                                                <c:if test="${__formdata.CTIPTAR == tiposTar.CATRIBU}">selected</c:if>>
                                                ${tiposTar.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj001" c="NTARGET" >
                                    <td class="campocaja" id = "td_NTARGET">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NTARGET}" name="NTARGET" id="NTARGET" 
                                            <axis:atr f="axiscaj001" c="NTARGET" a="obligatorio=true&isInputText=false&formato=entero"/>
                                            title="<axis:alt f="axiscaj001" c="NTARGET" lit="9902646"/>" size="15" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar c="FCADTAR" f="axiscaj001" dejarHueco="false">
                                    <td class="campocaja" id = "td_FCADTAR">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" 
                                          <axis:atr f="axiscaj001" c="FCADTAR" a="obligatorio=true&isInputText=false&modificable=false"/>
                                               title="<axis:alt f="axiscaj001" c="FCADTAR" lit="9902236"/>"
                                               value="${__formdata.FCADTAR}" name="FCADTAR" id="FCADTAR" 
                                               readonly="readonly"
                                               style="width:40%;;" alt="<axis:alt f="axiscaj001" c="FCADTAR" lit="9902236"/>" title="<axis:alt f="axisadm036" c="FCADTAR" lit="9902236"/>" />
                                     <a id="icon_FCADTAR" style="vertical-align:middle;" href="#"><img id="popup_calendario_FCADTAR" alt="<axis:alt f="axiscaj001" c="SEL_FCADTAR" lit="9902236"/>" title="<axis:alt f="axiscaj001" c="ALT_FCADTAR" lit="9902236" />" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:ocultar>
                            </tr>
                    </table>
                </td>
            </tr>
        </table>
        </tr>
    </td>
    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscaj017</c:param>
		<c:param name="__botones">cancelar<axis:visible c="BT_GUARDAR" f="axiscaj017">,guardar</axis:visible></c:param> 
        </c:import>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FVALOR",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FVALOR", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    </form>

    <c:import url="../include/mensajes.jsp"/>

</body>
</html>