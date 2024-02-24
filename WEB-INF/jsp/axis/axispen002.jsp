<%/**
*  Fichero: axispen002.jsp
* 
*  Busqueda de Gestoras
*	
*
*
*  Fecha: 16/12/2009
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
        <title><axis:alt c="TITLE" f="axispen002" lit="151501"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
             function f_onload(){
                f_cargar_propiedades_pantalla();
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores = ${!empty requestScope.__mensajes.m__clave};
                if (${empty __formdata.CCODGES} && !hayErrores)
                    f_but_buscar_gestores();
             }         
           
             function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
               }
            
             function f_but_buscar_gestores() {
                f_abrir_modal("axispen007");                
             }       
             
            function f_nueva_gestora(){
                f_abrir_modal("axispen012",null,"&parametro=alta");            
            }
           
            function f_aceptarAxispen012(CCODGES){
                //alert(CCODGES);
                f_cerrar_modal("axispen012");
                objDom.setValorPorId("CCODGES", CCODGES);
                objDom.setValorPorId("NCONTADOR", 0);
                objDom.setValorPorId("NCONTADORX", 0);
                objUtiles.ejecutarFormulario("axis_axispen002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            function f_modificar_gestora(codigo) {
            
                f_abrir_modal("axispen012",null,"&parametro=mod&CCODGES="+codigo);
                
            }


            function f_nuevo_fondo(){
                f_abrir_modal("axispen013",null,"&parametro=alta");            
            }
            
            function f_modificar_fondo(codigo) {
            
                f_abrir_modal("axispen013",null,"&parametro=mod&CCODFON="+codigo);
                
            }
            
            function f_aceptarAxispen013(codigo) {
                f_cerrar_modal("axispen013");
                objUtiles.ejecutarFormulario("axis_axispen002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
                
            }             
             
             function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
                }
            
             
             function f_buscar_gestores(){            
                objUtiles.ejecutarFormulario("axis_axispen002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                    
             function f_seleccionar_gestora(CCODGES,contador){
                         
                objDom.setValorPorId("CCODGES", CCODGES);
                objDom.setValorPorId("NCONTADOR", contador);
                objUtiles.ejecutarFormulario("axis_axispen002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
           
            function f_recargar_plan(CCODFON,contador){                
                objDom.setValorPorId("CCODFON", CCODFON);
                objDom.setValorPorId("NCONTADORX", contador);
                objUtiles.ejecutarFormulario("axis_axispen002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                 
            }            
        
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
                    
            function f_aceptar_axispen007(CCODGES,CGESDGS, TNOMGES) {
                objUtiles.cerrarModal("axispen007");            
                objDom.setValorPorId("CCODGES", CCODGES);            
                objDom.setValorPorId("TNOMGES", TNOMGES);    
                f_buscar_gestores();            
            }
            
            function f_but_salir() {
                    objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }

            function f_modificar_pension (CCODPLA){
                f_abrir_modal("axispen014",null,"&parametro=mod&CCODPLA="+CCODPLA);
             }
             
             function f_alta_plan() {
                f_abrir_modal("axispen014",null,"&parametro=ALTA");
                
            } 
            
            function f_aceptarAxispen014(CCODPLA){
                objUtiles.cerrarModal("axispen014");
                objUtiles.ejecutarFormulario("axis_axispen002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>        
        <input type="hidden" name="CCODDEP" id = "CCODDEP" value="${__formdata.CCODDEP}"/> 
        <input type="hidden" name="CCODGES" id = "CCODGES" value="${__formdata.CCODGES}"/> 
        <input type="hidden" name="CCODFON" id = "CCODFON" value="${__formdata.CCODFON}"/> 
        <input type="hidden" name="NCONTADOR" id = "NCONTADOR" value="${__formdata.NCONTADOR}" />                  
        <input type="hidden" name="NCONTADORX" id = "NCONTADORX" value="${__formdata.NCONTADORX}" />   
        <input type="hidden" id="TNOMGES" name="TNOMGES" value="${__formdata.TNOMGES}"/>        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt c="MODALIDAD" f="axispen002" lit="9900720"/></c:param>
                <c:param name="formulario"><axis:alt c="FORMULARIO" f="axispen002" lit="9900720"/></c:param>
                <c:param name="form">axispen002</c:param>
        </c:import>
         
         
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen007|<axis:alt c="TITULO_007" f="axispen002" lit="9900864"/><%-- Buscador de gestores --%>
                </c:param>
        </c:import>
        
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen012|<axis:alt c="TITULO_012" f="axispen002" lit="9900904"/><%-- alta/mod Gestoras --%>
                </c:param>
            </c:import> 

           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen013|<axis:alt c="TITULO_013" f="axispen002" lit="9900865"/>><%-- alta/mod Fondos --%>
                </c:param>
            </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen014|<axis:alt c="TITULO_014" f="axispen002" lit="9900722"/><%-- Cercador de plans de pensions --%>
                </c:param>
         </c:import> 
        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            
            <!--campos-->
            <table class="seccion">   
             <tr>
                <td>
                     <div class="separador">&nbsp;</div>
                     <div class="separador">&nbsp;</div>        
                        <div class="titulo">
                         <!-- Gestora -->
                            <img src="images/flecha.gif"/><axis:alt c="BUSCAR" f="axispen002" lit="9001782"/>    <img border="0" src="images/find.gif" onclick="f_but_buscar_gestores();" style="cursor:pointer" alt="<axis:alt c="BUSCAR_02" f="axispen002" lit="9000508"/>" title="<axis:alt c="BUSCAR_02" f="axispen002" lit="9000508"/>"/>
                        </div>
                        <!-- Lista de Gestoras -->
                                            
                          <table class="area" align="center"> 
                            <tr>
                                <td>
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                         <axis:alt c="GESTORA" f="axispen002" lit="1000109"/><!-- Gestora -->
                                    </c:set>
                                    <c:set var="title2">
                                        <axis:alt c="NOMBRE" f="axispen002" lit="105940"/><!-- Nombre -->
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt c="FALTA" f="axispen002" lit="9001192"/><!-- Fecha alta -->
                                    </c:set>
                                    <c:set var="title4">
                                        <axis:alt c="FBAJA" f="axispen002" lit="9001510"/><!-- Fecha baja -->
                                    </c:set>
                                      <!--Imatge nou registre-->
                                     <div style="float:right;">
                                        <a href="javascript:f_nueva_gestora()"><img border="0" alt="<axis:alt c="NUEVO" f="axispen002" lit="104825"/>" title="<axis:alt c="NUEVO" f="axispen002" lit="104825"/>" src="images/new.gif"/></a>
                                    </div>                                    
                                    <!--Fi imatge nou registre-->   
                                    <% int contador = 0;%>                                       
                                    <div class="seccion displayspace">
                                        <display:table name="${__formdata.AXIS_GESTORAS}"
                                                       id="miListaGestoras"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="axis_axispen002.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <c:set var="contador"><%=contador%></c:set>                                                                                        
                                          <display:column headerClass="sortable fixed"
                                                            title=""
                                                            media="html"
                                                            autolink="false"
                                                            style="width:2%">
                                                <div class="dspIcons">
                                                    <input value="${miListaGestoras.OB_IAX_GESTORAS['CCODGES']}"
                                                           type="radio"
                                                           onclick="f_seleccionar_gestora('${miListaGestoras.OB_IAX_GESTORAS['CCODGES']}','${contador}');"
                                                           <c:if test="${__formdata.NCONTADOR == contador}"> checked </c:if>
                                                           id="radioGestora"
                                                           name="radioGestora"/>
                                                </div>
                                            </display:column>                                            
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="CCODGES"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">
                                               <div class="dspText">
                                                        ${miListaGestoras.OB_IAX_GESTORAS.CODDGS}                                                
                                                </div>                                                            
                                            </display:column>
                                            <display:column title="${title2}"
                                                            sortable="true"
                                                            sortProperty="TNOMBRE"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:40%">
                                               <div class="dspText">
                                                        ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TNOMBRE']}
                                                        ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TAPELLI1']}&nbsp;
                                                        ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TAPELLI2']}
                                                </div>                                               
                                            </display:column>
                                            <display:column title="${title3}"
                                                            sortable="true"
                                                            sortProperty="FALTA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">
                                            <div class="dspText"><fmt:formatDate value="${miListaGestoras.OB_IAX_GESTORAS['FALTA']}" pattern="dd/MM/yy" />
                                            </div>                                                 
                                            </display:column>
                                            <display:column title="${title4}"
                                                            sortable="true"
                                                            sortProperty="FBAJA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">
                                            <div class="dspText"><fmt:formatDate value="${miListaGestoras.OB_IAX_GESTORAS['FBAJA']}" pattern="dd/MM/yy" />
                                            </div>                                                 
                                            </display:column>
                                            
                                              <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                               <div class="dspIcons"><a href="javascript:f_modificar_gestora('${miListaGestoras.OB_IAX_GESTORAS['CCODGES']}');"><img border="0" alt="<axis:alt c="MODIFICAR" f="axispen002" lit="9900815"/>" title="<axis:alt c="MODIFICAR" f="axispen002" lit="9900815"/>" src="images/lapiz.gif"/></a></div>
                                            </display:column>                                    

                                            
                                        <%contador++;%>                                                                                 
                                        </display:table>
                                         
                                        <c:choose>
                                            <c:when test="${!empty  __formdata.AXIS_GESTORAS}">
                                                <script language="javascript"></script>
                                            </c:when>
                                            <c:otherwise>
                                                <script language="javascript">
                                                </script>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                     </td>
                    </tr>
              
                         <div class="separador">&nbsp;</div>
<!--Segona part Fondos Pensiones -->                    
                        <tr>
                            <td>
                                <!-- Lista de Gestoras -->
                                    <table class="area" align="center">
                                    <tr>
                                        <td>
                                <div class="titulo">
                                    <img src="images/flecha.gif"/><axis:alt c="FONPENSION" f="axispen002" lit="9900819"/> <!-- Fondos pensiones -->
                                </div>                                
                                <c:set var="title0">&nbsp;</c:set>
                                <c:set var="title1">
                                    <axis:alt c="CODFONDO" f="axispen002" lit="1000109"/><!-- Código fondo -->
                                </c:set>
                                <c:set var="title2">
                                    <axis:alt c="NOMBRE2" f="axispen002" lit="105940"/><!-- Nombre -->
                                </c:set>
                                <c:set var="title3">
                                    <axis:alt c="FALTA2" f="axispen002" lit="9001192"/><!-- Fecha alta -->
                                </c:set>
                                <c:set var="title4">
                                    <axis:alt c="FBAJA2" f="axispen002" lit="9001510"/><!-- Fecha baja -->
                                </c:set>                                      
                                <!--Imatge nou registre-->
                                <div style="float:right;">
                                   <a href="javascript:f_nuevo_fondo()"><img border="0" alt="<axis:alt c="NUEVO" f="axispen002" lit="104825"/>" title="<axis:alt c="NUEVO" f="axispen002" lit="104825"/>" src="images/new.gif"/></a>
                                </div>                                    
                                <!--Fi imatge nou registre-->                                       
                                <%int contadorx = 0;%>
                                <div class="seccion  displayspace">
                                
                                
                                
                                    <display:table name="${__formdata.AXIS_GESTORAS[0].OB_IAX_GESTORAS.FONPENSIONES}"
                                                   id="miListaId"
                                                   export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1"
                                                   requestURI="axis_axispen002.do?paginar=true"
                                                   sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>
                                          <c:set var="contadorx"><%=contadorx%></c:set>    
                                         <display:column headerClass="sortable fixed"
                                                        title=""
                                                        media="html"
                                                        autolink="false"
                                                        style="width:2%">
                                            <div class="dspIcons">
                                                <input value="${miListaId.OB_IAX_FONPENSIONES['CCODFON']}"
                                                       type="radio"
                                                       onclick="f_recargar_plan('${miListaId.OB_IAX_FONPENSIONES['CCODFON']}','${contadorx}');"
                                                       <c:if test="${__formdata.NCONTADORX == contadorx}"> checked </c:if>
                                                       id="radioGestora2"
                                                       name="radioGestora2"/>
                                            </div>
                                        </display:column> 
                                        <display:column title="${title1}"
                                                        sortable="true"
                                                        sortProperty="CCODGES"
                                                        headerClass="sortable fixed"
                                                        media="html"
                                                        autolink="false"
                                                        style="width:5%">
                                           <div class="dspText">
                                                    ${miListaId.OB_IAX_FONPENSIONES.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.CFONDGS}
                                            </div>   
                                    
                                        </display:column>
                                        <display:column title="${title2}"
                                                        sortable="true"
                                                        sortProperty="TNOMBRE"
                                                        headerClass="sortable fixed"
                                                        media="html"
                                                        autolink="false"
                                                        style="width:50%">
                                           <div class="dspText">
                                                    ${miListaId.OB_IAX_FONPENSIONES.PERSONA['TNOMBRE']}
                                                    ${miListaId.OB_IAX_FONPENSIONES.PERSONA['TAPELLI1']}&nbsp;
                                                    ${miListaId.OB_IAX_FONPENSIONES.PERSONA['TAPELLI2']}
                                           </div>                                               
                                        </display:column>
                                        <display:column title="${title3}"
                                                        sortable="true"
                                                        sortProperty="FALTARE"
                                                        headerClass="sortable fixed"
                                                        media="html"
                                                        autolink="false"
                                                        style="width:5%">
                                           <div class="dspText"><fmt:formatDate pattern="dd/MM/yy" value="${miListaId.OB_IAX_FONPENSIONES['FALTARE']}"/></div>    
                                        </display:column>
                                        <display:column title="${title4}"
                                                        sortable="true"
                                                        sortProperty="FBAJARE"
                                                        headerClass="sortable fixed"
                                                        media="html"
                                                        autolink="false"
                                                        style="width:5%">
                                           <div class="dspText"><fmt:formatDate pattern="dd/MM/yy" value="${miListaId.OB_IAX_FONPENSIONES['FBAJARE']}"/></div>                                                                                                                                                  
                                        </display:column>
                                        
                                          <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                           <div class="dspIcons"><a href="javascript:f_modificar_fondo('${miListaId.OB_IAX_FONPENSIONES['CCODFON']}');"><img border="0" alt="<axis:alt c="MODIFICAR" f="axispen002" lit="9900815"/>" title="<axis:alt c="MODIFICAR" f="axispen002" lit="9900815"/>" src="images/lapiz.gif"/></a></div>
                                        </display:column>                                    
                                        <%contadorx ++;%>
                                     </display:table>
                                     </div>
                                     <table class="area" align="right">
                                        <tr>
                                        <td> 
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/> <axis:alt c="PLAPEN" f="axispen002" lit="9900820"/><!-- Planes de pensiones -->
                                            </div>      
                                            <c:set var="title0">&nbsp;</c:set>
                                            <c:set var="title1">
                                                <axis:alt c="CODPLANPEN" f="axispen002" lit="1000109"/><!-- Código plan pensión -->
                                            </c:set>
                                            <c:set var="title2">
                                                <axis:alt c="NOMBRE3" f="axispen002" lit="105940"/><!-- Nombre -->
                                            </c:set>
                                            <c:set var="title3">
                                                <axis:alt c="MODALIDAD" f="axispen002" lit="100943"/><!-- Modalidad -->
                                            </c:set>
                                            <c:set var="title4">
                                                <axis:alt c="SISTEMA" f="axispen002" lit="9900821"/><!-- Sistema -->
                                            </c:set>                                    
                                            <c:set var="title5">
                                                <axis:alt c="FALTA3" f="axispen002" lit="9001192"/><!-- Fecha alta -->
                                            </c:set>
                                            <c:set var="title6">
                                                <axis:alt c="COMERCIAL" f="axispen002" lit="9900822"/><!-- Comercial -->
                                            </c:set>    
                                            <!--Imatge nou registre-->
                                            <div style="float:right;">
                                               <a href="javascript:f_alta_plan()"><img border="0" alt="<axis:alt c="NUEVO" f="axispen002" lit="104825"/>" title="<axis:alt c="NUEVO" f="axispen002" lit="104825"/>" src="images/new.gif"/></a>
                                            </div>                                    
                                            <!--Fi imatge nou registre-->  
                                            <div class="seccion  displayspace">
                                                <display:table name="${__formdata.AXIS_GESTORAS[0].OB_IAX_GESTORAS.FONPENSIONES[__formdata.NCONTADORX].OB_IAX_FONPENSIONES.PLANPENSIONES}"
                                                               id="miListaPlanes"
                                                               export="false"
                                                               class="dsptgtable"
                                                               pagesize="-1"
                                                               requestURI="axis_axispen004.do?paginar=true"
                                                               sort="list"
                                                               cellpadding="0"
                                                               cellspacing="0">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}"
                                                                    sortable="true"
                                                                    sortProperty="CCODPLA"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false">
                                                       <div class="dspText">
                                                           ${miListaPlanes.OB_IAX_PLANPENSIONES.CODDGS}
                                                        </div>                                                            
                                                    </display:column>
                                                    <display:column title="${title2}"
                                                                    sortable="true"
                                                                    sortProperty="TNOMPLA"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false">
                                                       <div class="dspText">
                                                                ${miListaPlanes.OB_IAX_PLANPENSIONES['TNOMPLA']}
                                                        </div>                                               
                                                    </display:column>
                                                    <display:column title="${title3}"
                                                                    sortable="true"
                                                                    sortProperty="TMODALI"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false">
                                                       <div class="dspText">
                                                                ${miListaPlanes.OB_IAX_PLANPENSIONES['TMODALI']}
                                                        </div>                                               
                                                    </display:column>                                           
        
                                                    <display:column title="${title4}"
                                                                    sortable="true"
                                                                    sortProperty="TSISTEM"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false">
                                                       <div class="dspText">
                                                                ${miListaPlanes.OB_IAX_PLANPENSIONES['TSISTEM']}
                                                        </div>                                               
                                                    </display:column>                                           
                                                    <display:column title="${title5}"
                                                                    sortable="true"
                                                                    sortProperty="FALTARE"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false">
                                                       <div class="dspText"><fmt:formatDate value="${miListaPlanes.OB_IAX_PLANPENSIONES['FALTARE']}" pattern="dd/MM/yy" />
                                                        </div>             
                                                    </display:column>
                                                    
                                                    <display:column title="${title6}"
                                                                    sortable="true"
                                                                    sortProperty="TCOMERC"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false">
                                                       <div class="dspText">
                                                                ${miListaPlanes.OB_IAX_PLANPENSIONES['TCOMERC']}
                                                        </div>                                               
                                                    </display:column>             
                                                    
                                                      <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                       <div class="dspIcons"><a href="javascript:f_modificar_pension('${miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}');"><img border="0" alt="<axis:alt c="MODIFICAR" f="axispen002" lit="9900815"/>" title="<axis:alt c="MODIFICAR" f="axispen002" lit="9900815"/>>" src="images/lapiz.gif"/></a></div>
                                                    </display:column>                                    

                                                                                     
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
         </td>
        </tr>
    </table>
   
    <c:import url="../include/botonera_nt.jsp">
          <c:param name="f">axispen002</c:param>
          <c:param name="__botones">salir</c:param>
    </c:import>
    
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>