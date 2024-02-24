<%/*
*  Fichero: axisctr158.jsp
* vcl  - Traspasos diarios
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
    <title> <fmt:message key="9901354"/></title>  <%-- Traspasos diarios --%>
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
        
        function f_imprimir_fitxer(pfitxer){        
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
            //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
        }        
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
        }
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla();
             <c:if test="${empty __formdata.PFICHERO}">
                objDom.setVisibilidadPorId("SECCION_SALIDA", "hidden");                            
            </c:if>
            <c:if test="${!empty __formdata.PFICHERO}">
                objDom.setVisibilidadPorId("SECCION_SALIDA", "VISIBLE");                            
            </c:if>
        }
        
        function f_cargar_propiedades_pantalla(){
            f_cargapropietatexpander();
            f_cargar_valores_defecto();
            objDependencias.modificarPropiedadesSegunModificableYVisible();
            f_carga_dependencias();
            revisarEstilos();
            }


        function fechaMayorOIgualQue(fec0, fec1){  
            var bRes = false;  
            var sDia0 = fec0.substr(0, 2);  
            var sMes0 = fec0.substr(3, 2);  
            var sAno0 = fec0.substr(6, 4);  
            var sDia1 = fec1.substr(0, 2);  
            var sMes1 = fec1.substr(3, 2);  
            var sAno1 = fec1.substr(6, 4);  
            if (sAno0 > sAno1) bRes = true;  
            else {  
             if (sAno0 == sAno1){  
              if (sMes0 > sMes1) bRes = true;  
              else {  
               if (sMes0 == sMes1)  
                if (sDia0 >= sDia1) bRes = true;  
              }  
             }  
            }  
            return bRes;  
           }  
           
        function f_but_109006() { // Ejecutar
         if (objValidador.validaEntrada()) {            
                if ( !objUtiles.estaVacio(objDom.getValorPorId("FFIN")) && fechaMayorOIgualQue(objDom.getValorPorId("FINICIO"),objDom.getValorPorId("FFIN")))
                            alert('<fmt:message key="101922"/>'); 
                else
                    objUtiles.ejecutarFormulario ("axis_axisctr158.do", "ejecutar", document.miForm, "_self", objJsMessages.jslit_cargando);        
        }
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr158", "cancelar", document.miForm, "_self");
        }        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
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

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">        
            <c:param name="titulo"> <fmt:message key="9901354"/></c:param>     <%-- Traspasos diarios --%>
            <c:param name="formulario">  <fmt:message key="9901354"/></c:param> 
            <c:param name="form">axisctr158</c:param>
        </c:import>
        
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES2" id="CEMPRES2" value="${__formdata.CEMPRES2}"/>       
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><fmt:message key="103694"/>
                    </div>                    
                        <table class="area" align="center">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                 <axis:visible c="DADES_SECCIO" f="axisctr158">
                                    <table class="seccion" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>  
                                        <tr>
                                         <axis:ocultar c="CEMPRES" f="axisctr158" dejarHueco="false">
                                               <td class="titulocaja"  id="tit_CAMPO4"  >
                                                   <b id="label_CEMPRES"><axis:alt c="LIT_CEMPRES" f="axisctr158" lit="101619"/></b> <%-- Empresa --%>
                                               </td>
                                         </axis:ocultar>
                                        </tr>                                        
                                        <tr>
                                            <axis:ocultar f="axisctr158" c="CEMPRES" dejarHueco="false">                                   
                                                 <td class="campocaja">
                                                    <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto"  <axis:atr f="axisctr158" c="CEMPRES" a="modificable=true&obligatorio=true"/>
                                                    <c:if test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> disabled</c:if>>
                                                     >>&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                            <option value = "${element.CEMPRES}"
                                                            <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                                ${element.TEMPRES} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <%-- Fecha Inicial --%>                                        
                                            <axis:ocultar c="FINICIO" f="axisctr158" dejarHueco="false">
                                               <td class="titulocaja"  id="tit_FINICIO">
                                                   <b id="label_FINICIO"><axis:alt c="LIT_FINICIO" f="axisctr158" lit="9000526"/></b> <%-- Fecha Inicial --%>
                                               </td>
                                            </axis:ocultar>
                                            
                                            
                                              <%-- Fecha Final --%>
                                            <axis:ocultar c="FFIN" f="axisctr158" dejarHueco="false">
                                               <td class="titulocaja"  id="tit_FFIN"  >
                                                   <b id="label_FFIN"><axis:alt c="LIT_FFIN" f="axisctr158" lit="9000527"/></b> <%-- Fecha Final --%>
                                               </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
    
                                            <%-- Fecha Inicial --%>
                                            <axis:ocultar f="axisctr158" c="FINICIO" dejarHueco="false">  
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="<fmt:formatDate value='${__formdata.FINICIO}' pattern='dd/MM/yyyy'/>" name="FINICIO" id="FINICIO"
                                                    style="width:25%" <axis:atr f="axisctr158" c="FINICIO" a="formato=fecha&obligatorio=true"/>
                                                    title="<fmt:message key="9000526"/>" /><a id="icon_FINICIO" style="vertical-align:middle;"><img 
                                                    alt="<fmt:message key="108341"/>" title="<fmt:message key="9000526" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar>    
                                            
                                            
                                              <%-- Fecha Final --%>
                                            <axis:ocultar f="axisctr158" c="FFIN" dejarHueco="false">  
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="<fmt:formatDate value='${__formdata.FFIN}' pattern='dd/MM/yyyy'/>"  name="FFIN" id="FFIN"
                                                    style="width:25%;" <axis:atr f="axisctr158" c="FFIN" a="formato=fecha&obligatorio=true"/>
                                                    title="<fmt:message key="9000527"/>" /><a id="icon_FFIN" style="vertical-align:middle;"><img 
                                                    alt="<fmt:message key="108341"/>" title="<fmt:message key="9000527" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar>   
                                    </table>                                 
                                 </axis:visible>

                                <div class="separador">&nbsp;</div>
                                <axis:visible c="SORTIDA_SECCIO" f="axisctr158">
                                    <div id="SECCION_SALIDA">
                                        <table class="seccion" align="center">
                                            <tr>
                                                <th style="width:40%;height:0px"></th>
                                                <th style="width:5%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:5%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:5%;height:0px"></th>
                                                <th style="width:5%;height:0px"></th>
                                            </tr>                                        
                                            <tr> <%-- Fitxer generat--%>
                                                <axis:visible c="SORTIDA" f="axisctr158">
                                                   <td class="titulocaja"  id="tit_SORTIDA"  >
                                                       <b id="label_SORTIDA"><axis:alt c="LIT_SORTIDA" f="axisctr158" lit="107913"/></b> <%-- Fitxer generat--%>
                                                   </td>
                                                </axis:visible>
                                            </tr>
                                            <tr>
                                                <axis:visible c="SORTIDA" f="axisctr158">
                                                    <td class="campocaja" id="fichero">
                                                        <input type="text" readonly 
                                                               style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                               onclick="javascript:f_imprimir_fitxer(document.getElementById('SORTIDA').value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                               title="<fmt:message key="107913"/>" value="${__formdata.PFICHERO}"/>                                     
                                                    </td> 
                                                </axis:visible>    
                                            </tr>
                                        </table>
                                     </div>   
                                 </axis:visible>   

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>        
        <c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr158</c:param>
           <c:param name="__botones"><axis:ocultar f="axisctr158" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisctr158" c = "BT_109006" dejarHueco="false">,109006</axis:ocultar></c:param>
        </c:import>        
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FINICIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINICIO", 
            singleClick    :    true,
            firstDay       :    1
        });        
        
     </script>

</body>
</html>