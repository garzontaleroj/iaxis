<%/**
*  Fichero: axisfinv010.jsp
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
        <title><axis:alt f="axisfinv010" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>       
        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            var resultados = "${fn:length(listaFon)>0}";
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
                if(objUtiles.utilEquals(resultados, "false"))
                    f_cercar();
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfinv010", "cancelar", document.miForm, "_self");
            }
            
            function f_cercar (){//Cercar
                objUtiles.abrirModal("axisfinv001", "src", "modal_axisfinv001.do?operation=form&porig=10");  
            }
            
            function f_buscar_modal(cual, params) {
                f_cerrar_modal(cual);
                objUtiles.ejecutarFormulario("axis_axisfinv010.do" + params, "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
                
            /*function f_buscar (PMONORIG,PMONDES){
                 f_cerrar_modal("axisfinv001");
                 objUtiles.ejecutarFormulario ("axis_axisfinv010.do?B_MONORIG="+PMONORIG+"&B_MONDES="+PMONDES, "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }*/
           
            function f_editar (CCODFON,CEMPRES){
                objUtiles.abrirModal("axisfinv011", "src", "modal_axisfinv011.do?operation=form&PAR_CCODFON=" + CCODFON + "&NOU=0&PAR_CEMPRES="+CEMPRES);
            }
            
            function f_new (CEMPRES){
                objUtiles.abrirModal("axisfinv011", "src", "modal_axisfinv011.do?operation=nou&NOU=1&PAR_CEMPRES="+CEMPRES);
            }
            
            function f_nou (CCODFON,CEMPRES){
                objUtiles.abrirModal("axisfinv011", "src", "modal_axisfinv011.do?operation=nou&PAR_CCODFON=" + CCODFON + "&NOU=0&PAR_CEMPRES="+CEMPRES);
            }
            
            function f_hist (CCODFON){
                objUtiles.abrirModal("axisfinv012", "src", "modal_axisfinv012.do?operation=form&PAR_CCODFON=" + CCODFON);
            }
            
            function f_cerrar_modal(cual){
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_axisfinv011(coddfon){
                f_cerrar_modal("axisfinv011");
                objUtiles.ejecutarFormulario ("axis_axisfinv010.do?CCODFON_MODAL="+coddfon, "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>    
        <form name="miForm" action="" method="POST"> 
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="busq" value=""/> 
            <input type="hidden" name="CEMPRES_SEL" id="CEMPRES_SEL" value="${CEMPRES_SEL}"/> 

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv010" c="TITULO_PANTALLA" lit="9902144" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv010" c="TITULO_FORM" lit="9902144" /></c:param>
                
                <c:param name="form">axisfinv010</c:param>
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
                    <c:param name="nid_y_titulo">axisfinv001|<axis:alt f="axisfinv010" c="MODAL_BUSCAR" lit="9001287" /></c:param>
             </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisfinv011|<axis:alt f="axisfinv010" c="MODAL_NOU" lit="9902150" /></c:param>
             </c:import>
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisfinv012|<axis:alt f="axisfinv010" c="MODAL_HIST" lit="9902148" /></c:param>
             </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo">    
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><axis:alt f="axisfinv010" c="IMG_SECC" lit="9902147"/>
                                <axis:visible f="axisfinv010" c="BOT_BUSCAR">
                                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisfinv010" c="BOT_BUSCAR" lit="100797" />" onclick="f_cercar();" style="cursor:pointer"/>  
                                </axis:visible>
                            </div>
                            <div style="float:right;">
                                <axis:visible f="axisfinv010" c="BOT_NEW">
                                    <img id="new" border="0" src="images/new.gif" alt="<axis:alt f="axisfinv010" c="BOT_NEW" lit="1000428"/>" onclick="f_new(${CEMPRES_SEL});" style="cursor:pointer"/>  
                                </axis:visible>
                            </div>
                            <div style="clear:both;">
                               
                            </div>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            
                           <tr>                       
                                        
                                        <td class="titulocaja" style="padding-right: 0px;">
                                            <%-- DisplayTag Facturas --%>
                                            
                                            <c:set var="title0"><axis:alt f="axisfinv010" c="TFONCMP" lit="107059"/></c:set>  
                                            <c:set var="title1"><axis:alt f="axisfinv010" c="FINICIO" lit="9000526"/></c:set>  
                                            <c:set var="title2"><axis:alt f="axisfinv010" c="FFIN" lit="9000527"/></c:set>  
                                            <c:set var="title3"><axis:alt f="axisfinv010" c="TTIPCOM" lit="9902149"/></c:set>  
                                            <c:set var="title4"><axis:alt f="axisfinv010" c="TTIPOCALCUL" lit="9002111"/></c:set>  
                                            <c:set var="title5"><axis:alt f="axisfinv010" c="PGASTOS" lit="101467"/></c:set>  
                                            <c:set var="title6"><axis:alt f="axisfinv010" c="IIMPFIJ" lit="9902145"/></c:set>  
                                            <%int contador = 0;%>
                                            <div id="dt_recibos" class="seccion displayspaceGrande">
                                                <display:table name="${listaFon}" id="LSTCOT" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisfinv010.do?operation=form&paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <axis:visible f="axisfinv010" c="TFONCMP">
                                                        <display:column title="${title0}" sortable="true" sortProperty="TFONCMP" headerClass="sortable"  media="html" autolink="false" style="width:20%" >
                                                            <div class="dspText">
                                                                ${LSTCOT.TFONCMP}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="FINICIO">
                                                        <display:column title="${title1}" sortable="true" sortProperty="FINICIO" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOT.FINICIO}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="FFIN">
                                                        <display:column title="${title2}" sortable="true" sortProperty="FFIN" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOT.FFIN}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="TTIPCOM">
                                                        <display:column title="${title3}" sortable="true" sortProperty="TTIPCOM" headerClass="sortable"  media="html" autolink="false" style="width:20%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.TTIPCOM}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="TTIPOCALCUL">
                                                        <display:column title="${title4}" sortable="true" sortProperty="TTIPOCALCUL" headerClass="sortable"  media="html" autolink="false" style="width:10%" >
                                                            <div class="dspText">
                                                             ${LSTCOT.TTIPOCALCUL}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="PGASTOS">
                                                        <display:column title="${title5}" sortable="true" sortProperty="PGASTOS" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="##0.00" value="${LSTCOT.PGASTOS}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="IIMPFIJ">
                                                        <display:column title="${title6}" sortable="true" sortProperty="IIMPFIJ" headerClass="sortable"  media="html" autolink="false" style="width:9%" >
                                                            <div class="dspNumber">
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCOT.IIMPFIJ}"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisfinv010" c="EDIT">
                                                        <display:column title="" sortable="" sortProperty="" headerClass="sortable"  media="html" autolink="false" style="width:3%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisfinv010" c="edit" lit="9901356"/>" title="<axis:alt f="axisfinv010" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_editar('${LSTCOT.CCODFON}','${CEMPRES_SEL}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="NOU">
                                                        <display:column title="" sortable="" sortProperty="" headerClass="sortable"  media="html" autolink="false" style="width:3%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisfinv010" c="nou" lit="1000428"/>" title="<axis:alt f="axisfinv010" c="nou" lit="1000428"/>" src="images/new.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_nou('${LSTCOT.CCODFON}','${CEMPRES_SEL}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv010" c="HIST">
                                                        <display:column title="" sortable="" sortProperty="" headerClass="sortable"  media="html" autolink="false" style="width:3%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axisfinv010" c="hist" lit="9901313"/>" title="<axis:alt f="axisfinv010" c="hist" lit="9901313"/>" src="images/informacion.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_hist('${LSTCOT.CCODFON}')"/>
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
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfinv010</c:param><c:param name="__botones">salir</c:param></c:import>
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