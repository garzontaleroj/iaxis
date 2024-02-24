<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<html>
<head>
    <title><axis:alt f="axissin045" c="TIT1" lit="9902550"/> <axis:alt f="axissin045" c="TIT2" lit="9902550"/> </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
</head>
<body style="overflow-x:hidden">

    <c:set var="title1"><axis:alt f="axissin047" c="SSERVIC" lit="1000109"/></c:set>
    <c:set var="title2"><axis:alt f="axissin047" c="TDESCRI" lit="100588"/></c:set>
    <c:set var="title3"><axis:alt f="axissin047" c="IPRECIO" lit="9001165" /></c:set>
    <div class="displayspace" style="padding-right:2%;height:100%">
      <display:table name="${__formdata.LSTSERVICIOS}" id="T_BUSQUEDA" export="false" class="dsptgtable" pagesize="5" 
                     defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                     requestURI="modal_axissin045.do?paginar=true" style="width:105%;" >
                     
        <%@ include file="../include/displaytag.jsp"%>
        <display:column title="" sortable="false" media="html" autolink="false" style="width:5%" headerClass="sortable" >
            <div class="dspIcons" >
                <input type="radio" value="${T_BUSQUEDA.SSERVIC}" 
                       onclick="parent.f_addServei(${T_BUSQUEDA.STARIFA},${T_BUSQUEDA.NLINEA},${T_BUSQUEDA.SSERVIC},'${T_BUSQUEDA.TDESCRI}',${T_BUSQUEDA.IPRECIO},'${T_BUSQUEDA.CCODMON}',
                                            ${T_BUSQUEDA.CTIPCAL},${T_BUSQUEDA.IMINIMO})"
                       name="radiobusc"/>
            </div>
        </display:column>
        <axis:visible f="axissin045" c="TSSERVIC"> 
            <display:column title="${title1}" sortable="true" sortProperty="SSERVIC" style="width:10%" headerClass="sortable fixed" media="html" autolink="false" >
                <div class="dspText">${T_BUSQUEDA.SSERVIC}</div>
            </display:column>  
        </axis:visible>
        <display:column title="${title2}" sortable="true" sortProperty="TDESCRI" headerClass="sortable fixed" media="html" autolink="false" >
            <div class="dspText">${T_BUSQUEDA.TDESCRI}</div>
        </display:column> 
        <display:column title="${title3}" sortable="true" sortProperty="IPRECIO" style="width:15%" headerClass="sortable fixed" media="html" autolink="false" >
            <div class="dspText" align="left"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_BUSQUEDA.IPRECIO}"/></div>
        </display:column> 
      </display:table>
    </div>
</body>
