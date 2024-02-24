<%-- 
  Fichero: axisper009_a2.jsp
  Fecha: 21/01/2013
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%> 
 <!-- tabla seccion ANTIGUEDAD -->                                           
<c:if test="${!empty dades_persona.ANTIGUEDAD}"> 
<axis:visible c="DSP_ANTIGUEDAD_PERS" f="axisper009">
<div class="titulo"><a name="posicionPorColorcar__T_IAX_ANTIGUEDAD" id="posicionPorColorcar__T_IAX_ANTIGUEDAD"></a>
<b><axis:alt f="axisper009" c="ANTIGUEDAD" lit="140423" /></b>
</div>                                                
<table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_ANTIGUEDAD');return true;">
    <tr>
        <td>
            <!-- DisplayTag  -->
            <c:set var="title1"><axis:alt f="axisper009" c="TAGRUPACION" lit="111471"/></c:set>
            <c:set var="title2"><axis:alt f="axisper009" c="FANTIGUEDAD" lit="9906411"/></c:set>           
            <c:set var="title3"><axis:alt f="axisper009" c="TESTADO" lit="100587"/></c:set>
            <c:set var="title4"><axis:alt f="axisper009" c="F_FIN_ANTIGUEDAD" lit="9906412"/></c:set>
            <div class="displayspace">
              <display:table name="${dades_persona.ANTIGUEDAD}" id="T_IAX_ANTIGUEDAD" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
               requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                <%@ include file="../include/displaytag.jsp"%>
                <display:column title="${title1}" sortable="true" sortProperty="TAGRUPA" headerClass="sortable" media="html" style="width:6%" autolink="false" >
                    <div class="dspText">${T_IAX_ANTIGUEDAD.TAGRUPA}</div>
                </display:column>  
                <display:column title="${title2}" sortable="true" sortProperty="FANTIGUEDAD" headerClass="sortable" media="html" style="width:6%" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_ANTIGUEDAD.FANTIGUEDAD}"/></div>
                </display:column>                
                <display:column title="${title3}" sortable="true" sortProperty="TESTADO" headerClass="sortable" media="html" style="width:15%" autolink="false" >
                    <div class="dspText">${T_IAX_ANTIGUEDAD.TESTADO}</div>
                </display:column>
                <display:column title="${title4}" sortable="true" sortProperty="F_FIN_ANTIGUEDAD" headerClass="sortable" media="html" style="width:6%" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_ANTIGUEDAD.F_FIN_ANTIGUEDAD}"/></div>
                </display:column>  
             </display:table>
            </div>
        </td>
    <tr>
</table> 
</axis:visible>
</c:if>
 <!-- tabla seccion CONDUCTORES -->                                           
<c:if test="${!empty dades_persona.CONDUCTORES}"> 
<!--<axis:visible c="DSP_ANTIGUEDAD_PERS" f="axisper009">-->
<div class="titulo"><a name="posicionPorColorcar__T_IAX_CONDUCTORES" id="posicionPorColorcar__T_IAX_CONDUCTORES"></a>
<b><axis:alt f="axisper009" c="CONDUCTORES" lit="9001027" /></b>
</div>                                                
<table class="seccion" onClick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','T_IAX_CONDUCTORES');return true;">
    <tr>
        <td>
            <!-- DisplayTag -->            
            <c:set var="title1"><axis:alt f="axisper009" c="POLIZA" lit="9903659"/></c:set>           
            <c:set var="title2"><axis:alt f="axisper009" c="TPRODUCTO" lit="9902909"/></c:set>
            <c:set var="title3"><axis:alt f="axisper009" c="FANULAC" lit="140214"/></c:set>           
            <c:set var="title4"><axis:alt f="axisper009" c="TAGENTE" lit="100584"/></c:set>
            <c:set var="title5"><axis:alt f="axisper009" c="NPUNTOS" lit="9001173"/></c:set>           
            <c:set var="title6"><axis:alt f="axisper009" c="FCARNET" lit="9001171"/></c:set>
            <div class="displayspace">
              <display:table name="${dades_persona.CONDUCTORES}" id="T_IAX_CONDUCTORES" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" 
               requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=datospoltom">
                <%@ include file="../include/displaytag.jsp"%>                
                <display:column title="${title1}" sortable="true" sortProperty="POLIZA" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_CONDUCTORES.POLIZA}</div>
                </display:column>                
                <display:column title="${title2}" sortable="true" sortProperty="TPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_CONDUCTORES.TPRODUCTO}</div>
                </display:column>
                <display:column title="${title3}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CONDUCTORES.FANULAC}"/></div>
                </display:column>                 
                <display:column title="${title4}" sortable="true" sortProperty="TAGENTE" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_CONDUCTORES.TAGENTE}</div>
                </display:column>
                <display:column title="${title5}" sortable="true" sortProperty="NPUNTOS" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_IAX_CONDUCTORES.NPUNTOS}</div>
                </display:column>                          
                <display:column title="${title6}" sortable="true" sortProperty="FCARNET" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CONDUCTORES.FCARNET}"/></div>
                </display:column>
                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" style="width:5%" autolink="false" >
                     <div class="dspIcons"><a href="javascript:f_but_polissa('${T_IAX_CONDUCTORES.SSEGURO}')"><img border="0" alt="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" title="<axis:alt f="axisper009" c="LIT_CONS_POL" lit="151477"/>" src="images/find.gif"/></a></div>
                </display:column>   
             </display:table>
            </div>
        </td>
    <tr>
</table> 
<!--</axis:visible>-->
</c:if>