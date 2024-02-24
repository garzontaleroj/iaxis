<%/*
*  Fichero: axispro045.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 14/06/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    
    
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           //parent.f_cerrar_modal('axispro045');
           parent.parent.reabrir_modal_garantias("modal_axispro001_garantias.do?operation=form&SPRODUC=${__formdata.SPRODUC}&CACTIVI=${param.PCACTIVI}&CGARANT=${param.PCGARANT}&dt="+(new Date().getTime()) + "&subpantalla=garantias_incompatibilidades");
        }
        
        function f_onload(){
        
            revisarEstilos();
        }   
            
        
        function f_but_aceptar() {
            objUtiles.ejecutarFormulario("modal_axispro045.do?CGARINC="+document.miForm.LSTGARIN.value, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_borrar(VCGARINC) {
            objUtiles.ejecutarFormulario("modal_axispro045.do?CGARINC="+VCGARINC, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro045.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="9901250"/></c:param>
            <c:param name="form">axispro045</c:param>
            <c:param name="titulo"><fmt:message key="9901250"/></c:param>
        </c:import>

        <input type="hidden" id="PSPRODUC" name="PSPRODUC" value="${SPRODUC}"/>
        <input type="hidden" id="PCACTIVI" name="PCACTIVI" value="${ACTIVIDAD}"/>
        <input type="hidden" id="PCGARANT" name="PCGARANT" value="${CGARANTIA}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="VMODO" name="VMODO" value="${__formdata.VMODO}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <c:if test="${!empty mntproducto.SPRODUC}">
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:35%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:45%;height:0px"></th>
                        </tr>
                        <!-- Producto -->
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="100829" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${mntproducto.SPRODUC}" name="SPRODUC" id="SPRODUC" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}" name="TPRODUC" id="TPRODUC" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <!-- Actividad -->
                        <tr>
                            <td></td>
                            <td class="titulocaja" id="TACTIVIDAD">
                                <b ><fmt:message key="103481" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CCACTIVI">
                                <input type="text" class="campowidthinput campo campotexto" value="${ACTIVIDAD}" name="CACTIVI" id="CACTIVI" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja" id="TTACTIVI">
                                <input type="text" class="campowidthinput campo campotexto" value="${TACTIVIDAD}" name="TACTIVI" id="TACTIVI" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <!-- Garantia -->
                        <tr>
                            <td></td>
                            <td class="titulocaja"  >
                                <b id="TGARANTIA"><fmt:message key="100561"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CCGARANT">
                                <input type="text" class="campowidthinput campo campotexto" value="${CGARANTIA}" name="CGARANT" id="CGARANT" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja" id="TTGARANT">
                                <input type="text" class="campowidthinput campo campotexto" value="${TGARANTIA}" name="TGARANT" id="TGARANT" size="15" readonly="true"/>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                </c:if>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:30%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:50%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="100561" /></b>
                            </td>
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <select name="LSTGARIN" style="width:90%"  id="LSTGARIN" size="1" onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="garantias" items="${__formdata.COMBOS.LSTGARIN}" varStatus="status">
                                        <option value = "${garantias.CGARANT}"
                                            <c:if test="${__formdata.LSTGARIN == garantias.CGARANT}" >selected</c:if>>
                                            ${garantias.TGARANT}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                 <input type="button" class="boton" id="but_anadir_incompa" value="<axis:alt f="axispro045" c="BT_NOU_INCOM" lit="104825"/>" onclick="f_but_aceptar()" />  
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left" colspan="2">
                                <c:set var="title0"><fmt:message key="100791"/></c:set>
                                <div class="displayspace">
                                <display:table name="${mntgaran.INCOMPGARAN}" id="INCOMPGARAN" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="6" sort="list" cellpadding="0" cellspacing="0" requestURI="modal_axispro045.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" headerClass="sortable" sortable="true" sortProperty="INCOMPGARAN.TGARINC" style="width:90%" media="html" autolink="false" >
                                        <div class="dspText">${INCOMPGARAN.OB_IAX_PRODINCOMPGARAN.TGARINC}</div>
                                    </display:column>
                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons" id="BT_SIN_DELETE_INCOM"><img border="0" alt="<fmt:message key="1000127"/>" title1="<fmt:message key="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                        style="cursor:pointer;" onclick="javascript:f_but_borrar('${INCOMPGARAN.OB_IAX_PRODINCOMPGARAN.CGARINC}')"/></div> 
                                    </display:column>
                                </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir</c:param></c:import>
        
        
    
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>