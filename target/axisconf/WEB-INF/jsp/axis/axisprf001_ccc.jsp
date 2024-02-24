<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="contacto"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
    <!-- DisplayTag CCC -->
    <!-- Ramo -->
    <c:set var="title0"><axis:alt f="axisprf001" c="LIT_RAMO_CCC" lit="100784"/></c:set>
    <!-- Producto -->
    <c:set var="title1"><axis:alt f="axisprf001" c="LIT_PRODUCTO_CCC" lit="100829"/></c:set>
    <!-- Actividad -->
    <c:set var="title2"><axis:alt f="axisprf001" c="LIT_ACTIVIDAD_CCC" lit="103481"/></c:set>
    <!-- Cuenta Bancaria -->
    <c:set var="title3"><axis:alt f="axisprf001" c="LIT_CBANCAR_CCC" lit="100965"/></c:set> 
    <!--Eliminar-->
    <c:set var="title4"><axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" /></c:set>
    <div class="displayspace">
         <display:table name="${__formdata['OBPROFESIONAL'].CUENTAS}"
                        id="T_IAX_CCC" export="false"
                        class="dsptgtable" pagesize="-1"
                        defaultsort="1"
                        defaultorder="ascending"
                        sort="list" cellpadding="0"
                        cellspacing="0"
                        requestURI="">
         <%@ include file="../include/displaytag.jsp"%>
         <display:column title="${title0}"
                         sortable="true"
                         sortProperty="OB_IAX_PROF_CCC.TRAMO"
                         headerClass="sortable fixed"
                         media="html" autolink="false">
         <div class="dspText">${T_IAX_CCC.OB_IAX_PROF_CCC.TRAMO}</div>
         </display:column>
         <display:column title="${title1}"
                         sortable="true"
                         sortProperty="OB_IAX_PROF_CCC.TPRODUC"
                         headerClass="sortable fixed"
                         media="html" autolink="false">
         <div class="dspText">${T_IAX_CCC.OB_IAX_PROF_CCC.TPRODUC}</div>
         </display:column>
         <display:column title="${title2}"
                         sortable="true"
                         sortProperty="OB_IAX_PROF_CCC.TACTIVI"
                         headerClass="sortable fixed"
                         media="html" autolink="false">
         <div class="dspText">${T_IAX_CCC.OB_IAX_PROF_CCC.TACTIVI}</div>
         </display:column>
         <display:column title="${title3}"
                         sortable="true"
                         sortProperty="OB_IAX_PROF_CCC.TTIPBAN"
                         headerClass="sortable fixed"
                         media="html" autolink="false">
         <div class="dspText">
              <axis:masc f="axisprf001" c="CBANCAR" value="${T_IAX_CCC.OB_IAX_PROF_CCC.CBANCAR}" />
         </div>
         </display:column>
         <axis:visible f="axisprf001" c="BT_DELETE_CCC">  <!-- boton delete estado -->
              <display:column title="${title4}" 
                              headerClass="headwidth5 sortable" 
                              style="width:5%" 
                              media="html" autolink="false" >
         <div class="dspIcons" id="BT_DELETE_CCC">
              <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_CCC" lit="1000127"/>" 
                   title1="<axis:alt f="axisprf001" c="BT_DELETE_CCC" lit="1000127"/>" 
                   src="images/delete.gif" width="15px" height="15px"  
                   style="cursor:pointer;" onclick="f_borrar_fila('&CNORDEN='+'${T_IAX_CCC.OB_IAX_PROF_CCC.CNORDEN}','ccc')"/>
         </div>
         </display:column>
         </axis:visible>
         </display:table>
       </div>
</form>