<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="roles"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="TTIPPRO" lit="9902569"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TSUBPRO" lit="9902570"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" /></c:set>      
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].ROLES}"
                     id="T_IAX_ROLES" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
      <axis:visible f="axisprf001" c="TTIPPRO">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_ROLES.TTIPPRO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_ROLES.OB_IAX_PROF_ROLES.TTIPPRO}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_ROLES.TSUBPRO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_ROLES.OB_IAX_PROF_ROLES.TSUBPRO}</div>
      </display:column>
      <axis:visible f="axisprf001" c="BT_DELETE_ROL">  <!-- boton delete rol -->
           <display:column title="${title2}" 
                           headerClass="headwidth5 sortable" 
                           style="width:5%" 
                           media="html" autolink="false" >
           <div class="dspIcons" id="BT_DELETE_ROL">
                <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_ROL" lit="1000127"/>" 
                     title1="<axis:alt f="axisprf001" c="BT_DELETE_ROL" lit="1000127"/>" 
                     src="images/delete.gif" width="15px" height="15px"  
                     style="cursor:pointer;" onclick="f_borrar_fila('&CTIPPRO='+'${T_IAX_ROLES.OB_IAX_PROF_ROLES.CTIPPRO}'+
                                                                    '&CSUBPRO='+'${T_IAX_ROLES.OB_IAX_PROF_ROLES.CSUBPRO}','rol')"/>
           </div>
           </display:column>
      </axis:visible>
      </display:table>                                  
      </div>
</form>