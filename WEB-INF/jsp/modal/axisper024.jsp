<%/*
*  Fichero: axisper024.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a> 
*
*  Fecha: 12/01/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
<!--********** CALENDARIO ************************* -->
  <!-- Hoja de estilo del Calendario -->
  <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
  <!-- Script principal del calendario -->
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <!-- Idioma del calendario, en función del Locale -->
  <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
  <!-- Setup del calendario -->
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->    
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
        
        <c:if test="${RESULT==0}">
            parent.f_aceptar_axisper024('axisper024');
        </c:if>
        
        f_cargar_propiedades_pantalla();
        }
                
     

        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisper024');
        }
        
        function seleccionarLista(SPERSON,CAGENTE,duplicat,MODO){
            parent.f_aceptar_axisper024(SPERSON,CAGENTE,duplicat,MODO);
        
        }
        
        function f_but_1000436(){
            seleccionarLista('','',1,'');
        }
  
        function f_marcar(thiss,SPERSON,CAGENTE,duplicat,MODO){
            
            if (thiss.checked){
                document.miForm.SPERSON_MARCADO.value=SPERSON;
                document.miForm.CAGENTE_MARCADO.value=CAGENTE;
                document.miForm.duplicat_MARCADO.value=duplicat;
                document.miForm.MODO_MARCADO.value=MODO;
            }else{
                document.miForm.SPERSON_MARCADO.value='';
                document.miForm.CAGENTE_MARCADO.value='';
                document.miForm.duplicat_MARCADO.value='';
                document.miForm.MODO_MARCADO.value='';
            
            }
        }
        
        function f_but_aceptar(){
              var check = document.getElementById("checked").checked;
              if(check){
                parent.f_aceptar_axisper024( document.miForm.SPERSON_MARCADO.value, document.miForm.CAGENTE_MARCADO.value,document.miForm.duplicat_MARCADO.value,document.miForm.MODO_MARCADO.value);
              }else{
                alert('<axis:alt f="axisper024" c="lit_selec_pers" lit="1000410" />');
              }
        }
    
    </script>
  </head>
    <body onload="f_onload()"  >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
            
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
             <input type="hidden" name="NNUMIDE" id="NNUMIDE" value="${__formdata.NNUMIDE}"/>
             <input type="hidden" name="SPERSON_MARCADO" id="SPERSON_MARCADO" value="${__formdata.SPERSON_MARCADO}"/>
             <input type="hidden" name="CAGENTE_MARCADO" id="CAGENTE_MARCADO" value="${__formdata.CAGENTE_MARCADO}"/>
             <input type="hidden" name="duplicat_MARCADO" id="duplicat_MARCADO" value="${__formdata.duplicat_MARCADO}"/>
             <input type="hidden" name="MODO_MARCADO" id="MODO_MARCADO" value="${__formdata.MODO_MARCADO}"/>
             
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper024" c="TIT_FORM" lit="9901871" /></c:param>
                <c:param name="producto"><axis:alt f="axisper024" c="TIT_FORM" lit="9901871" /></c:param>
                <c:param name="form">axisper024</c:param>
            </c:import>
            
         <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                            <img src="images/flecha.gif"/> 
                            <b><axis:alt f="axisper024" c="TIT_DUP" lit="9901871"/></b>
                           
                        </div>
                       <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title1"><axis:alt f="axisper024" c="NNUMIDE" lit="105330"/></c:set>
                            <c:set var="title2"><axis:alt f="axisper024" c="NOMBRE" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt c="FNACIMI" f="axisper024" lit="100959"/></c:set>
                            <c:set var="title4"><axis:alt c="TDOMICI" f="axisper024" lit="110029"/></c:set>
                            <c:set var="title5"><axis:alt c="CPOSTAL" f="axisper024" lit="101081"/></c:set>
                            <c:set var="title0"><axis:alt f="axisper024" c="CAGENTE" lit="100584"/></c:set>
                             
                            <div class="seccion displayspacePersonas">
                             <display:table name="${__formdata.personas}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisper024.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                     <c:set var="contador"></c:set>    
                                      <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['CODI'] == __formdata.SPERSON_MARCADO}">checked</c:if> type="radio" id="checked" name="checked" value="${__formdata.SPERSON_MARCADO}" onclick="javascript:f_marcar(this,'${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" />
                                    </display:column>
                                   <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['NNUMIDE']}</a>  </div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" style="width:20%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                    <axis:visible f="axisper024" c="FNACIMI">
                                    <display:column title="${title3}" sortable="true" style="width:11%;" sortProperty="FNACIMI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['FNACIMI']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper024" c="CPOSTAL">
                                    <display:column title="${title5}" sortable="true" style="width:9%;" sortProperty="CPOSTAL" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['CPOSTAL']}</a></div>
                                    </display:column>    
                                    </axis:visible>
                                    <axis:visible f="axisper024" c="TDOMICI">
                                    <display:column title="${title4}" sortable="true" style="width:20%;" sortProperty="TDOMICI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['TDOMICI']}</a></div>
                                    </display:column>
                                    </axis:visible>                                    
                                    <axis:visible f="axisper024" c="CAGENTE">
                                        <display:column title="${title0}" sortable="true" style="width:5%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['CAGENTE']}</a> </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" style="width:20%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText"><a onclick="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')" href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','','${miListaId['MODO']}')">${miListaId['TAGENTE']}</a></div>
                                        </display:column>                                                  
                                    </axis:visible>
                                     
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisper024_listaPersonas}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>	
                            
                    </td>
                </tr>
            </table>						
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper024</c:param>
                <c:param name="__botones">cancelar,aceptar<axis:visible f="axisper024" c="BUT_NUEVAPER">,1000436</axis:visible></c:param>
         </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINIEFE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIEFE", 
        singleClick    :    true,
        firstDay       :    1
    });
    

  

</script>    
    </body>
</html>

