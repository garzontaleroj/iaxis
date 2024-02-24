<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="sedes"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="TNOMBRE" lit="105940"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TDOMICI" lit="9000914"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="THORARI" lit="9904812"/></c:set>
      <c:set var="title3"><axis:alt f="axisprf001" c="TNOMCTO" lit="9904813"/></c:set>
      <c:set var="title4"><axis:alt f="axisprf001" c="MODIFICAR" lit="9000552" /></c:set><!--Modificar-->
   
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].SEDES}"
                     id="T_IAX_SEDES" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
      <axis:visible f="axisprf001" c="TNOMBRE">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEDES.TNOMBRE"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEDES.OB_IAX_PROF_SEDES.TNOMBRE}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEDES.TDOMICI"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEDES.OB_IAX_PROF_SEDES.TDOMICI}</div>
      </display:column>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEDES.THORARI"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEDES.OB_IAX_PROF_SEDES.THORARI}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_SEDES.TPERCTO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_SEDES.OB_IAX_PROF_SEDES.TPERCTO}</div>
      </display:column>
      <axis:visible f="axisprf001" c="BT_EDITAR_SEDE"> <!-- boton editar tramitaciones general -->
            <display:column title="${title4}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                    <div class="dspIcons" id="BT_EDITAR_SEDE">
                         <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_SEDE" lit="100002"/>"
                              title1="<axis:alt f="axisprf001" c="BT_EDITAR_SEDE" lit="100002"/>" 
                              src="images/lapiz.gif" width="15px" height="15px"
                              style="cursor:pointer;" 
                              onclick="javascript:f_abrir_modal('axisprf014',null,
                                      '&pCodiProf='+document.miForm.pCodiProf.value+
                                      '&SPERSED='+'${T_IAX_SEDES.OB_IAX_PROF_SEDES.SPERSED}'+
                                      '&TNOMBRE='+'${T_IAX_SEDES.OB_IAX_PROF_SEDES.TNOMBRE}'+
                                      '&CDOMICI='+'${T_IAX_SEDES.OB_IAX_PROF_SEDES.CDOMICI}'+
                                      '&THORARI='+'${T_IAX_SEDES.OB_IAX_PROF_SEDES.THORARI}'+
                                      '&TPERCTO='+'${T_IAX_SEDES.OB_IAX_PROF_SEDES.TPERCTO}'+
                                      '&MODO=modificar');"  />
                    </div>
            </display:column> 
      </axis:visible>
      </display:table>                                  
      </div>
</form>