<%/* Revision:# LspDjqQ3k8RKVYULxXel+Q== # */%>
<%/*
*  Fichero: axisctr040.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 25/08/2008
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
    <title><axis:alt f="axisctr040" c="TTITULO" lit="9000417"/></title> <%-- RIESGOS INNOMINADOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                                                

            //-- Bug 0016544 - 24/12/2010 - JMF
            f_cargar_propiedades_pantalla();
            var numRiesgosActuales = ${fn:length(__formdata.LIST_RIESGOS)};
            var opennew = document.getElementById('opennew').value;
            if ((numRiesgosActuales == 0)||(opennew == '1')){             
                document.getElementById('opennew').value= '0';
                f_abrir_modal("axisctr043");            
            }
        }

        
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr040", "cancelar", document.miForm, "_self");
        }
        
        function f_but_anterior() {
            objUtiles.ejecutarFormulario("axis_axisctr040.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_siguiente() {
            objUtiles.ejecutarFormulario("axis_axisctr040.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_anadir_riesgo() {
            var PERMITIRMULTIRIESGOS  = ${__formdata.PERMITIRMULTIRIESGOS};
            var numRiesgosActuales = ${!empty __formdata.NUMRIESGOS ? __formdata.NUMRIESGOS : 0};
            
            if (PERMITIRMULTIRIESGOS == 0 && numRiesgosActuales == 1)                
                alert("<axis:alt f='axisctr040' c='ALERTBUTANADIR' lit='9000419'/>");
            else             
                f_abrir_modal("axisctr043");
        }
        
        function f_but_modificar_riesgo(NRIESGO) {
            f_abrir_modal("axisctr043", false, "&NRIESGO=" + NRIESGO);                        
        }
        
        function f_but_descrip_riesgo(NRIESGO) {
            //f_abrir_modal("axisctr044", false, "&NRIESGO=" + NRIESGO);  
			var producto = $("#PRODUCTO").val();
			
        	if(producto == "8063"){
        		f_abrir_modal("axisctr043", false, "&NRIESGO=" + NRIESGO);  
        	}else{
        		f_abrir_modal("axisctr044", false, "&NRIESGO=" + NRIESGO);  
        	}   
        }        
        
        function f_borrar_riesgo(NRIESGO) {
            objUtiles.ejecutarFormulario("axis_axisctr040.do?NRIESGO=" + NRIESGO, "eliminarRiesgo", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            if (cual == 'axisctr043')
                objUtiles.ejecutarFormulario("axis_axisctr040.do" , "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr040" c="TMODALIDAD" lit="101110" />
                <axis:visible f="axisctr040" c="NPOLIZA"> 
                   <axis:alt f="axisctr040" c="TITULO_FORM" lit="101779"/> 
                   <axis:ocultar f="axisctr040" c="TITULO_COLECTIVO" dejarHueco="false">
            			<axis:alt f="axisctr040" c="TITULO_FORM" lit="102707"/> 
            	   </axis:ocultar>
            		${__formdata.NPOLIZA}
                </axis:visible>
                <axis:visible f="axisctr040" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
                </axis:visible>
                </c:param> 
                
                <c:param name="formulario"><axis:alt f="axisctr040" c="RIESGOS_INNOMINADOS" lit="9000417"/></c:param> <%-- RIESGOS INNOMINADOS --%>
                <c:param name="form">axisctr040</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr043|<axis:alt f="axisctr040" c="TRIESGOINNOMINADO" lit="9000471"/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO INNOMINADO --%>
        </c:import>
        
        <!-- INI BUG CONF-114 - 17/09/2016 - JAEG-->   
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr040" c="TITULO_DET" lit="1000199" /></c:param>
            <c:param name="nid" value="axisctr044" />
        </c:import>
        <!-- FIN BUG CONF-114 - 17/09/2016 - JAEG-->         
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="opennew" id="opennew" value="${__formdata.opennew}"/>
		<input type="hidden" name="PRODUCTO" id="PRODUCTO" value="${__formdata.PRODUCTO}"/><!-- bartolo-->  
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr040" c="LLISTA_RISCOS" lit="9000418"/></div>                                        
                    <table class="seccion" align="center">   
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisctr040" c="TNUMERO" lit="800440"/><axis:alt f="axisctr040" c="NUM_RIESGO" lit="100649"/></c:set>   <%-- Nº Risc --%>
                                            <c:set var="title1"><axis:alt f="axisctr040" c="TDESCRIPCION" lit="100588"/></c:set>  <%-- Descripción --%>                                            
                                            <c:set var="title4"><axis:alt f="axisctr040" c="TNUMASSEGURADOS" lit="9000477"/></c:set> <%-- Nº Asegurados --%>
                                            <div class="separador">&nbsp;</div>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.LIST_RIESGOS}" id="LIST_RIESGOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr040.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="NRIESGO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber">${LIST_RIESGOS.NRIESGO}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TNATRIE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LIST_RIESGOS.TRIESGO}</div>
                                                    </display:column>
                                                    <c:if test="${__formdata.COBJASE == 4}">
                                                    <display:column title="${title4}" sortable="true" sortProperty="NASEGUR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${LIST_RIESGOS.NASEGUR}</div>
                                                    </display:column>
                                                    </c:if>
                                                    
                                                    <!-- FIN BUG CONF-114 - 17/09/2016 - JAEG-->                                                    
                                                    <axis:visible c="BT_DESC_RIE" f="axisctr040">                                                    
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <div class="dspIcons"><a href="javascript:f_but_descrip_riesgo('${LIST_RIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr040" c="BT_DESCRIPCION" lit="1000199"/>" title="<axis:alt f="axisctr040" c="BT_DESCRIPCION" lit="1000199"/>" src="images/firmar.gif"/></a></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <!-- FIN BUG CONF-114 - 17/09/2016 - JAEG-->  
                                                    
                                                    <axis:visible c="BT_MODIF_RIE" f="axisctr040">                                                    
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <c:if test="${empty LIST_RIESGOS.permiteModificarPlan ||  LIST_RIESGOS.permiteModificarPlan == 0}">
                                                        <div class="dspIcons"><a href="javascript:f_but_modificar_riesgo('${LIST_RIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr040" c="BT_EDITAR" lit="100002"/>" title="<axis:alt f="axisctr040" c="BT_EDITAR" lit="100002"/>" src="images/lapiz.gif"/></a></div>
                                                        </c:if>
                                                    </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible c="BT_DELETE_RIE" f="axisctr040">
                                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                        <c:if test="${empty LIST_RIESGOS.permiteModificarPlan ||  LIST_RIESGOS.permiteModificarPlan == 0}">
                                                        <div class="dspIcons"><a href="javascript:f_borrar_riesgo('${LIST_RIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr040" c="BT_ELIMINAR" lit="1000127" />" title="<axis:alt f="axisctr040" c="BT_ELIMINAR" lit="1000127" />" src="images/delete.gif"/></a></div>
                                                        </c:if>
                                                    </display:column>
                                                    </axis:visible>
                                                </display:table>
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
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr040</c:param>
            <c:param name="f">axisctr040</c:param>
            <c:param name="__botones">cancelar,<axis:visible c="BT_ANTERIOR" f="axisctr040">anterior,</axis:visible>siguiente</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>
