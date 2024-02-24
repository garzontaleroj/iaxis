<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="pantalla" value="garantias_formulas"/>
<script type="text/javascript">
    function f_editar_clave(CLAVE) {
        parent.f_abrir_gfi(CLAVE, '${param.SPRODUC}', '${param.CGARANT}', '${param.CACTIVI}');
    }
    
</script>

<form name="${pantalla}" action=""  method="POST">
    <input type="hidden" name="operation" id="operation" value=""/>
    
    <table class="seccion" style="width:100%;" align="center"> 
    <tr>
        <th style="width:49%;height:0px"></th>
        <th style="width:1%;height:0px"></th>
        <th style="width:50%;height:0px"></th>
    </tr>
    <tr>
        <td>
            <div class="titulo"><div style="float:left;"><img src="images/flecha.gif"/><fmt:message key="108987" /></div>
            	<div style="float:right;">
            		<a href="javascript:f_abrir_axispro014(0)">
            		<axis:visible f="axispro001_garantias" c="EDIT_GARAN_PROVS">  
            			<img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/>
            		</axis:visible>			
            		</a>
            	</div>
            </div>
            <table class="area" align="center" style="width:100%">
                <tr>
                    <td>
                        <c:set var="title1"><fmt:message key="100559" /></c:set>
                        <c:set var="title0"><fmt:message key="100990" /></c:set>
                        <c:set var="title1"><fmt:message key="100991" /></c:set>
                        <c:set var="title2"><fmt:message key="1000087" /></c:set>
                        <c:set var="title3"><fmt:message key="1000107" /></c:set>
                        <div class="displayspace">
                            <display:table name="${__formdata.FORMULASTARIF}" id="TARIFICACION" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="3" sort="list" cellpadding="0" cellspacing="0" 
                             requestURI="modal_axispro001_garantias.do?paginar=true&subpantalla=garantias_formulas">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" headerClass="headwith5 sortable" sortable="true" sortProperty="CCAMPO"  media="html" autolink="false" >
                                   <div class="dspText">${TARIFICACION.CCAMPO}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="TCAMPO" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${TARIFICACION.TCAMPO}</div>
                                </display:column>
                                <display:column title="${title2}" headerClass="headwith5 sortable" sortable="true" sortProperty="CLAVE"  media="html" autolink="false" >
                                   <div class="dspText">${TARIFICACION.CLAVE}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="FORMULA" headerClass="sortable" media="html" autolink="false" >
                                   <div class="dspText">${TARIFICACION.FORMULA}</div>
                                </display:column>
                                <display:column title="" headerClass="sortable headwidth5" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_editar_clave('${TARIFICACION.CLAVE}')">
																	  <axis:visible f="axispro001_garantias" c="EDIT_GARAN_PROVS">
																		   	<img border="0" alt="<fmt:message key="100002" />" title="<fmt:message key="100002" />" src="images/mas.gif"/>
																		</axis:visible>  	
																	  </a></div>
                                </display:column>
                            </display:table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
        <td>
            <div class="titulo"><div style="float:left;"><img src="images/flecha.gif"/><fmt:message key="102656" /></div>
            	<div style="float:right;">
            		<a href="javascript:f_abrir_axispro014(8)">
	            	<axis:visible f="axispro001_garantias" c="EDIT_GARAN_PROVS">  
	            		<img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/>
	            	</axis:visible>			
	            	</a>
            	</div></div>
           
            <table class="area" align="center" style="width:100%;">
                <tr>
                    <td>
                        <div class="displayspace">                        
                            <display:table name="${__formdata.FORMULASPROV}" id="PROVISIONES" export="false" class="dsptgtable" defaultsort="1" defaultorder="ascending" pagesize="3" sort="list" cellpadding="0" cellspacing="0" 
                             requestURI="modal_axispro001_garantias.do?paginar=true&subpantalla=garantias_formulas">
                                <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" headerClass="headwith5 sortable" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.CCAMPO"  media="html" autolink="false" >
                                        <div class="dspText">${PROVISIONES.CCAMPO}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.TCAMPO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${PROVISIONES.TCAMPO}</div>
                                    </display:column>
                                    <display:column title="${title2}" headerClass="headwith5 sortable" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.CLAVE"  media="html" autolink="false" >
                                        <div class="dspText">${PROVISIONES.CLAVE}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODGARFORMULAS.FORMULA" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${PROVISIONES.FORMULA}</div>
                                    </display:column>
                                    <display:column title="" headerClass="sortable headwidth5" media="html" autolink="false" >
                                        <div class="dspIcons"><a href="javascript:f_editar_clave('${PROVISIONES.CLAVE}')">
																					<axis:visible f="axispro001_garantias" c="EDIT_GARAN_PROVS">  
																						<img border="0" alt="<fmt:message key="100002" />" title="<fmt:message key="100002" />" src="images/mas.gif"/>
																					</axis:visible>	
																				</a></div>
                                    </display:column>
                            </display:table>                                
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
</form>