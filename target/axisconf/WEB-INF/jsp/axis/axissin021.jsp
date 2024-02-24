<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/**
*  Fichero: axissin021.jsp
*  @author <a href = "mailto:xpator@csi-ti.com">Xavi Pastor</a>
*  
*  Gestión Siniestros : Causas y motivos
*
*  Fecha: 22/05/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>
            <fmt:message key="9002277"/>
        </title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <script type="text/javascript">
   function f_onload(){
    revisarEstilos();
    var SCAUMOT = "${__formdata.SCAUMOT}";
         if (objUtiles.estaVacio(SCAUMOT)) 
                 f_but_buscar();
       try{          
        objEstilos.toggleDisplay("DSP_DESTINATARIOS", document.getElementById("DSP_DESTINATARIOS_parent"));
        objEstilos.toggleDisplay("DSP_FORMULAS", document.getElementById("DSP_FORMULAS_parent"));
        objEstilos.toggleDisplay("DSP_PRODUCTES", document.getElementById("DSP_PRODUCTES_parent"));
        }catch(e){}
          location.href="#SCAUMOT_${__formdata.SCAUMOT}"       
    
   }
   function f_getCausaMotivo(index, SCAUMOT){
    document.axissin021Form.SCAUMOT.value = SCAUMOT;
    document.axissin021Form.CTIPDES.value = null;
    document.axissin021Form.indexCausaMot.value = index;
     objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
    

   }

   function f_getDestinatarios(index, CTIPDES){
    document.axissin021Form.CTIPDES.value = CTIPDES;
    document.axissin021Form.indexDestinatari.value = index;
    objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
   }   
   

    function f_but_salir() {
        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin021", "cancelar", document.axissin021Form, "_self");
    }
    

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        function f_but_buscar() {
            f_abrir_modal('axissin020');

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
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axissin021')
                objUtiles.ejecutarFormulario("axis_axissin021.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }    

        function f_buscar(CEMPRES,CRAMO,SPRODUC,CCAUSIN,CMOTSIN,CTIPDES){
            f_cerrar_modal('axissin020');
            document.axissin021Form.CEMPRES_CERCA.value = CEMPRES;
            document.axissin021Form.CRAMO_CERCA.value = CRAMO;
            document.axissin021Form.SPRODUC_CERCA.value = SPRODUC;
            document.axissin021Form.CCAUSIN_CERCA.value = CCAUSIN;
            document.axissin021Form.CMOTSIN_CERCA.value = CMOTSIN;
            document.axissin021Form.CTIPDES_CERCA.value = CTIPDES;
            objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axissin025(){
            f_cerrar_modal('axissin025');
            objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
        function f_aceptar_axissin024(){
            f_cerrar_modal('axissin024');
            objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }        

        function f_borrar_producte (SPRODUC, CACTIVI, CGARANT, CTRAMIT){
           var answer = confirm(objJsMessages.jslit_confirma_borrar);
           if (answer) 
            objUtiles.ejecutarFormulario("axis_axissin021.do?SPRODUC="+SPRODUC+"&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&CTRAMIT="+CTRAMIT, "borrar_producte", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
        function f_borrar_formula (CCAMPO, CCLAVE){
          var answer = confirm(objJsMessages.jslit_confirma_borrar);
          if (answer)  
            objUtiles.ejecutarFormulario("axis_axissin021.do?CCAMPO="+CCAMPO+"&CCLAVE="+CCLAVE, "borrar_formula", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axissin22(){
            f_cerrar_modal('axissin022');
            objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_borrar_destinatario (CSCAUMOT,CTIPDES){
          var answer = confirm(objJsMessages.jslit_confirma_borrar);
          if (answer)  
            objUtiles.ejecutarFormulario("axis_axissin021.do?CSCAUMOT="+CSCAUMOT+"&CCTIPDES="+CTIPDES, "borrar_destinatario", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axissin023(){
            f_cerrar_modal('axissin023');
            objUtiles.ejecutarFormulario("axis_axissin021.do", "buscar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }  
        
        function f_borrar(CSCAUMOT){
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer)
                objUtiles.ejecutarFormulario("axis_axissin021.do?CSCAUMOT="+CSCAUMOT, "borrar", document.axissin021Form, "_self", objJsMessages.jslit_cargando);
        }
    
</script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <fmt:message key="9001681"/>
            </c:param>
            <c:param name="nid" value="axissin020"/>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <fmt:message key="9001716"/>
            </c:param>
            <c:param name="nid" value="axissin022"/>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <fmt:message key="9002277"/>
            </c:param>
            <c:param name="nid" value="axissin025"/>
        </c:import>        

        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <fmt:message key="9001732"/>
            </c:param>
            <c:param name="nid" value="axissin023"/>
        </c:import>
        
	<c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <fmt:message key="9001720"/>
            </c:param>
            <c:param name="nid" value="axissin024"/>
        </c:import>            
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
                <axis:alt f="axissin021" c="TTITULO" lit="9002277"/>
            </c:param>
            <c:param name="formulario">
                <axis:alt f="axissin021" c="TTITULO" lit="9002277"/>
            </c:param>
            <c:param name="form">axissin021</c:param>
        </c:import>
        <form name="axissin021Form" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" name="isNew" id="isNew"
                   value="${__formdata.isNew}"/>
            <input type="hidden" name="indexCausaMot"
                   value="${__formdata.indexCausaMot}"/>
            <input type="hidden" name="indexDestinatari"
                   value="${__formdata.indexdestinatari}"/>
            <%-- Paràmetres de cerca--%>
            <input type="hidden" name="CEMPRES_CERCA"
                   value="${__formdata.CEMPRES_CERCA}"/>
            <input type="hidden" name="CRAMO_CERCA"
                   value="${__formdata.CRAMO_CERCA}"/>
            <input type="hidden" name="SPRODUC_CERCA"
                   value="${__formdata.SPRODUC_CERCA}"/>
            <input type="hidden" name="CCAUSIN_CERCA"
                   value="${__formdata.CCAUSIN_CERCA}"/>
            <input type="hidden" name="CMOTSIN_CERCA"
                   value="${__formdata.CMOTSIN_CERCA}"/>
            <input type="hidden" name="CTIPDES_CERCA"
                   value="${__formdata.CTIPDES_CERCA}"/>
                   
            <input type="hidden" name="CCAUSIN"
                   value="${__formdata.CCAUSIN}"/>   
            <input type="hidden" name="CMOTSIN"
                   value="${__formdata.CMOTSIN}"/>                       
            <input type="hidden" name="CTIPDES"
                   value="${__formdata.CTIPDES}"/>  
            <input type="hidden" name="SCAUMOT"
                   value="${__formdata.SCAUMOT}"/>                          

<table class="mainTableDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <div class="titulo">
                    <div style="float:left;">
                        
                            <img src="images/flecha.gif"/><fmt:message key="9001674"/>
                             
                            <img id="find" border="0" src="images/find.gif"
                                 alt='<fmt:message key="100797" />'
                                 onclick="f_but_buscar();"
                                 style="cursor:pointer"/>
                       
                        </div>
                        <axis:visible f="axissin021" c="BT_NEW">
                          <div style="float:right;">
                           <img id="find" border="0" src="images/new.gif"
                                 alt='<fmt:message key="1000428" />'
                                 onclick="f_abrir_modal('axissin022',null,'&isNew=Si')"
                                 style="cursor:pointer"/>
                          </div>
						  </axis:visible>
                           </div>
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:100%;height:0px">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <!-- Área 1 -->
                                                <div class="separador">&nbsp;</div>
                                                <c:set var="title0">
                                                    <fmt:message key="1000109"/>
                                                </c:set>
                                                <c:set var="title1">
                                                    <fmt:message key="101040"/>
                                                </c:set>
                                                <c:set var="title2">
                                                    <fmt:message key="102577"/>
                                                </c:set>
                                                <c:set var="title3">
                                                    <fmt:message key="1000591"/>
                                                </c:set>
                                                <c:set var="title4">
                                                    <fmt:message key="9001675"/>
                                                </c:set>
                                                <c:set var="title5">
                                                    <fmt:message key="9001676"/>
                                                </c:set>
                                                <c:set var="title6">
                                                    <fmt:message key="9001677"/>
                                                </c:set>
                                                <c:set var="title7">
                                                    <fmt:message key="9900954"/>
                                                </c:set>
                                                
                                                <div class="displayspace">
                                                    <%int contador = 0;%>
                                                     
                                                    <display:table name="${__formdata.causamots}"
                                                                   id="miListaId"
                                                                   export="false"
                                                                   class="dsptgtable"
                                                                   pagesize="-1"
                                                                   requestURI="axis_axissin021.do?operation=buscar&paginar=true"
                                                                   sort="list"
                                                                   cellpadding="0"
                                                                   cellspacing="0">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title=""
                                                                        sortable="false"
                                                                        sortProperty=""
                                                                        headerClass="headwidth5 sortable"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspIcons">
                                                                <input onclick="javascript:f_getCausaMotivo('${contador}','${miListaId.SCAUMOT}')"
                                                                       <c:if test="${__formdata.SCAUMOT == miListaId.SCAUMOT }"> checked </c:if>
                                                                       value=""
                                                                       type="radio"
                                                                       id="radioCAUMOT"
                                                                       name="radioCAUMOT"/><a name="SCAUMOT_${miListaId.SCAUMOT}" />
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title0}"
                                                                        headerClass="sortable"
                                                                        sortProperty="SCAUMOT"
                                                                        style="width:5%"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspText">
                                                                ${miListaId.SCAUMOT}
                                                            </div>
                                                        </display:column>                                                        
                                                        <display:column title="${title1}"
                                                                        headerClass="sortable"
                                                                        sortProperty="TCAUSIN"
                                                                        style="width:20%"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspText">
                                                                ${miListaId.TCAUSIN}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title2}"
                                                                        headerClass="sortable"
                                                                        sortProperty="TMOTSIN"
                                                                        style="width:20%"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspText">
                                                                ${miListaId.TMOTSIN}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title3}"
                                                                        headerClass="sortable"
                                                                        sortProperty="TPRENOM"
                                                                        style="width:15%"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspText">
                                                                ${miListaId.TMOVIMI}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title4}"
                                                                        headerClass="sortable"
                                                                        sortProperty="TMOVIMI"
                                                                        style="width:10%"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspText">
                                                                ${miListaId.TMOTMOV}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title5}"
                                                                        headerClass="sortable"
                                                                        style="width:10%"
                                                                        sortProperty="TMOTFIN"
                                                                        media="html"
                                                                        autolink="false">
                                                            <div class="dspText">
                                                                ${miListaId.TMOTFIN}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title6}"
                                                                        headerClass="sortable"
                                                                        sortProperty="CPAGAUT"
                                                                        style="width:5%"
                                                                        media="html"
                                                                        autolink="false">
                                                              <div class="dspIcons">  
                                                                  <input type="checkbox" disabled id="CPAGAUT" name="CPAGAUT" value="${miListaId.CPAGAUT}" 
                                                                  <c:if test="${miListaId.CPAGAUT == '1'}">checked</c:if> >
                                                              </div>    
                                                        </display:column>
                                                        <display:column title="${title7}"
                                                                        headerClass="sortable"
                                                                        sortProperty="CDESAUT"
                                                                        style="width:5%"
                                                                        media="html"
                                                                        autolink="false">
                                                              <div class="dspIcons">  
                                                                  <input type="checkbox" disabled id="CDESAUT" name="CDESAUT" value="${miListaId.CDESAUT}" 
                                                                  <c:if test="${miListaId.CDESAUT == '1'}">checked</c:if> >
                                                              </div>    
                                                        </display:column>

                                                        <axis:visible f="axissin021"
                                                                      c="BT_EDITAR">
                                                            <display:column title=""
                                                                            headerClass="headwidth5 sortable"
                                                                            style="width:5%"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspIcons">
                                                                    <img border="0"
                                                                         alt='<fmt:message key="1000439"/>'
                                                                         title1='<fmt:message key="1000439"/>'
                                                                         src="images/lapiz.gif"
                                                                         width="11px"
                                                                         height="11px"
                                                                         style="cursor:pointer;"
                                                                         onclick="javascript:f_abrir_modal('axissin022',null,'&isNew=No&CSCAUMOT=${miListaId.SCAUMOT}')"/>
                                                                </div>
                                                            </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axissin021"
                                                                      c="BT_ELIMINAR">
                                                            <display:column title=""
                                                                            headerClass="headwidth5 sortable "
                                                                            media="html"
                                                                            style="width:5%"
                                                                            autolink="false">
                                                                <div class="dspIcons">
                                                                    <img border="0"
                                                                         alt='<fmt:message key="9001333"/>'
                                                                         title1='<fmt:message key="100002"/>'
                                                                         src="images/delete.gif"
                                                                         width="15px"
                                                                         height="15px"
                                                                         style="cursor:pointer;"
                                                                         onclick="javascript:f_borrar('${miListaId.SCAUMOT}')"/>
                                                                </div>
                                                            </display:column>
                                                        </axis:visible>
                                                        <%contador++;%>
                                                    </display:table>
                                                </div>
                                                <div class="separador">&nbsp;</div>
                                                <div class="separador">&nbsp;</div>
                                                <table class="area"
                                                       align="center">
                                                    <tr>
                                                        <td class="campocaja">
                                                            <div style="float:left;">
                                                                <img id="DSP_DESTINATARIOS_parent"
                                                                     src="images/mes.gif"
                                                                     onclick="objEstilos.toggleDisplay('DSP_DESTINATARIOS', this)"
                                                                     style="cursor:pointer"/>
                                                                 
                                                                <b><fmt:message key="9000896"/></b>
                                                            </div>
															                        <axis:visible f="axissin021" c="BT_NEW_2">
                                                            <div style="float:right;">
                                                                <!--a href="javascript:f_inicializar_suplemento(243, 'DSP_DATOS_GESTION')"><img border="0" alt="<fmt:message key="1000126"/>" title="<fmt:message key="1000126"/>" src="images/lapiz.gif"/>sss</a-->
                                                                 
                                                             <!--   <a href="javascript:f_inicializar_suplemento(286, 'DSP_DATOS_GESTION')"> -->
                                                                    <img border="0"
                                                                         alt='<fmt:message key="1000428"/>'
                                                                         title='<fmt:message key="1000428"/>'
                                                                         src="images/new.gif"
                                                                         onclick="f_abrir_modal('axissin023',null,'&isNew=Si')"
                                                                         style="cursor:pointer"/>
                                                                         
                                                                   
                                                             <!--   </a> -->
                                                                 
                                                                <!-- onclick="javascript:mostrar_ocultar('SECCION_GESION');" -->
                                                            </div>
															</axis:visible>
                                                            <div style="clear:both;">
                                                                <hr class="titulo"></hr>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="DSP_DESTINATARIOS_children"
                                                        style="display:none">
                                                        <td align="left">
                                                            <%-- <table
                                                                 class="area"
                                                                 align="center">--%>
                                                            <table class="area"
                                                                   align="center">
                                                                <tr>
                                                                    <td class="campocaja">
                                                                        <c:set var="title1">
                                                                            <fmt:message key="9001213"/>
                                                                        </c:set>
                                                                        <c:set var="title2">
                                                                            <fmt:message key="9001679"/>
                                                                        </c:set>
                                                                      
                                                                        <div class="displayspace">
                                                                            <%int contadorx = 0;%>
                                                                             
                                                                            <display:table name="${__formdata.destinatarios}"
                                                                                           id="miListaId"
                                                                                           export="false"
                                                                                           class="dsptgtable"
                                                                                           pagesize="8"
                                                                                           requestURI="modal_axissin021.do?paginar=true"
                                                                                           sort="list"
                                                                                           cellpadding="0"
                                                                                           cellspacing="0">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <c:set var="i"><%=contadorx%></c:set>
                                                                                <display:column title=""
                                                                                                sortable="false"
                                                                                                sortProperty=""
                                                                                                style="width:5%"
                                                                                                headerClass="headwidth5 sortable"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspIcons">
                                                                                        <input onclick="javascript:f_getDestinatarios('${i}','${miListaId.CTIPDES}')"
                                                                                               <c:if test="${__formdata.CTIPDES == miListaId.CTIPDES}"> checked </c:if>
                                                                                               value=""
                                                                                               type="radio"
                                                                                               id="radioDESTINATARI"
                                                                                               name="radioDESTINATARI"/>
                                                                                    </div>
                                                                                </display:column>                                                                                
                                                                                <display:column title="${title1}"
                                                                                                headerClass="sortable"
                                                                                                sortProperty="TCTIPDES"
                                                                                                style="width:40%"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspText">
                                                                                        ${miListaId.TCTIPDES}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title2}"
                                                                                                headerClass="sortable"
                                                                                                sortProperty="TMODFIS"
                                                                                                 style="width:45%"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspText">
                                                                                        ${miListaId.TMODFIS}
                                                                                    </div>
                                                                                </display:column>
                                                                               <axis:visible f="axissin021"
                                                                                          c="BT_EDITAR">
                                                                                <display:column title=""
                                                                                                headerClass="headwidth5 sortable"
                                                                                                style="width:5%"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspIcons">
                                                                                        <img border="0"
                                                                                             alt='<fmt:message key="1000439"/>'
                                                                                             title1='<fmt:message key="1000439"/>'
                                                                                             src="images/mas.gif"
                                                                                             width="11px"
                                                                                             height="11px"
                                                                                             style="cursor:pointer;"
                                                                                             onclick="javascript:f_abrir_modal('axissin023',null,'&XSCAUMOT=${miListaId.SCAUMOT}&CTIPDES=${miListaId.CTIPDES}&isNew=No')"/>
                                                                                    </div>                                   
                                                                                </display:column>
                                                                            </axis:visible>
                                                                            <axis:visible f="axissin021"
                                                                                          c="BT_ELIMINAR">
                                                                                <display:column title=""
                                                                                                headerClass="headwidth5 sortable"
                                                                                                media="html"
                                                                                                style="width:5%"
                                                                                                autolink="false">
                                                                                    <div class="dspIcons">
                                                                                        <img border="0"
                                                                                             alt='<fmt:message key="9001333"/>'
                                                                                             title1='<fmt:message key="100002"/>'
                                                                                             src="images/delete.gif"
                                                                                             width="15px"
                                                                                             height="15px"
                                                                                             style="cursor:pointer;"
                                                                                             onclick="javascript:f_borrar_destinatario('${miListaId.SCAUMOT}','${miListaId.CTIPDES}')"/>
                                                                                    </div>
                                                                                </display:column>
                                                                            </axis:visible>
                                                                                <%contadorx++;%>
                                                                            </display:table>
                                                                        </div>
                                                                       <div class="separador">&nbsp;</div>
                                                                        <table class="area"
                                                                               align="center">
                                                                            <tr>
                                                                                <td class="campocaja">
                                                                                    <div style="float:left;">
                                                                                        <img id="DSP_FORMULAS_parent"
                                                                                             src="images/mes.gif"
                                                                                             onclick="objEstilos.toggleDisplay('DSP_FORMULAS', this)"
                                                                                             style="cursor:pointer"/>
                                                                                         
                                                                                        <b><fmt:message key="9001678"/></b>
                                                                                    </div>
																					  <axis:visible f="axissin021" c="BT_NEW_3">
                                                                                    <c:if test="${!empty __formdata.destinatarios}">
                                                                                    <div style="float:right;">
                                                                                        <a href="javascript:f_abrir_modal('axissin024',null,'&isNew=Si&CTIPDES='+document.axissin021Form.CTIPDES.value);"  />
                                                                                            <img border="0"
                                                                                                 alt='<fmt:message key="1000428"/>'
                                                                                                 title='<fmt:message key="1000428"/>'
                                                                                                 src="images/new.gif"/>
                                                                                        </a>
                                                                                    </div>
                                                                                    </c:if>
																					</axis:visible>
                                                                                    <div style="clear:both;">
                                                                                        <hr class="titulo"></hr>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="DSP_FORMULAS_children"
                                                                                style="display:none">
                                                                                <td align="left">
                                                                                    <%-- <table
                                                                                         class="area"
                                                                                         align="center">--%>
                                                                                    <table class="area"
                                                                                           align="center">
                                                                                        <tr>
                                                                                            <td class="campocaja">
                                                                                                <c:set var="title1">
                                                                                                    <fmt:message key="9001680"/>
                                                                                                </c:set>
                                                                                                <c:set var="title2">
                                                                                                    <fmt:message key="108347"/>
                                                                                                </c:set>
                                                                                              
                                                                                                <div class="displayspace">
                                                                                                    <%contador = 0;%>
                                                                                                    
                                                                                                    <display:table name="${__formdata.formulas}"
                                                                                                                   id="miListaId"
                                                                                                                   export="false"
                                                                                                                   class="dsptgtable"
                                                                                                                   pagesize="8"
                                                                                                                   requestURI="modal_axissin021.do?paginar=true"
                                                                                                                   sort="list"
                                                                                                                   cellpadding="0"
                                                                                                                   cellspacing="0">
                                                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                                                                                                                                        
                                                                                                        <display:column title="${title1}"
                                                                                                                        headerClass="sortable"
                                                                                                                        sortProperty="TCAMPO"
                                                                                                                        style="width:50%"
                                                                                                                        media="html"
                                                                                                                        autolink="false">
                                                                                                            <div class="dspText">
                                                                                                                ${miListaId.TCAMPO} 
                                                                                                            </div>
                                                                                                        </display:column>
                                                                                                        <display:column title="${title2}"
                                                                                                                        headerClass="sortable"
                                                                                                                        sortProperty="CCAMPO"
                                                                                                                        style="width:30%"
                                                                                                                        media="html"
                                                                                                                        autolink="false">
                                                                                                            <div class="dspText">
                                                                                                                ${miListaId.DESCRIPCION}
                                                                                                            </div>
                                                                                                        </display:column>
                                                                                                       <axis:visible f="axissin021"
                                                                                                                  c="BT_EDITAR">
                                                                                                        <display:column title=""
                                                                                                                        headerClass="headwidth5 sortable"
                                                                                                                        style="width:5%"
                                                                                                                        media="html"
                                                                                                                        autolink="false">
                                                                                                            <div class="dspIcons">
                                                                                                                <img border="0"
                                                                                                                     alt='<fmt:message key="1000439"/>'
                                                                                                                     title1='<fmt:message key="1000439"/>'
                                                                                                                     src="images/mas.gif"
                                                                                                                     width="11px"
                                                                                                                     height="11px"
                                                                                                                     style="cursor:pointer;"
                                                                                                                     onclick="javascript:f_abrir_modal('axissin024',null,'&CCLAVE=${miListaId.CCLAVE}&CCAMPO=${miListaId.CCAMPO}&isNew=No')"/>
                                                                                                            </div>
                                                                                                        </display:column>
                                                                                                    </axis:visible>
                                                                                                    <axis:visible f="axissin021"
                                                                                                                  c="BT_ELIMINAR">
                                                                                                        <display:column title=""
                                                                                                                        headerClass="headwidth5 sortable"
                                                                                                                        media="html"
                                                                                                                        style="width:5%"
                                                                                                                        autolink="false">
                                                                                                            <div class="dspIcons">
                                                                                                                <img border="0"
                                                                                                                     alt='<fmt:message key="9001333"/>'
                                                                                                                     title1='<fmt:message key="9001333"/>'
                                                                                                                     src="images/delete.gif"
                                                                                                                     width="15px"
                                                                                                                     height="15px"
                                                                                                                     style="cursor:pointer;"
                                                                                                                     onclick="javascript:f_borrar_formula('${miListaId.CCAMPO}','${miListaId.CCLAVE}')"/>
                                                                                                            </div>
                                                                                                        </display:column>
                                                                                                    </axis:visible>
                                                                                                        <%contador++;%>
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
                                                <div class="separador">&nbsp;</div>
                                                <div class="separador">&nbsp;</div>
                                                <table class="area"
                                                       align="center">
                                                    <tr>
                                                        <td class="campocaja">
                                                            <div style="float:left;">
                                                                <img id="DSP_PRODUCTES_parent"
                                                                     src="images/mes.gif"
                                                                     onclick="objEstilos.toggleDisplay('DSP_PRODUCTES', this)"
                                                                     style="cursor:pointer"/>
                                                                 
                                                                <b><fmt:message key="102177"/></b>
                                                            </div>
															  <axis:visible f="axissin021" c="BT_NEW_4">
                                                            <div style="float:right;">
                                                                <a href="javascript:f_abrir_modal('axissin025',null,'&isNew=Si');"  />
                                                                    <img border="0"
                                                                         alt='<fmt:message key="1000428"/>'
                                                                         title='<fmt:message key="1000428"/>'
                                                                         src="images/new.gif"/>
                                                                </a>
                                                            </div>
															 </axis:visible>
                                                            <div style="clear:both;">
                                                                <hr class="titulo"></hr>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="DSP_PRODUCTES_children"
                                                        style="display:none">
                                                        <td align="left">
                                                            <%-- <table
                                                                 class="area"
                                                                 align="center">--%>
                                                            <table class="area"
                                                                   align="center">
                                                                <tr>
                                                                    <td class="campocaja">
                                                                        <c:set var="title1">
                                                                            <fmt:message key="100829"/>
                                                                        </c:set>
                                                                        <c:set var="title2">
                                                                            <fmt:message key="103481"/>
                                                                        </c:set>
                                                                        <c:set var="title3">
                                                                            <fmt:message key="100561"/>
                                                                        </c:set>
                                                                        <c:set var="title4">
                                                                            <fmt:message key="9000908"/>
                                                                        </c:set>
                                                                        <div class="displayspace">
                                                                            <%contador = 0;%>
                                                                             
                                                                            <display:table name="${__formdata.productos}"
                                                                                           id="miListaId"
                                                                                           export="false"
                                                                                           class="dsptgtable"
                                                                                           pagesize="8"
                                                                                           requestURI="modal_axissin021.do?paginar=true"
                                                                                           sort="list"
                                                                                           cellpadding="0"
                                                                                           cellspacing="0">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <display:column title="${title1}"
                                                                                                headerClass="sortable"
                                                                                                sortProperty="TPRODUCTO"
                                                                                                style="width:22.5%"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspText">
                                                                                        ${miListaId.TPRODUCTO}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title2}"
                                                                                                headerClass="sortable"
                                                                                                style="width:22.5%"
                                                                                                sortProperty="TACTIVIDAD"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspText">
                                                                                        ${miListaId.TACTIVIDAD}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title3}"
                                                                                                headerClass="sortable"
                                                                                                sortProperty="TGARANTIA"
                                                                                                style="width:22.5%"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspText">
                                                                                        ${miListaId.TGARANTIA}
                                                                                    </div>
                                                                                </display:column>
                                                                                <display:column title="${title4}"
                                                                                                headerClass="sortable"
                                                                                                style="width:22.5%"
                                                                                                sortProperty="TTRAMITACION"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspText">
                                                                                        ${miListaId.TTRAMITACION}
                                                                                    </div>
                                                                                </display:column>
                                                                               <axis:visible f="axissin021"
                                                                                          c="BT_EDITAR">
                                                                                <display:column title=""
                                                                                                headerClass="headwidth5 sortable"
                                                                                                style="width:5%"
                                                                                                media="html"
                                                                                                autolink="false">
                                                                                    <div class="dspIcons">
                                                                                        <img border="0"
                                                                                             alt='<fmt:message key="1000439"/>'
                                                                                             title1='<fmt:message key="1000439"/>'
                                                                                             src="images/mas.gif"
                                                                                             width="11px"
                                                                                             height="11px"
                                                                                             style="cursor:pointer;"
                                                                                             onclick="javascript:f_abrir_modal('axissin025',null,'&isNew=No&SPRODUC=${miListaId.SPRODUC}&CACTIVI=${miListaId.CACTIVI}&CGARANT=${miListaId.CGARANT}&CTRAMIT=${miListaId.CTRAMIT}');"/>
                                                                                    </div>
                                                                                </display:column>
                                                                            </axis:visible>
                                                                            <axis:visible f="axissin021"
                                                                                          c="BT_ELIMINAR">
                                                                                <display:column title=""
                                                                                                headerClass="headwidth5 sortable"
                                                                                                media="html"
                                                                                                style="width:5%"
                                                                                                autolink="false">
                                                                                    <div class="dspIcons">
                                                                                        <img border="0"
                                                                                             alt='<fmt:message key="9001333"/>'
                                                                                             title1='<fmt:message key="9001333"/>'
                                                                                             src="images/delete.gif"
                                                                                             width="15px"
                                                                                             height="15px"
                                                                                             style="cursor:pointer;"
                                                                                             onclick="javascript:f_borrar_producte('${miListaId.SPRODUC}','${miListaId.CACTIVI}','${miListaId.CGARANT}','${miListaId.CTRAMIT}')"/>
                                                                                    </div>
                                                                                </display:column>
                                                                            </axis:visible>                                                                               
                                                                               
                                                                                <%contador++;%>
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
                    </td>
                </tr>
            </table>


         
        </form>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axissin021</c:param>
            <c:param name="__botones">salir</c:param>
        </c:import>
        <c:import url="../include/mensajes.jsp"/>
        </body>
</html>