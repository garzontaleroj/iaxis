<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="contacto"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
    <!-- Tipo contacto -->
    <c:set var="title0"><axis:alt f="axisprf001" c="LIT_TTIPO_CONTACTO" lit="1000616"/></c:set>
    <!-- Valor contacto -->
    <c:set var="title1"><axis:alt f="axisprf001" c="LIT_TVALOR_CONTACTO" lit="1000617"/></c:set>
    <div class="displayspace">
    <display:table name="${__formdata['OBPROFESIONAL'].CONTACTOS}"
                   id="T_IAX_CONTACTO" export="false"
                   class="dsptgtable" pagesize="-1"
                   defaultsort="1"
                   defaultorder="ascending"
                   sort="list" cellpadding="0"
                   cellspacing="0"
                   requestURI="">
    <%@ include file="../include/displaytag.jsp"%>
        <display:column sortable="true"
                        sortProperty=""
                        headerClass="sortable fixed"
                        media="html" autolink="false" style="width:4%">
        <div class="dspText">
                <input type="radio" value="${T_IAX_CONTACTO.OB_IAX_PROF_CONTACTOS.CMODCON}" 
                                    onclick="set_contacto_pref('${T_IAX_CONTACTO.OB_IAX_PROF_CONTACTOS.CMODCON}')"
                                    name="CMODCON" <axis:atr f="axisprf001" c="CMODCON" a="modificable=true&isInputText=false"/>/></div>
        </display:column>
        <display:column title="${title0}"
                        sortable="true"
                        sortProperty="OB_IAX_PROF_CONTACTOS.TTIPO"
                        headerClass="sortable fixed"
                        media="html" autolink="false">
        <div class="dspText">${T_IAX_CONTACTO.OB_IAX_PROF_CONTACTOS.TTIPCON}</div>
        </display:column>
        <display:column title="${title1}"
                        sortable="true"
                        sortProperty="OB_IAX_PROF_CONTACTOS.TVALCON"
                        headerClass="sortable fixed"
                        media="html" autolink="false">
        <div class="dspText">${T_IAX_CONTACTO.OB_IAX_PROF_CONTACTOS.TVALCON}</div>
        </display:column>
     </display:table>
    </div>
</form>