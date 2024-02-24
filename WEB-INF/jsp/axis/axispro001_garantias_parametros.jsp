<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*"%>
<c:set var="nombrePantalla" value="garantias_parametros"/>
<c:set var="tabulador" value="     "/>
<form name="${nombrePantalla}" action="" method="POST">
    <table class="seccion" align="center" cellpadding="0" cellspacing="5" style="padding:1% 1% 1% 1%">
    <tr>
      <td>
        <c:set var="title9">
          <axis:alt f="axispro001" c="TPARAME" lit="104111"/>
        </c:set>
        <c:set var="title0">
          <axis:alt f="axispro001" c="DVALPAR" lit="101159"/>
        </c:set>
        <c:if test="${! empty mntgaran.PARAMETROS}">
        <div class="displayspace">
          <display:table name="${mntgaran.PARAMETROS}" id="miListaIdGP" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="modal_axispro001_garantias.do?paginar=true&subpantalla=garantias_parametros">
            <%@ include file="../include/displaytag.jsp"%>
            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPARAGARANPRO.TPARAME" headerClass="sortable" media="html" autolink="false">
              <div class="dspText">
                ${miListaIdGP.OB_IAX_PRODPARAGARANPRO.TPARAME }
              </div>
            </display:column>
            <display:column title="${title0}" sortable="true"  sortProperty="OB_IAX_PRODPARAGARANPRO.DVALPAR"  headerClass="sortable" media="html" autolink="false">
              <div class="dspText">
                ${miListaIdGP.OB_IAX_PRODPARAGARANPRO.VVALPAR}
              </div>
            </display:column>
          </display:table>
        </div>
         </c:if>
      </td>
    </tr>
  </table>
</form>