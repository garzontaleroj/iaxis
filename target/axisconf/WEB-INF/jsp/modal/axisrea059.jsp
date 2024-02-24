<%/**
*  Fichero: axisrea059.jsp
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisrea059" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {   
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_salir() {
                parent.f_cerrar_modal("axisrea059");  
            }           

        </script>
    </head>
    
    <body onload="f_onload()" >

        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>     
            
             <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea059" c="TITULO_PANTALLA" lit="89906269" /></c:param>
                <c:param name="formulario"><axis:alt f="axisrea059" c="TITULO_FORM" lit="89906269" /></c:param>
                <c:param name="form">axisrea059</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
<!--                         <div class="titulo"> -->
<%--                             <img src="images/flecha.gif"/><axis:alt f="axisrea059" c="IMG_SECC" lit="9901968"/> - ${listatHist[0].MONEDAORIGEN} / ${listatHist[0].MONEDADESTINO}  --%>
<!--                          </div> -->
                        <!-- Sección 1 -->
                        <table class="seccion">
                            
                           <tr>                       
                                        
                                        <td class="titulocaja" style="padding-right: 0px;">
                                            
                                            <c:set var="title0"><axis:alt f="axisrea059" c="MONEDA" lit="108645"/></c:set> 
                                            <c:set var="title1"><axis:alt f="axisrea059" c="VALOR" lit="101159"/></c:set>  
                                            <c:set var="title2"><axis:alt f="axisrea059" c="FECHA" lit="100562"/></c:set>  
                                            <%int contador = 0;%>
                                            <div id="dt_recibos" class="seccion displayspaceGrande" style="width:25%">
                                                <display:table name="${listatHist}" id="LSTCOT" export="false" class="dsptgtable" pagesize="8" sort="list" cellpadding="0" cellspacing="0" requestURI="modal_axisrea059.do?operation=form&paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <axis:visible f="axisrea059" c="MONEDA">
                                                        <display:column title="${title0}" sortable="true" sortProperty="MONEDA" headerClass="sortable fixed"   media="html" autolink="false" style="width:30%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.TMONEDA}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea059" c="VALOR">
                                                        <display:column title="${title1}" sortable="true" sortProperty="VALOR" headerClass="sortable"  media="html" autolink="false" style="width:50%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCOT.IPATTEC}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea059" c="FECHA">
                                                        <display:column title="${title2}" sortable="true" sortProperty="FECHA" headerClass="sortable"  media="html" autolink="false" style="width:50%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOT.FMOVINI}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <%contador++;%>  
                                                </display:table>                                                        
                                            </div>
                                        </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisrea059</c:param>
                            <c:param name="__botones">salir</c:param>
                        </c:import>
                        <div class="separador">&nbsp; </div>       
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
