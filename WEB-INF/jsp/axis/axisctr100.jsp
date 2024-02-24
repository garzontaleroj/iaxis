<%/* Revision:# z3lSqsdyuqxJGEhYbFV37g== # */%>
<%/**
*  Fichero: axisctr100.jsp
*  
*
*  Pantalla de Simulacion de riesgos
*
*  Detalle:	
*  Campos: TNATRIE : Descripcion del riesgo naturaleza riegso
*          FEFECTO : Fecha efecto
*          CDURACI : Tipo de duracion
*          NDURACI : Duracion
*          FVENCIM : Fecha vencimiento
*          CFORPAG : Forma de pago
*
*  Fecha: 30/12/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Traductor" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr100" c="TITULO_HTML" lit="1000182"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp"/>
        <c:import url="../../../scripts/axis/axisctr100.jsp"/>      
        <!--********** CALENDARIO ************************* -->
          <!-- Hoja de estilo del Calendario -->
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <!-- Script principal del calendario -->
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <!-- Idioma del calendario, en función del Locale -->
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <!-- Setup del calendario -->
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>

          <style type="text/css">
              .displayspaceAGM{
                  width: 100%;
                  overflow-x: hidden;
                  overflow-y: auto;
                  border: 1px solid #DDDDDD;
                  border-right-width: 0px; }
          </style>          
		  
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
          <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr042|<axis:alt f="axisctr100" c="TIT_AXISCTR042" lit="9000420"/></c:param> <%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr009" c="PSU003" lit="9002255" /></c:param>
        <c:param name="nid" value="axispsu003" />
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <axis:alt f="axisctr100" c="TITULOaxisper005" lit="1000214"/>
            </c:param>
            <c:param name="nid" value="axisper005"/>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <axis:alt f="axisctr100" c="TITULO_AXISPER001" lit="1000199"/>
            </c:param>
            <c:param name="nid" value="axisper001"/>
        </c:import>
        
          <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <axis:alt f="axisctr100" c="TITULO_AXISPER001" lit="1000199"/>
            </c:param>
            <c:param name="nid" value="axisctr148"/>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <axis:alt f="axisctr100" c="TITULO_AXISPER001" lit="1000199"/>
            </c:param>
            <c:param name="nid" value="axisctr061"/>
        </c:import>
		
		<c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <axis:alt f="axisctr100" c="TITULO_AXISPER001" lit="1000199"/>
            </c:param>
            <c:param name="nid" value="axisctr006"/>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr503" c="TIT_AXISCTR503" lit="9907572" /></c:param>
                <c:param name="nid" value="axisctr503" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_DET" lit="9908904" /></c:param>
            <c:param name="nid" value="axiscalculafecha" />
        </c:import>        
		
	
		
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="respuestas" name="respuestas" value=""/>
            <input type="hidden" name="COBJASE" id="COBJASE" value="${__formdata.COBJASE}"/>
            <input type="hidden" name="CSITUAC" id="CSITUAC" value="${__formdata.CSITUAC}"/>
            <input type="hidden" name="PREG_COND_TOMASEG" id="PREG_COND_TOMASEG" value="${__formdata.PREG_COND_TOMASEG}"/>
            <input type="hidden" name="CDOMICI" id="CDOMICI" value="${__formdata.CDOMICI}"/>
            <input type="hidden" name="CPAIS" id="CPAIS" value="${__formdata.CPAIS}"/>
            <input type="hidden" name="CPROVIN" id="CPROVIN" value="${__formdata.CPROVIN}"/>
            <input type="hidden" name="CPOBLAC" id="CPOBLAC" value="${__formdata.CPOBLAC}"/>
            <input type="hidden" name="CTIPCOM" id="CTIPCOM" value="${__formdata.CTIPCOM}"/>
            <axis:ocultar f="axisctr100" c="CFG_ALTA_ASEGU" dejarHueco="false">
              <input type="hidden" name="CFG_ALTA_ASEGU" id="CFG_ALTA_ASEGU" value="${__formdata.CFG_ALTA_ASEGU}"/>
            </axis:ocultar>  
              
	    <!-- ramiro -->
            <input type="hidden" name="FLAG_BT_CONTRATAR" id="FLAG_BT_CONTRATAR" <axis:atr f="axisctr100" c="FLAG_BT_CONTRATAR"/> />
            <input type="hidden" name="CMODOCOT" id="CMODOCOT" value="${__formdata.CMODOCOT}"/>
    
                
            <!--PARAMETROS PARA EL PASO MODAL -->
            <input type="hidden" name="TNOMBRE" id="TNOMBRE" value=""/>
            <input type="hidden" name="TNOMBRE1" id="TNOMBRE1" value=""/>
            <input type="hidden" name="TNOMBRE2" id="TNOMBRE2" value=""/>
            <input type="hidden" name="TAPELLI1" id="TAPELLI1" value=""/>
            <input type="hidden" name="TAPELLI2" id="TAPELLI2" value=""/>
            <input type="hidden" name="CTIPIDE" id="CTIPIDE" value=""/>
            <input type="hidden" name="TIDENTI" id="TIDENTI" value=""/>
            <input type="hidden" name="CSEXPER" id="CSEXPER" value=""/>
            <input type="hidden" name="CESTCIV" id="CESTCIV" value=""/>
            <input type="hidden" name="FNACIMI" id="FNACIMI" value=""/>
            <input type="hidden" name="NNUMNIF" id="NNUMNIF" value=""/>
            <input type="hidden" name="NRIESGO" id="NRIESGO" value="${NRIESGO}"/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${sessionScope.SPERSON}"/>
            <input type="hidden" name="SPERSON2MODIFY" id="SPERSON2MODIFY" value="${sessionScope.SPERSON2MODIFY}"/>    
            <input type="hidden" name="COCUPACION" id="COCUPACION" value="${__formdata.COCUPACION}" />
            <input type="hidden" name="CCRITICO" id="CCRITICO" value="${CCRITICO}">
            <input type="hidden" name="NOVISIBLE" id="NOVISIBLE" value="${NOVISIBLE}">
            <input type="hidden" name="SPRODUC" id="SPRODUC" value="${sessionScope.axisctr100_datosGestion.SPRODUC}">
            <%--xpl 16/07/2009 10194        --%>
            <input type="hidden" name="isNeedTarificar" id="isNeedTarificar" value="${isNeedTarificar}"/>
            <%--fi xpl 16/07/2009 10194        --%>
            <!--FIN PARA EL PASO MODAL        -->
            <!--PAGINACION -->
            <input type="hidden" name="FORM_ACT" id="FORM_ACT" value=""/>
            <!--PAGINACION -->
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt c="TITULO" f="axisctr100" lit="108021"/></c:param>
                <c:param name="formulario"><axis:alt c="TITULO" f="axisctr100" lit="108021"/></c:param>
                <c:param name="form">axisctr100</c:param>
            </c:import>
           
            <!-- Area de campos  -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISCTR091" lit="9002050" /></c:param>
                <c:param name="nid" value="axisctr091" />
            </c:import>            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISCTR101" lit="1000199" /></c:param>
                <c:param name="nid" value="axisctr101" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISIMPRIMIR" lit="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir" />
                <c:param name="botonCerrar" value="true"/>
            </c:import>            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISEDICIONTEXTO" lit="1000573" /></c:param>
                <c:param name="nid" value="axisediciontexto" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISPER001" lit="1000235" /></c:param>
                <c:param name="nid" value="axisper001" />
            </c:import>   
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISCTR043" lit="9000471" /></c:param>
                <c:param name="nid" value="axisctr043" />
            </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <!-- Body -->        
                <c:import url="axisctr100_a.jsp"/>
            </table>     
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr100</c:param><c:param name="f">axisctr100</c:param><c:param name="f">axisctr100</c:param>
            <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr100">cancelar</axis:visible><axis:visible c="BT_IMPRIMIR" f="axisctr100"><c:if test="${simuOK  =='OK' || BUSCANDO=='1' }">,imprimir</c:if><axis:visible c="BT_9000545" f="axisctr100">,9000545</axis:visible></axis:visible><axis:visible c="BT_GUARDAR" f="axisctr100">,guardar</axis:visible><axis:visible c="BT_CONTRATAR" f="axisctr100">,contratar</axis:visible><axis:visible c="BT_ANTERIOR" f="axisctr100">,anterior</axis:visible><axis:visible c="BT_SIGUIENTE" f="axisctr100">,siguiente</axis:visible></c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
    <script type="text/javascript">
       <axis:visible f="axisctr100" c="FEFECTO">
        Calendar.setup({
            inputField     :    "FEFECTO",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_efecto",  
            singleClick    :    true,
            firstDay       :    1
        });
        </axis:visible>
        
        <axis:visible f="axisctr100" c="FPPREN">
        Calendar.setup({
            inputField     :    "FPPREN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_revision",  
            singleClick    :    true,
            firstDay       :    1
        });
        </axis:visible>
    
        <axis:visible f="axisctr100" c="FVENCIM">
        Calendar.setup({
            inputField     :    "FVENCIM",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_vencimiento",  
            singleClick    :    true,
            firstDay       :    1
        });
        </axis:visible>
        
        <axis:visible f="axisctr100" c="FRENOVA">
        Calendar.setup({
            inputField     :    "FRENOVA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_frenova",  
            singleClick    :    true,
            firstDay       :    1
        });
        </axis:visible>
	
        //JAEG
        <axis:visible f="axisctr100" c="FEFEPLAZO" >
            Calendar.setup({
                inputField     :    "FEFEPLAZO",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "icon_FEFEPLAZO",  
                singleClick    :    true,
                firstDay       :    1
            });
        </axis:visible>
        //JAEG   	
    </script>
</body>
</html>
