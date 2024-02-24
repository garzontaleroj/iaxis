<%/**
*  Fichero: axispen005.jsp
* 
*  Busqueda de Promotores
*	
*
*
*  Fecha: 15/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="151501"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            function f_onload(){
                revisarEstilos();                
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores = ${!empty requestScope.__mensajes.m__clave};
                if (${empty sessionScope.AXIS_PROMO} && !hayErrores)
                    f_but_buscar_promotors();
             }         
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_axispen015(){
               objUtiles.cerrarModal('axispen015');
               f_buscar_promotors();
            }
        
            function f_but_buscar_promotors() {
                f_abrir_modal("axispen010");
            }            
            
             function f_seleccionar_promotor(contador){
               //Marcar el registro del promotor selecccionado                                       
                objDom.setValorPorId("NCONTADOR", contador);
                objUtiles.ejecutarFormulario("axis_axispen005.do", "busqueda_cuerpo", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            
             function f_buscar_promotors(){            
                objUtiles.ejecutarFormulario("axis_axispen005.do", "busqueda_promotors", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
            }   
        
            function f_but_salir() {
                    objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
    
            function f_aceptar_axispen10(CRAMO,SPRODUC,NPOLIZA,CCODPLA,CTIPIDE,NNUMIDE){
                 objUtiles.cerrarModal("axispen010");
                 objDom.setValorPorId("CRAMO", CRAMO);            
                 objDom.setValorPorId("SPRODUC", SPRODUC);            
                 objDom.setValorPorId("NPOLIZA", NPOLIZA);            
                 objDom.setValorPorId("CCODPLA", CCODPLA);            
                 objDom.setValorPorId("CTIPIDE", CTIPIDE);            
                 objDom.setValorPorId("NNUMIDE", NNUMIDE);            
                 f_buscar_promotors();
            }   
            
            function f_modificar_promotor(CCODPLAN,SPERSON){
                objUtiles.abrirModal("axispen015", "src", "modal_axispen015.do?operation=form&CCODPLAN="+CCODPLAN+"&SPERSON="+SPERSON);  
            }
            
            function f_borrar_promotor(CCODPLAN,SPERSON){
                objUtiles.ejecutarFormulario("axis_axispen005.do?CCODPLAN="+CCODPLAN+"&SPERSON="+SPERSON, "borrar_promotor", document.miForm, "_self", objJsMessages.jslit_cargando);
                f_buscar_promotors();
            }
    
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="radioFondos" value=""/>        
        <input type="hidden" name="CCODFON" value=""/> 
        <input type="hidden" name="NCONTADOR" id = "NCONTADOR" value="${__formdata.NCONTADOR}" /> 
        
        <input type="hidden" name="CRAMO" id = "CRAMO" value="${__formdata.CRAMO}" /> 
        <input type="hidden" name="SPRODUC" id = "SPRODUC" value="${__formdata.SPRODUC}" /> 
        <input type="hidden" name="NPOLIZA" id = "NPOLIZA" value="${__formdata.NPOLIZA}" /> 
        <input type="hidden" name="CCODPLA" id = "CCODPLA" value="${__formdata.CCODPLA}" />         
        <input type="hidden" name="CTIPIDE" id = "CTIPIDE" value="${__formdata.CTIPIDE}" /> 
        <input type="hidden" name="NNUMIDE" id = "NNUMIDE" value="${__formdata.NNUMIDE}" /> 
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><fmt:message key="9900723" /></c:param>
                <c:param name="formulario"><fmt:message key="9900723" /></c:param>
                <c:param name="form">axispen005</c:param>
        </c:import>
        
          <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen010|<fmt:message key="9900844"/><%-- Buscador de promotors --%>
                </c:param>
         </c:import>
         
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen015|<fmt:message key="9900911"/><%-- Buscador de promotors --%>
                </c:param>
         </c:import>
         
        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                                 <div class="separador">&nbsp;</div>
              <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/> <fmt:message key="9900835"/> <img border="0" src="images/find.gif" onclick="f_but_buscar_promotors()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/>
                </div>
                <!-- Lista de Promotores -->
                <table class="seccion">                            
                <tr>
                    <td>
                        <c:set var="title0">&nbsp;</c:set>
                        
                        <c:set var="title1">
                            <fmt:message key="105904"/> <!--NIF-->
                        </c:set>
                        
                        <c:set var="title2">
                            <fmt:message key="9000759"/> <!--Nombre y Apellidos-->
                        </c:set>
                        
                         <c:set var="title3">
                            <fmt:message key="9900775"/> <!--Pla pensions-->
                        </c:set>
                        
                        <c:set var="title4">
                            <fmt:message key="105940"/><!-- Nombre -->
                        </c:set>
                        
                         <!--afegir registre-->
                         <div style="float:right;">
                            <a href="javascript:f_abrir_modal('axispen015')"><img border="0" alt="<fmt:message key="104825"/>" title="<fmt:message key="104825"/>" src="images/new.gif"/></a>
                        </div>
                        <!--fi afegir registre-->
                        
                        <% int contador = 0;%>
                        <div class="displayspace" style="width:100%;height:100%">
                            <display:table name="${sessionScope.AXIS_PROMO}"
                                           id="miListaPromotores"
                                           export="false"
                                           class="dsptgtable"
                                           pagesize="-1"
                                           requestURI="axis_axispen005.do?paginar=true"
                                           sort="list"
                                           cellpadding="0"
                                           cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <c:set var="contador"><%=contador%></c:set>
                              <display:column headerClass="sortable fixed"
                                                title=""
                                                media="html"
                                                autolink="false"
                                                style="width:5%">
                                    <div class="dspIcons">
                                        <input value="${miListaPromotores.OB_IAX_PROMOTORES['']}"
                                               type="radio"
                                               <c:if test="${!empty sessionScope.AXIS_PROMO && __formdata.NCONTADOR == contador}" >checked</c:if>
                                               id="radioFondos" onclick="f_seleccionar_promotor(<%=contador%>)"
                                               name="radioFondos"/>
                                    </div>
                                </display:column>                                            
                                <display:column title="${title1}"
                                                sortable="true"
                                                sortProperty="NNUMIDE"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false"
                                                style="width:10%">
                                   <div class="dspText">
                                         ${miListaPromotores.OB_IAX_PROMOTORES.PERSONA['NNUMIDE']}
                                    </div>                                                            
                                </display:column>
                                <display:column title="${title2}"
                                                sortable="true"
                                                sortProperty="TNOMBRE"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false"
                                                style="width:30%">
                                   <div class="dspText">
                                            ${miListaPromotores.OB_IAX_PROMOTORES.PERSONA['TNOMBRE']},
                                            ${miListaPromotores.OB_IAX_PROMOTORES.PERSONA['TAPELLI1']}&nbsp;
                                            ${miListaPromotores.OB_IAX_PROMOTORES.PERSONA['TAPELLI2']}
                                    </div>                                               
                                </display:column>
                                <display:column title="${title3}"
                                                sortable="true"
                                                sortProperty="CCODPLA"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false"
                                                style="width:10%">
                                   <div class="dspText">
                                            ${miListaPromotores.OB_IAX_PROMOTORES['CCODPLA']}
                                    </div>                                               
                                </display:column>                                           
                                <display:column title="${title4}"
                                                sortable="true"
                                                sortProperty="TNOMPLA"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false"
                                                style="width:35%">
                                   <div class="dspText">
                                            ${miListaPromotores.OB_IAX_PROMOTORES['TNOMPLA']}
                                    </div>                                               
                                </display:column>                                    
                                  <display:column title="" sortable="false" sortProperty="" style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_modificar_promotor('${miListaPromotores.OB_IAX_PROMOTORES['CCODPLA']}','${miListaPromotores.OB_IAX_PROMOTORES.PERSONA['SPERSON']}');"><img border="0" alt="<fmt:message key='100002'/>" title="<fmt:message key='100002'/>" src="images/lapiz.gif"/></a></div>
                                </display:column>                                    
                                <display:column title="" sortable="false" sortProperty="" style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_borrar_promotor('${miListaPromotores.OB_IAX_PROMOTORES['CCODPLA']}','${miListaPromotores.OB_IAX_PROMOTORES.PERSONA['SPERSON']}')"><img border="0" alt="<fmt:message key='1000127'/>" title="<fmt:message key='1000127'/>" src="images/delete.gif"/></a></div>
                                </display:column>
                            <%contador++;%>
                            </display:table>
                             
                            <c:choose>
                                <c:when test="${!empty  sessionScope.AXIS_PROMO}">
                                    <script language="javascript">//objUtiles.retocarDsptagtable("miListaFondos");</script>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                    //objLista.esconderListaSpans();
                                    //objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                  </tr>             
                  <tr>
                    <td>
                     <div class="separador">&nbsp;</div>
                      <div class="separador">&nbsp;</div>
                        <!-- Lista de Gestoras -->
                         <table class="area" align="center">
                             <tr>
                                <td class="campocaja" >                                   
                                    <div style="float:left;">
                                        <img id="DSP_DATOS_PROMO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_PROMO', this)" style="cursor:pointer"/> 
                                        <b><fmt:message key="9900837"/></b>&nbsp;&nbsp;                                       
                                    </div>
                                    <div style="clear:both;">
                                          <hr class="titulo">
                                    </div>
                                </td>
                             </tr>         
                             <tr id="DSP_DATOS_PROMO_children" style="display:none">
                                 <td align="left" >
                                       <table class="area" align="center">
                                          <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                          </tr> 
                                          <tr>
                                                <axis:ocultar f="axispen005" c="NUMCONTRA">
                                                    <td class="titulocaja">                                       
                                                        <b><fmt:message key="9900838"/></b>                                         
                                                    </td>
                                                </axis:ocultar>                                            
                                                <axis:ocultar f="axispen005" c="IMPS"> 
                                                    <td class="titulocaja">
                                                      <b><fmt:message key="9900839"/></b>                                        
                                                    </td>
                                                </axis:ocultar>                                                        
                                          </tr>
                                          <tr>
                                                <axis:ocultar f="axispen005" c="NUMCONTRA">
                                                    <td class="campocaja">
                                                        <input  type="text" name="NUMCONTRA" id="NUMCONTRA" value="${sessionScope.AXIS_PROMO[__formdata.NCONTADOR].OB_IAX_PROMOTORES.NPOLIZA}" class="campowidthinput campo" readonly="true"
                                                        style="width:55%;" <axis:atr f="axispen005" c="NUMCONTRA" a="modificable=false"/>/>
                                                    </td>
                                                </axis:ocultar>
                                            
                                                <axis:ocultar f="axispen005" c="IMPS"> 
                                                    <td class="campocaja">
                                                        <input  type="text" name="IMPS" id="IMPS" value="${sessionScope.AXIS_PROMO[__formdata.NCONTADOR].OB_IAX_PROMOTORES.NVALPARSP}" class="campowidthinput campo" readonly="true"
                                                        style="width:60%;" <axis:atr f="axispen005" c="IMPS" a="modificable=false"/>/>
                                                    </td>
                                                </axis:ocultar>                            
                                           </tr>
                                      </table>
                              </td> 
                           </tr>  
                       </table>
                      <div class="separador">&nbsp;</div>
                     </td>
                   </td>
                </tr>
            </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">salir</c:param>
    </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>

