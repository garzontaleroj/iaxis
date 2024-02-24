<%/* Revision:# ThBvQxdEVMsYqGj9px1m+w== # */%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">



        function f_onload() {
          
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";


            var NSINIES = "${__formdata.NSINIES}";
            var NTRAMIT = "${__formdata.NTRAMIT}";

            f_cargar_propiedades_pantalla();
        }

        function f_but_salir() {
        	 parent.f_cerrar_modal("axissin076");
        }        
        
    </script>
  </head>
    <body onload="f_onload()">
         <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>   
            <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}" />  
            <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}" />
  
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin076" c="FORM" lit="9909675" /></c:param>
                <c:param name="producto"><axis:alt f="axissin076" c="FORM" lit="9909675" /></c:param>
                <c:param name="form">axissin076</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>

                        <axis:visible f="axissin076" c="DSP_RESUMEN_APUNTES_TAREAS">

							<table class="area" align="center">

                			<tr>
                    			<td align="center" >

			                         <c:set var="title0"><axis:alt f="axissin076" c="IDAPUNTE" lit="9001189" /></c:set>
			                         <c:set var="title1"><axis:alt f="axissin076" c="TTIPTRA" lit="9001328" /></c:set>
			                         <c:set var="title2"><axis:alt f="axissin076" c="TTIPAPUNTE" lit="9000908" /></c:set>
			                         <c:set var="title3"><axis:alt f="axissin076" c="FALTA" lit="9001192" /></c:set>
			                         <c:set var="title4"><axis:alt f="axissin076" c="TUSUALT" lit="9001630" /></c:set>
			                         <c:set var="title5"><axis:alt f="axissin076" c="TASIGNADOAPU" lit="9909663" /></c:set>
			                         <c:set var="title6"><axis:alt f="axissin076" c="FRECORDATORIO" lit="9901674" /></c:set>
			                         <c:set var="title7"><axis:alt f="axissin076" c="TESTADO" lit="9905523" /></c:set>
			                         <c:set var="title8"><axis:alt f="axissin076" c="FFINALI" lit="9001198" /></c:set>
			                         <c:set var="title9"><axis:alt f="axissin076" c="TUSUFIN" lit="9909659" /></c:set>
			                         <c:set var="title10"><axis:alt f="axissin076" c="TCONCEP" lit="9000715" /></c:set>
			                         <c:set var="title11"><axis:alt f="axissin076" c="TTITULO" lit="100785" /></c:set>
			                         <c:set var="title12"><axis:alt f="axissin076" c="TTEXTO" lit="100566" /></c:set>
			                         
			                         <div class="displayspaceGrandeSinBorde" style="width:98%">
	                          			<display:table name="${lstagdtareas}" id="lista" export="false" class="dsptgtable" defaultorder="ascending" pagesize="10" sort="list" cellpadding="0" cellspacing="0" requestURI="modal_axissin076.do?paginar=true">
	                                       
		                               	   <%@ include file="../include/displaytag.jsp"%> 
			                                 
	                                        <display:column title="${title0}" sortable="true" sortProperty="IDAPUNTE" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['IDAPUNTE']}</div>
                       						</display:column>
			                               
			                                <display:column title="${title1}" sortable="true" sortProperty="TTIPTRA" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TTIPAPU']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title2}" sortable="true" sortProperty="TTIPAPUNTE" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['NTRAMIT']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title3}" sortable="true" sortProperty="FALTA" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['FALTA']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title4}" sortable="true" sortProperty="TUSUALT" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TUSUALT']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title5}" sortable="true" sortProperty="TASIGNADOAPU" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TASIGNADOAPU']}</div>
                       						</display:column>
                       						
                       						<display:column title="${title6}" sortable="true" sortProperty="FRECORDATORIO" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['FRECORDATORIO']}</div>
                       						</display:column>
			                               
			                                <display:column title="${title7}" sortable="true" sortProperty="TESTADO" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TESTADO']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title8}" sortable="true" sortProperty="FFINALI" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['FFINALI']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title9}" sortable="true" sortProperty="TUSUFIN" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TUSUFIN']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title10}" sortable="true" sortProperty="TCONCEP" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TCONCEP']}</div>
                       						</display:column>
                       						
			                                <display:column title="${title11}" sortable="true" sortProperty="TTITULO" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TTITULO']}</div>
                       						</display:column>
                       						
                       						<display:column title="${title12}" sortable="true" sortProperty="TTEXTO" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                           						<div class="dspText">${lista['TTEXTO']}</div>
                       						</display:column>

	                          		</display:table>
                          			
		                        </div>
                       		</td>
                   		</tr>
					</table>
			 	</axis:visible>				
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axissin076</c:param>
                <c:param name="__botones">salir</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
</html>

