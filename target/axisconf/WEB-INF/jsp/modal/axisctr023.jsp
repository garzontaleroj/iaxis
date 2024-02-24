<%/*
*  Fichero: axisctr023.jsp
*
*
*
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Map"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
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
        // Retocar tabla en IE
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
        }
       
        function f_but_cancelar() {
            parent.f_cerrar_axisctr023();
        }
       
        function f_but_aceptar() {
            // Si no es IBAN, quitar formato="iban"
            // TODO: Ojo, si el CTIPBAN = 2 no representa al IBAN, no funcionará! Ojo al cambiarlo!
            if (document.miForm.CTIPBAN.value != 2)
                document.miForm.CBANCAR.setAttribute("formato", ""); 
            if (objValidador.validaEntrada()) {
                parent.f_aceptar_axisctr023(document.miForm.CTIPCOB.value,document.miForm.CTIPBAN.value,document.miForm.CBANCAR.value,document.miForm.NRECIBO.value);
            }
        }
        
       
    </script>
  </head>
    <body class=" " onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="respuestas" name="respuestas" value=""/>  
            <input type="hidden" name="SPERSON" id="SPERSON" value="${sessionScope.SPERSON}"/>
            <input type="hidden" name="SPERSON2MODIFY" id="SPERSON2MODIFY" value="${sessionScope.SPERSON2MODIFY}"/>
            <input type="hidden" name="NRECIBO" id="NRECIBO" value="${NRECIBO}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="1000199" /></c:param>
                <c:param name="producto"><fmt:message key="1000199" /></c:param>
                <c:param name="form">axisctr023</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="1000199" /></c:param>
                <c:param name="nid" value="axisper001" />
            </c:import>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--Datos      -->
                         <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="151604" /></div>
                        <table class="area" align="center">
                             <tr>
                                <th style="width:33.3%;height:0px"></th>
                                <th style="width:33.3%;height:0px"></th>
                                <th style="width:33.3%;height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Tipo de Cobro -->
                                <td class="titulocaja">
                                    <b><fmt:message key="151348" /></b>
                                </td>
                                 <!-- Tipo cuenta -->
                                <td class="titulocaja">
                                    <b><fmt:message key="1000374" /></b>
                                </td>
                                <!-- Número de cuenta -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100878" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" style="width:100">
                                  <!-- Tipo de cobro -->
                                   <select name = "CTIPCOB" id ="CTIPCOB" size="1" onchange="" class="campowidthselect campo campotexto_ob"
                                   obligatorio="true" title="<fmt:message key="151348" />"/>
                                        <option value = "null" selected >-<fmt:message key="108341"/>-</option>
                                        <c:forEach var="tipocobro" items="${axisctr023_tipoCobro}">
                                            <option value = "${tipocobro.CATRIBU}">
                                                  ${tipocobro.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                   <select name = "CTIPBAN" id ="CTIPBAN" size="1" class="campowidthselect campo campotexto_ob"
                                   obligatorio="true" title="<fmt:message key="1000374" />" />
                                        <option value = "null" selected >-<fmt:message key="108341"/>-</option>
                                        <c:forEach var="tipocuenta" items="${axisctr023_tipoCuenta}">
                                            <option value = "${tipocuenta.CTIPBAN}">
                                                  ${tipocuenta.TTIPO}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <input type="text" maxislength="34" class="campowidthinput campo campotexto" id="CBANCAR" name="CBANCAR" size="15"
                                    value="" obligatorio="true" formato="iban" title="<fmt:message key="100878" />"/>
                                </td>
                             </tr>
                        </table>
                        <!-- Fin datos -->
                    </td>
                </tr>

            </table>
            
            
           <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <script type="text/javascript">
 
        </script>
    </body>
</html>