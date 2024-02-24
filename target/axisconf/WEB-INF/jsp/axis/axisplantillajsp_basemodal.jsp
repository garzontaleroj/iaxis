<%/**
*  Fichero: axisplantillajsp_basemodal.jsp
*  Base de pantalla modal
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>  
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>  
*  Fecha: 23/04/2008
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
        <title><fmt:message key="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_abrir_axisplantillajsp_modal ();
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_basemodal", "cancelar", document.miForm, "_self");
                
            }           
            
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            function f_abrir_axisplantillajsp_modal() {
                objUtiles.abrirModal("axisplantillajsp_modal", "src", "axis_plantilla.do?operation=modal");
            }
            function f_cerrar_axisplantillajsp_modal() {
                objUtiles.cerrarModal("axisplantillajsp_modal");
            }   
            function f_aceptar_axisplantillajsp_modal () {
                f_cerrar_axisplantillajsp_modal();
            }
            
            /****************************************************************************************/
            /**********************************     MODAL MODAL PEQUEÑA    **************************/
            /****************************************************************************************/
          
            function f_abrir_axisplantillajsp_mini() {
                objUtiles.abrirModal("axisplantillajsp_mini", "src", "axis_plantilla.do?operation=mini",480,200);
            }
            function f_cerrar_axisplantillajsp_mini() {
                objUtiles.cerrarModal("axisplantillajsp_mini");
            }   
            function f_aceptar_axisplantillajsp_mini () {
                f_cerrar_axisplantillajsp_mini();
                ptho=null;
            }
            
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
               <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisplantillajsp_modal|<fmt:message key="formulario.axisplantillajsp_modal" /></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid">axisplantillajsp_mini</c:param><c:param name="titulo">axisplantillajsp_mini</c:param>
                <c:param name="modalModo">SOLOX</c:param>
            </c:import>
     

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="formulario.axisplantillajsp_basemodal" /></c:param>
                <c:param name="form">axisplantillajsp_basemodal</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="primera_seccion"/></div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                       
                                            <th style="width:33%;height:0px"></th>
                                            
                                            <th style="width:33%;height:0px"></th>
                                       
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2"/></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja dim100">
                                            <input  type="text" class="campowidth campo campotexto" id="campo1" name="campo1" size="15"
                                            value="campo1"/>
                                            </td>
                                            <td class="campocaja dim100">
                                            <select name="select" id="select" size="1" onchange="" class="campowidth campo campotexto_ob">&nbsp;                                        
                                                    <option value = "null"> - Seleccione una opción - </option>
                                                    <option value = "0" selected>Opción 0</option>
                                                    <option value = "1" selected>Opción 1</option>
                                                    <option value = "2" selected>Opción 2</option>
                                                    <option value = "3" selected>Opción 3</option>
                                                </select>
                                            </td>
                                            <td class="campocaja dim100">
                                            <input  type="text" class="campowidth campo campotexto" id="campo3" name="campo3" size="15"
                                            value="campo3"/>
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisplantillajsp_mini()" style="cursor:pointer"/>
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2" /></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                             <input onClick="" checked
                                            type="checkbox" id="check" name="chek" value="" />
                                            </td>
                                            <td class="campocaja">
                                           <input onClick="" checked
                                            type="checkbox" id="check" name="chek" value="" />
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo3" name="campo3" size="15"
                                            value="campo3"/>
                                            </td>
                                            
                                        </tr>
                                        
                                                                                                                    
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="segunda_seccion"/></div>
                        <!-- Sección 2 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_4"/></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_5"/></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_6"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo4" name="campo4" size="15"
                                            value="campo4"/>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo5" name="campo5" size="15"
                                            value="campo5"/>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo6" name="campo6" size="15"
                                            value="campo6"/>
                                            </td>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <!-- tercera seccion -->
                            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="primera_seccion"/></div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                            <!-- TABLA -->
                                             <c:set var="title0"><fmt:message key="105940"/></c:set>
                                             <c:set var="title1"><fmt:message key="telefono"/></c:set>
                                             <c:set var="title2"><fmt:message key="cargo"/></c:set>
                                             <div class="separador">&nbsp;</div>
                                                <div class="displayspace">
                                                        <display:table name="${lista}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                        requestURI="axis_plantilla.do?operation=modal&paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.NOMBRE}</div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="TLF" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">${miListaId.TLF}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="CARGO" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspText">${miListaId.CARGO}</div>
                                                        </display:column>
                                                    </display:table>
                                                </div>
                                                <div class="separador">&nbsp;</div>
                                            </td>
                                        </tr>
                                                                                         
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <!-- fin tercera seccion-->
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>