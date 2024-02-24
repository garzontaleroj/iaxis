<%/*
*  Fichero: axifinv014.jsp
*  Fecha: 14/02/2014
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
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
    <script type="text/javascript" src="scripts/jsFecha.js"></script>
    
      <script type="text/javascript">
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload(){
           f_cargar_propiedades_pantalla();
           var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
           if (${empty T_IAX_FONDOS} && !hayErrores && objUtiles.estaVacio(objDom.getValorPorId("FLAG")))         
            { 
                f_but_buscar();                  
                objDom.setValorPorId("FLAG","1");
            }    
        }
        
        function f_but_buscar(){
                f_abrir_modal('axisfinv013');    
        }
        
        function f_abrir_modal(cual) {
             objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form");        
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do", "cancelar", document.miForm, "_self");
        }
        
        function f_but_nuevo(){
            var CEMPRES = document.miForm.CEMPRES;
            objUtiles.abrirModal("axisfinv015", "src", "modal_axisfinv015.do?operation=form&CEMPRES=" + CEMPRES);
        }
        
        function f_abrir_edicion(CCODFON){
            var CEMPRES = document.miForm.CEMPRES;
            objUtiles.abrirModal("axisfinv015", "src", "modal_axisfinv015.do?operation=form&CEMPRES=" + CEMPRES + "&CCODFON="+ CCODFON );
        }
        
        function f_buscar_modal(cual,params){
           objUtiles.ejecutarFormulario("axis_axisfinv014.do"+params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisfinv015(){
            objUtiles.cerrarModal('axisfinv015');
            f_buscar_modal('axisfinv013',"?pCEMPRES=&pCCODFON=&pTCODFON=&pCMONEDA=&pCMANAGER=");
        }
        
        function f_but_nuevo_axisfinv013(){
            
            f_cerrar_axisfinv013();
            f_but_nuevo();
			
        }
        
        function f_cerrar_axisfinv013(){
            objUtiles.cerrarModal('axisfinv013');
        }
        
      </script>
   </head> 
   <body onload="f_onload();" >
     <c:import url="../include/precargador_ajax.jsp">
          <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
     </c:import>
     <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="form"/>
        <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.cempres}"/>
        <input type="hidden" id="FLAG" name="FLAG" value="${__formdata.FLAG}"/>
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisfinv014" c="FORMULARIO" lit="9906553"/></c:param>
                <c:param name="producto"><axis:alt f="axisfinv014" c="PRODUCTO" lit="9906553"/></c:param>
                <c:param name="form">axisfinv014</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisfin014" c="MODAL_AXISFIN013" lit="9906551" /></c:param>
            <c:param name="nid" value="axisfinv013"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisfin014" c="MODAL_AXISFIN015" lit="9906552" /></c:param>
            <c:param name="nid" value="axisfinv015"></c:param>
        </c:import>
        <!--titols taules-->
        <c:set var="title1"><axis:alt f="axisifinv014" c="CCODFON" lit="1000109"/></c:set><!-- Codigo fondos -->
        <c:set var="title2"><axis:alt f="axisifinv014" c="TCODFON" lit="100588"/></c:set><!-- Texto fondos -->
        <c:set var="title3"><axis:alt f="axisifinv014" c="CMANAGER" lit="9906548"/></c:set><!--manager-->
        <c:set var="title4"><axis:alt f="axisifinv014" c="CMONEDA" lit="108645"/></c:set><!--moneda-->
        <c:set var="title5"><axis:alt f="axisifinv014" c="EDIT" lit="9901356"/></c:set><!--EDICION-->
   
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="titulocaja" id="LIT_CEMPRES">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <b><axis:alt f="axisfinv015" c="CEMPRES" lit=""/></b>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                    
                        <display:table name="${T_IAX_FONDOS}" id="listaFondos" export="false"  pagesize="30" defaultsort="1" requestURI="axis_axisfinv014.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                             <%@ include file="../include/displaytag.jsp"%>
                             <display:column title="${title1}" sortable="true" sortProperty="CCODFON" headerClass="sortable fixed"  media="html" autolink="false" >    
                                     <div class="dspText">${listaFondos.CCODFON}</div>
                             </display:column>
                             <display:column title="${title2}" sortable="true" sortProperty="TFONCMP" headerClass="sortable fixed"  media="html" autolink="false" >    
                                     <div class="dspText">${listaFondos.TFONCMP}</div>
                             </display:column>
                             <display:column title="${title3}" sortable="true" sortProperty="TCMANAGER" headerClass="sortable fixed"  media="html" autolink="false" >    
                                     <div class="dspText">${listaFondos.TCMANAGER}</div>
                             </display:column>
                             <display:column title="${title4}" sortable="true" sortProperty="TMONEDA" headerClass="sortable fixed"  media="html" autolink="false" >    
                                     <div class="dspText">${listaFondos.TCMONEDA}</div>
                             </display:column>
                             <display:column title="${title5}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >    
                                     <div class="dspText">
                                        <img border="0" alt="<axis:alt f="axiscomi014" c="DESGLOSE" lit="9904656"/>" title1="<axis:alt f="axiscomi005" c="FONDOS" lit="9904656"/>" src="images/lapiz.gif" 
                                             style="cursor:pointer;" onclick="javascript:f_abrir_edicion(${listaFondos.CCODFON})"/>
                                     </div>
                             </display:column>
                         </display:table>
                         
                         <c:import url="../include/botonera_nt.jsp">
                             <c:param name="f">axiscomi014</c:param><c:param name="__botones">salir,buscar,nuevo</c:param>
                         </c:import>
                    </td>
                </tr>
        </table>
    </form>
    <c:import url="../include/mensajes.jsp" />
  </body>
</html>