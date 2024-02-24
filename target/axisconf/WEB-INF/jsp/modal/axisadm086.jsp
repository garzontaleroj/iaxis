<%/*
*  Fichero: axisadm086.jsp
*
*  Fecha: 16/05/2013
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>    
    <c:import url="../include/carga_framework_js.jsp" />    
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>    
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {            
            parent.f_cerrar_modal('axisadm086');
       }
       
       function f_onload(){                            
          f_cargar_propiedades_pantalla();         
          var ok = "${__formdata.OK}";
            if (!objUtiles.estaVacio(ok) &&  ok == 0){               
                parent.f_aceptar_axisadm086();
          }
          
          //var currentDate = new Date();     
          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth()+1; //January is 0!
          var yyyy = today.getFullYear();
          
          if(dd<10){dd='0'+dd} 
          if(mm<10){mm='0'+mm} 
          var fecha = dd+'/'+mm+'/'+yyyy;
          //document.getElementById("DATE").value = today;
          
          //var fecha = currentDate.getDate()+'/'+(currentDate.getMonth() + 1)+'/'+currentDate.getFullYear();               
          if (objDom.getValorComponente(document.miForm.buscarFINI) == '' ||
              objDom.getValorComponente(document.miForm.buscarFINI) == null) {                
              objDom.setValorPorId("buscarFINI", fecha);
          }                      
       }      
                      
       function f_but_aceptar() {
            if (objValidador.validaEntrada()) { 
                var diasgracia = $("#DIASGRACIA").val();
                if ( diasgracia <= 365 && diasgracia >= 1 ){
                    objUtiles.ejecutarFormulario ("modal_axisadm086.do?","aceptar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);          
                }else{
                    alert('<axis:alt f="axisadm086" c="DIASGRACIA" lit="9906858" />');
                }
            } 
        }
       
       function f_cargar_productos(){                    
           CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
           if (!objUtiles.estaVacio (CRAMO) ){
              objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
              objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
           }else{
              objDom.setValorComponente(document.miForm.CRAMO, null);
           }
           objAjax.invokeAsyncCGI("modal_axisadm086.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);                                            
        }      
                
        function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisadm086" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }                       
                }
        }        
           
        function f_aceptar_axisadm086 (CAGENTE){             
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisadm086();
            //objAjax.invokeAsyncCGI("modal_axisdesc016.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
                
  </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>        
        
        <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>                
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>                
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
         
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm086" c="FORM" lit="9906283" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm086" c="FORM" lit="9906283" /></c:param>
                <c:param name="form">axisadm086</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisadm086" c="AGENTE" lit="100584"/></b>
                                        </td>   
                                    </tr>
                                     <tr>
                                         <td class="campocaja" colspan="4">
                                            <input type="text" obligatorio="true" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" formato="entero" title="<axis:alt f="axisadm086" c="CAGENTE" lit="100584"/>" readonly="true" size="5" style="width:15%" title="<axis:alt f="axisadm086" c="CAGENTE" lit="100584"/>"/>                                           
                                            <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisadm086" c="TAGENTE" lit="100584"/>" size="15" style="width:60%" readonly="true" title="<axis:alt f="axisadm086" c="TAGENTE" lit="100584"/>"/>&nbsp;&nbsp;                                    
                                         </td>
                                    </tr>
                                    <tr>
                                      <!-- Ramo -->
                                      <axis:ocultar f="axisadm086" c="CRAMO" dejarHueco="false"> 
                                         <td class="titulocaja">
                                            <b><axis:alt f="axisadm086" c="RAMO" lit="100784"/></b>
                                         </td>
                                      </axis:ocultar>
                                      <!-- Sproduc -->
                                      <axis:ocultar f="axisadm086" c="SPRODUC" dejarHueco="false"> 
                                         <td class="titulocaja">
                                            <b><axis:alt f="axisadm086" c="PRODUCTO" lit="100829"/></b>
                                         </td>
                                      </axis:ocultar>                                                                                               
                                   </tr>                                   
                                   <tr>                            
                                      <!-- Ramo -->                                                            
                                      <axis:ocultar f="axisadm086" c="CRAMO" dejarHueco="false"> 
                                         <td class="campocaja">
                                           <select name = "ramoProducto" id="ramoProducto" style="width:100%;"  size="1" onchange="f_cargar_productos()" 
                                           class="campowidthselect campo campotexto">
                                           <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>
                                           <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                           <option value = "${ramos.CRAMO}/${ramos.TRAMO}"  <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>${ramos.TRAMO}
                                           </option>
                                           </c:forEach>
                                           </select>
                                         </td>
                                      </axis:ocultar>
                                      <!-- Producto -->
                                      <axis:ocultar f="axisadm086" c="SPRODUC" dejarHueco="false"> 
                                         <td class="campocaja" colspan="2">
                                            <select name = "SPRODUC" obligatorio="true" id ="SPRODUC" size="1" onchange="" class="campowidthselect campo campotexto" 
                                            style="width:100%;" title="<axis:alt f="axisadm086" c="LIT_SPRODUC" lit="100829"/>"> 
                                            <option value="<%= Integer.MIN_VALUE %>">  <axis:alt f="axisadm086" c="SELECCIONAR" lit="108341" />  </option>
                                            <c:forEach items="${__formdata.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                            </c:forEach>
                                            </select>
                                         </td>
                                      </axis:ocultar>                                        
                                   </tr>
                                   <tr>
                                       <td class="titulocaja">
                                          <b><axis:alt f="axisadm086" c="LIT_SPRODUC" lit="9000526"/><%-- Fecha Inicio --%>
                                       </td>  
                                       <td class="titulocaja" ><b><axis:alt f="axisadm086" c="DIAS" lit="9906293"/></b></td>
                                   </tr>
                                   <tr>
                                      <td class="campocaja">
                                            <input type="text" obligatorio="true" class="campowidthinput campo campotexto" size="15" 
                                            value ="<fmt:formatDate value='${__formdata.buscarFINI}' pattern='dd/MM/yyyy'/>"  
                                            name="buscarFINI" id="buscarFINI"
                                            style="width:50%;" <axis:atr f="axisadm086" c="FINI" a="formato=fecha"/>
                                            title="<axis:alt f="axisadm086" c="LIT_FINI" lit="9000526"/>"/><a id="icon_buscarFINI" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axisadm086" c="LIT_FINI" lit="108341"/>" title="<axis:alt f="axisadm086" c="LIT_FINI" lit="9000526"/>" src="images/calendar.gif"/></a>
                                      </td>
                                      <td class="campocaja">
                                       <input type="text"  obligatorio="true" class="campowidth campo campotexto" id="DIASGRACIA" 
                                              name="DIASGRACIA"  value="${__formdata.DIASGRACIA}"
                                              style="width:95%;" size="15"  title="<axis:alt f="axisadm086" c="LIT_DIASGRACIA" lit="9906293"/>"
                                              <axis:atr f="axisadm086" c="DIASGRACIA" a="modificable=true&obligatorio=true&formato=entero"/> />											  
                                      </td>                                      
                                   </tr>
                                </table>
                             </td>
                          </tr>
                        </table>            
                    </td>
                  </tr>
               </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm086</c:param><c:param name="f">axisadm086</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>            
        </form>
      <c:import url="../include/mensajes.jsp" />
      
       <script type="text/javascript">
        Calendar.setup({
            inputField     :    "buscarFINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_buscarFINI", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>      
    </body>
</html>

