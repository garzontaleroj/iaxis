<%--
      NOMBRE:    axisctr165.jsp
      Fecha: 16/11/2010
      PROPÓSITO Pantalla de parametros de clausulas
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        16/11/2010   JBN              1. Creación de la pantalla. Bug.16510
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
                if (!objUtiles.estaVacio(document.getElementById('ERROR').value)) {
                    var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
                    if (document.getElementById('ERROR').value == 0){
                        if (!hayErrores){
                            parent.f_Nueva_Liquidacion('axisctr165', objDom.getValorPorId("SPROLIQ_SEL"));
                        }
                    }
                }
                    var hayOBJ = ${!empty __formdata.POB_LIQUIDA};
                    if (hayOBJ){
                        document.getElementById('OBSERV').value = '${__formdata.POB_LIQUIDA.TLIQUIDA}';
                        document.getElementById('FINILIQ').value = '<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.POB_LIQUIDA.FINILIQ}"/>';
                        document.getElementById('FFINLIQ').value = '<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.POB_LIQUIDA.FFINLIQ}"/>';
                        document.getElementById('CCOMPANI').value = '${__formdata.POB_LIQUIDA.CCOMPANI}';
                        document.getElementById('IMPORTE').value = '<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.POB_LIQUIDA.IMPORTE}'/>';
                        document.getElementById('NMES').value = parseInt('<fmt:formatDate pattern="M" value="${__formdata.POB_LIQUIDA.FLIQUIDA}"/>');
                        document.getElementById('NANO').value = '<fmt:formatDate pattern="yyyy" value="${__formdata.POB_LIQUIDA.FLIQUIDA}"/>';
                    }
                    
                
	 	f_cargar_propiedades_pantalla();
                
            }
           function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                    //Netejem la variable error
                    document.getElementById('ERROR').value = "";
                    //Si es modificar
                    var hayOBJ = ${!empty __formdata.POB_LIQUIDA};
                    if (hayOBJ){
                        objUtiles.ejecutarFormulario("modal_axisctr165.do", "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);   
                    }else{
                        objUtiles.ejecutarFormulario("modal_axisctr165.do", "nuevo", document.miForm, "_self", objJsMessages.jslit_cargando);   
                    }
                    
                }
           }
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisctr165');
           }
            
          function f_get_fecha(){
            
            if (!objUtiles.estaVacio(document.getElementById('CCOMPANI').value) &&
            !objUtiles.estaVacio(document.getElementById('NMES').value ) &&
            !objUtiles.estaVacio(document.getElementById('NANO').value )){
            
                var param = "?CCOMPANI="+document.miForm.CCOMPANI.value;
                 param = param+"&NMES="+document.miForm.NMES.value;
                 param = param+"&NANYO="+document.miForm.NANO.value;
            objAjax.invokeAsyncCGI("modal_axisctr165.do"+param, callbackAjax, "operation=get_fecha", this, objJsMessages.jslit_actualizando_registro);
            }
          }
          
         
            
            function callbackAjax(ajaxResponseText){
                 var jDate = new JsFecha();
                var doc=objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                   objDom.setValorComponente(document.miForm.FINILIQ, objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINILIQ"), 0, 0));  
                 }            
            }
          
          function f_verificar(){
           if (( objUtiles.estaVacio(document.getElementById('CCOMPANI').value)  ||    document.getElementById('CCOMPANI').value<0  )  ||
            objUtiles.estaVacio(document.getElementById('NMES').value ) ||
            objUtiles.estaVacio(document.getElementById('NANO').value )){
            alert('<axis:alt f="axisctr165" c="VAL_FECHA" lit="9001768"/>');
            document.getElementById('NANO').focus();
            }
          
          }
          
        function f_actData(thiss){
           thiss.value = f_formatdate(thiss);
        }     
        function f_formatdate(entrada){
         var jDate = new JsFecha();

         if (!jDate.validaFecha(entrada.value)
         || entrada.value.indexOf("/") == -1
         ){
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
        }
        return entrada.value;
        }
         
          function validarNumeros(IMPORTE){
                 if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                     if(objNumero.validaNumero(IMPORT, true)){
                         return this.formateaNumeroCero(IMPORT, true);
                     }
                     else{
                         return   '';
                     }
                 }
                 else return IMPORTE;
             }
             
            function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
            function f_formatear(thiss){
                thiss.value = validarNumeros(thiss.value);
            }
            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="ERROR" name="ERROR" value="${__formdata.ERROR}"/>
            <input type="hidden" id="SPROLIQ_SEL" name="SPROLIQ_SEL" value="${__formdata.SPROLIQ_SEL}"/>
            <input type="hidden" id="SPROCES" name="SPROCES" value="${__formdata.POB_LIQUIDA.SPROLIQ}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisctr165" lit="9901676"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisctr165" lit="9901676"/></c:param>
                <c:param name="form">axisctr165</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:visible f="axisctr165" c="CCOMPANI">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr165" c="CCOMPANI" lit="9000600"/></b> <%-- Mes --%>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisctr165" c="NMES">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr165" c="MES" lit="9000495"/></b> <%-- Mes --%>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisctr165" c="NANO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr165" c="ANY" lit="101606"/></b> <%-- Any --%>
                                </td>
                                </axis:visible>
                            </tr>
                           
                            <tr>
                             <axis:ocultar f="axisctr079" c="CCOMPANI" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CCOMPANI"  obligatorio="true" id ="CCOMPANI" size="1" class="campowidthselect campo campotexto" onchange="f_get_fecha()" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr165" c="COMBO_SVN" lit="1000348"/> - </option>
                                    <c:forEach var="CIA" items="${__formdata.CIAS}">
                                        <option value="${CIA.CCOMPANI}"
                                        <c:if test="${!empty __formdata.CCOMPANI && CIA.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if>>
                                        ${CIA.TCOMPANI}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                                <axis:visible f="axisctr165" c="NMES">
                                <td class="campocaja">
                                        <select name = "NMES" id ="NMES" onchange="f_get_fecha()"
                                            title="<axis:alt f="axisctr165" c="NMES" lit="9000495"/>"
                                            class="campowidthselect campo campotexto" obligatorio="true">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr165" c="COMBO_SNV" lit="108341"/> - </option> 
                                            <c:forEach items="${__formdata.LSTMESESCARTERA2}" var="mes">
                                                <option value = "${mes.CATRIBU}" <c:if test="${mes.CATRIBU  == __formdata.NMES}">selected</c:if>>${mes.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                 </td>
                            </axis:visible>
                            <axis:visible f="axisctr165" c="NANO">
                            <td class="campocaja">
                                        <input type="text" onchange="f_get_fecha()" class="campowidthinput campo campotexto" style="width:95%" size="15" value="${__formdata.NANO}" name="NANO" id="NANO"
                                         title="<axis:alt f="axisctr165" c="NANO" lit="101606"/>" obligatorio="true"/>
                             </td>
                            </axis:visible>
                           
                            </tr>
                             <tr>
                                <axis:ocultar f="axisctr165" c="FINILIQ">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr165" c="FINILIQ" lit="9000526"/></b> <%-- Mes --%>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr165" c="FFINLIQ">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr165" c="FFINLIQ" lit="9000527"/></b> <%-- Any --%>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr165" c="IMPORTE">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr165" c="IMPORTE" lit="100563"/></b> <%-- Any --%>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <TR>
                            <axis:ocultar f="axisctr165" c="FINILIQ">
                             <td class="campocaja">    
                                    <input type="text" onfocus="f_verificar();" obligatorio="true" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINILIQ}"/>" name="FINILIQ" id="FINILIQ"
                                    title="<axis:alt f="axisctr165" c="FINILIQ" lit="9000526"/>"
                                    <axis:atr f="axisctr165" c="FINILIQ" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                    id="icon_FINILIQ" alt="<axis:alt f="axisctr165" c="FINILIQ" lit="9000526"/>" title="<axis:alt f="axisctr165" c="FINILIQ" lit="9000526"/>" src="images/calendar.gif"/></a>
                                </td>
                                 </axis:ocultar>
                                <axis:ocultar f="axisctr165" c="FFINLIQ">
                                 <td class="campocaja">    
                                    <input type="text"  obligatorio="true" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINLIQ}"/>" name="FFINLIQ" id="FFINLIQ"
                                    title="<axis:alt f="axisctr165" c="FFINLIQ" lit="9000527"/>"
                                    <axis:atr f="axisctr165" c="FFINLIQ" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                    id="icon_FFINLIQ" alt="<axis:alt f="axisctr165" c="FFINLIQ" lit="9000527"/>" title="<axis:alt f="axisctr165" c="FFINLIQ" lit="9000527"/>" src="images/calendar.gif"/></a>
                                </td>
                                 </axis:ocultar>
                                 
                                 <axis:ocultar f="axisctr165" c="IMPORTE">
                                 <td class="campocaja">    
                                    <input type="text"  obligatorio="false" class="campowidthinput campo campotexto" size="15" style="width:80%;"
                                    value="${__formdata.IMPORTE}" name="IMPORTE" id="IMPORTE" onchange="f_formatear(this)"
                                    title="<axis:alt f="axisctr165" c="IMPORTE" lit="100563"/>"
                                    <axis:atr f="axisctr165" c="IMPORTE" a="formato=decimal"/> />
                                </td>
                                 </axis:ocultar>
                                        
                            </tr>
                            <tr>
                                <td colspan="4" style="width:100%;" class="campocaja">
                                       <axis:ocultar c="OBSERV" f="axisctr165" dejarHueco="false">
                                           <b><axis:alt f="axisctr165" c="OBSERV" lit="101162"/></b> <%-- Observaciones --%> 
                                       </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <tr>
                                   <td colspan="4" style="width:100%;" class="campocaja">
                                       <axis:ocultar c="OBSERV" f="axisctr165" dejarHueco="false">
                                            <textarea class="campowidthinput campo campotexto_ob" style="width:100%;" name="OBSERV" id="OBSERV">${__formdata.OBSERV}</textarea>
                                       </axis:ocultar>
                                    </td>
                                </tr>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    
     </form>
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FINILIQ",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINILIQ", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FFINLIQ",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FFINLIQ",  
            singleClick    :    true,
            firstDay       :    1
        });
        
        
    </script> 

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr165</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr165" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisctr165" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


