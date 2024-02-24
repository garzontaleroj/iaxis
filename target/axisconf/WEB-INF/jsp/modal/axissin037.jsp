<%/* Revision:# KR+N+AY4DOIyO12oDgZJ8Q== # */%>
<%/*
*  Fichero: Axissin037.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 17/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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

       function f_but_cerrar() {
            parent.f_cerrar_axissin037();
       }
        
       function f_onload(){
            f_cargar_propiedades_pantalla();
       }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="GARANTIA" id="GARANTIA" value="${__formdata.GARANTIA}">
            <input type="hidden" name="CMONRES" id="CMONRES" value="${__formdata.CMONRES}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin037" c="TITULO" lit="9900943" /></c:param>
                <c:param name="producto"><axis:alt f="axissin037" c="TITULO" lit="9900943" /></c:param>
                <c:param name="form">Axissin037</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                            <tr>
                                <td align="left" >
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <div class="separador">&nbsp;</div>
                                           
                                            <c:set var="title1"><axis:alt f="axissin037" c="NMOVRES" lit="800440" /></c:set><!--Nº-->
                                            <c:set var="title2"><axis:alt f="axissin037" c="TTIPRES" lit="100565" /></c:set><!--Tipo-->
                                            <c:set var="title14"><axis:alt f="axissin037" c="CTIPGAS" lit="9902296"/></c:set><!-- Tipo de Gasto -->
                                            <c:set var="title3"><axis:alt f="axissin037" c="TGARANT" lit="110994" /></c:set><!--Garantia -->
                                            <c:set var="title4"><axis:alt f="axissin037" c="FMOVRES" lit="9906065" /></c:set><!--data-->
                                            <!--<c:set var="title5"><axis:alt f="axissin037" c="TCALRES" lit="9001023" /></c:set><!--Calcul --> -->
                                            <c:set var="title5"><axis:alt f="axissin037" c="IVALREEX" lit="89907076" /></c:set><!--Reexpresion -->
                                            <c:set var="title6"><axis:alt f="axissin037" c="ICOSTE" lit="9001024" /></c:set><!-- ICost -->
                                            <c:set var="title7"><axis:alt f="axissin037" c="IRESERVA" lit="9900790" /></c:set><!-- IRESERVA PDTE. -->             
                                            <c:set var="title8"><axis:alt f="axissin037" c="IPAGO" lit="9900791" /></c:set><!-- IPagos -->
                                            <c:set var="title9"><axis:alt f="axissin037" c="IRECOBRO" lit="9900792" /></c:set><!-- IRecobros -->
                                            <c:set var="title0"><axis:alt f="axissin037" c="FRESINI" lit="9000526" /></c:set><!-- F_ini-->
                                            <c:set var="title10"><axis:alt f="axissin037" c="FRESFIN" lit="9000527" /></c:set><!-- F_fin-->
                                            <c:set var="title11"><axis:alt f="axissin037" c="ICAPRIE" lit="9902924" /></c:set><!-- Import capital risc-->
                                            <c:set var="title12"><axis:alt f="axissin037" c="IPENALI" lit="9900794" /></c:set><!-- Import penalització-->
                                            <c:set var="title13"><axis:alt f="axissin037" c="IPREREC" lit="9900853"/></c:set><!-- Import prevision recobro -->  
                                            <c:set var="title99"><axis:alt f="axissin037" c="TMONRES" lit="108645"/></c:set><!-- Moneda -->
                                            <c:set var="title15"><axis:alt f="axissin037" c="FCAMBIO" lit="9900897"/></c:set><!-- Fecha cambio -->
                                            <c:set var="title16"><axis:alt f="axissin037" c="ITASACAMBIO" lit="9909298"/></c:set><!-- Tasa cambio -->
                                            <c:set var="title17"><axis:alt f="axissin037" c="TTIPTRANS" lit="9909302"/></c:set><!-- Tipo de transacción -->
                                            <c:set var="title18"><axis:alt f="axissin037" c="IVALTRANS" lit="9909303"/></c:set><!-- Valor de transacción -->
                                            
                                            <c:set var="title19"><axis:alt f="axissin037" c="IRESERVA_MONCIA" lit="9909304"/></c:set><!-- Imp. Reserva pte. en pesos -->
                                            <!--<c:set var="title20"><axis:alt f="axissin037" c="IPAGO_MONCIA" lit="89907041"/></c:set><!-- Imp. en pesos -->-->
                                            <c:set var="title20"><axis:alt f="axissin037" c="IPAGO_MONCIA" lit="9900790"/></c:set><!--  IRESERVA PDTE. -->  
                                            <c:set var="title21"><axis:alt f="axissin037" c="IRECOBRO_MONCIA" lit="9909306"/></c:set><!-- Imp. Recobro en pesos -->
                                            <c:set var="title22"><axis:alt f="axissin037" c="ICAPRIE_MONCIA" lit="9902924"/></c:set><!-- Imp. Capital Riesgo en pesos -->
                                            <c:set var="title23"><axis:alt f="axissin037" c="IPENALI_MONCIA" lit="9909308"/></c:set><!-- Imp. Penalización en pesos -->
                                            <c:set var="title24"><axis:alt f="axissin037" c="IPREREC_MONCIA" lit="9909309"/></c:set><!-- Imp. previsión recobro en pesos -->
                                            <!-- <c:set var="title25"><axis:alt f="axissin037" c="ICOSTE_MONCIA" lit="9909310"/></c:set><!-- Importe Coste en pesos --> -->
                                            <c:set var="title25"><axis:alt f="axissin037" c="IVALTRAN_MONCIA" lit="89907077"/></c:set><!-- Transaccion valor  --> 
                                            <c:set var="title26"><axis:alt f="axissin037" c="IFRANQ" lit="9907164"/></c:set><!-- Franquicia/Deducible -->
                                            <c:set var="title30"><axis:alt f="axissin037" c="CSOLIDARIDAD" lit="9910049"/></c:set><!-- Solidaridad -->
                                            <c:set var="title31"><axis:alt f="axissin037" c="CUSUMOD" lit="9001265"/></c:set><!-- Solidaridad -->
	
                                            <c:set var="num_tramitacion">0</c:set>
                                            
                                        
                                           
                                            <!--div class="seccion displayspacePersonas"-->
                                            <div id ="divDisplayspaceGrande" class="displayspaceGrandeNew" style="overflow-x:auto;" >
                                                <display:table name="${LISTARESERVAS}" id="T_IAX_TRAM_RESERVAS" 
                                                export="false" class="dsptgtable" pagesize="10"  sort="list" cellpadding="0" cellspacing="0"
                                                requestURI="" >
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <axis:visible f="axissin037" c="NMOVRES">
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT" headerClass="sortable" media="html" autolink="false" style="width:1%">
                                                            <div class="dspNumber">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}</div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="TTIPRES">
                                                        <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:5%">
                                                             <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}</div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible c="CSOLIDARIDAD" f="axissin037">
                                                    <display:column title="${title30}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspIcons"><a name="check_solidaridad_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}"/>
                                                            <input type="checkbox" id="check_solidaridad_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}"  <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CSOLIDARIDAD == 1}"> checked </c:if>  value=""  disabled="disabled"  />
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="TGARANT">
                                                        <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:6%">
                                                             <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TGARANT}</div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="FMOVRES">
                                                        <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:6%">
                                                             <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FMOVRES}"/></div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IVALREEX">
                                                        <display:column title="${title5}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:5%">
                                                             <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IVALREEX}"/></div>   
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="TMONRES">
                                                        <display:column title="${title99}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                             <div class="dspText" title="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TMONRES}" >${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRESINT}</div>    
                                                        </display:column>
                                                    </axis:visible>
										            <axis:visible f="axissin037" c="IFRANQ_RESERVA">
										                <display:column title="${title26}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
										                    <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IFRANQ}"/></div>   
										                </display:column>
										            </axis:visible>
                                                    <axis:visible f="axissin037" c="IRESERVA">
                                                        <display:column title="${title7}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRESERVA" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/></div>    
                                                        </display:column>                             
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IPAGO">
                                                        <display:column title="${title8}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                             <div class="dspText"><fmt:formatNumber value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO}"/></div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IRECOBRO">
                                                        <display:column title="${title9}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                             <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO}"/></div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="ICAPRIE">
                                                        <display:column title="${title11}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ICAPRIE}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="IPENALI">
                                                        <display:column title="${title12}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPENALI}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IPREREC">
                                                        <display:column title="${title13}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPREREC}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="ICOSTE">
                                                        <display:column title="${title6}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:5%">
                                                             <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${(T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO ) - (T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IINGRESO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO )}"/></div>   
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IRESERVA_MONCIA">
                                                        <display:column title="${title19}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRESERVA_MONCIA" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                             <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA_MONCIA}"/></div>    
                                                        </display:column>                             
                                                    </axis:visible>
                                                     <axis:visible f="axissin037" c="IPAGO_MONCIA">
                                                        <display:column title="${title20}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO_MONCIA" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                            <!-- Changes for IAXIS-4663 PK-02/07/2019 Start -->
                                                            <div class="dspText">
                                                                <fmt:formatNumber value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/>
                                                            	<!--<c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPTRANS != ' Recobros'}">
	                                                            	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" 
	                                                            		value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO_MONCIA}"/>
                                                            	</c:if>-->
                                                            </div>
                                                            <!-- Changes for IAXIS-4663 PK-02/07/2019 End -->
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IRECOBRO_MONCIA">
                                                        <display:column title="${title21}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                             <div class="dspText"><fmt:formatNumber value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO_MONCIA}"/></div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="ICAPRIE_MONCIA">
                                                        <display:column title="${title22}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ICAPRIE_MONCIA}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="IPENALI_MONCIA">
                                                        <display:column title="${title23}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPENALI_MONCIA}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IPREREC_MONCIA">
                                                        <display:column title="${title24}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:10%">
                                                            <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPREREC_MONCIA}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axissin037" c="IVALTRAN_MONCIA">
                                                        <display:column title="${title25}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:5%">
                                                             <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IVALTRAN_MONCIA }"/></div>   
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="FCAMBIO">
                                                        <display:column title="${title15}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:6%">
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FCAMBIO}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="ITASACAMBIO">
                                                        <display:column title="${title16}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:5%">
                                                             <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITASACAMBIO}"/></div>   
                                                        </display:column>
                                                    </axis:visible> 

                                                     <axis:visible f="axissin037" c="CTIPGAS">
                                                        <display:column title="${title14}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:6%">
                                                             <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPGAS}</div>    
                                                        </display:column>
                                                    </axis:visible> 
                                                                                      
                                                    <axis:visible f="axissin037" c="FRESINI">
                                                        <display:column title="${title0}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:6%">
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESINI}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="FRESFIN">
                                                        <display:column title="${title10}" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:6%">
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESFIN}"/></div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="CUSUMOD">
                                                        <display:column title="${title31}" sortable="false" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                             <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CUSUMOD}</div>    
                                                        </display:column>                             
                                                    </axis:visible>
                                                    
                                                     <axis:visible f="axissin037" c="TTIPTRANS">
                                                        <display:column title="${title17}" sortable="false"  headerClass="sortable" media="html" autolink="false" style="width:5%">
                                                             <div class="dspText">${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPTRANS}</div>    
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axissin037" c="IVALTRANS">
                                                        <display:column title="${title18}" sortable="false" sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IVALTRANS" headerClass="sortable" media="html" autolink="false" style="width:10%">
                                                             <div class="dspText"><fmt:formatNumber  value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IVALTRANS}"/></div>    
                                                        </display:column>                             
                                                    </axis:visible>
                                                    
                                                </display:table>
                                            </div>
                                             <script language="Javascript" type="text/javascript">
                                                //alert(objUtiles.miInnerWidth()*0.9)
                                                //poniendo scroll a nivel de body o div, no lo presenta, o presenta el scroll horizontal protegido
                                                document.getElementById("divDisplayspaceGrande").style.width=objUtiles.miInnerWidth() * 0.92 + 'px';
                                            </script>
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
                <c:param name="f">axissin037</c:param>
                <c:param name="__botones">cerrar</c:param>
            </c:import>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

