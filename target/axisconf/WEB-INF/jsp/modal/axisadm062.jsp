<%/*
*  Fichero: axisadm062.jsp
*
*  @author <a href = "mailto:icanada@csi-ti.com">Ivan Canada</a>
*
*
*  Fecha: 14/11/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>



<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla();
            document.miForm.CBANCO.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
        }
        
        
        
        
        function f_but_aceptar() {
            if(typeof document.miForm.seleccionaBanco == 'undefined' || typeof document.miForm.seleccionaBanco == 'null')
                alert(objJsMessages.jslit_busca_primero_agente);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaBanco");
                if (!hayChecked) 
                    alert(objJsMessages.jslit_selecciona_de_lista_agente);
                else 
                    f_seleccionar_banco(hayChecked);
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm062();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta, ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm062.do", "busqueda_banco", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
         
        function f_seleccionar_banco(CBANCO){
            if (objUtiles.estaVacio(CBANCO))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                parent.f_aceptar_axisadm062 (CBANCO);
            }
         }
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisadm059" lit="9901537" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisadm059" lit="9901537" /></c:param>
                <c:param name="form">axisadm062</c:param>
            </c:import>
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
                                <axis:ocultar f="axisadm062" c="CBANCO" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt c="CBANCO" f="axisadm062" lit="9000964" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm062" c="TBANCO" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt c="TBANCO" f="axisadm062" lit="100588" /></b>
                                    </td> 
                                </axis:ocultar>    
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm062" c="CBANCO" dejarHueco="false"> 
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['CBANCO']}" name="CBANCO" id="CBANCO" size="10"
                                        style="width:90%" title="<axis:alt c="CBANCO" f="axisadm062" lit="9000964"/>" maxLength="6" <axis:atr f="axisadm062" c="CBANCO" a="formato=entero"/>/> 
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm062" c="TBANCO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['TBANCO']}" name="TBANCO" id="TBANCO" size="15"
                                        style="width:97%" title="<axis:alt c="TBANCO" f="axisadm062" lit="100588"/>"/>
                                    </td>  
                                </axis:ocultar>    
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <!-- DisplayTag Bancos -->
                        <c:set var="title0"><axis:alt c="CBANCO" f="axisadm062" lit="9000964"/></c:set>
                        <c:set var="title1"><axis:alt c="TBANCO" f="axisadm062" lit="100588"/></c:set>                        
                        <div class="seccion displayspaceGrande">                        
                            <display:table name="${Axisadm062_listaBancos}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axisadm062.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="radio" id="seleccionaBanco" name="seleccionaBanco" value="${miListaId['CBANCO']}" style="width:10%"  /></div>
                                </display:column>
                                 <axis:visible f="axisadm062" c="CBANCO"> 
                                     <display:column title="${title0}" sortable="true" sortProperty="CBANCO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['CBANCO']}</div>
                                    </display:column>                                
                                </axis:visible>
                                <axis:visible f="axisadm062" c="TBANCO"> 
                                    <display:column title="${title1}" sortable="true" sortProperty="TBANCO" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                        <div class="dspText">${miListaId['TBANCO']}</div>
                                    </display:column>  
                               </axis:visible>     
                            </display:table>
                            <c:choose>
                            <c:when test="${!empty Axisadm062_listaBancos}">
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
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm062</c:param>        
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>