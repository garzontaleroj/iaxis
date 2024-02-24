<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisctr041.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 24/07/2008
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr041" c="TITULO" lit="9000416"/></title> <%-- RIESGOS DOMICILIO --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {    
        	f_cargar_propiedades_pantalla();                                            
            var numRiesgosActuales = ${fn:length(__formdata.LIST_RIESGOS)};
            var opennew = document.getElementById('opennew').value;
            
            if ((numRiesgosActuales == 0)||(opennew == '1')) {
                // Abrir modal
                //f_abrir_modal("axisctr042");   
                var geo = ${__formdata.GEODIRECCION};
                document.getElementById('opennew').value= '0';

                var hayErrores=false;
                if (document.getElementById("mensajes_frame").style.visibility=='visible') {
                   hayErrores=true;
                }
                
                if (hayErrores) {

                }
                else {
                     if (geo == 1)
                        f_abrir_modal("axisdir001");
                     else
                        f_abrir_modal("axisctr042");
                }
            }
        }
        
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr041", "cancelar", document.miForm, "_self");
        }
        
        function f_but_anterior() {
            objUtiles.ejecutarFormulario("axis_axisctr041.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_siguiente() {
            objUtiles.ejecutarFormulario("axis_axisctr041.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_anadir_riesgo() {
            var PERMITIRMULTIRIESGOS  = ${__formdata.PERMITIRMULTIRIESGOS};
          // contamos el num. de riesgos cargados en la lista para después compararlo con la función que nos dice si está permitido multiriesgo o no
            var numRiesgosActuales = ${fn:length(__formdata.LIST_RIESGOS)};
            if (PERMITIRMULTIRIESGOS == 0 && numRiesgosActuales >= 1)
                alert('<axis:alt f="axisctr041" c="LIT_PERMIT_RIESGO" lit="9000419"/>');
            else{             
                //f_abrir_modal("axisctr042");
                var geo = ${__formdata.GEODIRECCION};
                if (geo == 1)
                    f_abrir_modal("axisdir001");
                else
                    f_abrir_modal("axisctr042");
            }
        }
        
        function f_but_modificar_riesgo(NRIESGO) {
           // f_abrir_modal("axisctr042", false, "&NRIESGO=" + NRIESGO); 
           var geo = ${__formdata.GEODIRECCION};
            if (geo == 1)
                f_abrir_modal("axisdir002", false, "&NRIESGO=" + NRIESGO + "&MODO=CONSULTA");
            else
                f_abrir_modal("axisctr042", false, "&NRIESGO=" + NRIESGO); 
        }
        
        function f_borrar_riesgo(NRIESGO) {
            objUtiles.ejecutarFormulario("axis_axisctr041.do?NRIESGO=" + NRIESGO, "eliminarRiesgo", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual) {
            f_cerrar_modal(cual);
            if (cual == 'axisctr042')
                objUtiles.ejecutarFormulario("axis_axisctr041.do" , "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        function f_buscar_direcciones(CPOSTAL, CTIPVIA, TNOMVIA, NDESDE, NHASTA, CDESDE, CHASTA, CTIPFINCA, CPAIS, CPROVIN, CPOBLAC, CLOCALIDAD, AFINCA, INE, ESCALERA, PISO, PUERTA, REFERENCIA, IDFINCA) {
            f_cerrar_modal('axisdir001');
            objUtiles.abrirModal("axisdir002", "src", "modal_axisdir002.do?operation=buscar_direcciones&CPOSTAL="+CPOSTAL+
                                                      "&CTIPVIA="+CTIPVIA+"&TNOMVIA="+TNOMVIA+"&NDESDE="+NDESDE+"&NHASTA="+NHASTA+
                                                      "&CDESDE="+CDESDE+"&CHASTA="+CHASTA+"&CTIPFINCA="+CTIPFINCA+"&CPAIS="+CPAIS+
                                                      "&CPROVIN="+CPROVIN+"&CPOBLAC="+CPOBLAC+"&CLOCALIDAD="+CLOCALIDAD+
                                                      "&AFINCA="+AFINCA+"&INE="+INE+"&ESCALERA="+ESCALERA+"&PISO="+PISO+
                                                      "&PUERTA="+PUERTA+"&REFERENCIA="+REFERENCIA+"&IDFINCA="+IDFINCA);    
        }
        
        function f_cancelar_axisdir002(MODO){
            f_cerrar_modal('axisdir002');
            if (objUtiles.estaVacio(MODO))
                f_abrir_modal("axisdir001");
        }
        
        function f_but_portal(IDFINCA){ 
            f_cerrar_modal('axisdir002');
            objUtiles.abrirModal("axisdir001", "src", "modal_axisdir001.do?operation=form&IDFINCA="+IDFINCA); 
        }
        
        function f_aceptar_axisdir002(IDDOMICI){
            f_cerrar_modal('axisdir002');
            objUtiles.ejecutarFormulario("axis_axisctr041.do" , "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
        
        function f_cancelar_axisdir001(cual,IDFINCA){
            
            f_cerrar_modal(cual);
            if(!objUtiles.estaVacio(IDFINCA))
                objUtiles.abrirModal("axisdir002", "src", "modal_axisdir002.do?operation=recargar"); 
            
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr041" c="MODALIDAD" lit="101110" /></c:param>                
                <c:param name="formulario"><axis:alt f="axisctr041" c="TITULO" lit="9000416"/></c:param> <%-- RIESGOS DOMICILIO --%>
                <c:param name="form">axisctr041</c:param>
        </c:import>
        
       
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr042|<axis:alt f="axisctr041" c="TITULO_DOMIC" lit="9901647"/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisdir001|<axis:alt f="axisctr041" c="TITULO_DOMIC" lit=""/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisdir002|<axis:alt f="axisctr041" c="TITULO_DOMIC" lit=""/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="opennew" id="opennew" value="${__formdata.opennew}"/>
        <input type="hidden" name="GEODIRECCION" value="${__formdata.GEODIRECCION}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr041" c="TITULO_LISTA" lit="9000418"/></div>                                        
                    <table class="seccion" align="center">   
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisctr041" c="NRIESGO1" lit="800440"/> <axis:alt f="axisctr041" c="NRIESGO2" lit="100649"/></c:set>   <%-- Nº Risc --%>
                                            <c:set var="title1"><axis:alt f="axisctr041" c="TDOMICI" lit="9000415"/></c:set>  <%-- Descripción domicilio --%>
                                            <c:set var="title2"><axis:alt f="axisctr041" c="CPOSTAL" lit="101081"/></c:set>   <%-- C.P. --%>
                                            <c:set var="title3"><axis:alt f="axisctr041" c="TPROVIN" lit="100756"/></c:set>   <%-- Provincia --%>
                                            <c:set var="title4"><axis:alt f="axisctr041" c="TPOBLAC" lit="100817"/></c:set>   <%-- Població --%>
                                            <div class="separador">&nbsp;</div>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.LIST_RIESGOS}" id="LIST_RIESGOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr041.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="NRIESGO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber">${LIST_RIESGOS.NRIESGO}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TDOMICI" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LIST_RIESGOS.TIPO_VIA} ${LIST_RIESGOS.TDOMICI} ${LIST_RIESGOS.NVIAADCO} - ${LIST_RIESGOS.NPLACACO} </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="CPOSTAL" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LIST_RIESGOS.CPOSTAL}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TPROVIN" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LIST_RIESGOS.TPROVIN}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TPOBLAC" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LIST_RIESGOS.TPOBLAC}</div>
                                                    </display:column>
                                                    <axis:visible c="BT_MODIF_DIR" f="axisctr041">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <div class="dspIcons"><a href="javascript:f_but_modificar_riesgo('${LIST_RIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr041" c="BT_MODIF_DIR" lit="100002"/>" title="<axis:alt f="axisctr041" c="BT_MODIF_DIR" lit="100002"/>" src="images/lapiz.gif"/></a></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible c="BT_DELETE_DIR" f="axisctr041">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <div class="dspIcons"><a href="javascript:f_borrar_riesgo('${LIST_RIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr041" c="BT_DELETE_DIR" lit="1000127" />" title="<axis:alt f="axisctr041" c="BT_DELETE_DIR" lit="1000127" />" src="images/delete.gif"/></a></div>
                                                    </display:column>
                                                    </axis:visible>
                                                </display:table>
                                            </div>
                                        </td>
                                    </tr>                        
                                </table>
                            </td>
                        </tr>            
                   <%--     
                   Comentat fins que es necessiti el multirrisc--%>
                   <axis:visible c="BT_ANADIR_RIESGO" f="axisctr041">
                   			<tr>
                            <td align="right">
                                <div class="separador">&nbsp;</div>
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton" value="<axis:alt f="axisctr041" c="BT_ANADIR_RIESGO" lit="9001286"/>" onclick="f_but_anadir_riesgo()" />
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </axis:visible>    
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr041</c:param>
            <c:param name="__botones">cancelar,<axis:visible c="BT_ANTERIOR" f="axisctr041">anterior,</axis:visible>siguiente</c:param> 
        </c:import>
        
        
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>