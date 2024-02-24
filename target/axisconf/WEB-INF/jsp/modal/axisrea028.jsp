<%-- * Fichero: axisrea028.jsp * Alta/Mod. Asociación de fórmulas a garantías *
     Fecha: 09/08/2011 */--%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all"
              href="styles/calendar-green.css" title="green"/>
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript"
                src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
        <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisrea028() {
           f_cargar_propiedades_pantalla();
                       
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisrea028();             
                
        }
                
        function f_but_aceptar() {
             if (objValidador.validaEntrada()) {           
                    objUtiles.ejecutarFormulario("modal_axisrea028.do", "altamodi", document.miForm, "_self", objJsMessages.jslit_cargando);             
            }
           
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_modal("axisrea028");                
        }    
        
         /* *********************************************************************************************** */
         
    </script>
    </head>
    <body onload="f_onload_axisrea028()"><c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import><!--form name="axisrea028Form" action="" method="POST"--><form name="miForm"
                                                                                  action="modal_axisrea028.do"
                                                                                  method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axisrea028" c="LIT_NOMBRE_PANTALLA"
                              lit="9902280"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axisrea028" c="ALT_NOMBRE_PANTALLA"
                              lit="9902280"/>
                </c:param>
                <c:param name="form">axisrea028</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0" style="height:130px">
                <tr>
                    <td>
                        <!-- TRAMOS -->
                        <table class="area">
                            <tr>
                                <th style="width:20%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:20%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:20%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:20%;height:0px">
                                    &nbsp;
                                </th>
                                <th style="width:20%;height:0px">
                                    &nbsp;
                                </th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea028" c="SCONAGR"
                                              dejarHueco="false">
                                    <!-- SCONAGR -->
                                    <td class="titulocaja" colspan="1">
                                        <b id="label_SCONAGR"><axis:alt f="axisrea028"
                                                                        c="LIT_SCONAGR"
                                                                        lit="111471"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisrea028" c="SCONAGR"
                                              dejarHueco="false">
                                    <td class="campocaja" colspan="1">
                                        <!-- SCONAGR -->
                                        <input type="text"
                                               class="campo campotexto"
                                               obligatorio="true" id="SCONAGR"
                                               name="SCONAGR" style="width:80%"
                                               value="${__formdata.SCONAGR}"
                                               <axis:atr f="axisrea028" c="SPRODUC" a="modificable=false"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <!--  *********************************** Lista idiomas ************************* -->
                            <tr>
                                <td colspan="5">
                                    <c:set var="title1">
                                        <axis:alt f="axisrea027" c="ALT_CIDIOMA"
                                                  lit="100654"/>
                                    </c:set>
                                    <%-- Idioma--%>
                                    <c:set var="title2">
                                        <axis:alt f="axisrea027" c="ALT_TCONAGR"
                                                  lit="100588"/>
                                    </c:set>
                                    <%-- Descripción--%>
                                    <div class="displayspace" id="dt_idioma" style="height:200px">
                                        <display:table name="${__formdata.listaIdiomas}"
                                                       id="miListaIdiomas"
                                                       defaultsort="1"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultorder="ascending"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0"
                                                       requestURI="modal_axisrea028.do?operation=form&paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="TIDIOMA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:15%">
                                                <div class="dspText">
                                                    ${miListaIdiomas.TIDIOMA}
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}"
                                                            sortable="false"
                                                            sortProperty="DESCRIPCION"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:85%">
                                                <div class="dspText">
                                                    <c:set var="miTCONAGR"
                                                           value=""/>
                                                     
                                                    <c:forEach items="${__formdata.listaDescripciones}"
                                                               var="item">
                                                        <c:if test="${item.CIDIOMA==miListaIdiomas.CIDIOMA}">
                                                            <c:set var="miTCONAGR"
                                                                   value="${item.TCONAGR}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                     
                                                    <input type="text"
                                                           class="campo campotexto"
                                                           id="TCONAGR_${miListaIdiomas.CIDIOMA}"
                                                           name="TCONAGR_${miListaIdiomas.CIDIOMA}"
                                                           value="${miTCONAGR}"
                                                           <axis:atr f="axisrea028" c="TCONAGR" a="modificable=true"/>/>
                                                </div>
                                            </display:column>
                                        </display:table>
                                         
                                    </div>
                                </td>
                            </tr>
                            <!--  *********************************** fin lista idiomas ********************* -->
                        </table>
                    </td>
                </tr>
            </table>
            <!-- ************************* FIN DATOS TRAMOS  ********************* -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrea028</c:param>
                <c:param name="f">axisrea028</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>