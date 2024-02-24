<%/*
*  Fichero: Axissin034.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 11/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
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
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axissin034();
       }
       
       function f_but_buscar(){
            parent.f_but_buscar(document.miForm.CEVENTO.value,document.miForm.DEVENTO.value,document.miForm.FECHAINI.value,document.miForm.FECHAFIN.value);
       }
        
    </script>
  </head>
    <body onload="" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9900841" /></c:param>
                <c:param name="producto"><fmt:message key="9900841" /></c:param>
                <c:param name="form">Axissin034</c:param>
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
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Codigo Evento -->
                                            <axis:ocultar f="axissin034" c="CEVENTO" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin034" c="CEVENTO" lit="9900810" /></b>
                                            </td>
                                            </axis:ocultar>
                                            <!-- Descripcion Evento -->
                                            <axis:ocultar f="axissin034" c="DEVENTO" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin034" c="CEVENTO" lit="100588" /></b>
                                            </td>
                                            </axis:ocultar>
                                            <!-- Fecha inicio -->
                                            <axis:ocultar f="axissin034" c="FECHAINI" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin034" c="CEVENTO" lit="9000526" /></b>
                                            </td>
                                            </axis:ocultar>
                                            <!-- Fecha fin -->
                                            <axis:ocultar f="axissin034" c="FECHAFIN" dejarHueco="false">
                                            <td class="titulocaja" id="" >
                                                <b><axis:alt f="axissin034" c="CEVENTO" lit="9000527" /></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin034" c="CEVENTO" dejarHueco="false">
                                            <td class="campocaja" > 
                                                <select name = "CEVENTO" id="CEVENTO"  
                                                        value="" size="1" onchange="" class="campowidthselect campo campotexto_ob">
                                                    <option value=""> - <fmt:message key="108341"/> - </option>
                                                    <c:forEach var="eventos" items="${LIST_EVENTOS}">
                                                        <option value = "${eventos.CEVENTO}"
                                                        <c:if test="${(!empty __formdata.CEVENTO)&& eventos.CEVENTO == __formdata.CEVENTO}"> selected </c:if>>
                                                        ${eventos.TTITEVE}</option>  
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin034" c="DEVENTO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" name="DEVENTO" id="DEVENTO"  <axis:atr f="axissin034" c="devento" a="modificable=true"/> value="${__formdata.DEVENTO}"  class="campowidthinput campo campotexto"/> 
                                           </td>
                                           </axis:ocultar>
                                           <axis:ocultar f="axissin034" c="FECHAINI" dejarHueco="false">
                                            <td class="campocaja" >
                                                <input type="text" formato="fecha" name="FECHAINI" id="FECHAINI" style="width:80px;"   value="<fmt:formatDate value="${__formdata.FECHAINI}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                                <a id="icon_FECHAINI" style="vertical-align:middle;">
                                                <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin034" c="FECHAFIN" dejarHueco="false">
                                            <td class="campocaja" >
                                                <input type="text" formato="fecha" name="FECHAFIN" id="FECHAFIN" style="width:80px;"   value="<fmt:formatDate value="${__formdata.FECHAFIN}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                                <a id="icon_FECHAFIN" style="vertical-align:middle;">
                                                <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
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
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FECHAINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHAINI", 
            singleClick    :    true,
            firstDay       :    1
            });
            </script>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FECHAFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHAFIN", 
            singleClick    :    true,
            firstDay       :    1
            });
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

