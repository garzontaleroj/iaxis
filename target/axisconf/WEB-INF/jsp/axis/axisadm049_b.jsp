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
                    $.get(url, showListaProcesoslin2, "text");
                }
            });
        });
        function showListaProcesoslin2(res){        	
            $("#divProcesosline").html(res);          
        }
        
    </script>
    
    <c:set var="title0">
                  <axis:alt f="${fname}" c="PROCESO" lit="1000576"/>
                </c:set>
                <c:set var="title1">
                  <axis:alt f="${fname}" c="LINIA" lit="9000455"/>
                </c:set>
                <c:set var="title2">
                  <axis:alt f="${fname}" c="IDENTI" lit="1000559"/>
                </c:set>
                <c:set var="title3">
                  <axis:alt f="${fname}" c="DESCRIPCION" lit="100588"/>
                </c:set>
                <c:set var="title4">
                  <axis:alt f="${fname}" c="FEJEC" lit="9001572"/>
                </c:set>
                <c:set var="title6">
                  <axis:alt f="${fname}" c="TIPO" lit="9901195"/>
                </c:set>                             
                <div class="seccion displayspaceGrande">
                  <display:table name="${__formdata.REC_LSTPROCESOSLIN}"
                                 id="LSTPROCESOSLIN" export="false"
                                 class="dsptgtable" pagesize="13"
                                 sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisadm049.do?paginar=true">                                 
                    <%@ include file="../include/displaytag.jsp"%>
                                        
                    <display:column title="${title0}" sortable="true"
                                    sortProperty="OB_IAX_PROCESOSLIN.SPROCES"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspNumber">
                        ${LSTPROCESOSLIN.OB_IAX_PROCESOSLIN.SPROCES}
                      </div>
                    </display:column>
                    <display:column title="${title1}" sortable="true"
                                    sortProperty="OB_IAX_PROCESOSLIN.NPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspNumber">
                        ${LSTPROCESOSLIN.OB_IAX_PROCESOSLIN.NPROLIN}
                      </div>
                    </display:column>
                    <display:column title="${title2}" sortable="true"
                                    sortProperty="OB_IAX_PROCESOSLIN.TPOLIZA"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN.OB_IAX_PROCESOSLIN.TPOLIZA}
                      </div>
                    </display:column>
                    <display:column title="${title3}" sortable="true"
                                    sortProperty="OB_IAX_PROCESOSLIN.TPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN.OB_IAX_PROCESOSLIN.TPROLIN}
                      </div>
                    </display:column>
                    <display:column title="${title4}" sortable="true"
                                    sortProperty="OB_IAX_PROCESOSLIN.TFPROLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        <!--<fmt:formatDate value="${LSTPROCESOSLIN['FPROLIN']}" pattern="dd/MM/yyyy"/>-->                            
                        ${LSTPROCESOSLIN.OB_IAX_PROCESOSLIN.TFPROLIN}
                      </div>
                    </display:column>
                   <%-- <display:column title="${title5}" sortable="false"
                                    sortProperty="CESTADO"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspNumber">
                        ${LSTPROCESOSLIN['CESTADO']}
                      </div>
                    </display:column>--%>
                    <display:column title="${title6}" sortable="true"
                                    sortProperty="OB_IAX_PROCESOSLIN.TTIPLIN"
                                    headerClass="sortable" media="html"
                                    autolink="false">                     
                      <div class="dspText">
                        ${LSTPROCESOSLIN.OB_IAX_PROCESOSLIN.TTIPLIN}
                      </div>
                    </display:column>
                    
                  </display:table>
                   
                  <c:choose>
                    <c:when test="${!empty  __formdata.REC_LSTPROCESOSLIN}">
                      <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                    </c:when>
                  </c:choose>
                </div>