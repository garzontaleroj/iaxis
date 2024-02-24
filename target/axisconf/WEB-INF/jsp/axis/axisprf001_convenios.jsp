<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="sedes"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="SCONVEN" lit="9902590"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TDESCRI" lit="101761"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="STARIFA" lit="9904895"/></c:set>
      <c:set var="title3"><axis:alt f="axisprf001" c="SPERSED" lit="9902589"/></c:set>
      <c:set var="title4"><axis:alt f="axisprf001" c="CESTADO" lit="100587" /></c:set>
      <c:set var="title5"><axis:alt f="axisprf001" c="FESTADO" lit="9900983" /></c:set>
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].CONVENIOS}"
                     id="T_IAX_CONVENIOS" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
      <axis:visible f="axisprf001" c="SCONVEN">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_CONVE.SCONVEN"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.SCONVEN}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_CONVE.TDESCRI"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TDESCRI}</div>
      </display:column>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_CONVE.STARIFA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TTARIFA}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_CONVE.SPERSED"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TPERSED}</div>
      </display:column>
      <display:column title="${title4}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_CONVE.CESTADO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.TESTADO}</div>
      </display:column>
      <display:column title="${title5}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_CONVE.FESTADO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CONVENIOS.OB_IAX_PROF_CONVE.FESTADO}"/></div>
      </display:column>
      </display:table>                                  
      </div>
</form>