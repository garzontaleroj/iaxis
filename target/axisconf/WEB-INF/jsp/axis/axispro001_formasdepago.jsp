<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<c:set var="nombrePantalla" value="formasdepago"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>

<script type="text/javascript">
    function f_aceptar_axispro006() {
        f_cerrar_modal("axispro006");
        document.miForm.subpantalla.value="formasdepago";
        objUtiles.ejecutarFormulario("axis_axispro001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
</script>

<form name="${nombrePantalla}" action="" method="POST">
    <c:set var="title0"><axis:alt f="axispro001" c="CPAGDEF" lit="100713"/></c:set>
    <c:set var="title1"><axis:alt f="axispro001" c="CREVFPG" lit="105677"/></c:set>
    <c:set var="title2"><axis:alt f="axispro001" c="PRECARG" lit="1000485"/></c:set>
    <c:set var="title3"><axis:alt f="axispro001" c="TFORPAG" lit="100712"/></c:set>
    <c:set var="title4"><axis:alt f="axispro001" c="COBLIGA" lit="103496"/></c:set>
    <table class="seccion" cellpadding="0" cellspacing="5" style="padding:1% 1% 1% 1%">
   <tr>
   <td>

<display:table name="${mntproducto.FORPAGO}" id="miListaIdFP" export="false" class="dsptgtable" pagesize="7"  defaultsort="3"  defaultorder="ascending" sort="list"  cellpadding="0" cellspacing="0" 
requestURI="axis_axispro001.do?paginar=true&operation=formasdepago">
<%@ include file="../include/displaytag.jsp"%>
    <display:column title="${title3}"  headerClass="headwidth20 sortable" sortProperty="OB_IAX_PRODFORMAPAGO.TFORPAG" sortable="true" media="html" autolink="false" style="text-align:center; width:20%">
    <div class="dspText" > ${miListaIdFP.OB_IAX_PRODFORMAPAGO.TFORPAG}</div>
    </display:column>
        <display:column title="${title4}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODFORMAPAGO.COBLIGA" media="html" autolink="false" style="text-align:center" sortable="true">
        <div class="dspIcons"><input type="checkbox"  name="COBLIGA" <c:if test="${miListaIdFP.OB_IAX_PRODFORMAPAGO.COBLIGA == 1}">checked</c:if> disabled/></div>                              
     </display:column>
       <display:column title="${title0}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODFORMAPAGO.CPAGDEF" media="html" autolink="false" style="width:5%" sortable="true"> 
            <div class="dspIcons"><input type="radio" name="CPAGDEF" <c:if test="${miListaIdFP.OB_IAX_PRODFORMAPAGO.CPAGDEF == 1}">checked</c:if> disabled/></div>                
    </display:column>
       <display:column title="${title1}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODFORMAPAGO.CREVFPG" media="html" autolink="false" style="width:5%" sortable="true">
            <div class="dspIcons">
                <c:if test="${miListaIdFP.OB_IAX_PRODFORMAPAGO.CFORPAG  == 0}">
                    <input type="checkbox" name="CREVFPG" <c:if test="${miListaIdFP.OB_IAX_PRODFORMAPAGO.CREVFPG == 1}">checked</c:if> disabled/>
                </c:if>
            </div>              
    </display:column>
</display:table>
</td>
</tr>
</table>

   
</form>