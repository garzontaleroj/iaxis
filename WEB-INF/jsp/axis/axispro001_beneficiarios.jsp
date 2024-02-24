<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<c:set var="nombrePantalla" value="beneficiarios"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>


<form name="${nombrePantalla}" action="" method="POST">

                        <c:set var="title0"><axis:alt f="axispro001" c="CDEFECTO" lit="100713"/></c:set>
                        <c:set var="title1"><axis:alt f="axispro001" c="TCLABEN" lit="101791"/></c:set>
                        <c:set var="title2"><axis:alt f="axispro001" c="TCLABEN" lit="101697"/></c:set>
<table cellpadding="0" cellspacing="5" class="seccion" style="padding:1% 1% 1% 1%">                                            
   <tr>
   <td>
 <div class="displayspace">

<display:table name="${mntproducto.BENEFICIARIOS}" id="miListaIdBS" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
requestURI="axis_axispro001.do?paginar=true&operation=beneficiarios">
<%@ include file="../include/displaytag.jsp"%>
<display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODBENEFICIARIOS.TCLABEN" headerClass="sortable" media="html" autolink="false" >
<div class="dspText">${miListaIdBS.OB_IAX_PRODBENEFICIARIOS.TCLABEN }</div>
</display:column>
<display:column title="${title0}" headerClass="sortable headwidth10"  sortable="true" sortProperty="OB_IAX_PRODBENEFICIARIOS.CDEFECTO" media="html" autolink="false">
    <div class="dspIcons">
                 <c:choose>
          <c:when test="${miListaIdBS.OB_IAX_PRODBENEFICIARIOS.CDEFECTO == 1}"> 
       <input type="radio" name="CDEFECTO" checked disabled>              
       </c:when>
       <c:otherwise>
       <input type="radio" name="CDEFECTO" disabled>              
       </c:otherwise>
        </c:choose>  
    </div>
     </display:column>
   </display:table>  
     </div>

</td>
</tr>
</table>

   
</form>