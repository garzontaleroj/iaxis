<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="procesos"/>

<script type="text/javascript">
   
    
</script>

<form name="${nombrePantalla}" action="" method="POST">  

                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                            <div class="displayspace">
                                   <c:set var="title0"><axis:alt f="axisctr020" c="CARGAPROCESO_LIT1" lit="1000576"/></c:set>
                                    <display:table name="${carga_fichero_datos}" id="lista_fichero" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                                                <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">${lista_fichero.LINEA}</div>
                                        </display:column>
                                    </display:table>    
                            </div>    
                            </td>
                        </tr>
                        </table>
                  
</form>