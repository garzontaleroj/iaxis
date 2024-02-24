<%/*
*  Fichero: axiscaj009.jsp
*
*  Fecha: 29/06/2009
*/
%>
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
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>    
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script> 
        <c:import url="../include/carga_framework_js.jsp"/>        
        <script type="text/javascript">
        
            function f_onload() {
                f_cargar_propiedades_pantalla();
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj009.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj009.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj009", "cancelar", document.miForm, "_self");            
            }
            
            function f_but_9000632() {
                // ini Bug 32661/0189343 - 17/10/2014 - JMF Validar que no supere fecha del dia
                var fecha=document.getElementById("FECHA").value;
                var sDia0 = fecha.substr(0, 2);  
                var sMes0 = fecha.substr(3, 2);  
                var sAno0 = fecha.substr(6, 4);  
                var stot0 = sAno0 + sMes0 + sDia0;
               
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; //January is 0!
                var yyyy = today.getFullYear();
                  
                if(dd<10){dd='0'+dd} 
                if(mm<10){mm='0'+mm} 
                var hoy = "" + yyyy + mm + dd;
                
                //alert("fecha=" + stot0 + " hoy=" + hoy );

                if (stot0 > hoy) {
                    alert("<axis:alt f="axiscaj009" c="ALERT2_PANTALLA" lit="109208"/>");    
                }
                else {
                // fin Bug 32661/0189343 - 17/10/2014 - JMF
                if (objValidador.validaEntrada()){
                  var params = f_get_params();
                 objUtiles.ejecutarFormulario("axis_axiscaj009.do?PPARAMS="+params+"&operation=ejecutar", "ejecutar", document.miForm, "_self", '<axis:alt f="axiscaj009" c="MSG_CARGAR" lit="9901019"/>');   
                }
            }
            }

            function f_but_9905069() {
                // ini Bug 32661/0189343 - 17/10/2014 - JMF Validar que no supere fecha del dia
                var fecha=document.getElementById("FECHA").value;
                var sDia0 = fecha.substr(0, 2);  
                var sMes0 = fecha.substr(3, 2);  
                var sAno0 = fecha.substr(6, 4);  
                var stot0 = sAno0 + sMes0 + sDia0;
               
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; //January is 0!
                var yyyy = today.getFullYear();
                  
                if(dd<10){dd='0'+dd} 
                if(mm<10){mm='0'+mm} 
                var hoy = "" + yyyy + mm + dd;
                
                //alert("fecha=" + stot0 + " hoy=" + hoy );

                if (stot0 > hoy) {
                    alert("<axis:alt f="axiscaj009" c="ALERT2_PANTALLA" lit="109208"/>");    
                }
                else {
                    if (objValidador.validaEntrada()){
                      var params = f_get_params();
                     objUtiles.ejecutarFormulario("axis_axiscaj009.do?PPARAMS="+params+"&operation=cierre", "cierre", document.miForm, "_self", '<axis:alt f="axiscaj009" c="MSG_CIERRE" lit="9905069"/>');   
                    }
                }                    
            }

            
            function f_get_params(){
                var inputs = document.getElementsByTagName("input");
                var params = "";
                for(var i=0;i<inputs.length;i++){
                    if(inputs[i].attributes.length>0) {
                        var inputId = inputs[i].getAttribute("id");
                        if(inputs[i].getAttribute("type") != "button" && 
                          (!objUtiles.estaVacio(inputs[i].getAttribute("paramMap")) && 
                           inputs[i].getAttribute("paramMap") == "true")){
                            if (objDom.esVisible(inputId)){
                                if (objUtiles.estaVacio(objDom.getValorPorId(inputId)) ||
                                   (!objUtiles.estaVacio(objDom.getValorPorId(inputId)) &&
                                    objDom.getValorPorId(inputId) < 0 ) ){
                                    params = params+"|"+inputId+":";
                               }else{
                                    valor = objDom.getValorPorId(inputId);
                                    if (inputs[i].getAttribute('formato') == 'fecha')
                                        valor = formateaFechaToString(valor);
                            
                                    if (inputs[i].getAttribute('type') == 'radio'){
                                        if (objDom.getComponenteMarcado(inputs[i])){
                                             params = params+"|"+inputId+":"+valor;                        
                                        }
                                    }else params = params+"|"+inputId+":"+valor;                        
                                }
                            }
                        }         
                    }
                }
                            
                var selects = document.getElementsByTagName("select");
                for(var i=0;i<selects.length;i++){
                    if(selects[i].attributes.length>0) {
                        var selectId = selects[i].getAttribute("id");
                        if (objDom.esVisible(selectId) ){
                            if(selects[i].getAttribute("type") != "button" &&
                              (!objUtiles.estaVacio(selects[i].getAttribute("paramMap")) && 
                               selects[i].getAttribute("paramMap") == "true")){
                               if ( objUtiles.estaVacio(objDom.getValorPorId(selectId))||
                                  (!objUtiles.estaVacio(objDom.getValorPorId(selectId)) &&
                                   objDom.getValorPorId(selectId) < 0 ) ){
                                   params = params+"|"+selectId+":";
                               }else{
                                   params = params+"|"+selectId+":"+objDom.getValorPorId(selectId);
                               }
                             }    
                         }
                    }
                }
            return params+"|";
        }
        
        function formateaFechaToString (entrada){
            var enValue = entrada;
            var utiles = new JsUtiles();
            // Convertimos separadores a / , si tiene
            var splitValue = utiles.replaceAll(utiles.replaceAll(enValue,'-','/'),'.','/').split('/');//enValue.replace('-','/').replace('.','/').split('/');
            var dia, mes, any;
            if (splitValue.length == 3) {
                // dd/mm/yyyy o dd/mm/yy
                dia = splitValue[0];
                mes = splitValue[1];
                any = splitValue[2];		
            }else{
                // ddmmyyyy o dd/mm/yy
                dia = enValue.substring(0,2);
                mes = enValue.substring(2,4);
                any = enValue.substring(4,enValue.length);
            }
		
            if (dia < 10 && dia.length == 1)
                // Ex. Dia = 5
                dia = "0" + dia;
			
            if (mes < 10 && mes.length == 1)
                // Ex. Mes = 5
                mes = "0" + mes;
                	
            if (any.length != 4)
                // Ex. Any = 02
                // Ex. Any = 98
                if (any > 50) 
                    // Ex. Any = 98 --> 1998
                    any = parseInt(any,10) + 1900;
                else
                    // Ex. Any = 02 --> 2002
                    any = parseInt(any,10) + 2000;
            return (dia + "" + mes + "" + any);
        }
        
         function f_imprimir_fitxer(pfitxer){
                var lpfitxer= objDom.getValorPorId("SORTIDA_"+pfitxer);
                lpfitxer = lpfitxer.replace(/\\/gi, "barrainvertida");
                lpfitxer= lpfitxer.replace(/barrainvertida/gi, "/"); 
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?origen=axisint001.jsp&operation=tunnel&file="+lpfitxer,600,200);
        }     
       </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axiscaj009" c="TIT_AXISIMPRIMIR" lit="1000205" />|true</c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj009.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><b><axis:alt f="axiscaj009" c="TITULO_FORM" lit="9905069"/></b></c:param>    
                <c:param name="formulario"> <b><axis:alt f="axiscaj009" c="TITULO_FORM" lit="9905069"/></b></c:param> 
                <c:param name="form">axiscaj009</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr075" c="IMP_DOCUMENTOS" lit="1000205" />|true</c:param>
            </c:import>
            <axis:visible c="DSP_CUENTAS" f="axiscaj009"> 
           <!-- MMS 20140825 El codigo del MAP no debe ir Hardcored  -->
           <!--    <input type="hidden" name="CLISTADO" id="CLISTADO" value="737"/>   -->
               <input type="hidden" name="CLISTADO" id="CLISTADO" value="${LISTADOS[0].CMAP}"/>

              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:40%;height:0px"></th>
                 </tr>
                 <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj009" c="CUSUARI" lit="9905097"/></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj009" c="FECHA" lit="100562"/></b>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <input type="text" class="campo campotexto_ob" value="${__formdata.CUSUARI}"  name="CUSUARI" id="CUSUARI" size="15"
                               style="width:50%" paramMap="true" <axis:atr f="axiscaj009" c="CUSUARI" a="obligatorio=true"/> title="<axis:alt f="axiscaj009" c="CUSUARI" lit="9905097"/>" />
                    </td>
                    <td>
                        <input  type="text" paramMap="true" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHA}"/>" 
                                name="FECHA" id="FECHA" style="width:50%;" title= "<axis:alt f="axiscaj009" c="FECHA" lit="100562"/>"  
                                <axis:atr f="axiscaj009" c="FECHA" a="obligatorio=true&formato=fecha"/> />
                            <a style="vertical-align:middle;">
                                <img id="popup_calendario_FECHA" alt="<axis:alt f="axiscaj009" c="FECHA" lit="100562"/>"  
                                     src="images/calendar.gif" 
                            </a>
                    </td>
                </tr>
            </table>
        </axis:visible>    
        <div class="separador">&nbsp;</div>   
        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
        
        <c:if test="${!empty __formdata.LIST_FICHEROS}">
                                
                               
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        
                                    </tr>    
                                    <tr>
                                        <td colspan="7">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><b><axis:alt f="axislist002" c="TIT_FITX" lit="9901019"/> </b>
                                            </div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero" colspan="3">
                                        <%int cont = 0;%>
                                         <c:set var="title0"><axis:alt f="axislist002" c="FICHERO" lit="1000574"/>  </c:set>
                                          <div class="seccion displayspace">
                                              <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axislist002.do?paginar=true" style="width:99.9%">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <c:set var="i"><%=cont%></c:set>
                                            <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                               <a href="javascript:f_imprimir_fitxer('${i}')">${OBFICHERO}</a>
                                               <input type="hidden" 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   class="campowidthinput campo campotexto" size="15"  name="SORTIDA_${i}" id="SORTIDA_${i}"
                                                   value="${OBFICHERO}"/>                                     
                                            </display:column>   
                                            <% cont ++ ;%>
                                            </display:table>
                                            </div>
                        
                                          </td> 
                                    </tr>
                                </table>
                                </c:if>
    </form>  
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FECHA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FECHA", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>     
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj009</c:param>
    <c:param name="__botones">salir,9000632,9905069</c:param> 
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


