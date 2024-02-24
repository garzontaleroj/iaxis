<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="garantias_gestion"/>

<script type="text/javascript">

</script>


<form name="${nombrePantalla}" action="" method="POST">    
    <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
    <%-- <c:set target="${mntgaran.DATGESTION}" property="C2CABEZAS">1</c:set> --%>
        <tr>
            <th style="width:2%;height:0px"></th>
            <th style="width:15%;height:0px"></th>
            <th style="width:10%;height:0px"></th>
            <th style="width:15%;height:0px"></th>
            <th style="width:10%;height:0px"></th>
            <th style="width:15%;height:0px"></th>
            <th style="width:10%;height:0px"></th>
            <th style="width:15%;height:0px"></th>
            <th style="width:8%;height:0px"></th>
        </tr>
        <tr>
            <td></td>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000476" lit="1000476"/></b>
                <input type="checkbox" name="CIEDMIC" value="${mntgaran.DATGESTION.CIEDMIC}" 
                <c:if test="${mntgaran.DATGESTION.CIEDMIC == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEDMIC" a="modificable=false"/> disabled/>
         <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDAMIC" value="${mntgaran.DATGESTION.NEDAMIC}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDAMIC" a="modificable=false"/> />
            </td>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000475" lit="1000475"/></b>
                <input type="checkbox" name="CIEDMAC" value="${mntgaran.DATGESTION.CIEDMAC}" 
                <c:if test="${mntgaran.DATGESTION.CIEDMAC == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEDMAC" a="modificable=false"/> disabled/>
            <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDAMAC" value="${mntgaran.DATGESTION.NEDAMAC}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDAMAC" a="modificable=false"/> />
            </td>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id100719" lit="100719"/></b>
                <input type="checkbox" name="CIEDMAR" value="${mntgaran.DATGESTION.CIEDMAR}" 
                <c:if test="${mntgaran.DATGESTION.CIEDMAR == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEDMAR" a="modificable=false"/> disabled/>
            <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDAMAR" value="${mntgaran.DATGESTION.NEDAMAR}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDAMAR" a="modificable=false"/> />
            </td>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id9906428" lit="9906428"/></b>
                <input type="checkbox" name="CIEDMRV" value="${mntgaran.DATGESTION.CIEDMRV}" 
                <c:if test="${mntgaran.DATGESTION.CIEDMRV == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEDMRV" a="modificable=false"/> disabled/>
            <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDAMRV" value="${mntgaran.DATGESTION.NEDAMRV}" maxlength="3" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDAMRV" a="modificable=false"/> />
            </td>
        </tr>
        <c:if test="${mntgaran.DATGESTION.C2CABEZAS == 1}">
        <tr>
            <td class="titulocaja">
                    <b><axis:alt f="axispro001_garantias_gestion" c="id1000346" lit="1000346"/></b>
            </td>
        </tr>
        <tr>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id100717" lit="100717"/></b>
                <input type="checkbox" name="CIEMI2C" value="${mntgaran.DATGESTION.CIEMI2C}" 
                <c:if test="${mntgaran.DATGESTION.CIEMI2C == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEMI2C" a="modificable=false"/> disabled/>
            <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDMI2C" value="${mntgaran.DATGESTION.NEDMI2C}" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDMI2C" a="modificable=false"/> />
            </td>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id100718" lit="100718"/></b>                    
                <input type="checkbox" name="CIEMA2C" value="${mntgaran.DATGESTION.CIEMA2C}" 
                <c:if test="${mntgaran.DATGESTION.CIEMA2C == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEMA2C" a="modificable=false"/> disabled/>
            <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDMA2C" value="${mntgaran.DATGESTION.NEDMA2C}" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDMA2C" a="modificable=false"/> />
            </td>
            <td class="titulocaja" colspan="2">
                <b><axis:alt f="axispro001_garantias_gestion" c="id100719" lit="100719"/></b>                    
                <input type="checkbox" name="CIEMA2R" value="${mntgaran.DATGESTION.CIEMA2R}" 
                <c:if test="${mntgaran.DATGESTION.CIEMA2R == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CIEMA2R" a="modificable=false"/> disabled/>
            <%--   </td>
            <td class="titulocaja"> --%>
                <input type="text" name="NEDMA2R" value="${mntgaran.DATGESTION.NEDMA2R}" class="campowidthinput campo campotexto" style="width:10%"
                <axis:atr f="axispro001" c="NEDMA2R" a="modificable=false"/> />
            </td>                      
            
        </tr>
        </c:if>
    </table>
    <div class="separador">&nbsp;</div>
    <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001_garantias_gestion" c="id9901238" lit="9901238"/></b>                    
            </td>            
            <td class="titulocaja">
                <b><axis:alt f="axispro001_garantias_gestion" c="id100956" lit="100956"/></b>                    
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001_garantias_gestion" c="id103350" lit="103350"/></b>                    
            </td>
            
        </tr>
        <tr>
            <td align="left" >
                <input type="text" name="CTARMAN" value="${mntgaran.DATGESTION.TTARMAN}" class="campowidthinput campo campotexto" style="width:70%"
                <axis:atr f="axispro001" c="CTARMAN" a="modificable=false"/> />
            </td>
            <td align="left" >
                <input type="text" name="CREASEG" value="${mntgaran.DATGESTION.TREASEG}" class="campowidthinput campo campotexto" style="width:70%"
                <axis:atr f="axispro001" c="CREASEG" a="modificable=false"/> />
            </td>
            <td align="left" >
                <input type="text" name="CREVALI" value="${mntgaran.DATGESTION.TREVALI}" class="campowidthinput campo campotexto" style="width:70%"
                <axis:atr f="axispro001" c="CREVALI" a="modificable=false"/> />
            </td>
            
        </tr>
                        
        <tr>
           <%-- <td class="titulocaja">
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000241" lit="1000241"/></b>                    
                <input type="checkbox" name="CTIPTAR" value="${mntgaran.DATGESTION.CTIPTAR}" 
                <c:if test="${mntgaran.DATGESTION.CTIPTAR == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CTIPTAR" a="modificable=false"/> disabled/>
            </td> --%>
            <td class="campocaja">
                <input type="checkbox" name="CMODREV" value="${mntgaran.DATGESTION.CMODREV}" 
                <c:if test="${mntgaran.DATGESTION.CMODREV == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CMODREV" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000294" lit="1000294"/></b> 
            </td>
            <td class="titulocaja">
                <input type="checkbox" name="CRECARG" value="${mntgaran.DATGESTION.CRECARG}" 
                <c:if test="${mntgaran.DATGESTION.CRECARG == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CRECARG" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000077" lit="1000077"/></b> 
            </td>
            <td class="titulocaja">
                <input type="checkbox" name="CDTOCOM" value="${mntgaran.DATGESTION.CDTOCOM}" 
                <c:if test="${mntgaran.DATGESTION.CDTOCOM == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CDTOCOM" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000075" lit="1000075"/></b>
            </td>
            <td class="titulocaja">
                <input type="checkbox" name="CTECNIC" value="${mntgaran.DATGESTION.CTECNIC}" 
                <c:if test="${mntgaran.DATGESTION.CTECNIC == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CTECNIC" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000340" lit="1000340"/></b>
            </td>
              
        </tr>
        <tr>
            <td class="titulocaja">
                <input type="checkbox" name="COFERSN" value="${mntgaran.DATGESTION.COFERSN}" 
                <c:if test="${mntgaran.DATGESTION.COFERSN == 1}">checked</c:if>
                <axis:atr f="axispro001" c="COFERSN" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000309" lit="1000309"/></b>
            </td>    
            <td class="titulocaja">
                <input type="checkbox" name="CEXTRAP" value="${mntgaran.DATGESTION.CEXTRAP}" 
                <c:if test="${mntgaran.DATGESTION.CEXTRAP == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CEXTRAP" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000076" lit="1000076"/></b> 
            </td>  
            <td class="titulocaja">
                <input type="checkbox" name="CDERREG" value="${mntgaran.DATGESTION.CDERREG}" 
                <c:if test="${mntgaran.DATGESTION.CDERREG == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CDERREG" a="modificable=false"/> disabled/>
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000106" lit="1000106"/></b> 
            </td>
        </tr>
        <tr>
            <c:set var="PREVALI_visibility">
                ${mntgaran.DATGESTION.CREVALI >= 2 && mntgaran.DATGESTION.CREVALI <= 6 ? "visible" : "hidden"}
            </c:set>
            <td align="left">
                <input type="text" name="PREVALI" value="${mntgaran.DATGESTION.PREVALI}" class="campowidthinput campo campotexto" style="width:65%;visibility:${PREVALI_visibility}"
                <axis:atr f="axispro001" c="PREVALI" a="modificable=false"/> />
            </td>
            <c:set var="IREVALI_visibility">
                ${mntgaran.DATGESTION.CREVALI == 1 ? "visible" : "hidden"}
            </c:set>
            <td align="left" >
                <input type="text" name="IREVALI" value="${mntgaran.DATGESTION.IREVALI}" class="campowidthinput campo campotexto" style="width:70%;visibility:${IREVALI_visibility}"
                <axis:atr f="axispro001" c="IREVALI" a="modificable=false"/> />
            </td>            
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
        <tr>
            <th style="width:20%;height:0px"></th>
            <th style="width:3%;height:0px"></th>
            <th style="width:5%;height:0px"></th>
            <th style="width:50%;height:0px"></th>
            <th style="width:22%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001_garantias_gestion" c="id1000338" lit="1000338"/></b>            
            </td>            
            <td class="titulocampo" align="left">
                <input type="checkbox" name="CRECFRA" value="${mntgaran.DATGESTION.CRECFRA}" 
                <c:if test="${mntgaran.DATGESTION.CRECFRA == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CRECFRA" a="modificable=false"/> disabled/>
            </td>
            <td>
                &nbsp;
            </td>
            <td align="left">
                    <c:set var="title0"><axis:alt f="axispro001_garantias_gestion" c="id100712" lit="100712" /></c:set>
                    <c:set var="title1"><axis:alt f="axispro001_garantias_gestion" c="id9000716" lit="9000716" /></c:set>
                    <c:set var="title2"><axis:alt f="axispro001_garantias_gestion" c="id9000717" lit="9000717" /></c:set>
                    <c:set var="title3"><axis:alt f="axispro001_garantias_gestion" c="id9000720" lit="9000720" /></c:set>
                    <c:set var="title4"><axis:alt f="axispro001_garantias_gestion" c="id9000723" lit="9000723" /></c:set>
                    <div class="displayspace">
                        <display:table name="${__formdata.FORPAGRECGARAN}" id="FORPAGRECGARAN" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="6" sort="list" cellpadding="0" cellspacing="0" 
                        requestURI="modal_axispro016.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" headerClass="sortable" sortable="true" sortProperty="DESCFORPAG" style="width:20%"  media="html" autolink="false" >
                                <div class="dspText">${FORPAGRECGARAN.DESCFORPAG}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="FINIVIG" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${FORPAGRECGARAN.FINIVIG}"/></div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="FFINVIG" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${FORPAGRECGARAN.FFINVIG}"/></div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="DESCTIPCON" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText">${FORPAGRECGARAN.DESCTIPCON}</div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="NVALCON" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                <div class="dspText">${FORPAGRECGARAN.NVALCON}</div>
                            </display:column>
                        </display:table>
                    </div>
            </td>
        </tr>
    </table>
</form>