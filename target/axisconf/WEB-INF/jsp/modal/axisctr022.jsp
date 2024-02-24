<%/*
*  Fichero: axisctr022.jsp
*
*  Emisión Póliza
*
*  
*
*
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.Map"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
      <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
    <script language="Javascript" type="text/javascript">
   
        function f_onload() {
        		 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr022');
					</c:if>
           
        }
        function f_but_cancelar() {
            parent.f_cerrar_axisctr022();
        }
       
        function f_but_aceptar() {
            parent.f_aceptar_axisctr022(document.miForm_axisctr022.SSEGURO.value,document.miForm_axisctr022.NMOVIMI.value,document.miForm_axisctr022.FEFECTO.value);
        }
    
    </script>
  </head>
    <body class=" " onload="f_onload()" >
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm_axisctr022" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SSEGURO" value="${__formdata['SSEGURO']}"/>
            <input type="hidden" name="NMOVIMI" value="${__formdata['NMOVIMI']}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="1000190" /></c:param>
                <c:param name="producto"><fmt:message key="1000190" /></c:param>
                <c:param name="form">axisctr022</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000235" /></c:param>
                <c:param name="nid" value="axisper001" />
            </c:import>
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--Datos      -->
                         <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="151604" /></div>
                        <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>     
                                <!-- Fecha -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100883" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                                <jsp:useBean id="today" class="java.util.Date" /> 
                                                <c:set var="fecha_nac"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:set>
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" obligatorio="true" formato="fecha"
                                                value="${fecha_nac}" style="90%"
                                                title="><fmt:message key="100883"/>"  />
                                                <a style="vertical-align:middle;"><img 
                                                id="popup_calendario_efecto" alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                               
                                </td>
                            </tr>
                        </table>
                        <!-- Fin datos -->
                    </td>
                </tr>
                <tr>
               
                </tr>
            </table>
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <script type="text/javascript">
           
            Calendar.setup({
                inputField     :    "FEFECTO",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "popup_calendario_efecto",  
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
      </div>
    </body>
</html>