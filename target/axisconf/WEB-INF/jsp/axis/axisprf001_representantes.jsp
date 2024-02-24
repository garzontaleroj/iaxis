<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="representantes"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <c:set var="title0"><axis:alt f="axisprf001" c="TNIF" lit="100577"/></c:set>
      <c:set var="title1"><axis:alt f="axisprf001" c="TNOMBRE" lit="105940"/></c:set>
      <c:set var="title2"><axis:alt f="axisprf001" c="NMOVIL" lit="9903007"/></c:set>
      <c:set var="title3"><axis:alt f="axisprf001" c="TEMAIL" lit="9903325"/></c:set>
      <c:set var="title4"><axis:alt f="axisprf001" c="TCARG0" lit="9902638"/></c:set>
      <c:set var="title5"><axis:alt f="axisprf001" c="MODIFICAR" lit="9000552" /></c:set><!--Modificar-->
   
      <div class="displayspace">
      <display:table name="${__formdata['OBPROFESIONAL'].REPRESENTANTES}"
                     id="T_IAX_REPRESENTANTES" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisprf001.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
      <axis:visible f="axisprf001" c="CNUMIDE">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_REPRE.TNIF"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.TNIF}</div>
      </display:column>
      </axis:visible>
       <axis:visible f="axisprf001" c="TNOMBRE">
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_REPRE.TNOMBRE"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.TNOMBRE}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_REPRE.CTELCON"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.CTELCON}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_REPRE.CMAILCON"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.CMAILCON}</div>
      </display:column>
      <display:column title="${title4}"
                      sortable="true"
                      sortProperty="OB_IAX_PROF_REPRE.TCARGO"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.TCARGO}</div>
      </display:column>
      <axis:visible f="axisprf001" c="BT_EDITAR_REPRESENTANTE"> <!-- boton editar tramitaciones general -->
            <display:column title="${title5}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                    <div class="dspIcons" id="BT_EDITAR_REPRESENTANTE">
                         <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_REPRESENTANTE" lit="100002"/>"
                              title1="<axis:alt f="axisprf001" c="BT_EDITAR_REPRESENTANTE" lit="100002"/>" 
                              src="images/lapiz.gif" width="15px" height="15px"
                              style="cursor:pointer;" 
                              onclick="javascript:f_abrir_modal('axisprf013',null,
                                      '&pCodiProf='+document.miForm.pCodiProf.value+
                                      '&SPERSON='+'${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.SPERSON}'+
                                      '&TNOMBRE='+'${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.TNOMBRE}'+
                                      '&TCARGO='+'${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.TCARGO}'+
                                      '&CTELCON='+'${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.CTELCON}'+
                                      '&CMAILCON='+'${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.CMAILCON}'+
                                      '&TNIF='+'${T_IAX_REPRESENTANTES.OB_IAX_PROF_REPRE.TNIF}'+
                                      '&MODO=modificar');"  />
                    </div>
            </display:column> 
      </axis:visible>
      </display:table>                                  
      </div>
</form>