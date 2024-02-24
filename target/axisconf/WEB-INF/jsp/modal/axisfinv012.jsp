<%/**
*  Fichero: axisfinv012.jsp
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
        <title><axis:alt f="axisfinv012" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
                parent.f_cerrar_modal("axisfinv012");  
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
                <c:param name="titulo"><axis:alt f="axisfinv012" c="TITULO_PANTALLA" lit="9902148" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv012" c="TITULO_FORM" lit="9902148" /></c:param>
                <c:param name="form">axisfinv012</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisfinv012" c="IMG_SECC" lit="9902147"/> - ${listaFonHist[0].TFONCMP} 
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            
                           <tr>                       
                                        
                                        <td class="titulocaja" style="padding-right: 0px;">
                                            
                                            <c:set var="title0"><axis:alt f="axisfinv012" c="TFONCMP" lit="107059"/></c:set>  
                                            <c:set var="title1"><axis:alt f="axisfinv012" c="FINICIO" lit="9000526"/></c:set>  
                                            <c:set var="title2"><axis:alt f="axisfinv012" c="FFIN" lit="9000527"/></c:set>  
                                            <c:set var="title3"><axis:alt f="axisfinv012" c="TTIPCOM" lit="9902149"/></c:set>  
                                            <c:set var="title33"><axis:alt f="axisfinv012" c="TCONCEP" lit="1000480"/></c:set>  
                                            <c:set var="title4"><axis:alt f="axisfinv012" c="TTIPOCALCUL" lit="9002111"/></c:set>  
                                            <c:set var="title5"><axis:alt f="axisfinv012" c="PGASTOS" lit="101467"/></c:set>  
                                            <c:set var="title6"><axis:alt f="axisfinv012" c="IIMPFIJ" lit="9902145"/></c:set> 
                                            <%int contador = 0;%>
                                            <div id="dt_recibos" class="seccion displayspaceGrande" style="width:100%">
                                                <display:table name="${listaFonHist}" id="LSTCOT" export="false" class="dsptgtable" pagesize="8" sort="list" cellpadding="0" cellspacing="0" requestURI="modal_axisfinv012.do?operation=form&paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <axis:visible f="axisfinv012" c="FINICIO">
                                                        <display:column title="${title1}" sortable="true" sortProperty="FINICIO" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOT.FINICIO}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv012" c="FFIN">
                                                        <display:column title="${title2}" sortable="true" sortProperty="FFIN" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOT.FFIN}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv012" c="TTIPCOM">
                                                        <display:column title="${title3}" sortable="true" sortProperty="TTIPCOM" headerClass="sortable"  media="html" autolink="false" style="width:20%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.TTIPCOM}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv012" c="TCONCEP">
                                                        <display:column title="${title33}" sortable="true" sortProperty="TCONCEP" headerClass="sortable"  media="html" autolink="false" style="width:20%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.TCONCEP}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv012" c="TTIPOCALCUL">
                                                        <display:column title="${title4}" sortable="true" sortProperty="TTIPOCALCUL" headerClass="sortable"  media="html" autolink="false" style="width:10%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.TTIPOCALCUL}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv012" c="PGASTOS">
                                                        <display:column title="${title5}" sortable="true" sortProperty="PGASTOS" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="##0.00" value="${LSTCOT.PGASTOS}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv012" c="IIMPFIJ">
                                                        <display:column title="${title6}" sortable="true" sortProperty="IIMPFIJ" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCOT.IIMPFIJ}"/>
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
                            <c:param name="f">axisfinv012</c:param>
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
