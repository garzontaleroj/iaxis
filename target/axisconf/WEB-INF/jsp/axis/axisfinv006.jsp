<%/**
*  Fichero: axisfinv006.jsp
*  Manteniment cotitzacions
*  Fecha: 07/04/2011
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisfinv006" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>       
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfinv006", "cancelar", document.miForm, "_self");
            }
            
            function f_cercar (){//Cercar
                objUtiles.abrirModal("axisfinv007", "src", "modal_axisfinv007.do?operation=form");  
            }
            
            function f_buscar (PMONORIG,PMONDES){
                 f_cerrar_modal("axisfinv007");
                 objUtiles.ejecutarFormulario ("axis_axisfinv006.do?B_MONORIG="+PMONORIG+"&B_MONDES="+PMONDES, "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
           
            function f_editar (MONORIG,MONDEST){
                objUtiles.abrirModal("axisfinv008", "src", "modal_axisfinv008.do?operation=form&PAR_MONORIG=" + MONORIG + "&PAR_MONDEST=" + MONDEST+ "&NOU=0");
            }
            
            function f_new (MONORIG,MONDEST){
                objUtiles.abrirModal("axisfinv008", "src", "modal_axisfinv008.do?operation=nou&NOU=1");
            }
            
            function f_nou (MONORIG,MONDEST){
                objUtiles.abrirModal("axisfinv008", "src", "modal_axisfinv008.do?operation=nou&PAR_MONORIG=" + MONORIG + "&PAR_MONDEST=" + MONDEST+ "&NOU=0");
            }
            
            function f_hist (MONORIG,MONDEST){
                objUtiles.abrirModal("axisfinv009", "src", "modal_axisfinv009.do?operation=form&PAR_MONORIG=" + MONORIG + "&PAR_MONDEST=" + MONDEST);
            }
            
            function f_cerrar_modal(cual){
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_axisfinv008(){
                f_cerrar_modal("axisfinv008");
                objUtiles.ejecutarFormulario ("axis_axisfinv006.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        
          
        <form name="miForm" action="" method="POST"> 
            <input type="hidden" name="operation" value=""/> 

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv006" c="TITULO_PANTALLA" lit="9901965" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv006" c="TITULO_FORM" lit="9901965" /></c:param>
                
                <c:param name="form">axisfinv006</c:param>
            </c:import>
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
            <!-- ********* modales  *************** -->
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisfinv007|<axis:alt f="axisfinv006" c="MODAL_BUSCAR" lit="9901969" /></c:param>
             </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisfinv008|<axis:alt f="axisfinv006" c="MODAL_NOU" lit="9901970" /></c:param>
             </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisfinv009|<axis:alt f="axisfinv006" c="MODAL_HIST" lit="9901971" /></c:param>
             </c:import>
             
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo">    
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><axis:alt f="axisfinv006" c="IMG_SECC" lit="9901968"/>
                                <axis:visible f="axisfinv006" c="BOT_BUSCAR">
                                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisfinv006" c="BOT_BUSCAR" lit="100797" />" onclick="f_cercar();" style="cursor:pointer"/>  
                                </axis:visible>
                            </div>
                            <div style="float:right;">
                                <axis:visible f="axisfinv006" c="BOT_NEW">
                                    <img id="new" border="0" src="images/new.gif" alt="<axis:alt f="axisfinv006" c="BOT_NEW" lit="1000428"/>" onclick="f_new();" style="cursor:pointer"/>  
                                </axis:visible>
                            </div>
                            <div style="clear:both;">
                               
                            </div>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            
                           <tr>                       
                                        
                                        <td class="titulocaja" >
                                           
                                            <c:set var="title0"><axis:alt f="axisfinv006" c="MONEDAORIGEN" lit="9901972"/></c:set>  
                                            <c:set var="title1"><axis:alt f="axisfinv006" c="MONEDADESTINO" lit="9901973"/></c:set>  
                                            <c:set var="title2"><axis:alt f="axisfinv006" c="ITASA" lit="9901974"/></c:set>  
                                            <c:set var="title3"><axis:alt f="axisfinv006" c="FCAMBIO" lit="9900897"/></c:set>  
                                            <c:set var="title4"><axis:alt f="axisfinv006" c="EDIT" lit="9901356"/></c:set>  
                                            <c:set var="title5"><axis:alt f="axisfinv006" c="NOU" lit="1000428"/></c:set>  
                                            <c:set var="title6"><axis:alt f="axisfinv006" c="HIST" lit="9901313"/></c:set>  
                                            <%int contador = 0;%>
                                            <div class="displayspaceMaximo">
                                                <display:table name="${listaCot}" id="LSTCOT" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" style="width:98%" requestURI="axis_axisfinv006.do?operation=form&paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <axis:visible f="axisfinv006" c="MONEDAORIGEN">
                                                        <display:column title="${title0}" sortable="true" sortProperty="MONEDAORIGEN" headerClass="sortable fixed"  media="html" autolink="false" style="width:30%" >
                                                            <div class="dspText">
                                                                ${LSTCOT.MONEDAORIGEN}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv006" c="MONEDADESTINO">
                                                        <display:column title="${title1}" sortable="true" sortProperty="MONEDADESTINO" headerClass="sortable fixed"   media="html" autolink="false" style="width:30%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.MONEDADESTINO}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv006" c="ITASA">
                                                        <display:column title="${title2}" sortable="true" sortProperty="ITASA" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspNumber">
                                                                <%-- <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCOT.ITASA}"/> EZ FORMATO INCORRECTO --%>
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__formatDefault]}" value="${LSTCOT.ITASA}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv006" c="FCAMBIO">
                                                        <display:column title="${title3}" sortable="true" sortProperty="FCAMBIO" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOT.FCAMBIO}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisfinv006" c="EDIT">
                                                        <display:column title="${title4}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisfinv006" c="EDIT" lit="9901356"/>" title="<axis:alt f="axisfinv006" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_editar('${LSTCOT.CMONORI}','${LSTCOT.CMONDEST}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv006" c="NOU">
                                                        <display:column title="${title5}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisfinv006" c="NOU" lit="1000428"/>" title="<axis:alt f="axisfinv006" c="nou" lit="1000428"/>" src="images/new.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_nou('${LSTCOT.CMONORI}','${LSTCOT.CMONDEST}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv006" c="HIST">
                                                        <display:column title="${title6}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisfinv006" c="HIST" lit="9901313"/>" title="<axis:alt f="axisfinv006" c="hist" lit="9901313"/>" src="images/informacion.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_hist('${LSTCOT.CMONORI}','${LSTCOT.CMONDEST}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <%contador++;%>  
                                                </display:table>                                                        
                                            </div>
                                        </td>
                            </tr>
    
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfinv006</c:param><c:param name="__botones">salir</c:param></c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        <script type="text/javascript">       
        Calendar.setup({
            inputField     :    "FVALOR",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_ini",  
            singleClick    :    true,
            firstDay       :    1
        });
       </script>
    </body>
</html>