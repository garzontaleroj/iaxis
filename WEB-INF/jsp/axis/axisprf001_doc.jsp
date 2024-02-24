<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        


<c:set var="nombrePantalla" value="contacto"/>

<script type="text/javascript"></script>

<form name="${nombrePantalla}" action="" method="POST">   
<div class="displayspace">
     <c:set var="num_tramitacion">0</c:set>
     <c:set var="title0"><axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                            <c:set var="title1"><axis:alt f="${pantalla}" c="FICHERO" lit="105940"></axis:alt></c:set>
                            <c:set var="title2"><axis:alt f="${pantalla}" c="TOBSERVA" lit="101162"></axis:alt></c:set>
                            <c:set var="title3"><axis:alt f="${pantalla}" c="FCADUCA" lit="9001356"></axis:alt></c:set>
                            <c:set var="title4"><axis:alt f="${pantalla}" c="FALTA" lit="105887"></axis:alt></c:set>
                            <c:set var="title5"><axis:alt f="${pantalla}" c="MODIF" lit="9000552"></axis:alt></c:set>
                            <display:table name="${__formdata['OBPROFESIONAL'].DOCUMENTACION}" id="documento" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                             requestURI="modal_axisper009.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${documento.OB_IAX_PROF_DOCUMENTACION.TDESCRI}</div>
                                </display:column>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="FICHERO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" onclick="f_ver_doc('${documento.OB_IAX_PROF_DOCUMENTACION.IDDOCGX}');"><a hrefx="#">${documento.OB_IAX_PROF_DOCUMENTACION.TTITDOC}</a></div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspDate"><fmt:formatDate value="${documento.OB_IAX_PROF_DOCUMENTACION.FALTA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TOBSERVA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${documento.OB_IAX_PROF_DOCUMENTACION.TOBSERVA}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="FCADUCA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspDate"><fmt:formatDate value="${documento.OB_IAX_PROF_DOCUMENTACION.FCADUCA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <axis:visible f="axisprf001" c="BT_EDITAR_DOC"> <!-- boton editar documentos -->
                                  <display:column title="${title5}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons" id="BT_EDITAR_DOC">
                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_EDITAR_DOC" lit="100002"/>"
                                             title="<axis:alt f="axisprf001" c="BT_EDITAR_DOC" lit="100002"/>" 
                                             src="images/lapiz.gif" width="15px" height="15px"
                                             style="cursor:pointer;" 
                                             onclick="javascript:f_abrir_modal('axisprf015',null,'&SPROFES='+document.miForm.pCodiProf.value+
                                                                                                 '&TDESCRI='+'${documento.OB_IAX_PROF_DOCUMENTACION.TDESCRI}'+
                                                                                                 '&IDDOCGX='+${documento.OB_IAX_PROF_DOCUMENTACION.IDDOCGX}+
                                                                                                 '&TTITDOC='+'${documento.OB_IAX_PROF_DOCUMENTACION.TTITDOC}'+
                                                                                                 '&FALTA='+'${documento.OB_IAX_PROF_DOCUMENTACION.FALTA}'+
                                                                                                 '&TOBSERVA='+'${documento.OB_IAX_PROF_DOCUMENTACION.TOBSERVA}'+
                                                                                                 '&FCADUCA='+'${documento.OB_IAX_PROF_DOCUMENTACION.FCADUCA}'+
                                                                                                 '&IDCAT='+'${documento.OB_IAX_PROF_DOCUMENTACION.IDCAT}'+
                                                                                                 '&MODO=modificar');"  />
                                    </div>
                                  </display:column> 
                                  </axis:visible>
                            </display:table>
    </div>
</form>