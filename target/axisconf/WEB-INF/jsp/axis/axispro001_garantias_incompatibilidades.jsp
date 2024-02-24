<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="garantias_incompatibilidades"/>

<script type="text/javascript">

</script>

            <!-- ${mntgaran.INCOMPGARAN} -->

<form name="${nombrePantalla}" action="" method="POST">    
    <table class="seccion" style="padding-left:1%;padding-right:1%">
        <tr>
            <th style="width:5%;height:0px"></th>
            <th style="width:60%;height:0px"></th>
            <th style="width:35%;height:0px"></th>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <c:set var="title0"><fmt:message key="100791"/></c:set>
                <div class="displayspace">
                    <display:table name="${mntgaran.INCOMPGARAN}" id="INCOMPGARAN" export="false" class="dsptgtable" defaultsort="1"  defaultorder="ascending" pagesize="6" sort="list" cellpadding="0" cellspacing="0" requestURI="modal_axispro001_garantias.do?paginar=true&subpantalla=garantias_incompatibilidades">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column title="${title0}" headerClass="sortable" sortable="true" sortProperty="OB_IAX_PRODINCOMPGARAN.TGARINC" style="width:90%" media="html" autolink="false" >
                            <div class="dspText">${INCOMPGARAN.OB_IAX_PRODINCOMPGARAN.TGARINC}</div>
                        </display:column>
                        
                    </display:table>
                </div>
            </td>
        </tr>
    </table>
</form>