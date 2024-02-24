<%/**
*  Fichero: axispen009.jsp
* 
*  Busqueda de Planes pension
*	
*
*
*  Fecha: 14/12/2009
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
    <title><axis:alt f="axispen009" c="titulo" lit="9900850"/></title> <%-- Buscador de planes de pensiones --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>   
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
       function f_onload() {                                 
            document.getElementById("CODDGS").focus();
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen009');
        }
        
     
       function f_but_buscar() {            
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axispen009.do","form",document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }        
       function f_but_aceptar () {
            var CCODPLAN = null;
            if (!objUtiles.estaVacio(document.miForm.checked_poliza)) {
                // Checkeada por el radio button
                CCODPLAN = objUtiles.f_GuardaCasillasChecked("checked_poliza");
            } 
             if (typeof CCODPLAN == 'boolean' || objUtiles.estaVacio (CCODPLAN)) {
                alert(objJsMessages.jslit_selecciona_registro);
            }else{
                parent.f_aceptar_axispen009(CCODPLAN);
            }
         }
         function f_aceptarAxispen014(CCODPLA){
                objUtiles.cerrarModal("axispen014");
                parent.f_aceptar_axispen009(CCODPLA); 
        }
        
        function f_but_nuevo() {
                f_abrir_modal("axispen014",null,"&parametro=ALTA");
                
        }
        
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
        
    </script>    
</head>

<body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axispen009" c="titulo" lit="9900850"/></c:param>     <%-- Buscador de planes de pensiones --%>
                <c:param name="formulario"><axis:alt f="axispen009" c="formulario" lit="9900850"/></c:param> <%-- Buscador de planes de pensiones --%>
                <c:param name="form">axispen009</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen014|<axis:alt c="title_AXISPEN014" f="axispen009" lit="9900722"/><%-- Cercador de plans de pensions --%>
                </c:param>
         </c:import>     
        <input type="hidden" name="operation" value="form"/> 
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axispen009" c="CODDGS">
                                            <td class="titulocaja"> 
                                                <b id="label_CODDGS"><axis:alt f="axispen009" c="CODDGS" lit="9900843"/></b> <%-- Codi pla --%>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen009" c="NOMPLA">
                                            <td class="titulocaja"> 
                                                <b id="label_NOMPLA"><axis:alt f="axispen009" c="NOMPLA" lit="105940"/></b> <%-- Nom pla --%>
                                            </td>
                                        </axis:visible>                                        
                                        <axis:visible f="axispen009" c="FON_CODDGS">
                                            <td class="titulocaja"> 
                                                <b id="label_CCODDEP"><axis:alt f="axispen009" c="FON_CODDGS" lit="9001352"/></b> <%-- Codi fons --%>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                       <axis:visible f="axispen009" c="CODDGS">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CODDGS}" name="CODDGS" id="CODDGS" style="width:90%;"
                                            </td>
                                        </axis:visible>
                                       <axis:visible f="axispen009" c="NOMPLA">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMPLA}" name="NOMPLA" id="NOMPLA" style="width:100%;"
                                            </td>
                                        </axis:visible>                                        
                                        <axis:visible f="axispen009" c="FON_CODDGS">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.FON_CODDGS}" name="FON_CODDGS" id="FON_CODDGS" style="width:60%;"
                                            </td>
                                        </axis:visible>
                                    </tr>                                   
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    
                      <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            
                            <c:set var="title1"><axis:alt f="axispen009" c="title1" lit="1000109"/></c:set>
                            <c:set var="title2"><axis:alt f="axispen009" c="title2" lit="9900880"/></c:set>                            
                            <c:set var="title3"><axis:alt f="axispen009" c="title3" lit="9001352"/></c:set>
                            <c:set var="title4"><axis:alt f="axispen009" c="title4" lit="108263"/></c:set>
                            <c:set var="title5"><axis:alt f="axispen009" c="title5" lit="9905714"/></c:set>
                            <c:set var="title6"><axis:alt f="axispen009" c="title6" lit="9001778"/></c:set>
                            <div class="seccion displayspaceGrande">
                            
                                <display:table name="${__formdata.AXIS_PLANES}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr019.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['checkedPoliza']}">checked</c:if> type="radio" id="checked_poliza" name="checked_poliza" value="${miListaId.OB_IAX_PLANPENSIONES.CCODPLA}"/></div>
                                        
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" style="width:5%;" sortProperty="OB_IAX_PLANPENSIONES.CCODPLA" headerClass="sortable"  media="html" autolink="false" >    
                                        <div class="dspText">${miListaId.OB_IAX_PLANPENSIONES['CODDGS']}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" style="width:26%;" sortProperty="OB_IAX_PLANPENSIONES.TNOMPLA" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_PLANPENSIONES['TNOMPLA']}</div>
                                    </display:column>                                    
                                    <display:column title="${title3}" sortable="true" style="width:5%;" sortProperty="OB_IAX_PLANPENSIONES.CCODFON" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_PLANPENSIONES['CFONDGS']}</div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" style="width:26%;" sortProperty="OB_IAX_PLANPENSIONES.TFONDO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_PLANPENSIONES['TFONDO']}</div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="true" style="width:5%;" sortProperty="OB_IAX_PLANPENSIONES.CCODGES" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_PLANPENSIONES['CGESDGS']}</div>
                                    </display:column>
                                    <display:column title="${title6}" sortable="true" style="width:26%;" sortProperty="OB_IAX_PLANPENSIONES.TNOMGES" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId.OB_IAX_PLANPENSIONES['TNOMGES']}</div>
                                    </display:column>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        
                </td>
            </tr>
        </table>        
        <c:import url="../include/botonera_nt.jsp">
          <c:param name="f">axispen009</c:param>
          <c:param name="__botones">cancelar<axis:visible c="BT_BUSCAR" f="axispen009">,buscar</axis:visible>,aceptar<axis:visible c="BT_NUEVO" f="axispen009">,nuevo</axis:visible></c:param> 
        </c:import>
    </form>    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>