<%/*
*  Fichero: axisrea012.jsp
*
*  Fecha: 27/07/2009
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
    <title><axis:alt f="axisrea012" c="AXISREA012_TIT" lit="9001862"/></title> <%-- Buscador de cesiones --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
           // document.getElementById("NPOLIZA").focus();
            f_cargar_propiedades_pantalla();//BFP bug 20747 02/02/2012
            revisarEstilos();                             
            objDom.setValorPorId("NMOVIMI", ${__formdata.NMOVIMI});
        }
       //Carregar el detall del detall del rebut
         function f_seleccionar_datosReciboCes(TCTRAMO,CTRAMO,TGARANT,CGARANT,NOM,NRIESGO,SFACULT,SCONTRA,NVERSIO,PCESION,ICAPCES,ICESION,IPRITARREA,IDTOSEL,PSOBREPRIMA,IEXTRAP,IEXTREA) {                    
            objDom.setValorPorId("CTRAMO", CTRAMO);
            objDom.setValorPorId("TCTRAMO", TCTRAMO);
            objDom.setValorPorId("CGARANT", CGARANT);
            objDom.setValorPorId("TGARANT", TGARANT);
            objDom.setValorPorId("NOM", NOM);
            objDom.setValorPorId("NRIESGO", NRIESGO);
            objDom.setValorPorId("SFACULT", SFACULT);
            objDom.setValorPorId("SCONTRA", SCONTRA);
            objDom.setValorPorId("NVERSIO", NVERSIO);
            objDom.setValorPorId("PCESION", PCESION);
            objDom.setValorPorId("ICAPCES", ICAPCES);
            objDom.setValorPorId("ICESION", ICESION);
            objDom.setValorPorId("IPRITARREA", IPRITARREA);
            objDom.setValorPorId("IDTOSEL", IDTOSEL);
            objDom.setValorPorId("PSOBREPRIMA", PSOBREPRIMA);
            objDom.setValorPorId("IEXTRAP", IEXTRAP);
            objDom.setValorPorId("IEXTREA", IEXTREA);
            
        }
       //Netejar el detall del detall del rebut
        function f_netejar_datosReciboCes() {              
            objDom.setValorPorId("CTRAMO", "");
            objDom.setValorPorId("TCTRAMO", "");
            objDom.setValorPorId("CGARANT", "");
            objDom.setValorPorId("TGARANT", "");
            objDom.setValorPorId("NOM", "");
            objDom.setValorPorId("NRIESGO", "");
            objDom.setValorPorId("SFACULT", "");
            objDom.setValorPorId("SCONTRA", "");
            objDom.setValorPorId("NVERSIO", "");
            objDom.setValorPorId("PCESION", "");
            objDom.setValorPorId("ICAPCES", "");
            objDom.setValorPorId("ICESION", "");
            objDom.setValorPorId("IPRITARREA", "");
            objDom.setValorPorId("IDTOSEL", "");
            objDom.setValorPorId("PSOBREPRIMA", "");
            objDom.setValorPorId("IEXTRAP", "");
            objDom.setValorPorId("IEXTREA", "");
            
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisrea012');
        }
        
        //Carregar les dades del rebut seleccionat
        function f_seleccionar_recibo(NRECIBO) {
           f_netejar_datosReciboCes();
     //      document.getElementById("detalle").style.display = "none";
           objDom.setValorPorId("DETALLESTATUS", "table");
           objDom.setValorPorId("NRECIBOZ", NRECIBO);                 
           objUtiles.ejecutarFormulario("modal_axisrea012.do?primeraCarrega=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
         }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea012" c="AXISREA012_TIT2" lit="9001863"/></c:param>     <%-- Buscador de cesiones --%>
                <c:param name="formulario"><axis:alt f="axisrea012" c="AXISREA012_FORM" lit="9001863"/></c:param> <%-- Buscador de cesiones --%>
                <c:param name="form">axisrea012</c:param>
        </c:import>
            
        <input type="hidden" id="DETALLESTATUS" name="DETALLESTATUS" value="${__formdata.DETALLESTATUS}"/> 
        <input type="hidden" id="NRECIBOZ" name="NRECIBOZ" value="${__formdata.NRECIBOZ}"/> 
        <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/> 
        <input type="hidden" name="operation" value=""/>
                
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
          <tr>
           <td>
           
            <c:if test="${!empty requestScope.T_IAX_RECIBOSCES && empty requestScope.__mensajes.m__clave}">
                  <c:set var="resumen">
                    <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                        <b><axis:alt f="axisrea012" c="AXISREA012_NMOVIMI" lit="9001954"/>:</b> ${__formdata.NMOVIMI}     
                    </span>
                </c:set>
            </c:if>
            <div class="separador">&nbsp;</div>
            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisrea012" c="AXISREA012_DET" lit="1000113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; </div>
           
           
            <div class="separador">&nbsp;</div>          
             <table class="seccion">             
              <tr>
               <td>                                                                                     
                   <table class="area" align="center">
                    <tr>
                     <td>
                    <!--Aqui va la tabla de recibos -->
                            <c:set var="title1"><axis:alt f="axisrea012" c="AXISREA012_NRECIB" lit="800636"/></c:set>  <%-- Num recibo --%>
                            <c:set var="title2"><axis:alt f="axisrea012" c="AXISREA012_FACTOR" lit="9002023"/></c:set>   <%-- Factor --%>
                            <c:set var="title3"><axis:alt f="axisrea012" c="AXISREA012_FEFECT" lit="100883"/></c:set>   <%-- Fecha efecto --%>
                            <c:set var="title4"><axis:alt f="axisrea012" c="AXISREA012_FVENCI" lit="100885"/></c:set>   <%-- Fecha vencimiento --%>
                            <c:set var="title5"><axis:alt f="axisrea012" c="AXISREA012_FCIERR" lit="9000490"/></c:set>   <%-- Fecha cierre --%>
                            <c:set var="title6"><axis:alt f="axisrea012" c="AXISREA012_MCESIO" lit="9002024"/></c:set>   <%-- Motivo de cesión --%>
                            <div class="displayspace">
                              <display:table name="${requestScope.T_IAX_RECIBOSCES}" id="T_IAX_RECIBOSCES" export="false" class="dsptgtable" 
                              pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                              requestURI="modal_axisrea012.do?operation=form&paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable" title="" sortable="false" media="html" autolink="false" >
                                  <div class="dspIcons">
                                    <input value="${T_IAX_RECIBOSCES.SREAEMI}" <c:if test="${T_IAX_RECIBOSCES.SREAEMI==requestScope.SREAEMISELCCIONAT}">checked</c:if> onclick="javascript:f_seleccionar_recibo('${T_IAX_RECIBOSCES.NRECIBO}')" type="radio" id="SREAEMI" name="SREAEMI" selected="true"/>
                                  </div>
                                </display:column>                                                                       
                                <display:column title="${title1}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                  <div class="dspText">${T_IAX_RECIBOSCES.NRECIBO}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="NFACTOR" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                  <div class="dspText">${T_IAX_RECIBOSCES.NFACTOR}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="FEFECTE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                  <div class="dspText">
                                   <fmt:formatDate value="${T_IAX_RECIBOSCES.FEFECTE}" pattern="dd/MM/yyyy"/>
                                  </div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="FVENCIM" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                  <div class="dspText">
                                    <fmt:formatDate value="${T_IAX_RECIBOSCES.FVENCIM}" pattern="dd/MM/yyyy"/>
                                  </div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="FCIERRE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                  <div class="dspText">
                                    <fmt:formatDate value="${T_IAX_RECIBOSCES.FCIERRE}" pattern="dd/MM/yyyy"/>                                  
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="TCMOTCES" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                  <div class="dspText">${T_IAX_RECIBOSCES.TCMOTCES}</div>
                                </display:column>                                                              
                              </display:table>                                                                                                    
                            </div>                      
                    </td>
                    </tr>                                                                                                                
                    <tr>
                     <td>
                     
                     <c:choose> 
                        <c:when test="${__formdata.DETALLESTATUS == 'table'}" >                        
                            <table class="area" align="center" id="detalle"> 
                        </c:when>
                        <c:otherwise>
                            <table class="area" align="center" style="display:none" id="detalle">                             
                         </c:otherwise>   
                       </c:choose>  
                       
                       
                        <tr>
                        <td> 
                            <c:if test="${!empty requestScope.T_IAX_RECIBOSCES && empty requestScope.__mensajes.m__clave}">
                               <c:set var="resumen">
                                   <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                    <b><axis:alt f="axisrea012" c="AXISREA012_NRECIBOZ" lit="109253"/></b> ${__formdata.NRECIBOZ}  
                                   </span>
                               </c:set>
                            </c:if>
                            <div class="separador">&nbsp;</div>
                            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisrea012" c="AXISREA012_DET2" lit="1000113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; </div>
                            <div class="separador">&nbsp;</div>                             
                            <!--Aqui va la tabla de detalle de los recibos -->
                                <c:set var="title1"><axis:alt f="axisrea012" c="AXISREA012_GARAN" lit="100561"/></c:set>  <%-- Garantia --%>
                                <c:set var="title2"><axis:alt f="axisrea012" c="AXISREA012_CONTR" lit="9001894"/></c:set>   <%-- Contrato --%>
                                <c:set var="title3"><axis:alt f="axisrea012" c="AXISREA012_VCPRO" lit="9000577"/></c:set>   <%-- Versión contrato protección --%>
                                <c:set var="title4"><axis:alt f="axisrea012" c="AXISREA012_TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>                              
                                <c:set var="title5"><axis:alt f="axisrea012" c="AXISREA012_CESI1" lit="9000618"/></c:set>  <%-- %Cesión --%>                              
                                <c:set var="title6"><axis:alt f="axisrea012" c="AXISREA012_CESI2" lit="9002030"/></c:set>  <%-- Cesión --%>
                                <div class="displayspace">
                                  <c:set var="search" value="\'"/>
                                  <c:set var="change" value="\&acute;"/>
                                  <display:table name="${requestScope.T_IAX_DATOS_RECIBOS_CES}" id="T_IAX_DATOS_RECIBOS_CES" export="false" class="dsptgtable" 
                                  pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                  requestURI="modal_axisrea012.do?operation=form&paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                      <div class="dspIcons">
                                        <input value="" type="radio" id="radioDetallRebut" name="radioDetallRebut" selected="true"
                                               onclick="javascript:f_seleccionar_datosReciboCes('${fn:replace(T_IAX_DATOS_RECIBOS_CES.TCTRAMO,search,change)}','${T_IAX_DATOS_RECIBOS_CES.CTRAMO}','${fn:replace(T_IAX_DATOS_RECIBOS_CES.TGARANT,search,change)}','${T_IAX_DATOS_RECIBOS_CES.CGARANT}','${fn:replace(T_IAX_DATOS_RECIBOS_CES.NOM,search,change)}','${T_IAX_DATOS_RECIBOS_CES.NRIESGO}','${T_IAX_DATOS_RECIBOS_CES.SFACULT}','${T_IAX_DATOS_RECIBOS_CES.SCONTRA}','${T_IAX_DATOS_RECIBOS_CES.NVERSIO}', <axis:visible f='axisrea012' c='PCESION_1' >'<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.PCESION}" pattern="${__formatNumberPorcentajeDefault}"/>', </axis:visible><axis:visible f='axisrea012' c='PCESION_CP' >'<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.PCESION_CP}" pattern="${__formatNumberPorcentajeDefault}"/>', </axis:visible>'<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.ICAPCES}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>',<axis:visible f='axisrea012' c='ICESION_1' > '<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.ICESION}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>', </axis:visible><axis:visible f='axisrea012' c='ICESION_CP' > '<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.ICESION_CP}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>', </axis:visible> '<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.IPRITARREA}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>','<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.IDTOSEL}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>','<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.PSOBREPRIMA}" pattern="##,##0.00"/>','${T_IAX_DATOS_RECIBOS_CES.IEXTRAP}','<fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.IEXTREA}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>')"/>                                        
                                      </div>
                                    </display:column>                                                                       
                                    <display:column title="${title1}" sortable="true" sortProperty="CGARANT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                      <div class="dspText">${T_IAX_DATOS_RECIBOS_CES.CGARANT}${!empty T_IAX_DATOS_RECIBOS_CES.CGARANT && !empty T_IAX_DATOS_RECIBOS_CES.TGARANT ? ' - ' : ''}${T_IAX_DATOS_RECIBOS_CES.TGARANT}</div>                                        
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="SCONTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                      <div class="dspText">${T_IAX_DATOS_RECIBOS_CES.SCONTRA}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="NVERSIO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                      <div class="dspText">${T_IAX_DATOS_RECIBOS_CES.NVERSIO}</div>
                                    </display:column>                                   
                                    <display:column title="${title4}" sortable="true" sortProperty="CTRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                      <div class="dspText">${T_IAX_DATOS_RECIBOS_CES.CTRAMO}${!empty T_IAX_DATOS_RECIBOS_CES.CTRAMO && !empty T_IAX_DATOS_RECIBOS_CES.TCTRAMO ? ' - ' : ''}${T_IAX_DATOS_RECIBOS_CES.TCTRAMO}</div>                                      
                                    </display:column>
                                     <axis:visible f="axisrea012" c="PCESION_1" >
                                        <display:column title="${title5}" sortable="true" sortProperty="PCESION" headerClass="sortable fixed"  media="html" autolink="false">
                                            <div class="dspText">
                                                <div class="dspText">${T_IAX_DATOS_RECIBOS_CES.PCESION}<c:if test="${! empty T_IAX_DATOS_RECIBOS_CES.PCESION}"> %</c:if></div>                                                          
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisrea012" c="PCESION_CP" >
                                        <display:column title="${title5}" sortable="true" sortProperty="PCESION_CP" headerClass="sortable fixed"  media="html" autolink="false">
                                            <div class="dspText">
                                                <div class="dspText">${T_IAX_DATOS_RECIBOS_CES.PCESION_CP}<c:if test="${! empty T_IAX_DATOS_RECIBOS_CES.PCESION_CP}"> %</c:if></div>                                                            
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisrea012" c="ICESION_1" >
                                        <display:column title="${title6}" sortable="true" sortProperty="ICESION" headerClass="sortable fixed"  media="html" autolink="false">
                                            <div class="dspText">
                                                <fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.ICESION}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>                                                            
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisrea012" c="ICESION_CP" >
                                        <display:column title="${title6}" sortable="true" sortProperty="ICESION_CP" headerClass="sortable fixed"  media="html" autolink="false">
                                            <div class="dspText">
                                                <fmt:formatNumber value="${T_IAX_DATOS_RECIBOS_CES.ICESION_CP}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>                                                            
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                  </display:table>                                                                                                    
                                </div>      
                        </td>
                        </tr>
                        <!--Aqui va el detalle de la tabla de detalle de los recibos-->
                        <tr>
                            <td>
                              <table class="area" align="left">
                               <tr>
                                  <div class="separador">&nbsp;</div>
                                  <div class="detalleRebut_parent"><img id="detalleRebut_parent" name="detalleRebut_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('detalleRebut', this)" style="cursor:pointer"/>
                                    <b><axis:alt f="axisrea012" c="AXISREA012_DETREB" lit="9001866"/></b> 
                                        <c:if test="${! empty sessionScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">
                                            : &nbsp;&nbsp; ${sessionScope.OB_IAX_CODICONTRATO_REA.SCONTRA}/${__formdata.OB_IAX_CONTRATO_REA.NVERSIO} &nbsp;&nbsp; ${sessionScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp; <axis:alt f="axisrea012" c="AXISREA012_FCONI" lit="100883"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONINI}" pattern="dd/MM/yyyy"/> 
                                                <c:if test="${! empty __formdata.OB_IAX_CONTRATO_REA.FCONFIN}">&nbsp;&nbsp; <axis:alt f="axisrea012" c="AXISREA012_FCONF" lit="100885"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONFIN}" pattern="dd/MM/yyyy"/></c:if>
                                        </c:if>
                                  </div>
                                  <hr class="titulo"/>
                               </tr>
                               <tr id="detalleRebut_children" style="display:none">
                                <td>
                                    <table class="seccion" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <div class="separador">&nbsp;</div>
                                                <table class="area" align="center">
                                                    <tr>
                                                    <th style="width:35%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea012" c="CTRAMO" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_CTRAMO"><axis:alt f="axisrea012" c="AXISREA012_LTRAM" lit="9000609"/></b> <%-- Tramo --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IPRITARREA" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_IPRITARREA"><axis:alt f="axisrea012" c="AXISREA012_LPTAR" lit="1000496"/></b> <%-- Prima de tarifa --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IDTOSEL" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_IDTOSEL"><axis:alt f="axisrea012" c="AXISREA012_LDISEL" lit="9002033"/></b> <%-- Descuento importe seleccion --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IEXTRAP" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_IEXTRAP"><axis:alt f="axisrea012" c="AXISREA012_LEPRIM" lit="9002034"/></b> <%-- Tasa cálculo extraprima --%>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>                 
                                                        <axis:ocultar f="axisrea012" c="CTRAMO" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="CTRAMO" name="CTRAMO" size="15" 
                                                                <axis:atr f="axisrea012" c="CTRAMO" a="modificable=false"/>
                                                                value="${__formdata.CTRAMO}" style="width:10%"   <%-- 10 --%>
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CTRAM" lit="9000609"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="TCTRAMO" name="TCTRAMO" size="15" 
                                                                <axis:atr f="axisrea012" c="TCTRAMO" a="modificable=false"/>
                                                                value="${__formdata.TCTRAMO}" style="width:80%" <%-- 80 --%>
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CTRAM2" lit="9000609"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IPRITARREA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="IPRITARREA" name="IPRITARREA" size="15" 
                                                                <axis:atr f="axisrea012" c="IPRITARREA" a="modificable=false"/>
                                                                value='<fmt:formatNumber value="${__formdata.IPRITARREA}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>'
                                                                style="width:70%" title="<axis:alt f="axisrea012" c="AXISREA012_CPTAR" lit="1000496"/>"/>    <%-- 40 --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IDTOSEL" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="IDTOSEL" name="IDTOSEL" size="15" 
                                                                <axis:atr f="axisrea012" c="IDTOSEL" a="modificable=false"/>
                                                                value='<fmt:formatNumber value="${__formdata.IDTOSEL}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' 
                                                                style="width:70%" title="<axis:alt f="axisrea012" c="AXISREA012_CIDSEL" lit="9002033"/>"/>    <%-- 60 --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IEXTRAP" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="IEXTRAP" name="IEXTRAP" size="15" 
                                                                <axis:atr f="axisrea012" c="IEXTRAP" a="modificable=false"/>
                                                                value='<fmt:formatNumber value="${__formdata.IEXTRAP}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' 
                                                                style="width:90%" title="<axis:alt f="axisrea012" c="AXISREA012_CIEPRIM" lit="9002034"/>"/>    <%-- 85 --%>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea012" c="NRIESGO" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_NRIESGO"><axis:alt f="axisrea012" c="AXISREA012_LNRIESGO" lit="100649"/></b> <%-- Riesgo --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="SCONTRA" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_SCONTRA"><axis:alt f="axisrea012" c="AXISREA012_LCQPV" lit="9001594"/></b> <%-- Contrato QP/núm.versión --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="PSOBREPRIMA" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_PSOBREPRIMA"><axis:alt f="axisrea012" c="AXISREA012_LSPRIM" lit="9002032"/></b> <%-- %Sobreprima --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IEXTREA" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_IEXTREA"><axis:alt f="axisrea012" c="AXISREA012_LIEXPRIM" lit="101918"/></b> <%-- Extraprima --%>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisrea012" c="NRIESGO" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="NRIESGO" name="NRIESGO" size="15" 
                                                                <axis:atr f="axisrea012" c="NRIESGO" a="modificable=false"/>
                                                                value="${__formdata.NRIESGO}" style="width:10%"
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CNRIESGO" lit="100649"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="NOM" name="NOM" size="15" 
                                                                <axis:atr f="axisrea012" c="NOM" a="modificable=false"/>
                                                                value="${__formdata.NOM}" style="width:80%"
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CNOM" lit="100649"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="SCONTRA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="SCONTRA" name="SCONTRA" size="15" 
                                                                <axis:atr f="axisrea012" c="SCONTRA" a="modificable=false"/>
                                                                value="${__formdata.SCONTRA}" style="width:40%" <%-- 10 --%>
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_SCONTRA" lit="9001594"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="NVERSIO" name="NVERSIO" size="15" 
                                                                <axis:atr f="axisrea012" c="NVERSIO" a="modificable=false"/>
                                                                value="${__formdata.NVERSIO}" style="width:25%" <%-- 10 --%>
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_NVERSIO" lit="9001594"/>"/>
                                                                &nbsp;&nbsp;                                                   
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="PSOBREPRIMA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="PSOBREPRIMA" name="PSOBREPRIMA" size="15" 
                                                                <axis:atr f="axisrea012" c="PSOBREPRIMA" a="modificable=false"/>
                                                                value="${__formdata.PSOBREPRIMA}"
                                                                style="width:20%" title="<axis:alt f="axisrea012" c="AXISREA012_CSPRIM" lit="9002032"/>"/>    <%-- 25 --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="IEXTREA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="IEXTREA" name="IEXTREA" size="15" 
                                                                <axis:atr f="axisrea012" c="IEXTREA" a="modificable=false"/>
                                                                value='<fmt:formatNumber value="${__formdata.IEXTREA}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>'
                                                                style="width:90%" title="<axis:alt f="axisrea012" c="AXISREA012_IEXTRA" lit="101918"/>"/> <%-- 85 --%>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea012" c="CGARANT" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_CGARANT"><axis:alt f="axisrea012" c="AXISREA012_LGARAN" lit="110994"/></b> <%-- Garantía --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea012" c="SFACULT" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_SFACULT"><axis:alt f="axisrea012" c="AXISREA012_LFACUL" lit="9001918"/></b> <%-- Nº facultativo --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <td class="titulocaja">
                                                            <axis:ocultar f="axisrea012" c="PCESION" dejarHueco="false">
                                                                <b id="label_PCESION"><axis:alt f="axisrea012" c="AXISREA012_LPCES" lit="9000613"/></b> <%-- % Cessió. --%>
                                                                &nbsp;&nbsp;
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisrea012" c="ICAPCES" dejarHueco="false">
                                                                <b id="label_ICAPCES"><axis:alt f="axisrea012" c="AXISREA012_LICAPCE" lit="1000073"/></b> <%-- Capital cessión --%>
                                                            </axis:ocultar>
                                                        </td>
                                                        <axis:ocultar f="axisrea012" c="ICESION" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_ICESION"><axis:alt f="axisrea012" c="AXISREA012_LICESI" lit="9001870"/></b> <%-- Cesión --%>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisrea012" c="CGARANT" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="CGARANT" name="CGARANT" size="15" 
                                                                <axis:atr f="axisrea012" c="CGARANT" a="modificable=false"/>
                                                                value="${__formdata.CGARANT}" style="width:10%"
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CGARANT" lit="110994"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="TGARANT" name="TGARANT" size="15" 
                                                                <axis:atr f="axisrea012" c="TGARANT" a="modificable=false"/>
                                                                value="${__formdata.TGARANT}" style="width:80%"
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CTGARANT" lit="110994"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                       <axis:ocultar f="axisrea012" c="SFACULT" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="SFACULT" name="SFACULT" size="15" 
                                                                <axis:atr f="axisrea012" c="SFACULT" a="modificable=false"/>
                                                                value="${__formdata.SFACULT}"
                                                                style="width:50%" title="<axis:alt f="axisrea012" c="AXISREA012_CFACULT" lit="9001918"/>"/>    <%-- 40 --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <td class="campocaja">
                                                            <axis:ocultar f="axisrea012" c="PCESION" dejarHueco="false">
                                                                <input type="text" class="campowidthinput campo campotexto" id="PCESION" name="PCESION" size="15" 
                                                                <axis:atr f="axisrea012" c="PCESION" a="modificable=false"/>
                                                                value="${__formdata.PCESION}" style="width:20%" <%-- 20 --%>
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CPCESI" lit="9000613"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="ICAPCES" name="ICAPCES" size="15" 
                                                                <axis:atr f="axisrea012" c="ICAPCES" a="modificable=false"/>
                                                                value='<fmt:formatNumber value="${__formdata.ICAPCES}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>' style="width:65%" <%-- 55 --%>
                                                                title="<axis:alt f="axisrea012" c="AXISREA012_CICAPCE" lit="1000073"/>"/>
                                                            </axis:ocultar>
                                                        </td>
                                                        <axis:ocultar f="axisrea012" c="ICESION" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="ICESION" name="ICESION" size="15" 
                                                                <axis:atr f="axisrea012" c="ICESION" a="modificable=false"/>
                                                                <%-- value="<fmt:formatNumber value="${__formdata.ICESION}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>" --%>
                                                                value='<fmt:formatNumber value="${__formdata.ICESION}" pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>'
                                                                style="width:90%" title="<axis:alt f="axisrea012" c="AXISREA012_CICESI" lit="9001870"/>"/>    <%-- 85 --%>
                                                            </td>
                                                        </axis:ocultar>
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
             </td>
            </tr>  
         </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea012</c:param>
            <c:param name="__botones">cancelar</c:param> 
        </c:import>    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFEINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FEFEFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
    </script>

</body>
</html>