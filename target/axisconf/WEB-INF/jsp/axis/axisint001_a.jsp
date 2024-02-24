<%/* Revision:# E6Vlg75iu6lFVCfmKgDuvw== # */%>
<%@ page contentType="text/html;charset=windows-1252"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<script language="Javascript" type="text/javascript">
        
    $(document).ready(function(){ 
        
        $("a").click(function(event){
        
            var url =$(this).attr("href");                
            var params = url.substr(url.indexOf('?')+1,url.length); 
            if (params.indexOf('busqueda_lineas')>0){
                event.preventDefault();                    
                $.get(url, showListaCarga2, "text");
            }
        });
    });
    
    function showListaCarga2(res){
        
        $("#divCargas").html(res);          
    }
        
</script> 

<c:set var="title1"><axis:alt c="LIT_DSP_TIT08" f="axisint001" lit="1000576"/></c:set>
<c:set var="title2"><axis:alt c="LIT_DSP_TIT09" f="axisint001" lit="100565"/></c:set>
<c:set var="title3"><axis:alt c="LIT_DSP_TIT010" f="axisint001" lit="9901203"/></c:set>
<c:set var="title4"><axis:alt c="LIT_DSP_TIT011" f="axisint001" lit="9901202"/></c:set>
<c:set var="title5"><axis:alt c="LIT_DSP_TIT012" f="axisint001" lit="101510"/></c:set>
<c:set var="title6"><axis:alt c="LIT_DSP_TIT013" f="axisint001" lit="105400"/></c:set>
<c:set var="title7"><axis:alt c="LIT_DSP_TIT013" f="axisint001" lit="1000277"/></c:set>
<c:set var="title8"><axis:alt c="LIT_DSP_TIT014" f="axisint001" lit="9901265"/></c:set>

<div class="seccion displayspaceGrande" id="CTRLLIN">
<display:table name="${__formdata.ctrlLinea}" id="ctrlLinea" export="false" class="dsptgtable"  pagesize="${__formdata.MAXREGPAG}" cellpadding="0" cellspacing="0"
    requestURI="axis_axisint001.do?paginar=true">

    <%@ include file="../include/displaytag.jsp"%>
    
    <display:column headerClass="sortable fixed" style="width:5%"  title="" media="html" autolink="false">
        <div class="dspIcons">
        <input <c:if test="${__formdata.SPROCES == ctrlLinea.SPROCES && __formdata.NLINEAINDX == ctrlLinea.NLINEA }" >checked</c:if>
        onclick="f_selecciona_carga_linea_errores('${ctrlLinea.SPROCES}', '${ctrlLinea.NLINEA}');"
        value="${ctrlLinea.SPROCES}"
        type="radio" id="radioctrlLinea"
        name="radioctrlLinea"/>
        </div>
    </display:column>
    
    <display:column title="${title2}" sortable="false" style="width:15%" sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspText">${ctrlLinea['TTIPO']}</div>
    </display:column>
    
    <display:column title="${title3}" sortable="false" style="width:15%"  sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspText">${ctrlLinea['IDINT']}</div>
    </display:column>
    
    <display:column title="${title4}" sortable="false" style="width:15%"  sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspText">${ctrlLinea['IDEXT']}</div>
    </display:column>
    
    <display:column title="${title5}" sortable="false" style="width:15%"  sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspText" id="DIV_TESTADO_${ctrlLinea['NLINEA']}" ><c:if test="${ctrlLinea['CESTADO'] == 1}"><font color="red">${ctrlLinea['TESTADO']} </font> </c:if> 
        <c:if test="${ctrlLinea['CESTADO'] != 1}">${ctrlLinea['TESTADO']}</c:if>
        </div>
    </display:column>
    
    <display:column title="${title6}" sortable="false" style="width:5%"  sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspIcons">
        <input type="hidden" id="CVALIDADO_${ctrlLinea['SPROCES']}" name="CVALIDADO_${ctrlLinea['SPROCES']}"
        value="${ctrlLinea['CVALIDADO']}">
        
        <c:if test="${ctrlLinea['CVALIDADO'] == 1}">
        <img border="0" src="images/formulap.gif"/>
        </c:if>
        </div>
    </display:column>
    
    <axis:visible f="axisint001" c="CEDITAR">
    <display:column title="" sortable="false" style="width:5%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspIcons">
        
        <c:choose>
            <c:when test="${ctrlLinea['CESTADO'] == 1}">
                <c:if test="${ctrlLinea['IDINT'] != '-'}">
                    <img border="0" alt="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" /><axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="9903644" />" title1="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" />" src="images/informacion.gif" width="11px" height="11px"
                        style="cursor:pointer;"  onclick="javascript:f_actualizatablaerr('LINEA_A${ctrlLinea['NLINEA']}','CTRLLIN','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}')" />
                      <!-- IAXIS-14440 - JLTS - 13/10/2020. Se comenta para que no se pueda editar
                      <img id="find" border="0" src="images/lapiz.gif" onclick="f_open_axisint003('${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>
                       -->
                     
                </c:if>
            </c:when> 
            <c:when test="${ctrlLinea['CESTADO'] == 3}">
                <c:if test="${ctrlLinea['IDINT'] != '-'}">
                    <img border="0" alt="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" /><axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="9903644" />" title1="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" />" src="images/informacion.gif" width="11px" height="11px"
                        style="cursor:pointer;"  onclick="javascript:f_actualizatablaerr('LINEA_A${ctrlLinea['NLINEA']}','CTRLLIN','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}')" />
                      
                      <!-- IAXIS-14440 - JLTS - 13/10/2020. Se comenta para que no se pueda editar
                      <c:if test="${ __configform.axisint001__CEDITPEND__visible == 'true'}">  
                      <img id="find" border="0" src="images/lapiz.gif" onclick="f_open_axisint003('${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>
                     </c:if>    
                       -->
                     
                </c:if>
            </c:when>  
            <c:otherwise>
                <c:if test="${ctrlLinea['IDINT'] != '-'}">
                    <img border="0" alt="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" /><axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="9903644" />" title1="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" />" src="images/informacion.gif" width="11px" height="11px"
                        style="cursor:pointer;"  onclick="javascript:f_actualizatablaerr('LINEA_A${ctrlLinea['NLINEA']}','CTRLLIN','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}')" />
                </c:if>
            </c:otherwise>
        </c:choose>
        
        </div>
    </display:column>
    </axis:visible>
    
    <display:column title="" sortable="false" style="width:5%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
        <div class="dspIcons">
        <c:choose>
        <c:when test="${!empty ctrlLinea['NSINIES'] && ctrlLinea['CVALIDADO'] == 1}">
        <img id="find" border="0" src="images/find.gif" 
        alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_siniestro('${ ctrlLinea['NSINIES']}','${ ctrlLinea['NTRAMIT']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
        </c:when>
        <c:when test="${!empty ctrlLinea['NRECIBO'] && ctrlLinea['CVALIDADO'] == 1}">
        <img id="find" border="0" src="images/find.gif" 
        alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_recibo('${ ctrlLinea['NRECIBO']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
        </c:when>
        <c:when test="${!empty ctrlLinea['SPERSON'] && ctrlLinea['CVALIDADO'] == 1}">
        <img id="find" border="0" src="images/find.gif" 
        alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_persona('${ ctrlLinea['SPERSON']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
        </c:when>
        <c:otherwise>
        <c:if test="${!empty ctrlLinea['SSEGURO'] && ctrlLinea['CVALIDADO'] == 1}">
        <img id="find" border="0" src="images/find.gif" 
        alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_poliza('${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
        </c:if>
        </c:otherwise>
        </c:choose>
        </div>
    </display:column>

</display:table>
</div>