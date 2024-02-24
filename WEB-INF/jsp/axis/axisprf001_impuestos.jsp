<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="impuestos"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="TDESIMP" lit="9906564"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TINDICA" lit="9906486"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="CUSUARI" lit="9902948"/></c:set>
      <c:set var="title3"><axis:alt f="axisprf001" c="FALTA" lit="100562"/></c:set>
      <c:set var="title5"><axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" /></c:set>         
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].IMPUESTOS}"
                     id="T_IAX_IMPUESTOS" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
      <axis:visible f="axisprf001" c="TDESIMP">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_IMPUESTOS.TDESIMP"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_IMPUESTOS.OB_IAX_PROF_IMPUESTOS.TDESIMP}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_IMPUESTOS.TINDICA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_IMPUESTOS.OB_IAX_PROF_IMPUESTOS.TINDICA}</div>
      </display:column>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEGUIMIENTO.CUSUARI"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_IMPUESTOS.OB_IAX_PROF_IMPUESTOS.CUSUARI}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_IMPUESTOS.FALTA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">
      <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_IMPUESTOS.OB_IAX_PROF_IMPUESTOS.FALTA}"/>   
      </div>
      </display:column>
      <%--  TCS_1569B - ACL - 31/01/2019 - No se utilizará el botón borrar--%>  
     <%--   <axis:visible f="axisprf001" c="BT_DELETE_IMPUESTO">  <!-- boton delete impuesto -->
      <display:column title="${title9}" 
                      headerClass="headwidth5 sortable" 
                      style="width:5%" 
                      media="html" autolink="false" >
         <div class="dspIcons" id="BT_DELETE_IMPUESTO">
            <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_IMPUESTO" lit="1000127"/>" 
                 title1="<axis:alt f="axisprf001" c="BT_DELETE_IMPUESTO" lit="1000127"/>" 
                 src="images/delete.gif" width="15px" height="15px"
                 style="cursor:pointer;" onclick="f_borrar_fila('&CTIPIND='+'${T_IAX_IMPUESTOS.OB_IAX_PROF_IMPUESTOS.CTIPIND}',
                                                                    'impuesto')"/>
         </div>
      </display:column>
      </axis:visible>    --%>
      </display:table>                                  
      </div>
</form>