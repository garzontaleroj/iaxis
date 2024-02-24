<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="seguimiento"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="TVALORA" lit="9904778"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TOBSERV" lit="101162"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="CUSUARI" lit="9902948"/></c:set>
      <c:set var="title3"><axis:alt f="axisprf001" c="FALTA" lit="100562"/></c:set>
               
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].SEGUIMIENTO}"
                     id="T_IAX_SEGUIMIENTO" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
      <axis:visible f="axisprf001" c="TVALORA">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEGUIMIENTO.TVALORA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEGUIMIENTO.OB_IAX_PROF_SEGUIMIENTO.TVALORA}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEGUIMIENTO.TOBSERV"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEGUIMIENTO.OB_IAX_PROF_SEGUIMIENTO.TOBSERV}</div>
      </display:column>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEGUIMIENTO.CUSUARI"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEGUIMIENTO.OB_IAX_PROF_SEGUIMIENTO.CUSUARI}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEGUIMIENTO.FALTA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">
      <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_SEGUIMIENTO.OB_IAX_PROF_SEGUIMIENTO.FALTA}"/>   
      </div>
      </display:column>
      </display:table>                                  
      </div>
</form>