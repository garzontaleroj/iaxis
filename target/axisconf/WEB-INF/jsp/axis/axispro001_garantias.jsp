<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="pantalla" value="axispro001_garantias"/>

<script type="text/javascript">      
    function recargar_garantias_lista() {
        var strurl="axis_axispro001.do" //  "axispro001_garantias_lista.jsp"
        var SPRODUC="${mntproducto.SPRODUC}"
        objUtiles.ejecutarFormulario("axis_axispro001.do?SPRODUC="+SPRODUC, "garantias_lista", document.${pantalla}, "_self");        
    }
    function abrirModalGarantias(CGARANT) {
        var SPRODUC="${mntproducto.SPRODUC}"
        var CACTIVI=document.${pantalla}.CACTIVI.value
        var strurl="modal_axispro001_garantias.do?operation=form&SPRODUC="+SPRODUC+"&CACTIVI="+CACTIVI+"&CGARANT="+CGARANT+"&dt="+(new Date().getTime())
        objUtiles.abrirModal("axispro001garantias", "src", strurl);        
    }
    
    /** FUNCIONES DE AXPRO01_GARANTIAS_FORMULAS Y AXPRO014 **/
    function f_abrir_gfi(CLAVE, SPRODUC, CGARANT, CACTIVI){
        objDom.setValorPorId("PCLAVE", CLAVE);
        objDom.setValorPorId("SPRODUC_FORMULA", SPRODUC);
        objDom.setValorPorId("CACTIVI_FORMULA", CACTIVI);
        objDom.setValorPorId("CGARAN_FORMULA", CGARANT);
        objUtiles.ejecutarFormulario("axis_axispro001.do", "buscar_formula", document.${pantalla}, "_self");
    }
    
    function reabrir_modal_garantias(strURL) {
       f_cerrar_modal("axispro001garantias");
       objUtiles.abrirModal("axispro001garantias", "src", strURL);        
    
    }
    
    function f_delete_gar(cgarantia){
        document.${pantalla}.GARANTIA.value = cgarantia;
        objUtiles.ejecutarFormulario("axis_axispro001.do", "delete_garantia", document.${pantalla},"_self", objJsMessages.jslit_cargando);
    }
    
</script>
        

<form name="${pantalla}">
    <input type="hidden" name="operation" id="operation" value=""/>
    <input type="hidden" name="subpantalla" value="garantias"/>
    <%-- Parámetros de axispro001_garantias_formulas --%>        
    <input type="hidden" name="SPRODUC_FORMULA" id="SPRODUC_FORMULA" value=""/>
    <input type="hidden" name="CACTIVI_FORMULA" id="CACTIVI_FORMULA" value=""/>
    <input type="hidden" name="CGARAN_FORMULA" id="CGARANT_FORMULA" value=""/>
    <input type="hidden" name="GARANTIA" id="GARANTIA" value="${__formdata.GARANTIA}"/>
    <input type="hidden" name="SPRODUC" id="SPRODUC" value="${mntproducto.SPRODUC}"/>
    <input type="hidden" name="PCLAVE" id="PCLAVE" value=""/>
<table class="seccion" cellpadding="0" cellspacing="5" style="padding:1% 1% 1% 1%">
    <tr><td>
        
    <table class="area" align="center" cellpadding="0" cellspacing="0">                     
        <tr>
            <th style="width:100%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="ACTIVID" lit="103477"/></b>
            </td>
        </tr> 
        <tr>
            <td align="left">
                <select name="CACTIVI" class="campo" style="width:300px" size="1" onchange="recargar_garantias_lista()">
                    <c:forEach items="${mntproducto.ACTIVID}" var="item">
                    <option value="${item.OB_IAX_PRODACTIVIDADES.CACTIVI}" <c:if test="${__formdata.CACTIVI == item.OB_IAX_PRODACTIVIDADES.CACTIVI}"> selected </c:if>>${item.OB_IAX_PRODACTIVIDADES.TACTIVI}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td >
                <br />
                <%--iframe id="axispro001_garantias_lista" name="axispro001_garantias_lista" src="blanco.html" style="height:170px;width:99%" scrolling="auto" frameborder="0"></iframe--%>
                <c:set var="title1"><axis:alt f="axispro001" c="CGARANT" lit="1000109" /></c:set>
            <c:set var="title2"><axis:alt f="axispro001" c="TGARANT" lit="100561" /></c:set>
            <c:set var="title3"><axis:alt f="axispro001" c="TTIPGAR" lit="102517" /></c:set>
            <c:set var="title4"><axis:alt f="axispro001" c="TTIPCAP" lit="1000488" /></c:set>
            <c:set var="title5"><axis:alt f="axispro001" c="CGARDEP" lit="102511" /></c:set>
  
            <display:table name="${mntproducto_garantias}" requestURI="axis_axispro001.do?paginar=true&operation=garantias" id="miListaIdG" export="false" class="dsptgtable" pagesize="22" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                <%@ include file="../include/displaytag.jsp"%>
            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.CGARANT" headerClass="sortable" media="html" autolink="false" >
                <div class="dspNumber">${miListaIdG.OB_IAX_PRODGARANTIAS.CGARANT}</div>
            </display:column>
            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.TGARANT" headerClass="sortable" media="html" autolink="false" >
                <div class="dspText">${miListaIdG.OB_IAX_PRODGARANTIAS.TGARANT}</div>
            </display:column>
            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.TTIPGAR" headerClass="sortable" media="html" autolink="false" >
                <div class="dspText">${miListaIdG.OB_IAX_PRODGARANTIAS.TTIPGAR}</div>
            </display:column>
            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.TTIPCAP" headerClass="sortable" media="html" autolink="false" >
                <div class="dspText">${miListaIdG.OB_IAX_PRODGARANTIAS.TTIPCAP}</div>
            </display:column>
            <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.CGARDEP" headerClass="sortable" media="html" autolink="false" >
                <div class="dspNumber">${miListaIdG.OB_IAX_PRODGARANTIAS.CGARDEP}</div>
            </display:column>
            <axis:visible f="axispro001" c="EDIT_GARANTIA">
                <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspIcono"><img src="images/lapiz.gif" style="cursor:pointer" 
                         alt="<axis:alt f='axispro001' c='EDIT_GARANTIA' lit='9000552'/>" title="<axis:alt f='axispro001' c='EDIT_GARANTIA' lit='9000552'/>"
                         onclick="abrirModalGarantias('${miListaIdG.OB_IAX_PRODGARANTIAS.CGARANT}')"/></div>
                </display:column>
            </axis:visible>
            <axis:visible f="axispro001" c="EDIT_GARANTIA_DEL">
                <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspIcono"><img src="images/delete.gif" style="cursor:pointer" 
                         alt="<axis:alt f='axispro001' c='EDIT_GARANTIA_DEL' lit='9001333'/>" title="<axis:alt f='axispro001' c='EDIT_GARANTIA_DEL' lit='9001333'/>"
                         onclick="f_delete_gar(${miListaIdG.OB_IAX_PRODGARANTIAS.CGARANT})"/></div>
                </display:column>
            </axis:visible>
            </display:table>
            </td>
        </tr>
    </table>

    </td></tr>
</table>
</form>
<%--script type="text/javascript">      
recargar_garantias_lista();
</script%--%>