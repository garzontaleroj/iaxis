<%/*
*  Fichero: axifinv005.jsp
*  Fecha: 19/03/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            revisarEstilos();
			f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisfinv005');
        }        
                        
    </script>
  </head>
    <body class=" " onload="f_onload()" >
          <!--onkeypress="if (event.keyCode==13)  { f_but_buscar() }" -->
          
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="axisfinv005" f="axisfinv005" lit="180929" /></c:param>
                <c:param name="form">axisfinv005</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="axisfinv005" f="axisfinv005" lit="180929" /></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:80%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b id="label_CCODFON"><axis:alt f="axisfinv005" c="CCODFON" lit="9001352" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                    <b id="label_FINVERS"><axis:alt f="axisfinv005" c="FINVERS" lit="9001288" /></b>
                                             </td>
                                        </tr>
                                        <tr>
                                        
                                            <!-- Codi Fons -->
                                                <td class="campocaja"> <!-- colspan: uneix dos TDs, size: long dins el inputbox-->
                                                    <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="CCESTA" name="CCESTA" size="20"
                                                    value="${__formdata.CCESTA}" readonly="true" />
                                                </td> 
    

                                             <!-- Desc Fons -->   
                                                <td class="campocaja" >
                                                    <input type="text" style="width:50%" class="campowidthinput campo campotexto" id="DESC_FONS" name="DESC_FONS" size="20"
                                                    value="${__formdata.TFONABV}" readonly="true" />
                                                </td>                                                 
                                         </tr>
                                    </table>
                                </td>
                            </tr>
                        <tr>
                        <td align="left">
                             <table border="0" class="area" align="left" style="width:100%;">
                                <tr>
                                    <td>
                                        <c:set var="title1"><axis:alt f="axisfinv005" c="FVALOR" lit="105957"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisfinv005" c="IUNIACT" lit="108897"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisfinv005" c="VARINUM" lit="103983"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisfinv005" c="VARISIG" lit="107675"/></c:set>
                                         <c:set var="title6"><axis:alt f="axisfinv005" c="IUNIULTCMP" lit="9906967"/></c:set>
                                         <c:set var="title7"><axis:alt f="axisfinv005" c="IUNIULTVTASHW" lit="9906968"/></c:set>
                                         <c:set var="title8"><axis:alt f="axisfinv005" c="IUNIULTCMPSHW" lit="9906969"/></c:set>
                                        <div class="displayspace">
                                            <display:table name="${sessionScope.T_IAX_TABVALCES}" id="miListaId" export="false" class="dsptgtable" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                            requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}" sortable="false" sortProperty="FVALOR" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_TABVALCES.FVALOR}"/> - ${miListaId.OB_IAX_TABVALCES.DIASEM}</div>
                                                </display:column>
                                                 <display:column title="${title3}" sortable="false" sortProperty="IUNIACT" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.OB_IAX_TABVALCES.IUNIACT}'/></div>
                                                </display:column>   
                                                  <display:column title="${title6}" sortable="false" sortProperty="IUNIULTCMP" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.OB_IAX_TABVALCES.IUNIULTCMP}'/></div>
                                                </display:column>    
                                                  <display:column title="${title7}" sortable="false" sortProperty="IUNIULTVTASHW" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.OB_IAX_TABVALCES.IUNIULTVTASHW}'/></div>
                                                </display:column>    
                                                  <display:column title="${title8}" sortable="false" sortProperty="IUNIULTCMPSHW" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.OB_IAX_TABVALCES.IUNIULTCMPSHW}'/></div>
                                                </display:column>    
                                                 <display:column title="${title4}" sortable="false" sortProperty="VARINUM" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.000000" value='${miListaId.OB_IAX_TABVALCES.VARINUM}'/></div>
                                                </display:column>                                                
                                                <display:column title="${title5}" sortable="false" sortProperty="VARISIG" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                    <div class="dspText"> ${miListaId.OB_IAX_TABVALCES.VARISIG}</div>
                                                </display:column>
                                            </display:table>

                                        </div>                
                                    </td>
                                </tr>
                            </table>
                        </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisfinv005</c:param>
				<c:param name="__botones">cancelar</c:param>
            </c:import>
            
            <script type="text/javascript">
                Calendar.setup({
                    inputField     :    "FVALOR",     
                    ifFormat       :    "%d/%m/%Y",      
                    button         :    "icon_FVALOR", 
                    singleClick    :    true,
                    firstDay       :    1
                });
            </script>
            
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

