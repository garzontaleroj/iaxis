<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="descartados"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="TTIPPRO" lit="9903408"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TPRODUC" lit="9902909"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="TCAUSIN" lit="101040"/></c:set>
      <c:set var="title3"><axis:alt f="axisprf001" c="FDESDE" lit="9902360"/></c:set>
      <c:set var="title4"><axis:alt f="axisprf001" c="FHASTA" lit="9902361"/></c:set>   
      <c:set var="title5"><axis:alt f="axisprf001" c="MODIFICAR" lit="9000552" /></c:set><!--Eliminar-->
         
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].DESCARTADOS}"
                     id="T_IAX_DESCARTADOS" export="false"
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
                      sortProperty="OB_IAX_PROF_DESCARTADOS.TTIPPRO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.TTIPPRO}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_DESCARTADOS.TPRODUC"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.TPRODUC}</div>
      </display:column>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_DESCARTADOS.TCAUSIN"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.TCAUSIN}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_DESCARTADOS.FDESDE"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">
      <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.FDESDE}"/>   
      </div>
      </display:column>
      <display:column title="${title4}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_DESCARTADOS.FHASTA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">
      <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.FHASTA}"/>   
      </div>
      </display:column>
      <axis:visible f="axisprf001" c="BT_EDITAR_DESCARTADOS"> <!-- boton editar persona de contacto -->
      <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
      <div class="dspIcons" id="BT_EDITAR_DESCARTADOS">
      <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_DESCARTADOS" lit="100002"/>"
           title1="<axis:alt f="axisprf001" c="BT_EDITAR_DESCARTADOS" lit="100002"/>" 
           src="images/lapiz.gif" width="15px" height="15px"
           style="cursor:pointer;" 
           onclick="javascript:f_abrir_modal('axisprf011',null,'&pCodiProf='+document.miForm.pCodiProf.value+
                                             '&CTIPPRO='+'${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.CTIPPRO}'+
                                             '&CSUBPRO='+'${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.CSUBPRO}'+
                                             '&SPRODUC='+'${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.SPRODUC}'+
                                             '&CCAUSIN='+'${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.CCAUSIN}'+
                                             '&FDESDE='+'${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.FDESDE}'+
                                             '&FHASTA='+'${T_IAX_DESCARTADOS.OB_IAX_PROF_DESCARTADOS.FHASTA}'+
                                             '&MODO=modificar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
      </display:table>                                  
      </div>
</form>