<%/*
*  Fichero: axisadm015.jsp
* ecg 20100216 AXIS1633 Bug 13029 Recuperar y bajar fichero generado
* -- Bug 0015209 - 18/08/2010 - JMF: Separar radios tipoenvio para ocultar mediante CFG
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
    <title> <fmt:message key="9000664"/></title> <%-- Gestió del registre de cobertures de mort  --%>
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
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
        }        
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
        }
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
                 //-- Bug 0015209 - 18/08/2010 - JMF
                 //revisarEstilos();
                 f_cargar_propiedades_pantalla();
        }

        //-- Bug 0015209 - 18/08/2010 - JMF
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
           
           
           function tiene_caracteresNoPermitidos(texto){
               var resultado =  new Array(); 
               resultado[0] = 0;
               resultado[1] = "";               
               caracteresNP = '"' +  "/*?|!%><" + ":" + "\\";
               for(i=0; i<texto.length; i++){
                  if (caracteresNP.indexOf(texto.charAt(i),0)!=-1){
                     resultado[0] = 1;    
                     texto = texto.replace(texto.charAt(i), ""); 
                     resultado[1] = texto;
                  }
               }               
               return(resultado);               
            } 
            
            
        function f_but_109006() { // Ejecutar
         if (objValidador.validaEntrada()) {   
         
            var NomFitxer = objDom.getValorPorId("PFICHERO");
            
            var resultado = tiene_caracteresNoPermitidos(NomFitxer);
            if(resultado[0]==1){
                alert('<fmt:message key="9901158"/>'); 
                objDom.setValorPorId("PFICHERO",resultado[1]);
            }
            else
            {            
                if ( !objUtiles.estaVacio(objDom.getValorPorId("PFINCOBERTURA")) && fechaMayorOIgualQue(objDom.getValorPorId("PINICOBERTURA"),objDom.getValorPorId("PFINCOBERTURA")))
                            alert('<fmt:message key="101922"/>'); 
                else
                    objUtiles.ejecutarFormulario ("axis_axisadm015.do", "ejecutar", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
         
        }
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm015", "cancelar", document.miForm, "_self");
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
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (objUtiles.estaVacio(params))   
                params = "";
            if (cual == 'axisadm013') /* modificar per model de cierres*/ {
                objUtiles.ejecutarFormulario("axis_axisadm012.do" + params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
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
            <c:param name="titulo"> <fmt:message key="9000664"/></c:param>     <%-- Gestió del registre de cobertures de mort --%>
            <c:param name="formulario">  <fmt:message key="9000664"/></c:param> <%-- Gestió del registre de cobertures de mort --%>
            <c:param name="form">axisadm015</c:param>
        </c:import>
        
    
        <input type="hidden" name="operation" value=""/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><fmt:message key="103694"/>
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>   
                                    
                                    <tr>
                                        <%-- Fecha Inicial --%>
                                        <axis:ocultar c="PINICOBERTURA" f="axisadm015" dejarHueco="false">
                                           <td class="titulocaja">
                                               <b><axis:alt f="axisadm015" c="PINICOBERTURA" lit="9000526"/></b><%-- Fecha Inicial --%>
                                           </td>   
                                        </axis:ocultar>
                                    </tr>                                    
                                    <tr>
                                        <%-- Fecha Inicial --%>
                                        <axis:ocultar c="PINICOBERTURA" f="axisadm015" dejarHueco="false">
                                           <td class="campocaja">
                                               <input type="text" class="campowidthinput campo campotexto" size="15" 
                                               value="<fmt:formatDate value='${__formdata.PINICOBERTURA}' pattern='dd/MM/yyyy'/>" name="PINICOBERTURA" id="PINICOBERTURA"
                                               style="width:25%" <axis:atr f="axisadm015" c="PINICOBERTURA" a="formato=fecha"/>
                                               title="<fmt:message key="9000526"/>" obligatorio="true" /><a id="icon_PINICOBERTURA" style="vertical-align:middle;"><img 
                                               alt="<fmt:message key="108341"/>" title="<fmt:message key="9000526" />" src="images/calendar.gif"/></a>
                                           </td>
                                        </axis:ocultar>
                                    </tr>
                                      
                                    <tr>
                                         <%-- Fecha Final --%>
                                        <axis:ocultar c="PFINCOBERTURA" f="axisadm015" dejarHueco="false">
                                           <td class="titulocaja">
                                               <b><axis:alt f="axisadm015" c="PFINCOBERTURA" lit="9000527"/></b> <%-- Fecha Final --%>
                                           </td>    
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                      <%-- Fecha Final --%>
                                        <axis:ocultar c="PFINCOBERTURA" f="axisadm015" dejarHueco="false">
                                           <td class="campocaja">
                                               <input type="text" class="campowidthinput campo campotexto" size="15" 
                                               value="<fmt:formatDate value='${__formdata.PFINCOBERTURA}' pattern='dd/MM/yyyy'/>"  name="PFINCOBERTURA" id="PFINCOBERTURA"
                                               style="width:25%;" <axis:atr f="axisadm015" c="PFINCOBERTURA" a="formato=fecha"/>
                                               title="<fmt:message key="9000527"/>" /><a id="icon_PFINCOBERTURA" style="vertical-align:middle;"><img 
                                               alt="<fmt:message key="108341"/>" title="<fmt:message key="9000527" />" src="images/calendar.gif"/></a>
                                           </td>
                                        </axis:ocultar>
                                    </tr>

                                    <tr>
                                       <axis:ocultar c="PFICHERO" f="axisadm015" dejarHueco="false">
                                          <td class="titulocaja">
                                             <b><axis:alt f="axisadm015" c="PFICHERO" lit="1000574"/></b> <%-- NOM FITXER--%>
                                          </td> 
                                       </axis:ocultar>
                                    </tr>
                                    <tr>
                                       <axis:ocultar c="PFICHERO" f="axisadm015" dejarHueco="false">
                                         <td class="campocaja">
                                               <input type="text" class="campowidthinput campo campotexto" size="15" 
                                               value="${__formdata.PFICHERO}" name="PFICHERO" id="PFICHERO"
                                               style="width:100%;" title="<fmt:message key="105940"/> <fmt:message key="1000574"/>" obligatorio="true"/>
                                         </td>
                                       </axis:ocultar>
                                    </tr>

                                    <tr>
                                       <%-- Tipo envío --%>
                                       <axis:ocultar c="PTIPOENVIO" f="axisadm015" dejarHueco="false">
                                          <td class="titulocaja">
                                             <b><axis:alt f="axisadm015" c="PTIPOENVIO" lit="9901143"/></b>
                                          </td>    
                                       </axis:ocultar>
                                    </tr>                                   
                                    <tr>
                                       <%-- Tipo envío --%>
                                       <axis:ocultar c="PTIPOENVIOa" f="axisadm015" dejarHueco="false">
                                          <td class="titulocaja">
                                              <input type="radio" id="PTIPOENVIO" name="PTIPOENVIO" value="0" 
                                               <axis:atr f="axisadm015" c="PTIPOENVIOa"  a="modificable=true&isInputText=false"/>
                                               <c:if test="${PTIPOENVIO == '0'}">checked</c:if>/><fmt:message key="9901144"/>
                                           </td>
                                       </axis:ocultar>
                                       <axis:ocultar c="PTIPOENVIOb" f="axisadm015" dejarHueco="false">
                                           <td class="titulocaja">
                                               <input type="radio" id="PTIPOENVIO" name="PTIPOENVIO" value="1"
                                               <axis:atr f="axisadm015" c="PTIPOENVIOb"  a="modificable=true&isInputText=false"/>
                                               <c:if test="${PTIPOENVIO == '1' || PTIPOENVIO == null}">checked</c:if>/><fmt:message key="9901145"/>
                                           </td>                                      
                                       </axis:ocultar>
                                    </tr>

                                </table>

                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                    </tr>    
                                    <tr> <%-- Camp3 -Fitxer generat--%> 
                                        <td class="titulocaja" id="LITERAL_SORTIDA">
                                              <b><fmt:message key="107913" /></b>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero">
                                            <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(document.getElementById('SORTIDA').value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                   title="<fmt:message key="107913"/>" value="${__formdata.PFGENERADO}"/>                                     
                                        </td> 
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <c:import url="../include/botonera_nt.jsp">
              <c:param name="f">axisadm015</c:param>
              <c:param name="__botones">salir<axis:visible f="axisadm015" c="BT_SALIR">,109006</axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "PFINCOBERTURA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_PFINCOBERTURA", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "PINICOBERTURA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_PINICOBERTURA", 
            singleClick    :    true,
            firstDay       :    1
        });        
        
     </script>

</body>
</html>