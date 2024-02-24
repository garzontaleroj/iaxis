<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<c:set var="linea_trami" value="${__formdata.indexTramitacio}"/>
<!-- ${LINEATRAM} -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>
            <axis:alt f="axisprf103" c="TIT_AXISPRF103" lit="1000431"/>
        </title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <!--********** CALENDARIO ************************** -->
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
        function f_onload() { 
            f_cargar_propiedades_pantalla(); 
            var val1 = "<%=request.getAttribute("OK")%>"; 
            objDom.setValorPorId("STARIFA",'${__formdata.STARIFA}');
            
            if (val1=="OK"){
                parent.f_aceptar_modal("axisprf103","STARIFA_OUT="+'${__formdata.STARIFA_OUT}'+
                                                    "&TTARIFA="+'${__formdata.TTARIFA}');
            }
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {  
                objUtiles.ejecutarFormulario ("modal_axisprf103.do", "guardar", document.miForm, "_self"); 
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axisprf103");
        }
    </script>
    </head>
    <body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="modal_axisprf103.do" method="POST">
            <input type="hidden" name="operation" value="guardar"/>
            <input type="hidden" name="STARIFA" value="${__formdata.STARIFA}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <axis:alt f="axisprf103" c="TIT_AXISPRF103" lit="9904892"/>
                </c:param>
                <c:param name="formulario">
                    <axis:alt f="axisprf103" c="FORM_AXISPRF103" lit="102066"/>
                </c:param>
                <c:param name="form">axisprf103</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                   <tr><td>
                        <table class="seccion">
                           <tr>
                               <th style="width:33%;height:0px">&nbsp;</th>
                               <th style="width:33%;height:0px">&nbsp;</th>
                               <th style="width:33%;height:0px">&nbsp;</th>
                           </tr>
                           <div class="separador">&nbsp;</div>
                           <tr>
                               <td class="titulocaja">
                                   <b><axis:alt f="axisprf103" c="TIT_STARIFA" lit="9901888"/></b>
                               </td>
                               
                            </tr>
                            <tr>
                                <axis:visible f="axisprf103" c="STARIFA" >
                                <td class="campocaja">
                                    <c:if test="${__formdata.MODO == 'modificar'}">
                                        <input type="text" class="campo campotexto" value="${__formdata.OBIAXTARI.STARIFA}"  name="STARIFA" id="STARIFA" size="15"
                                               readonly="true" style="width:50%"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO != 'modificar'}">
                                        <input type="text" class="campo campotexto" value="${__formdata.STARIFA}"  name="STARIFA" id="STARIFA" size="15"
                                               readonly="true" style="width:50%"/>
                                    </c:if>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                              <td class="titulocaja">
                                   <b><axis:alt f="axisprf103" c="TIT_TDESCRI" lit="100588"/></b>
                               </td> 
                            </tr>
                            <tr>
                                <axis:visible f="axisprf103" c="TDESCRI">
                                <td>
                                    <textarea rows="8" class="campo campotexto" cols="" 
                                    		  alt="<axis:alt f="axisprf103" c="TDESCRI" lit="100588"/>"
                                    		  title="<axis:alt f="axisprf103" c="TDESCRI" lit="100588"/>"
                                    		  <axis:atr f="axisprf103" c="TDESCRI" a="modificable=true&isInputText=false&obligatorio=true"/> style="width:94%;"  
                                              name="TDESCRI" id="TDESCRI" >${__formdata.OBIAXTARI.TDESCRI}</textarea>
                                </td>
                                </axis:visible>
                            </tr>
                         </table>
                       </td>
                    </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf103</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>