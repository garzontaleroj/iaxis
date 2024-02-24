<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:set var="pantalla" value="axisctr062"/>
<c:set var="literalPantalla">
    <axis:alt f="axisctr062" c="LIT_PANTALLA" lit="9001283"/> <%-- Conductores innominados --%>
</c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>${literalPantalla}</title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
           <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
        
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
        
        <script type="text/javascript">        
        
            function f_onload() {
            	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr062');
					</c:if>
                if (${requestScope.grabarOK == '0'}) 
                    // ${empty __formdata.NORDEN} indica si es nuevo (true) o modificación
                    parent.f_aceptar_axisctr062(${empty __formdata.NORDEN});
            }
        
            function f_but_cerrar() {
                parent.f_cerrar_axisctr062();
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("modal_axisctr062.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

        </script>        
    </head>
    
    <body onload="f_onload()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
                ${literalPantalla}
            </c:param>
            <c:param name="formulario">
                ${literalPantalla}
            </c:param>
            <c:param name="modalidad">
                <fmt:message key="101110"/>
            </c:param>
            <c:param name="form">
                ${pantalla}
            </c:param>
        </c:import>
        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0"
               cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <!-- Sección Conductor Innominado -->                    
                    <div style="font-size: 12px;color: #FF9900;font-weight: bold;float:left;">
                        <img src="images/flecha.gif"/><axis:alt f="${pantalla}"
                                                            c="LIT_PRIMER_SUBTITULO"
                                                            lit="9001282"/> <%-- Conductor Innominado --%>
                    </div>
                  
                    <div class="titulo"> &nbsp; </div>                                        
                    
                    <table class="seccion" align="center">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:22.5%;height:0px"></th>
                                        <th style="width:29.5%;height:0px"></th>
                                        <th style="width:22.5%;height:0px"></th>
                                        <th style="width:15.5%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FNACIMI">
                                            <td class="titulocaja">
                                                <b><fmt:message key="1000064"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TSEXPER">
                                            <td class="titulocaja">
                                                <b><fmt:message key="100962"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
                                            <td class="titulocaja">
                                                <b><fmt:message key="9001171"/></b> <%-- Fecha carnet --%>
                                            </td>
                                        </axis:ocultar>                                        
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="NPUNTOS">
                                            <td class="titulocaja">
                                                <b><fmt:message key="9001173"/></b> <%-- Núm. puntos --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FNACIMI">
                                            <td class="campocaja">
                                                <input type="text" style="width:85%"
                                                       class="campowidthinput campo campotexto"
                                                       id="FNACIMI" name="FNACIMI"
                                                       size="15" formato="fecha"
                                                       <c:if test="${!empty requestScope.OB_IAX_AUTCONDUCTORES.FNACIMI}">
                                                            value="<fmt:formatDate value='${requestScope.OB_IAX_AUTCONDUCTORES.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                       </c:if>
                                                       <c:if test="${empty requestScope.OB_IAX_AUTCONDUCTORES.FNACIMI}">
                                                            value="<fmt:formatDate value='${__formdata.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                       </c:if>
                                                       title="<fmt:message key="1000064"/>" alt="<fmt:message key="1000064"/>"
                                                       <axis:atr f="${pantalla}" c="FNACIMI" a="modificable=true&formato=fecha"/>/><a id="icon_FNACIMI" style="vertical-align:middle;"><img 
                                                       alt="<fmt:message key="108341"/>" title="<fmt:message key="1000064"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="CSEXPER">
                                            <td class="campocaja">
                                                <select name="CSEXPER" id="CSEXPER" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;"
                                                 alt="<fmt:message key="100962"/>" title="<fmt:message key="100962"/>">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                                            <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == requestScope.OB_IAX_AUTCONDUCTORES.CSEXO}"> selected="selected" </c:if> 
                                                            <c:if test="${element.CATRIBU == __formdata.CSEXPER}"> selected="selected" </c:if> />
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
                                            <td class="campocaja">
                                                <input type="text" style="width:76%"
                                                       class="campowidthinput campo campotexto"
                                                       id="FCARNET" name="FCARNET"
                                                       size="15" alt="<fmt:message key="9001171"/>" title="<fmt:message key="9001171"/>"
                                                       <c:if test="${!empty requestScope.OB_IAX_AUTCONDUCTORES.FCARNET}">
                                                            value="<fmt:formatDate value='${requestScope.OB_IAX_AUTCONDUCTORES.FCARNET}' pattern='dd/MM/yyyy'/>"
                                                       </c:if>
                                                       <c:if test="${empty requestScope.OB_IAX_AUTCONDUCTORES.FCARNET}">
                                                            value="<fmt:formatDate value='${__formdata.FCARNET}' pattern='dd/MM/yyyy'/>"
                                                       </c:if>
                                                       formato="fecha"
                                                       <axis:atr f="${pantalla}" c="FCARNET" a="obligatorio=false&formato=fecha&modificable=true"/>/><a id="icon_FCARNET" style="vertical-align:middle;"><img 
                                                       alt="<fmt:message key="108341"/>" title="<fmt:message key="9001171"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="NPUNTOS">
                                            <td class="campocaja">
                                                <input type="text" style="width:70%"
                                                       class="campowidthinput campo campotexto"
                                                       id="NPUNTOS" name="NPUNTOS"
                                                       size="15" alt="<fmt:message key="9001173"/>" title="<fmt:message key="9001173"/>"
                                                       <c:if test="${!empty requestScope.OB_IAX_AUTCONDUCTORES.NPUNTOS}">
                                                            value="${requestScope.OB_IAX_AUTCONDUCTORES.NPUNTOS}"
                                                       </c:if>
                                                       <c:if test="${empty requestScope.OB_IAX_AUTCONDUCTORES.NPUNTOS}">
                                                            value="${__formdata.NPUNTOS}"
                                                       </c:if>
                                                       <axis:atr f="${pantalla}" c="NPUNTOS" a="obligatorio=false&formato=entero&modificable=true"/>/>
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
            <c:param name="__botones">cerrar,aceptar</c:param>
        </c:import>
        
    </form>
    
    <c:import url="../include/mensajes.jsp" />

    <script type="text/javascript">

        Calendar.setup({
            inputField     :    "FNACIMI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FNACIMI", 
            singleClick    :    true,
            firstDay       :    1
        });

        Calendar.setup({
            inputField     :    "FCARNET",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCARNET", 
            singleClick    :    true,
            firstDay       :    1
        });
        
    </script>
  </div>
</body>