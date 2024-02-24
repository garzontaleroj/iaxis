<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="preguntas"/>
<c:set var="formulari" value="axissin006"/>
<c:if test="${!empty param.f}">
    <c:set var="formulari">${param.f}</c:set>
</c:if>
<script type="text/javascript">
   
   
</script>

<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 
<!--  PREGUNTAS -->
    <table class="seccion">
    <axis:visible f="axissin006" c="DSP_INF_REASEG">  
        <div ID="DSP_INF_REASEG">
            <c:set var="title0"><axis:alt f="axissin006" c="CCONCEP" lit="100896" /></c:set><!--Concepto -->
            <c:set var="title1"><axis:alt f="axissin006" c="CCOMPANI" lit="9000600" /></c:set><!--Compañía-->
            <c:set var="title2"><axis:alt f="axissin006" c="SCONTRA" lit="104813" /></c:set><!--Contrato-->
            <c:set var="title3"><axis:alt f="axissin006" c="NVERSIO" lit="9001146" /></c:set><!--Versión -->
            <c:set var="title4"><axis:alt f="axissin006" c="TDESCRI" lit="101761" /></c:set><!--Descripción -->
            <c:set var="title5"><axis:alt f="axissin006" c="CTRAMO" lit="9000609" /></c:set><!-- Tramo -->
            <c:set var="title6"><axis:alt f="axissin006" c="IIMPORT" lit="100563" /></c:set><!-- Importe -->
            <c:set var="title7"><axis:alt f="axissin006" c="FMOVIMI" lit="9000490" /></c:set><!-- Fecha cierre -->
            <c:set var="title8"><axis:alt f="axissin006" c="CDEBHAB" lit="9001948" /></c:set><!-- Debe / Haber -->
            <c:set var="title9"><axis:alt f="axissin006" c="CESTADO" lit="100587" /></c:set><!--Estado-->
            <c:set var="title10"><axis:alt f="axissin006" c="FLIQUID" lit="103217" /></c:set><!--  Fecha liquidación-->
            <div class="displayspace">
               <display:table name="${__formdata.DATOS_REASEGURO}" id="T_IAX_DATOS_REASEGURO" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
               requestURI="">
               <%@ include file="../include/displaytag.jsp"%>
               <display:column title="${title0}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber">${T_IAX_DATOS_REASEGURO.TCONCEP}</div>
                </display:column>
                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText">${T_IAX_DATOS_REASEGURO.CCOMPANI}</div>    
                </display:column>
                <display:column title="${title2}" sortable="false" sortProperty="SCONTRA" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText">${T_IAX_DATOS_REASEGURO.SCONTRA}</div>    
                </display:column>
                <display:column title="${title3}" sortable="false" sortProperty="NVERSIO" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText"> ${T_IAX_DATOS_REASEGURO.NVERSIO}</div>    
                </display:column>
                <display:column title="${title4}" sortable="false" sortProperty="TDESCRI" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText">${T_IAX_DATOS_REASEGURO.TDESCRI}</div>    
                </display:column>
                <display:column title="${title5}" sortable="false" sortProperty="CTRAMO" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText">${T_IAX_DATOS_REASEGURO.TTRAMO}</div>    
                </display:column>                            
                <display:column title="${title6}" sortable="false" sortProperty="IIMPORT" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_DATOS_REASEGURO.IIMPORT}"/></div>    
                </display:column>
                <display:column title="${title7}" sortable="false" sortProperty="FMOVIMI" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_DATOS_REASEGURO.FMOVIMI}"/></div>    
                </display:column>
                <display:column title="${title8}" sortable="false" sortProperty="CDEBHAB" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText">${T_IAX_DATOS_REASEGURO.TDEBHAB}</div>    
                </display:column>                            
                <display:column title="${title9}" sortable="false" sortProperty="CESTADO" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText">${T_IAX_DATOS_REASEGURO.TESTADO}</div>    
                </display:column>                             
                <display:column title="${title10}" sortable="false" sortProperty="FLIQUID" headerClass="sortable" media="html" autolink="false" >
                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_DATOS_REASEGURO.FLIQUID}"/></div>    
                </display:column>                          
                </display:table>
            </div>
        </div>
    </axis:visible>
</form>