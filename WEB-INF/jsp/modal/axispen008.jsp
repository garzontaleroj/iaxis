<%/*
*  Fichero: axispen008.jsp
*
*  Fecha: 15/12/2009
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
    <title><axis:alt c="title" f="axispen008" lit="9001864"/></title> <%-- Buscador de facultativos --%>
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
            document.getElementById("CCODFON").focus();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen008');
        }
        
      
       function f_but_buscar() {  
            objUtiles.ejecutarFormulario("modal_axispen008.do", "busqueda_fons", document.miForm, "_self", objJsMessages.jslit_cargando);
        }  

        function f_buscar_fondos(){   
            objUtiles.ejecutarFormulario("modal_axispen008.do", "busqueda_fons", document.miForm, "_self", objJsMessages.jslit_cargando);
        }        

            function f_but_aceptar() {
                if (!objUtiles.estaVacio(document.miForm.rdio_value)) {
                    // Checkeada por el radio button
                    CCODFON = objDom.getValorPorId("rdio_value");
                    TFONDO =  objDom.getValorPorId("rdio_tnombre");
                    CODDGS =  objDom.getValorPorId("rdio_coddgs");
                    
                } 
                 if (typeof CCODFON == 'boolean' || objUtiles.estaVacio (CCODFON)) {
                    alert(objJsMessages.jslit_selecciona_registro);
                } else {
                    parent.f_aceptar_axispen008(CCODFON, CODDGS,TFONDO);       
                } 
            }

        function f_but_nuevo(){
            f_abrir_modal("axispen013",null,"&parametro=alta"); 
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {         
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";                    
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_onclick_radio(radio){
            objDom.setValorPorId("rdio_tnombre", radio.getAttribute("tnombre"));
            objDom.setValorPorId("rdio_coddgs", radio.getAttribute("coddgs"));
            objDom.setValorPorId("rdio_value", radio.getAttribute("value"));
        }
        
        function f_aceptarAxispen013(codigo) {
                f_cerrar_modal("axispen013");
                parent.f_aceptar_axispen008(codigo, '','');  
               
        }
        function f_but_nuevo(){
            f_abrir_modal("axispen013",null,"&MODO=ALTA");            
        }
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                        <c:param name="titulo"><axis:alt c="titulo" f="axispen008" lit="9900865"/></c:param><%-- Cercador de fons de pensions --%>
                        <c:param name="formulario"><axis:alt c="formulario" f="axispen008" lit="9900865"/></c:param><%-- Cercador de fons de pensions --%>
                        <c:param name="form">axispen008</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen013|<axis:alt c="TITULO_013" f="axispen008" lit="9900865"/><%-- alta/mod Fondos --%>
                </c:param>
            </c:import>     
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="rdio_tnombre" id="rdio_tnombre" value=""/>  
        <input type="hidden" name="rdio_coddgs" id="rdio_coddgs" value=""/>  
        <input type="hidden" name="rdio_value" id="rdio_value" value=""/>
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
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        
                                    </tr>
                                    <tr>
                                        <axis:visible f="axispen008" c="CCODFON" >
                                            <td class="titulocaja"> 
                                                <b id="label_CCODFON"><axis:alt c="CCODFON" f="axispen008" lit="1000109"/></b> <%-- Codi pensión --%>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen008" c="TNOM" >
                                            <td class="titulocaja">
                                                <b id="label_TNOM"><axis:alt c="label_TNOM" f="axispen008" lit="105940"/></b>   <%-- Nom Fons --%>
                                            </td>            
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axispen008" c="CCODFON" >
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CCODFON}" name="CCODFON" id="CCODFON" style="width:75%;"
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen008" c="TNOM" >
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOM}" name="TNOM" id="TNOM" style="width:100%;"
                                            </td>
                                        </axis:visible>                                        
                                    </tr>
                                    
                              <table class="area" align="center">     
                                <tr>
                                    <td>
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1">
                                            <axis:alt c="CCODFON" f="axispen008" lit="1000109"/><!-- Código fondo -->
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:alt c="NOMBRE" f="axispen008" lit="105940"/><!-- Nombre -->
                                        </c:set>
                                        <c:set var="title3">
                                            <axis:alt c="COMERCIAL" f="axispen008" lit="9900822"/><!-- Comercial -->
                                        </c:set>                                    
                                        <c:set var="title4">
                                            <axis:alt c="FALTA" f="axispen008" lit="9001192"/><!-- Fecha alta -->
                                        </c:set>
                                        <c:set var="title5">
                                            <axis:alt c="FBAJA" f="axispen008" lit="9001510"/><!-- Fecha baja -->
                                        </c:set>                                        
                                        
                                        
                                        <% int contador = 0;%>                                     
                                        <div class="seccion  displayspace">
                                            <display:table name="${__formdata.AXIS_FONDOS}"
                                                           id="miListaFondos"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           requestURI="axis_axispen003.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="contador"><%=contador%></c:set>                                            
                                                <display:column title="" sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  
                                                         media="html" autolink="false" >    
                                                 <div class="dspIcons">
                                                   <input <c:if test="${miListaFondos['radioFondos']}">checked</c:if> 
                                                           type="radio" id="radioFondos" name="radioFondos" 
                                                           value="${miListaFondos.OB_IAX_FONPENSIONES.CCODFON}"
                                                           tnombre="${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TNOMBRE']} ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TAPELLI1']}&nbsp;${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TAPELLI2']}" 
                                                           coddgs="${miListaFondos.OB_IAX_FONPENSIONES.CODDGS}" onclick="f_onclick_radio(this)"
                                                    />
                                                 </div>                                                    
                                                </display:column>                                            
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCODFON"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:5%">
                                                   <div class="dspText">
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.CODDGS} 
                                                    </div>                                                            
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TNOMBRE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"   style="width:40%">
                                                   <div class="dspText">
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TNOMBRE']}
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TAPELLI1']}&nbsp;
                                                            ${miListaFondos.OB_IAX_FONPENSIONES.PERSONA['TAPELLI2']}
                                                    </div>                                               
                                                </display:column>                                      
                                                <display:column title="${title4}"
                                                                sortable="true"
                                                                sortProperty="FALTARE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:7%">
                                                   <div class="dspText"><fmt:formatDate value="${miListaFondos.OB_IAX_FONPENSIONES['FALTARE']}" pattern="dd/MM/yy" />
                                                   </div>                                                 
                                                </display:column>
                                                <display:column title="${title5}"
                                                                sortable="true"
                                                                sortProperty="FBAJARE"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:7%">
                                                   <div class="dspText"><fmt:formatDate value="${miListaFondos.OB_IAX_FONPENSIONES['FBAJARE']}" pattern="dd/MM/yy" />
                                                    </div>             
                                                </display:column>
                                                
                                            <%contador++;%>                                         
                                            </display:table>
                                            <c:choose>
                                                <c:when test="${!empty  sessionScope.AXIS_FONDOS}">
                                                    <script language="javascript">//objUtiles.retocarDsptagtable("miListaFondos");</script>
                                                </c:when>
                                                <c:otherwise>
                                                    <script language="javascript">
                                                    </script>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                            </table>                                    
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispen008</c:param>
            <c:param name="__botones">cancelar,aceptar,buscar,nuevo</c:param> 
        </c:import>
    
    </form>    
    <c:import url="../include/mensajes.jsp"/>   
</body>
</html>