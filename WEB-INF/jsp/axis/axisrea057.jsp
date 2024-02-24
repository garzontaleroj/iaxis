<%/**
*  Fichero: axisrea057.jsp
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
        <title><axis:alt f="axisrea057" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea057", "cancelar", document.miForm, "_self");
            }
            
            function f_cercar (){//Cercar
                objUtiles.abrirModal("axisfinv007", "src", "modal_axisfinv007.do?operation=form");  
            }
            
            function f_buscar (PMONORIG,PMONDES){
                 f_cerrar_modal("axisfinv007");
                 objUtiles.ejecutarFormulario ("axis_axisrea057.do?B_MONORIG="+PMONORIG+"&B_MONDES="+PMONDES, "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            // Inicio IAXIS-15090 13/04/2021            
            function f_editar (ANIO,TRIMESTRE,MONEDA, IPATTEC, MOVIMI, PPORPAT ){ 
                objUtiles.abrirModal("axisrea058", "src", "modal_axisrea058.do?operation=form&NANIO=" + ANIO + "&NTRIM=" + TRIMESTRE+ "&MONEDA="+ MONEDA + "&IPATTEC="+ IPATTEC+ "&NMOVIMI="+ MOVIMI+ "&PPORPAT="+PPORPAT); 
            }
            // Fin IAXIS-15090 13/04/2021
            function f_new (MONORIG,MONDEST){
                objUtiles.abrirModal("axisrea058", "src", "modal_axisrea058.do?operation=nou&NOU=1");
            }
            
            function f_nou (ANIO,TRIMESTRE){
                objUtiles.abrirModal("axisrea058", "src", "modal_axisrea058.do?operation=nou&NANIO=" + ANIO + "&NTRIM=" + TRIMESTRE);
            }
            
            function f_hist (ANIO,TRIMESTRE){
                objUtiles.abrirModal("axisrea059", "src", "modal_axisrea059.do?operation=form&NANIO=" + ANIO + "&NTRIM=" + TRIMESTRE);
            }
            
            function f_cerrar_modal(cual){
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_axisrea058(){
                f_cerrar_modal("axisrea058");
                objUtiles.ejecutarFormulario ("axis_axisrea057.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        
          
        <form name="miForm" action="" method="POST"> 
            <input type="hidden" name="operation" value=""/> 

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea057" c="TITULO_PANTALLA" lit="89906263" /></c:param>
                <c:param name="formulario"><axis:alt f="axisrea057" c="TITULO_FORM" lit="89906263" /></c:param>
                
                <c:param name="form">axisrea057</c:param>
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
                    <c:param name="nid_y_titulo">axisfinv007|<axis:alt f="axisrea057" c="MODAL_BUSCAR" lit="9901969" /></c:param>
             </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisrea058|<axis:alt f="axisrea057" c="MODAL_NOU" lit="89906266" /></c:param>
             </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisrea059|<axis:alt f="axisrea057" c="MODAL_HIST" lit="89906269" /></c:param>
             </c:import>
             
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo">    
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><axis:alt f="axisrea057" c="IMG_SECC" lit="89906263"/>
                            </div>
                            <div style="float:right;">
                                <axis:visible f="axisrea057" c="BOT_NEW">
                                    <img id="new" border="0" src="images/new.gif" alt="<axis:alt f="axisrea057" c="BOT_NEW" lit="1000428"/>" onclick="f_new();" style="cursor:pointer"/>  
                                </axis:visible>
                            </div>
                            <div style="clear:both;">
                               
                            </div>
                        </div>
                        
                        <table class="seccion">
                            
                           <tr>                       
                                        
                                        <td class="titulocaja" >
                                           
                                            <c:set var="title0"><axis:alt f="axisrea057" c="ANIO" lit="101606"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisrea057" c="TRIMESTRE" lit="89906265"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisrea057" c="FECHAINI" lit="9000526"/></c:set>  
                                            <c:set var="title3"><axis:alt f="axisrea057" c="FECHAFIN" lit="9000527"/></c:set>  
                                            <c:set var="title4"><axis:alt f="axisrea057" c="MONEDA" lit="108645"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisrea057" c="VALOR" lit="101159"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisrea057" c="PORC" lit="101467"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisrea057" c="TOTAL" lit="101093"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisrea057" c="FECHA" lit="100562"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisrea057" c="EDIT" lit="9901356"/></c:set>  
                                            <c:set var="title10"><axis:alt f="axisrea057" c="NOU" lit="1000428"/></c:set>  
                                            <c:set var="title11"><axis:alt f="axisrea057" c="HIST" lit="9901313"/></c:set>  
                                            
                                            <div class="displayspaceMaximo">
                                                <display:table name="${listaPats}" id="LSTPATS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" style="width:98%" requestURI="axis_axisrea057.do?operation=form&paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <axis:visible f="axisrea057" c="ANIO">
                                                        <display:column title="${title0}" sortable="true" sortProperty="ANIO" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                ${LSTPATS.NANIO}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea057" c="TRIMESTRE">
                                                        <display:column title="${title1}" sortable="true" sortProperty="TRIMESTRE" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                ${LSTPATS.NTRIM}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea057" c="FECHAINI">
                                                        <display:column title="${title2}" sortable="true" sortProperty="FECHAINI" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTPATS.FINITRIM}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea057" c="FECHAFIN">
                                                        <display:column title="${title3}" sortable="true" sortProperty="FECHAFIN" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTPATS.FFINTRIM}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea057" c="MONEDA">
                                                        <display:column title="${title4}" sortable="true" sortProperty="MONEDA" headerClass="sortable fixed"   media="html" autolink="false" style="width:30%" >
                                                            <div class="dspText">
                                                             ${LSTPATS.TMONEDA}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea057" c="VALOR">
                                                        <display:column title="${title5}" sortable="true" sortProperty="VALOR" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTPATS.IPATTEC}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
													<!-- Inicio IAXIS-15090 13/04/2021 -->
                                                    <axis:visible f="axisrea057" c="PORC">
                                                        <display:column title="${title6}" sortable="true" sortProperty="PORC" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatNumber pattern="#0" value='${LSTPATS.PPORPAT}'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <<axis:visible f="axisrea057" c="TOTAL">
                                                        <display:column title="${title7}" sortable="true" sortProperty="TOTAL" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTPATS.ITOTPAT}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <!-- Fin IAXIS-15090 13/04/2021 -->
                                                    <axis:visible f="axisrea057" c="FECHA">
                                                        <display:column title="${title8}" sortable="true" sortProperty="FECHA" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTPATS.FMOVINI}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <!-- Inicio IAXIS-15090 13/04/2021 -->
                                                    <axis:visible f="axisrea057" c="EDIT">
                                                        <display:column title="${title9}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisrea057" c="EDIT" lit="9901356"/>" title="<axis:alt f="axisrea057" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_editar('${LSTPATS.NANIO}','${LSTPATS.NTRIM}','${LSTPATS.CMONEDA}','${LSTPATS.IPATTEC}','${LSTPATS.NMOVIMI}','${LSTPATS.PPORPAT}')"/>
                                                                
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <!-- Fin IAXIS-15090 13/04/2021 -->
<                                                     <axis:visible f="axisrea057" c="NOU"> 
                                                        <display:column title="${title10}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisrea057" c="NOU" lit="1000428"/>" title="<axis:alt f="axisrea057" c="nou" lit="1000428"/>" src="images/new.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_nou('${LSTPATS.NANIO}','${LSTPATS.NTRIM}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisrea057" c="HIST">
                                                        <display:column title="${title11}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisrea057" c="HIST" lit="9901313"/>" title="<axis:alt f="axisrea057" c="hist" lit="9901313"/>" src="images/informacion.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_hist('${LSTPATS.NANIO}','${LSTPATS.NTRIM}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                     
                                                </display:table>                                                        
                                            </div>
                                        </td>
                            </tr>
    
                        </table>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea057</c:param><c:param name="__botones">salir</c:param></c:import>
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