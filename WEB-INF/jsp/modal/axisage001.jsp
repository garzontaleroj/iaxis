<%/*
*  Fichero: axisage001.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 08/10/2008
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
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
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisage001');                      
        }
        
        function f_but_nuevo() {           
           parent.f_axisage001_nuevo();
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisage001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla(); 
            revisarEstilos();            
            var hayDatos = ${requestScope.buscarOK == true};
            if (hayDatos) {
                // Abrir modal buscador
                parent.f_aceptar_modal("axisage001");
            } else                 
                document.getElementById("CEMPRESA").focus();
        }

    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisage001.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage001" c="TITULO" lit="9000517"/></c:param> <%-- Búsqueda Red Comercial --%>
            <c:param name="formulario"><axis:alt f="axisage001" c="TITULO" lit="9000517"/></c:param> <%-- Búsqueda Red Comercial --%>
            <c:param name="form">axisage001</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper008|<axis:alt f="axisage001" c="TITULO_MOD" lit="1000065"/></c:param>
        </c:import>

        
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:30%;height:0%;"/>
                                        <th style="width:2%;height:0%;"/>
                                        <th style="width:30%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisage001" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisage001" c="T_FECHA_INI" lit="9000526"/></b> <%-- Fecha inicio --%>
                                        </td>                  
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                                
                                            <select name="CEMPRESA" id="CEMPRESA" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage001" c="SELECCIONAR" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                    <option value = "${element.CEMPRES}"
                                                    <c:if test="${__formdata.CEMPRESA == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                        ${element.TEMPRES} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                        <td class="campocaja">                             
                                            <c:if test="${empty formdata.FINICIO}">
                                            <%((java.util.Map) request.getAttribute("__formdata")).put("FINICIO", new java.util.Date());%>
                                            </c:if>
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:35%;"
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" name="FINICIO" id="FINICIO"
                                            title="<axis:alt f='axisage001' c='FECHA_INI' lit='100890'/>"
                                            <axis:atr f="axisage001" c="FINICIO" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                            id="icon_FINICIO" alt="<axis:alt f="axisage001" c="SELECC" lit="108341"/>" title="<axis:alt f="axisage001" c="FECHA_INI" lit="100890" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisage001" c="COD_AGENTE" lit="9000531"/></b> <%-- Código agente --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>
                                        <td class="titulocaja">
                                            <span id="label_TAGENTE"
                                            style="<c:if test='${empty __formdata.CBUSQUEDA || __formdata.CBUSQUEDA == 1}'>display:none;</c:if>">
                                                <b><axis:alt f="axisage001" c="NOMBRE" lit="105940"/></b><%-- Nombre --%>
                                            </span> 
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" 
                                            style="width:30%;" title="<axis:alt f="axisage001" c="COD_AGENTE" lit="9000531"/>"
                                            <axis:atr f="axisage001" c="CAGENTE"/> />
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" 
                                            style="width:95%;<c:if test='${empty __formdata.CBUSQUEDA || __formdata.CBUSQUEDA == 1}'>display:none;</c:if>" 
                                            title="<axis:alt f="axisage001" c="NOMBRE" lit="105940"/>" />
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisage001" c="TIPO_AGENTE" lit="9000519"/></b> <%-- Tipo agente --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisage001" c="ACTIVO" lit="100786"/></b>  <%-- Activo --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                                
                                            <select name="TIPAGENTE" id="TIPAGENTE" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage001" c="SELECCIONAR" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.TIPAGENTE == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                        <td class="campocaja">                                
                                            <select name="CACTIVO" id="CACTIVO" size="1" class="campowidthselect campo campotexto" style="width:43%">&nbsp;                                        
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage001" c="SELECCIONAR" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOAGENTE}">
                                                    <option value = "${element.CATRIBU}" 
                                                    <c:if test="${__formdata.CACTIVO == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>     
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisage001" c="TP_BUSQUEDA" lit="9000697"/></b> <%-- Tipo Búsqueda --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <div style="text-align:left;">
                                                <input type="radio" id="CBUSQUEDA" name="CBUSQUEDA" size="15" value="0"
                                                onclick="if (this.checked) {document.getElementById('TAGENTE').style.display='inline';document.getElementById('label_TAGENTE').style.display='inline'}"
                                                <c:if test='${__formdata.CBUSQUEDA == 0}'> checked </c:if>/>
                                                <b><axis:alt f="axisage001" c="TAGENTE" lit="100584"/></b> <%-- Agente --%>   <br/>                                            
                                                <input type="radio" id="CBUSQUEDA" name="CBUSQUEDA" size="15" value="1"
                                                onclick="if (this.checked) {document.getElementById('TAGENTE').style.display='none';document.getElementById('label_TAGENTE').style.display='none';}"
                                                <c:if test='${empty __formdata.CBUSQUEDA || __formdata.CBUSQUEDA == 1}'> checked </c:if>/>
                                                <b><axis:alt f="axisage001" c="RED_COMERC" lit="9000520"/></b> <%-- Red comercial --%> 
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage001</c:param><c:param name="__botones">cancelar,buscar<axis:visible c="BT_NUEVO" f="axisage001">,nuevo</axis:visible></c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
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