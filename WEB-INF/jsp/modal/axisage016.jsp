<%--
      NOMBRE:    axisage016.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 24/10/2011
      PROPÓSITO (descripción pantalla):  Histórico vigencias de comisión/sobrecomisión
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        24/10/2011   JTS(iniciales)     1. 19169: LCOL_C001 - Campos nuevos a añadir para Agentes.

--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
           function f_onload(){
               f_cargar_propiedades_pantalla();
               <%-- c:if test="${resultadoOK=='OK'}" >
                    alert("<axis:alt f='axisage016' c='ALERT' lit='1000405' />");
                    parent.f_cerrar_modal('axisage016');
               </c:if --%>
           }
            
           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //parent.f_cerrar_modal('axisage016');
                    if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisage016.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
           }  
           
           function f_but_salir(){
               parent.f_cerrar_modal('axisage016');
           }
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <%-- Hidden BFP --%>
            <input type="hidden" name="CCOMIND" id="CCOMIND" value="${__formdata.CCOMIND} />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisage016" lit="9902558"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisage016" lit="9902558"/></c:param>
                <c:param name="form">axisage016</c:param>
            </c:import>
            <!-- Area de campos  -->

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="4">
                                    <div class="titulo">
                                        <img src="images/flecha.gif"/><axis:alt c="DSP_TITULO" f="axisage016" lit="9902558"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <%-- Tipo agente --%>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage016" c="CTIPAGE" lit="100584"/></b>
                                </td>
                            </tr>
                            <tr>

                                <%-- Código agente --%>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" <axis:atr f="axisage016" c="CAGENTE"/>
                                    style="width:8%;" title="<axis:alt f="axisage016" c="CAGENTE" lit="9000531"/>" readonly="readonly" >                             

                                <%-- Código agente --%>
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" 
                                    style="width:50%;" title="<axis:alt f="axisage016" c="TAGENTE" lit="100584"/>" readonly="readonly"/>
                                </td> 
                            </tr>
                            
                            <tr>
                                <td class="titulocaja" colspan = "4">
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <%-- SUBVENCION --%>
                                    <c:set var="title0"><axis:alt f="axisage016" c="TCOMISI" lit="110766"/></c:set>  <%-- TCOMISI --%>
                                    <c:set var="title1"><axis:alt f="axisage016" c="FINIVIG" lit="104095"/></c:set>  <%-- FINIVIG --%>
                                    <c:set var="title2"><axis:alt f="axisage016" c="FFINVIG" lit="103051"/></c:set>   <%-- FFINVIG --%>
               
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.LISTAVIG}" id="LISTAVIG" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="modal_axisage016.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortable="true" sortProperty="TCOMISI" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${LISTAVIG.TCOMISI}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="FINIVIG" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAVIG.FINIVIG}" />
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="FFINVIG" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAVIG.FFINVIG}" />
                                                </div>
                                            </display:column>
                                        </display:table>                                                        
                                    </div>
                                </td>
                            </tr>                            
                        </table>
                    </td>
                </tr>
            </table>
     </form>
<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisage016</c:param>
            <c:param name="__botones">
                salir
            </c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>
