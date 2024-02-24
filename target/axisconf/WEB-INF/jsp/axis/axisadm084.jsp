<%/*
*  Fichero: axisadm084.jsp
* -- Bug 0026430 - 01/07/2013 - JMF
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
    <title> <axis:alt f="axisadm084" c="LITERAL" lit="9905717"/></title> <%-- FECU Intermediarios  --%>
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
        /* function f_imprimir_fitxer(pfitxer){
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
        } */ 
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
        }
        function f_imprimir_fitxer(cont){                    
                pfitxer = document.getElementById('SORTIDA_'+cont).value;
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");        
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axisadm084.jsp",600,200);
        }  
        function f_onload() { 
            f_cargar_propiedades_pantalla();
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
                    if ( !objUtiles.estaVacio(objDom.getValorPorId("FDESDE")) && fechaMayorOIgualQue(objDom.getValorPorId("FDESDE"),objDom.getValorPorId("FHASTA")))
                                alert('<axis:alt f="axisadm084" c="LITERAL" lit="101922"/>'); 
                    else
                        objUtiles.ejecutarFormulario ("axis_axisadm084.do", "ejecutar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm084", "cancelar", document.miForm, "_self");
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
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm084" c="LITERAL" lit="1000205" />|true</c:param>
    </c:import>
    <form name="miForm" action="" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"> <axis:alt f="axisadm084" c="LITERAL" lit="9905717"/></c:param>     <%-- Gestió del registre de cobertures de mort --%>
            <c:param name="formulario">  <axis:alt f="axisadm084" c="LITERAL" lit="9905717"/></c:param> <%-- Gestió del registre de cobertures de mort --%>
            <c:param name="form">axisadm084</c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><axis:alt f="axisadm084" c="LITERAL" lit="103694"/>
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
                                        <axis:ocultar c="FDESDE" f="axisadm084" dejarHueco="false">
                                           <td class="titulocaja">
                                               <b><axis:alt f="axisadm084" c="FDESDE" lit="9000526"/></b><%-- Fecha Inicial --%>
                                           </td>   
                                        </axis:ocultar>
                                    </tr>                                    
                                    <tr>
                                        <%-- Fecha Inicial --%>
                                        <axis:ocultar c="FDESDE" f="axisadm084" dejarHueco="false">
                                           <td class="campocaja">
                                               <input type="text" class="campowidthinput campo campotexto" size="15" 
                                               value="<fmt:formatDate value='${__formdata.FDESDE}' pattern='dd/MM/yyyy'/>" name="FDESDE" id="FDESDE"
                                               style="width:25%" <axis:atr f="axisadm084" c="FDESDE" a="formato=fecha"/>
                                               title="<axis:alt f="axisadm084" c="LITERAL" lit="9000526"/>" obligatorio="true" /><a id="icon_FDESDE" style="vertical-align:middle;"><img 
                                               alt="<axis:alt f="axisadm084" c="LITERAL" lit="108341"/>" title="<axis:alt f="axisadm084" c="LITERAL" lit="9000526" />" src="images/calendar.gif"/></a>
                                           </td>
                                        </axis:ocultar>
                                    </tr>
                                      
                                    <tr>
                                         <%-- Fecha Final --%>
                                        <axis:ocultar c="FHASTA" f="axisadm084" dejarHueco="false">
                                           <td class="titulocaja">
                                               <b><axis:alt f="axisadm084" c="FHASTA" lit="9000527"/></b> <%-- Fecha Final --%>
                                           </td>    
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                      <%-- Fecha Final --%>
                                        <axis:ocultar c="FHASTA" f="axisadm084" dejarHueco="false">
                                           <td class="campocaja">
                                               <input type="text" class="campowidthinput campo campotexto" size="15" 
                                               value="<fmt:formatDate value='${__formdata.FHASTA}' pattern='dd/MM/yyyy'/>"  name="FHASTA" id="FHASTA"
                                               style="width:25%;" <axis:atr f="axisadm084" c="FHASTA" a="formato=fecha"/>
                                               title="<axis:alt f="axisadm084" c="LITERAL" lit="9000527"/>" /><a id="icon_FHASTA" style="vertical-align:middle;"><img 
                                               alt="<axis:alt f="axisadm084" c="LITERAL" lit="108341"/>" title="<axis:alt f="axisadm084" c="LITERAL" lit="9000527" />" src="images/calendar.gif"/></a>
                                           </td>
                                        </axis:ocultar>
                                    </tr>

                                </table>
                                <!-- SEccion de resultados de ejecucion de ficheros-->
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
                                                    <img src="images/flecha.gif"/><b><axis:alt f="axisadm084" c="TIT_FITX" lit="9901019"/> </b>
                                                </div>
                                                <div class="separador">&nbsp;</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" id="fichero" colspan="3">
                                            <%int cont = 0;%>
                                             <c:set var="title0"><axis:alt f="axisadm084" c="FICHERO" lit="1000574"/>  </c:set>
                                              <div class="seccion displayspace">
                                                  <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axisadm084.do?paginar=true" style="width:99.9%">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="i"><%=cont%></c:set>
                                                <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                                   <a href="javascript:f_imprimir_fitxer('${i}')"> ${OBFICHERO.OB_IAX_IMPRESION.FICHERO}</a>
                                                   <input type="hidden" 
                                                       style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                       class="campowidthinput campo campotexto" size="15"  name="SORTIDA_${i}" id="SORTIDA_${i}"
                                                       value="${OBFICHERO.OB_IAX_IMPRESION.FICHERO}"/>                                     
                                                </display:column>   
                                                <% cont ++ ;%>
                                                </display:table>
                                                </div>
                            
                                              </td> 
                                        </tr>
                                    </table>
                                </c:if>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <c:import url="../include/botonera_nt.jsp">
              <c:param name="f">axisadm084</c:param>
              <c:param name="__botones">salir<axis:visible f="axisadm084" c="BT_SALIR">,109006</axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FDESDE", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FHASTA", 
            singleClick    :    true,
            firstDay       :    1
        });        
        
     </script>

</body>
</html>