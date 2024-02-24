<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

    <script language="Javascript" type="text/javascript">
        
        $(document).ready(function(){ 
            
            $("a").click(function(event){
            
                var url =$(this).attr("href");                
                var params = url.substr(url.indexOf('?')+1,url.length); 
                if (params.indexOf('busqueda_siniestro')>0){
                    event.preventDefault();                    
                    $.get(url, showListaSiniestros2, "text");
                }
            });
        });
        function showListaSiniestros2(res){
            
            $("#divSiniestros").html(res);          
        }
        
    </script>
    
    <c:set var="title0">&nbsp;</c:set>
    <c:set var="title1">
        <axis:alt f="axissin019" c="NPOLIZA" lit="9001514"/>
    </c:set>
    <c:set var="title2">
        <axis:alt f="axissin019" c="NSINIES" lit="101298"/>
    </c:set>
    <c:set var="title3">
        <axis:alt f="axissin019" c="DESC_RIESGO" lit="102524"/>
    </c:set>
    <c:set var="title4">
        <axis:alt f="axissin019" c="ESTAT_SINISTRE" lit="112259"/>
    </c:set>
    <c:set var="title5">
        <axis:alt f="axissin019" c="DESC_PRODUCTO" lit="1000111"/>
    </c:set>
    <c:set var="title6">
        <axis:alt f="axissin019" c="MOD" lit="9000724"/>
    </c:set>
    <c:set var="title7">
        <axis:alt f="axissin019" c="CONS" lit="103101"/>
    </c:set>
     <c:set var="title8">
        <!-- AABC IAXIS-2067 TIPO DE SINIESTRO --> 
        <axis:alt f="axissin019" c="CSINCIA" lit="89906253"></axis:alt>
        <!--<axis:alt f="axissin019" c="CSINCIA" lit="9901399"></axis:alt>-->
    </c:set>
    <c:set var="title9">
        <axis:alt f="axissin019" c="CCOMPANI" lit="9000600"></axis:alt>
    </c:set>
    <c:set var="title10">
        <axis:alt f="axissin019" c="NPRESIN" lit="9901400"></axis:alt>
    </c:set>
    <c:set var="title11">
        <axis:alt f="axissin019" c="FSINIES" lit="1000510"></axis:alt>
    </c:set>
     <c:set var="title12">
        <axis:alt f="axissin019" c="TSINIES" lit="1000112"></axis:alt>
    </c:set>
    <c:set var="title13">
       <axis:alt f="axissin019" c="NSINRECL" lit="9000974"/>
    </c:set>
    <div class="seccion  displayspace">
        <display:table name="${__formdata.AXISSIN_LISTASINIESTROS}"
                       id="miListaId"
                       export="false"
                       class="dsptgtable"
                       pagesize="4"
                       defaultsort="2"
                       defaultorder="ascending"
                       requestURI="modal_axissin019.do?paginar=true"
                       sort="list"
                       cellpadding="0"
                       cellspacing="0">
            <%@ include file="../include/displaytag.jsp"%>
            <axis:visible c="NPOLIZA_LSSIN" f="axissin019"> 
            <display:column title="${title1}"
                            sortable="false"
                            sortProperty="NPOLIZA"
                            headerClass="headwidth10 sortable"
                            media="html"
                            autolink="false">
                <div class="dspNumber">
                    ${miListaId['NPOLIZA']}
                </div>
            </display:column>
            </axis:visible>
            <display:column title="${title2}"
                            sortable="false"
                            sortProperty="NSINIES"
                            headerClass="headwidth10 sortable"
                            media="html"
                            autolink="false">
                <div class="dspNumber">
                     ${miListaId['NSINIES']}
                </div>
            </display:column>
            <display:column title="${title13}"
                            sortable="false"
                            sortProperty="NSINRECL"
                            headerClass="headwidth10 sortable"
                            media="html"
                            autolink="false">
                 <div class="dspNumber">
                      ${miListaId['NSINRECL']}
                 </div>
            </display:column>  
            <axis:visible c="NSINCIA" f="axissin019">
                 <display:column title="${title8}"
                                sortable="false"
                                sortProperty="NSINCIA"
                                headerClass="sortable"
                                media="html"
                                autolink="false">
		    <!-- AABC IAXIS-2067 tipo de siniestro -->		
                    <div class="dspText">
                        ${miListaId['TTIPSIN']}
                    </div>
                    <!--           
                    <div class="dspText">
                        ${miListaId['NSINCIA']}
                    </div> -->  
                </display:column>
             </axis:visible>   
            
            <axis:visible c="FSINIES" f="axissin019">
                <display:column title="${title11}"
                                sortable="false"
                                sortProperty="FSINIES"
                                headerClass="sortable"
                                media="html"
                                autolink="false">
                    <div class="dspText">
                        <fmt:formatDate value='${miListaId.FSINIES}' pattern='dd/MM/yyyy'/>
                     </div>
                </display:column>
            </axis:visible>
            
            <axis:visible c="TSINIES" f="axissin019">
                  <display:column title="${title12}"
                                sortable="false"
                                sortProperty="TSINIES"
                                headerClass="sortable"
                                media="html"
                                autolink="false">
                    <div class="dspText">
                         ${miListaId['TSINIES']}
                    </div>
                </display:column>
            </axis:visible>
            
            
             <axis:visible c="DESC_RIESGO" f="axissin019">
	            <display:column title="${title3}"
	                            sortable="false"
	                            sortProperty="TRIESGO"
	                            headerClass="sortable"
	                            media="html"
	                            autolink="false">
	                <div class="dspText">
	                     ${miListaId['TRIESGO']}
	                </div>
	            </display:column>
            </axis:visible>
            
            <display:column title="${title4}"
                            sortable="false"
                            sortProperty="TESTSIN"
                            headerClass="headwidth10 sortable"
                            media="html"
                            autolink="false">
                <div class="dspText">
                     ${miListaId['TESTSIN']}
                </div>
            </display:column>
            <axis:visible c="TPRODUC" f="axissin019"> 
            <display:column title="${title5}"
                            sortable="false"
                            sortProperty="TPRODUC"
                            headerClass="sortable"
                            media="html"
                            autolink="false">
                <div class="dspText">
                     ${miListaId['TPRODUC']}
                </div>
            </display:column>
            </axis:visible>
            
             <axis:visible c="CCOMPANI" f="axissin019">
                 <display:column title="${title9}"
                                sortable="false"
                                sortProperty="TCOMPANI"
                                headerClass="sortable"
                                media="html"
                                autolink="false">
                    <div class="dspText">
                        ${miListaId['TCOMPANI']}
                    </div>
                </display:column>
            </axis:visible>
            <axis:visible c="NPRESIN" f="axissin019">
                 <display:column title="${title10}"
                                sortable="true"
                                sortProperty="NPRESIN"
                                headerClass="sortable"
                                media="html"
                                autolink="false">
                    <div class="dspText">
                         ${miListaId['NPRESIN']}
                    </div>
                </display:column>
            </axis:visible>                                             
            
            <axis:visible c="BT_EDIT_SINI" f="axissin019">
            <display:column title="${title6}"
                            sortable="false"
                            headerClass="sortable"
                            media="html"
                            autolink="false">
                <div class="dspIcon">
                   <a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}',  '${miListaId['SSEGURO']}','${miListaId.SPRODUC}','${miListaId.CACTIVI}')"><img border="0" alt="<axis:alt f="axissin019" c="EDITAR" lit="100002" />" title="<axis:alt f="axissin019" c="EDITAR" lit="100002" />" src="images/lapiz.gif"/></a>
                </div>
            </display:column>
            </axis:visible>
            <axis:visible c="BT_BUSCAR_SINI" f="axissin019">
            <display:column title="${title7}"
                            sortable="false"
                            headerClass="sortable"
                            media="html"
                            autolink="false">
                <div class="dspIcon">
                   <a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}',  '${miListaId['SSEGURO']}','${miListaId.SPRODUC}','${miListaId.CACTIVI}')"><img border="0" alt="<axis:alt f="axissin019" c="CONSULTA" lit="109142" />" title="<axis:alt f="axissin019" c="CONSULTA" lit="109142" />" src="images/lapiz.gif"/></a>
                </div>
            </display:column>
            </axis:visible>
        </display:table>
         
        <c:choose>
            <c:when test="${!empty  __formdata.AXISSIN_LISTASINIESTROS}">
                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
            </c:when>
            <c:otherwise>
                <script language="javascript">
                //objLista.esconderListaSpans();
                //objLista.esconderListaLinks();     
                        </script>
            </c:otherwise>
        </c:choose>
    </div>
