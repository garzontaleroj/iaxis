<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>     
    <title> <axis:alt f="axisctr162export" c="TITULO" lit="9900957"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"> 
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
        
    <c:import url="../include/carga_framework_js.jsp"/>


  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
        
       
               </script>   
</head>
<body  onload="f_onload()">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"></c:param>    
            <c:param name="formulario"> <b>axisexporter</b></c:param> 
            <c:param name="form">axisctr162export</c:param>
        </c:import> 
<form name="miForm" action="" method="POST">    
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">       
            <tr>             
                <td class="campocaja" >   
                <c:set var="title0"><axis:alt f="axisctr162export" c="TCOMPANI" lit="9000600"/></c:set>
                <c:set var="title1"><axis:alt f="axisctr162export" c="NPOLIZA" lit="9902079"/></c:set>                
                <c:set var="title2"><axis:alt f="axisctr162export" c="NRECIBO_ULTIMO" lit="9902082"/></c:set>
                <c:set var="title3"><axis:alt f="axisctr162export" c="NRECIBO_ANTERIOR" lit="9902089"/></c:set>
                <c:set var="title4"><axis:alt f="axisctr162export" c="IPRINET_ULTIMO" lit="101368"/></c:set>
                <c:set var="title5"><axis:alt f="axisctr162export" c="IPRINET_ANTERIOR" lit="9902093"/></c:set>
                <c:set var="title6"><axis:alt f="axisctr162export" c="IPRINET_VARIACION" lit="9902094"/></c:set>
                <c:set var="title7"><axis:alt f="axisctr162export" c="ICOMBRU_ULTIMO" lit="9902087"/></c:set>
                <c:set var="title8"><axis:alt f="axisctr162export" c="ICOMBRU_ANTERIOR" lit="9902095"/></c:set>
                <c:set var="title9"><axis:alt f="axisctr162export" c="ICOMBRU_VARIACION" lit="9901616"/></c:set>
                <c:set var="title10"><axis:alt f="axisctr162export" c="TIT_FICHERO" lit="9901610"/></c:set>
                <c:set var="title11"><axis:alt f="axisctr162export" c="TIT_BANNER" lit="9901613"/></c:set>
                <c:set var="title12"><axis:alt f="axisctr162export" c="CPOLCIA" lit="9902080"/></c:set>
                <c:set var="title13"><axis:alt f="axisctr162export" c="CRECCIA_ULTIMO" lit="9001763"/></c:set>
                <c:set var="title14"><axis:alt f="axisctr162export" c="CRECCIA_ANTERIOR" lit="9902090"/></c:set>    
                <c:set var="title15"><axis:alt f="axisctr162export" c="TSITUAC" lit="100874"/></c:set>    
                <c:set var="title16"><axis:alt f="axisctr162export" c="FCARPRO" lit="109716"/></c:set>    
                <c:set var="title17"><axis:alt f="axisctr162export" c="FCARANT" lit="9002144"/></c:set>   
                <c:set var="title18"><axis:alt f="axisctr162export" c="PCOMISI" lit="9902096"/></c:set>
                <c:set var="title19"><axis:alt f="axisctr162export" c="ICOMISI" lit="9001924"/></c:set>
                <c:set var="title20"><axis:alt f="axisctr162export" c="IPRIFORPAG" lit="9902086"/></c:set>
                <c:set var="title21"><axis:alt f="axisctr162export" c="ICOMISIFORPAG" lit="9902097"/></c:set>
                
                <c:set var="title22"><axis:alt f="axisctr162export" c="TITULOPRO" lit="100829"/></c:set>
                <c:set var="title23"><axis:alt f="axisctr162export" c="FEFECTOPOL" lit="9902081"/></c:set>
                <c:set var="title24"><axis:alt f="axisctr162export" c="TNOMBREASEG" lit="9902078"/></c:set>
                <c:set var="title25"><axis:alt f="axisctr162export" c="CAGENTE" lit="9902077"/></c:set>
                <c:set var="title26"><axis:alt f="axisctr162export" c="FEFECTOR_ULTIMO" lit="9902085"/></c:set>
                <c:set var="title27"><axis:alt f="axisctr162export" c="FEFECTOR_ANTERIOR" lit="9902091"/></c:set>
                <c:set var="title28"><axis:alt f="axisctr162export" c="FVENCIMR_ULTIMO" lit="9902088"/></c:set>
                <c:set var="title29"><axis:alt f="axisctr162export" c="FVENCIMR_ANTERIOR" lit="9902092"/></c:set>
                <c:set var="title30"><axis:alt f="axisctr162export" c="TACTIVI" lit="103481"/></c:set>
                <c:set var="title31"><axis:alt f="axisctr162export" c="NNUMIDE" lit="105330"/></c:set>
                <c:set var="title32"><axis:alt f="axisctr162export" c="TFORPAG" lit="9000719"/></c:set>
                <c:set var="title33"><axis:alt f="axisctr162export" c="FEMISIO" lit="9902084"/></c:set>
               
<display:table name="${REC_LSTCARTERA}" id="miLista" export="true" class="dsptgtable" pagesize="-1" style="visibility:hidden;display:none"  requestURI="modal_axisexporter.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
    <axis:visible c="TCOMPANI" f="axisctr162export">
    <display:column title="${title0}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.TCOMPANI}</display:column>        
    </axis:visible>  
    <axis:visible c="TITULOPRO" f="axisctr162export">
        <display:column title="${title22}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.TITULOPRO}</display:column>    
    </axis:visible>
    <axis:visible c="TACTIVI" f="axisctr162export">
        <display:column title="${title30}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.TACTIVI}</display:column>    
    </axis:visible>
    <axis:visible c="CAGENTE" f="axisctr162export">
        <display:column title="${title25}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.CAGENTE}</display:column>    
    </axis:visible>
    <axis:visible c="NNUMIDETOM" f="axisctr162export">
        <display:column title="${title31}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.NNUMIDETOM}</display:column>    
    </axis:visible>
    <axis:visible c="TNOMBREASEG" f="axisctr162export">
        <display:column title="${title24}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.TNOMBRETOM}</display:column>    
    </axis:visible>
    <axis:visible c="NPOLIZA" f="axisctr162export">
        <display:column title="${title1}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.NPOLIZA}</display:column>    
    </axis:visible>
    <axis:visible c="CPOLCIA" f="axisctr162export">
        <display:column title="${title12}"          media="csv excel xml pdf" decorator="axis.mvc.view.DisplaytagQuotedExportDecorator">  ${miLista.OB_IAX_COMPARACARTERAS.CPOLCIA}</display:column>    
    </axis:visible>
    <axis:visible c="FEFECTOPOL" f="axisctr162export">
        <display:column title="${title23}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FEFECTOPOL}"/></display:column>    
    </axis:visible>
    <axis:visible c="TFORPAG" f="axisctr162export">
        <display:column title="${title32}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.TFORPAG}</display:column>    
    </axis:visible>
    <c:if test="${__formdata.CLISTADO==2}" > 
        <axis:visible c="TSITUAC" f="axisctr162export">
        <display:column title="${title15}"          media="csv excel xml pdf">${miLista.OB_IAX_COMPARACARTERAS.TSITUAC}</display:column>    
        </axis:visible>
        <axis:visible c="FCARPRO" f="axisctr162export">
        <display:column title="${title16}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FCARPRO}"/></display:column>    
        </axis:visible>
        <axis:visible c="FCARANT" f="axisctr162export">
        <display:column title="${title17}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FCARANT}"/></display:column>    
        </axis:visible>
    </c:if>    
    <c:if test="${__formdata.CLISTADO==1}" >    
        <axis:visible c="NRECIBO_ULTIMO" f="axisctr162export">
        <display:column title="${title2}"          media="csv excel xml pdf" decorator="axis.mvc.view.DisplaytagQuotedExportDecorator">${miLista.OB_IAX_COMPARACARTERAS.NRECIBO_ULTIMO}</display:column>    
        </axis:visible>     
        <axis:visible c="CRECCIA_ULTIMO" f="axisctr162export">
        <display:column title="${title13}"          media="csv excel xml pdf" decorator="axis.mvc.view.DisplaytagQuotedExportDecorator">${miLista.OB_IAX_COMPARACARTERAS.CRECCIA_ULTIMO}</display:column>    
        </axis:visible>
        <axis:visible c="FEMISIOR_ULTIMO" f="axisctr162export">
        <display:column title="${title33}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FEMISIOR_ULTIMO}"/></display:column>    
        </axis:visible>
        <axis:visible c="FEFECTOR_ULTIMO" f="axisctr162export">
        <display:column title="${title26}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FEFECTOR_ULTIMO}"/></display:column>    
        </axis:visible>
        <axis:visible c="FVENCIMR_ULTIMO" f="axisctr162export">
        <display:column title="${title28}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FVENCIMR_ULTIMO}"/></display:column>    
        </axis:visible>
    </c:if>
    <axis:visible c="NRECIBO_ANTERIOR" f="axisctr162export">
    <display:column title="${title3}"          media="csv excel xml pdf" decorator="axis.mvc.view.DisplaytagQuotedExportDecorator">${miLista.OB_IAX_COMPARACARTERAS.NRECIBO_ANTERIOR}</display:column>    
    </axis:visible>
     <axis:visible c="CRECCIA_ANTERIOR" f="axisctr162export">
    <display:column title="${title14}"          media="csv excel xml pdf" decorator="axis.mvc.view.DisplaytagQuotedExportDecorator">${miLista.OB_IAX_COMPARACARTERAS.CRECCIA_ANTERIOR}</display:column>    
    </axis:visible>
    <axis:visible c="FEFECTOR_ANTERIOR" f="axisctr162export">
        <display:column title="${title27}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FEFECTOR_ANTERIOR}"/></display:column>    
    </axis:visible>
    <axis:visible c="FVENCIMR_ANTERIOR" f="axisctr162export">
        <display:column title="${title29}"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_COMPARACARTERAS.FVENCIMR_ANTERIOR}"/></display:column>    
    </axis:visible>
    <axis:visible c="IPRINET_ANTERIOR" f="axisctr162export">
    <display:column title="${title5}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.IPRINET_ANTERIOR}"/></display:column>
    </axis:visible>
    <c:if test="${__formdata.CLISTADO==1}" >    
        <axis:visible c="IPRINET_ULTIMO" f="axisctr162export">
        <display:column title="${title4}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.IPRINET_ULTIMO}"/></display:column>
        </axis:visible>
    </c:if>
    <axis:visible c="IPRIFORPAG" f="axisctr162export">
        <display:column title="${title20}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.IPRIFORPAG}"/></display:column>    
    </axis:visible>
    <c:if test="${__formdata.CLISTADO==1}" >            
        <axis:visible c="IPRINET_VARIACION" f="axisctr162export">
        <display:column title="${title6}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.IPRINET_VARIACION}"/></display:column>
        </axis:visible>
    </c:if>        
        <axis:visible c="ICOMBRU_ANTERIOR" f="axisctr162export">
        <display:column title="${title8}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.ICOMBRU_ANTERIOR}"/></display:column>
        </axis:visible>
    <c:if test="${__formdata.CLISTADO==1}" >            
        <axis:visible c="ICOMBRU_ULTIMO" f="axisctr162export">
        <display:column title="${title7}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.ICOMBRU_ULTIMO}"/></display:column>
        </axis:visible>
    </c:if>  
    <axis:visible c="ICOMISI" f="axisctr162export">
        <display:column title="${title19}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.ICOMISI}"/></display:column>    
    </axis:visible>
    <c:if test="${__formdata.CLISTADO==1}" >           
        <axis:visible c="ICOMBRU_VARIACION" f="axisctr162export">
        <display:column title="${title9}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.ICOMBRU_VARIACION}"/></display:column>
        </axis:visible>        
    </c:if>
    <axis:visible c="PCOMISI" f="axisctr162export">
        <display:column title="${title18}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.PCOMISI}"/></display:column>    
    </axis:visible> 
    <axis:visible c="ICOMISIFORPAG" f="axisctr162export">
        <display:column title="${title21}"          media="csv excel xml pdf"><fmt:formatNumber pattern="###,##0.00" value="${miLista.OB_IAX_COMPARACARTERAS.ICOMISIFORPAG}"/></display:column>    
    </axis:visible> 
    <display:setProperty name="export.pdf" value="true" />
    <display:setProperty name="export.pdf.class" value="org.displaytag.export.PdfView" />
    <display:setProperty name="export.pdf.filename" value="${title10}.pdf" /> 
    <display:setProperty name="export.excel.filename" value="${title10}.xls" />
    <display:setProperty name="export.csv.filename" value="${title10}.csv" />
    <display:setProperty name="export.xml.filename" value="${title10}.xml" /> 
    <display:setProperty name="export.banner" value="<div class='gridexportlinks'>${title11}: {0}</div>"/> 
</display:table>

                </td>
           </tr>   
         </table>
         </form>
         
         <c:import url="../include/mensajes.jsp"/>
         
         </body>
</html>