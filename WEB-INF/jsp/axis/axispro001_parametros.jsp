<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*"%>
<c:set var="nombrePantalla" value="parametros"/>
<c:set var="tabulador" value="     "/>
<form name="${nombrePantalla}" action="" method="POST">

<table cellpadding="0" cellspacing="5" class="seccion" style="padding:1% 1% 1% 1%">                                            
    <tr>
      <td>
        <c:set var="title9">
          <axis:alt f="axispro001" c="TITULO9" lit="104111"/>
        </c:set>
        <c:set var="title0">
          <axis:alt f="axispro001" c="TITULO0" lit="101159"/>          
        </c:set>
        <div class="displayspace">

          <display:table name="${mntproducto.PARAMETROS}" id="miListaIdP" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axispro001.do?paginar=true&operation=parametros">
            <%@ include file="../include/displaytag.jsp"%>
            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPARAMETROS.TPARAME" headerClass="sortable" media="html" autolink="false">
              <div class="dspText">
                ${miListaIdP.OB_IAX_PRODPARAMETROS.TPARAME }
              </div>
            </display:column>
            <display:column title="${title0}" sortable="true"  sortProperty="OB_IAX_PRODPARAMETROS.DVALPAR"  headerClass="sortable" media="html" autolink="false">
              <div class="dspText">
                ${miListaIdP.OB_IAX_PRODPARAMETROS.DVALPAR}
              </div>
            </display:column>
          </display:table>
        </div>
      </td>
    </tr>
  </table>
</form>