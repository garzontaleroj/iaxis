<%/*
*  Fichero: axisctr503.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*
*  Fecha: 14/11/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisctr503');
					</c:if>
            f_cargar_propiedades_pantalla(); 
            document.miForm.CPROVIN.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
                
        }
        
        function f_but_aceptar() {

            if(typeof document.miForm.seleccionaConvenio == 'undefined' || typeof document.miForm.seleccionaConvenio == 'null')
                alert(objJsMessages.jslit_busca_primero_general);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaConvenio");               
                if (!hayChecked) 
                    alert(objJsMessages.jslit_selecciona_registro);
                else 
                {                    
                    f_seleccionar_convenio(hayChecked);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr503();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta, ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisctr503.do", "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_seleccionar_convenio(VARTODO){
       
                    var viene = VARTODO;                 
                    var agentSplit = objUtiles.utilSplit(viene, "#");
                    var TDESCRI = agentSplit[0];
                    var NVERSION = agentSplit[1];
                    var OB_IAX = agentSplit[2]; 
                    var TCODCONV = agentSplit[3]; 
            if (objUtiles.estaVacio(TDESCRI))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{            
                parent.f_aceptar_axisctr503(TDESCRI,NVERSION,OB_IAX,TCODCONV);
            }
         }
    </script>
  </head>
  
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisctr503" lit="9907572" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisctr503" lit="9907572" /></c:param>
                <c:param name="form">axisctr503</c:param>
            </c:import>
            
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            <input type="hidden" id="PARTNER" name="PARTNER" value="${__formdata.PARTNER}"/> 
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/> 
             <input type="hidden" id="TCODCONV" name="${sessionScope.axisctr503_listaConvenios}" value="${miListaId.OB_IAX_CONVEMPVERS.TCODCONV}"/> 

            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0%;"/>
                                <th style="width:65%;height:0%;"/>
                                <th style="width:20%;height:0%;"/>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="CPROVIN" f="axisctr503" lit="9907573" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="TDESCRI" f="axisctr503" lit="100588" /></b>
                                </td>                            
                            </tr>
                            <tr>
         
                                 <axis:ocultar f="axisctr503" c="CPROVIN">
                                            <td class="campocaja">                                
                                                <select name="CPROVIN" id="CPROVIN" size="1" class="campowidthselect campo campotexto" style="width:79%;" <axis:atr f="axisctr503" c="CPROVIN" a="modificable=false&obligatorio=true&isInputText=true"/>
                                                title="<axis:alt f="axisctr503" c="CPROVIN" lit="9907573"/>">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr503" c="SELECC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${LSTAMBITOS}">
                                                        <option value = "${element.CPROVIN}"
                                                        <c:if test="${__formdata.CPROVIN == element.CPROVIN || fn:length(LSTAMBITOS) == 1}"> selected = "selected"</c:if>>
                                                            ${element.TPROVIN} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['TDESCRI']}" name="TDESCRI" id="TDESCRI" size="15"
                                    style="width:97%" title="<axis:alt c="TDESCRI" f="axisctr503" lit="100588"/>"/>
                                </td>                                
                            </tr>                          
                        </table>

                        <div class="separador">&nbsp;</div>
                        <!-- DisplayTag Agentes -->
                        <c:set var="title0"><axis:alt c="CONVENIOS" f="axisctr503" lit="9905712"/></c:set>
                        <c:set var="title1"><axis:alt c="CONVENIOS" f="axisctr503" lit="9907599"/></c:set>                        
                        <div class="seccion displayspaceGrande">
                            <display:table name="${sessionScope.axisctr503_listaConvenios}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr503.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="radio" id="seleccionaConvenio" name="seleccionaConvenio" value="${miListaId.OB_IAX_CONVEMPVERS.TDESCRI}#${miListaId.OB_IAX_CONVEMPVERS.NVERSION}#${miListaId.OB_IAX_CONVEMPVERS}"/></div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CONVEMPVERS.TDESCRI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_seleccionar_convenio('${miListaId.OB_IAX_CONVEMPVERS.TDESCRI}#${miListaId.OB_IAX_CONVEMPVERS.NVERSION}#${miListaId.OB_IAX_CONVEMPVERS}#${miListaId.OB_IAX_CONVEMPVERS.TCODCONV}')">${miListaId.OB_IAX_CONVEMPVERS.TCODCONV}</a></div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CONVEMPVERS.TDESCRI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_seleccionar_convenio('${miListaId.OB_IAX_CONVEMPVERS.TDESCRI}#${miListaId.OB_IAX_CONVEMPVERS.NVERSION}#${miListaId.OB_IAX_CONVEMPVERS}#${miListaId.OB_IAX_CONVEMPVERS.TCODCONV}')">${miListaId.OB_IAX_CONVEMPVERS.TDESCRI}</a></div>
                                </display:column>
                            </display:table>
                        
                            <c:choose>
                            <c:when test="${!empty sessionScope.axisctr503_listaConvenios &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                            </c:when>
                            <c:otherwise>
                            	 <c:if test="${!(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">
                                   objLista.esconderListaSpans();
                                   objLista.esconderListaLinks();     
                                </script>
                              </c:if>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr503</c:param>        
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>