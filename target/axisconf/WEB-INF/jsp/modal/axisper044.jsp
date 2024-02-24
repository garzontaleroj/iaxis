<%-- 
*  Fichero: axisper044.jsp
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!-- BUG CONF-186 - 22/08/2016 - HRE -->
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisper044" c="TITULO_DET" lit="9909316" /></c:param>
    <c:param name="nid" value="axisper045" />
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisper044" c="TITULO_DET" lit="9909311" /></c:param>
    <c:param name="nid" value="axisper046" />
</c:import>
<!-- BUG CONF-186 - 22/08/2016 - HRE -->

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css">
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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

        function f_abrir_axisper045(selectedPerson, cmarca, observacion) { 
            objUtiles.abrirModal("axisper045", "src", "modal_axisper045.do?operation=init&SPERSON="+selectedPerson+"&CMARCA="+cmarca+"&OBSERVACION="+observacion);                        
                   
        }
        
        function f_abrir_axisper046(selectedPerson, cmarca) {            
            objUtiles.abrirModal("axisper046", "src", "modal_axisper046.do?operation=init&SPERSON="+selectedPerson+"&CMARCA="+cmarca);                        
        }
        function f_onload() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper044');
					</c:if>
            f_cargar_propiedades_pantalla();
            var OK = "${requestScope.OK}"; 
            
            PSPERSONOUT = "${__formdata.SPERSON}";
            PCAGENTEOUT = "${__formdata.CAGENTE}";
            PTMENSAJE   = "${PRETEN_MENSAJES}"; // IAXIS-4832(6) 04/09/2019 
            if (!objUtiles.estaVacio(OK)){
                parent.f_aceptar_axisper044(PSPERSONOUT,PCAGENTEOUT,OK,PTMENSAJE ); // IAXIS-4832(6) 04/09/2019
            }
                
        }

        function f_but_cancelar() {             
            // Inicio IAXIS-4832(6) 04/09/2019 
            //parent.f_aceptar_axisper044();
             parent.f_cancelar_axisper044();
            // Fin IAXIS-4832(6) 04/09/2019 
        }   
        
        function f_cancelar_axisper045(){
            objUtiles.cerrarModal("axisper045");
        }
                
        function f_salir_axisper046(){
            objUtiles.cerrarModal("axisper046");
        }
        
        function f_but_aceptar() {                   
           objUtiles.ejecutarFormulario("modal_axisper044.do", "grabarMarcas", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
           // Inicio IAXIS-4832(6) 04/09/2019
           // Se traslada a manera de "Confirm" para la función f_aceptar_axisper044 de la pantalla axisper009
           //alert("<axis:alt f="axisctr044" c="ALER_ERR" lit="101625"/>");
           // Fin IAXIS-4832(6) 04/09/2019
        }
        
        // 34989-207442
        function f_but_salir() {
            f_validar_parpersona();
           //parent.f_aceptar_axisper044();
        }
        
        function f_ondblclick(ths) {       
        }
        
        function callbackonchange(responseText) {
            if (responseText.substring(0,1)!="0") {
                //alert("<axis:alt f="axisper044" c="CALLBACK" lit="101283" />");
            }
        }
        function f_onchange(ths) {
            var vmarca = 0;
            var cmarca = ths.name;
            var vcampo = ths.id;

            if (ths.checked){
                vmarca = 1;
            }
            
            var qs="operation=crearMarca";
            qs=qs+"&CMARCA="+cmarca
            qs=qs+"&VMARCA="+vmarca
            qs=qs+"&VCAMPO="+vcampo
            qs=qs+"&SPERSON="+"${__formdata.SPERSON}"
                                            
            if (vcampo == "TODOS"){
              //alert("vcampo:"+vcampo+" qs:"+qs)
                var x = document.getElementsByName(cmarca);
                
                var i;
                for (i = 0; i < x.length; i++) {
                    if (!x[i].disabled){
                    
                       x[i].checked = ths.checked; 
                    }                    
                }                                
            }
            
                objAjax.invokeAsyncCGI("modal_axisper044.do", callbackonchange, qs, this, objJsMessages.jslit_cargando)
            
        }
            
        
    </script>
  </head>
<body onload="f_onload()">
	<div id="wrapper" class="wrapper">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><axis:alt f="axisper044" c="TITULO" lit="9909288"/></c:param>
            <c:param name="formulario"><axis:alt f="axisper044" c="FORMULARIO" lit="9909288"/></c:param>
            <c:param name="form">${sessionScope.AXISMPRXXX}</c:param>
    </c:import>

<!-- Area de campos de parametros -->

<table class="mainTableDimensions base"  align="center" cellpadding="0" cellspacing="0" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','PERMARCAS');return true;">
<tr>
<td class="campocaja">

    <c:set var="title0"><axis:alt f="${pantalla}" c="CMARCA" lit="1000109"></axis:alt></c:set>
    <c:set var="title1"><axis:alt f="${pantalla}" c="DESCRIPCION" lit="101761"></axis:alt></c:set>                            
    <c:set var="title2"><axis:alt f="${pantalla}" c="CTOMADOR" lit="101027"></axis:alt></c:set>       
    <c:set var="title3"><axis:alt f="${pantalla}" c="CASEGURADO" lit="9904824"></axis:alt></c:set>       
    <c:set var="title4"><axis:alt f="${pantalla}" c="CINTERMED" lit="9902363"></axis:alt></c:set>       
    <c:set var="title5"><axis:alt f="${pantalla}" c="CCONSORCIO" lit="100916"></axis:alt></c:set>       
    <c:set var="title6"><axis:alt f="${pantalla}" c="CCODEUDOR" lit="9909291"></axis:alt></c:set>       
    <c:set var="title7"><axis:alt f="${pantalla}" c="CBENEF" lit="9001911"></axis:alt></c:set>       
    <c:set var="title8"><axis:alt f="${pantalla}" c="CACCIONISTA" lit="9909292"></axis:alt></c:set>       
    <c:set var="title9"><axis:alt f="${pantalla}" c="CREPRESEN" lit="9909293"></axis:alt></c:set>       
    <c:set var="title10"><axis:alt f="${pantalla}" c="CAPODERADO" lit="9909294"></axis:alt></c:set>   
    <c:set var="title11"><axis:alt f="${pantalla}" c="CPAGADOR" lit="9903385"></axis:alt></c:set>  
    <c:set var="title12"><axis:alt f="${pantalla}" c="CTODOS" lit="100934"></axis:alt></c:set>       
    <c:set var="title13"><axis:alt f="${pantalla}" c="CHISTORICO" lit="9905535"></axis:alt></c:set>       
    <c:set var="title14"><axis:alt f="${pantalla}" c="COBSERVA" lit="9909295"></axis:alt></c:set>       
    <c:set var="title15"><axis:alt f="${pantalla}" c="CPROVEEDOR" lit="9909834"></axis:alt></c:set>       
    <c:set var="title16"><axis:alt f="${pantalla}" c="CGRUPOECON" lit="89908089"></axis:alt></c:set>
         
           
   <display:table name="${MARCAS}" id="documento" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
     requestURI="modal_axisper044.do?paginar=true">
        <%@ include file="../include/displaytag.jsp"%>
         
     <display:column  sortable="true" sortProperty="CAREA" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText">${documento.OB_IAX_MARCAS.CAREA}</div>
        </display:column>
     
     <display:column title="${title0}" sortable="true" sortProperty="CMARCA" headerClass="sortable"  media="html" autolink="false" >
                    <div id = "MMARCA" name = "MMARCA" class="dspText">${documento.OB_IAX_MARCAS.CMARCA}</div>
        </display:column>
        
        <display:column title="${title1}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                    <div class="dspText">${documento.OB_IAX_MARCAS.DESCRIPCION}</div>
        </display:column>       
        
        <display:column title="${title2}" sortable="true" style="width:15%;" sortProperty="MTOMADOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="TOMADOR" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CTOMADOR == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CTOMADOR == 1}">checked</c:if> /></div>         
        </display:column>            
        
        <display:column title="${title3}" sortable="true" style="width:15%;" sortProperty="MASEGURADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="ASEGURADO" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CASEGURADO == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CASEGURADO == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title4}" sortable="true" style="width:15%;" sortProperty="MINTERMEDIARIO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="INTERMEDIARIO" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CINTERMED == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CINTERMED == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title5}" sortable="true" style="width:15%;" sortProperty="MCONSORCIO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="CONSORCIO" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CCONSORCIO == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CCONSORCIO == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title6}" sortable="true" style="width:15%;" sortProperty="MCODEUDOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="CODEUDOR" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CCODEUDOR == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CCODEUDOR == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title7}" sortable="true" style="width:15%;" sortProperty="MBENEF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="BENEFICIARIO" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CBENEF == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CBENEF == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title8}" sortable="true" style="width:15%;" sortProperty="MACCIONISTA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="ACCIONISTA" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CACCIONISTA == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CACCIONISTA == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title9}" sortable="true" style="width:15%;" sortProperty="MREPRESEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="REPRESENTANTE" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CREPRESEN == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CREPRESEN == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title10}" sortable="true" style="width:15%;" sortProperty="MAPODERADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="APODERADO" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CAPODERADO == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CAPODERADO == 1}">checked</c:if> /></div>                                                                                 
       </display:column>            
        
        <display:column title="${title11}" sortable="true" style="width:15%;" sortProperty="MPAGADOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="PAGADOR" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CPAGADOR == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CPAGADOR == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        
        <display:column title="${title15}" sortable="true" style="width:15%;" sortProperty="MPROVEEDOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="PROVEEDOR" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CPROVEEDOR == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CPROVEEDOR == 1}">checked</c:if> /></div>                                                                                 
        </display:column>            
        <display:column title="${title16}" sortable="true" style="width:15%;" sortProperty="MGRUPOECON" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="GRUPOECON" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )" <c:if test="${documento.OB_IAX_MARCAS.CGRUPOECON == -1}">disabled</c:if> <c:if test="${documento.OB_IAX_MARCAS.CGRUPOECON == 1}">checked</c:if> /></div>                                                                                 
        </display:column>
        <display:column title="${title12}" sortable="true" style="width:15%;" sortProperty="MPAGADOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center">
                                            <input type="checkbox" id="TODOS" name="${documento.OB_IAX_MARCAS.CMARCA}" onchange="f_onchange(this); f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )"  /></div>                                                                                 
        </display:column>  
        <display:column title="${title13}" sortable="true" style="width:15%;" sortProperty="CENTER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            
        <a href="javascript:f_abrir_axisper046('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}')">
              <p align="center">  H </pp>
        </a>
        
        
        
        </display:column>            
                                        
     <%--                                            
   <display:column title="${title14}" sortable="true" style="width:15%;" sortProperty="CENTER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
        <axis:visible f="axisper044" c="BT_EDITPROPI">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper045__BT_EDITAR_PROPIEDAD__visible != 'false'}">
        <div  align="center">
          
            <img border="0" alt='<axis:alt f="axisper044" c="LIT_EDITAR" lit="100002"/>'
                 title='<axis:alt f="axisper044" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
                    onclick="f_abrir_axisper045('${documento.OB_IAX_MARCAS.SPERSON}', '${documento.OB_IAX_MARCAS.CMARCA}', '${documento.OB_IAX_MARCAS.OBSERVACION}' )"/>
        
        </div>
      </c:if>
      </axis:visible>
      
      </display:column>  --%>
    
    </display:table>   
                                                                                 
</td>
</tr>
</table>

</form>

<!-- Area de campos  -->
 <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper044</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>

    </form>
<c:import url="../include/mensajes.jsp" />

</div>
</body>
</html>