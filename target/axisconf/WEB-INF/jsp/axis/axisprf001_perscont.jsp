<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="perscont"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">                       
      <!-- DisplayTag CCC -->
                               <!-- NIF -->
                              <c:set var="title0"> 
                                <axis:alt f="axisprf001" c="LIT_NIF" lit="100577"/>
                              </c:set>
                              <!-- Nombre -->
                              <c:set var="title1"> 
                                <axis:alt f="axisprf001" c="LIT_NOMBRE" lit="105940"/>
                              </c:set>
                              <!-- Numero movil -->
                              <c:set var="title2"> 
                                <axis:alt f="axisprf001" c="LIT_MOVIL" lit="1000379"/>
                              </c:set>
                               <!-- E-mail -->
                              <c:set var="title3"> 
                                <axis:alt f="axisprf001" c="LIT_EMAIL" lit="109792"/>
                              </c:set> 
                               <!-- Cargo -->
                              <c:set var="title4"> 
                                <axis:alt f="axisprf001" c="LIT_CARGO" lit="9902638"/>
                              </c:set> 
                               <!-- Dirección -->
                              <c:set var="title5"> 
                                <axis:alt f="axisprf001" c="LIT_DIREC" lit="105889"/>
                              </c:set>
                              <!--Fecha baja-->
                              <c:set var="title6"> 
                                <axis:alt f="axisprf001" c="LIT_USUBAJ" lit="9001510"/>
                              </c:set>
                              <!--Usuario baja-->
                              <c:set var="title7"> 
                                <axis:alt f="axisprf001" c="LIT_USUBAJ" lit="9904753"/>
                              </c:set>
                              <!--Modificar-->
                              <c:set var="title8">
                                <axis:alt f="axisprf001" c="MODIFICAR" lit="9000552" />
                              </c:set>
                              <!--Eliminar-->
                              <c:set var="title9">
                                <axis:alt f="axisprf001" c="ELIMINAR" lit="1000127" />
                              </c:set>
                              <div class="displayspace">
                                <display:table name="${__formdata['OBPROFESIONAL'].CONTACTOS_PER}"
                                               id="T_IAX_CONTACTOS_PER" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <!--<axis:visible f="axisprf001" c="BANCO_CCC">-->
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.CNUMIDE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">                      
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.CNUMIDE}
                                    </div>
                                  </display:column>
                                  <!--</axis:visible>                                  -->
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.TNOMBRE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TNOMBRE}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.TMOVIL"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TMOVIL}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.TEMAIL"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TEMAIL}
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.TCARGO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TCARGO}
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.TDIREC"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TDIREC}
                                    </div>
                                  </display:column>
                                   <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.FBAJA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.FBAJA}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title7}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_PROF_CONTACTOS_PER.TUSUBAJ"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TUSUBAJ}
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisprf001" c="BT_EDITAR_CONTACTOS_PER"> <!-- boton editar persona de contacto -->
                                  <display:column title="${title8}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_EDITAR_CONTACTOS_PER">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_CONTACTOS_PER" lit="100002"/>"
                                             title1="<axis:alt f="axisprf001" c="BT_EDITAR_CONTACTOS_PER" lit="100002"/>" 
                                             src="images/lapiz.gif" width="15px" height="15px"
                                             style="cursor:pointer;" 
                                             onclick="javascript:f_abrir_modal('axisprf004',null,'&pCodiProf='+document.miForm.pCodiProf.value+
                                             '&NORDCTO='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.NORDCTO}'+
                                             '&CTIPIDE='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.CTIPIDE}'+
                                             '&CNUMIDE='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.CNUMIDE}'+
                                             '&TNOMBRE='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TNOMBRE}'+
                                             '&TMOVIL='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TMOVIL}'+
                                             '&TEMAIL='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TEMAIL}'+
                                             '&TCARGO='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TCARGO}'+
                                             '&TDIREC='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.TDIREC}'+
                                             '&MODO=modificar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
                                  
                                  <axis:visible f="axisprf001" c="BT_DELETE_CONTACTOS_PER">  <!-- boton delete persona contacto -->
                                  <display:column title="${title9}" 
                                                  headerClass="headwidth5 sortable" 
                                                  style="width:5%" 
                                                  media="html" autolink="false" >
                                     <div class="dspIcons" id="BT_DELETE_CONTACTOS_PER">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_CONTACTOS_PER" lit="1000127"/>" 
                                             title1="<axis:alt f="axisprf001" c="BT_DELETE_CONTACTOS_PER" lit="1000127"/>" 
                                             src="images/delete.gif" width="15px" height="15px"
                                             style="cursor:pointer;" onclick="f_borrar_fila('&CNUMIDE='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.CNUMIDE}'
                                                                                               +'&NORDCTO='+'${T_IAX_CONTACTOS_PER.OB_IAX_PROF_CONTACTOS_PER.NORDCTO}',
                                                                                                'perscont')"/>
                                     </div>
                                  </display:column>
                                  </axis:visible>
                                  
                                </display:table>
                              </div>
</form>