<%/*
*  Fichero: axisctr501.jsp
* 15/06/2010/
* @author <a href="jdelrio@csi-ti.com">Javi del Rio</a>
*
*/
%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title> <axis:alt f="axisctr501" c="LIT_TITULO" lit="9903338"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    
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
        
    <c:import url="../include/carga_framework_js.jsp"/>

    
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload() {
           revisarEstilos();
      
           <% if (request.getSession().getAttribute("abremodal") != null ) { %>  
               
               //objUtiles.abrirModal("axisctr501export","src","axisctr501export.jsp",300,80);  
               objUtiles.abrirModal("axisctr501export","src","modal_axisexporter.do?operation=axisctr501export",300,80); 
               
           <% } %>                
           f_cargar_propiedades_pantalla();
        }
      
        function f_but_salir() {
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr501", "cancelar", document.miForm, "_self");
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr501", "cancelar", document.miForm, "_self");
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }      

        
             
        
        function f_but_109006() {

                    var FDESDE = document.miForm.FDESDE.value;
                    var FHASTA = document.miForm.FHASTA.value;
                    var CDELEGA = document.miForm.CDELEGA.value;
           //  var parametres = '&CEMPRES='+objDom.getValorPorId("CEMPRES")+'&NANYO='+objDom.getValorPorId("NANYO")+'&NMES='+objDom.getValorPorId("NMES")+'&MODOCARTERA='+objDom.getValorPorId("MODOCARTERA");
           if (objValidador.validaEntrada()) {              
                objUtiles.ejecutarFormulario("axis_axisctr501.do", "consultar",document.miForm, "_self", objJsMessages.jslit_cargando);
                                }
        }
      
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr501" c="LIT_TITULO" lit="1000205"/>|true</c:param>
    </c:import>    
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axisctr501" c="LIT_TITULO" lit="9903338"/></b></c:param>    
            <c:param name="formulario"> <b> <axis:alt f="axisctr501" c="LIT_TITULO" lit="9903338"/></b></c:param> 
            <c:param name="form">axisctr501</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" name="CDELEGA" value=""/>
        <input type="hidden" name="abremodal" value="${abremodal}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
        <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                    </tr>
                                    <tr>
                                    <td class="titulocaja" id="LFDESDE">                                    
                                            <b><axis:alt f="axisctr501" c="LIT_LFDESDE" lit="9000526"/></b> <!--DATA INICI-->
                                        </td>
                                        <td class="titulocaja" id="LFHASTA">
                                            <b><axis:alt f="axisctr501" c="LIT_LFHASTA" lit="9000527"/></b> <!--DATA FI-->
                                        </td>                                       
                                        </tr>
            <tr> 
                <td class="campocaja" >
                    <input type="text" formato="fecha" <axis:atr f="axisadm047" c="FDESDE" a="modificable=true&isInputText=false&obligatorio=true"/>
                           name="FDESDE" id="FDESDE"  style="width:30%;"  value=""  class="campowidthinput campo campotexto_ob"/>
                    <a id="icon_FDESDE" style="vertical-align:middle;">
                    <img alt="<axis:alt f="axisctr501" c="LIT_FDESDE" lit="108341"/>" title="<axis:alt f="axisctr501" c="LIT_TITFDESDE" lit="100883"/>" src="images/calendar.gif"/></a>
                </td>            
                <td class="campocaja">
                    <input type="text" formato="fecha" <axis:atr f="axisadm047" c="FHASTA" a="modificable=true&isInputText=false&obligatorio=true"/>
                           name="FHASTA" id="FHASTA" style="width:30%;"   value=""  class="campowidthinput campo campotexto_ob"/>
                    <a id="icon_FHASTA" style="vertical-align:middle;">
                    <img alt="<axis:alt f="axisctr501" c="LIT_FHASTA" lit="108341"/>" title="<axis:alt f="axisctr501" c="LIT_TITFHASTA" lit="100883"/>" src="images/calendar.gif"/></a>
                </td>
           </tr>   
         </table>
                

<%--<display:table name="${REC_LSTCARTERA}" id="miLista" export="true" class="dsptgtable" pagesize="-1" style="visibility:hidden;display:none"  requestURI="axisctr501export.jsp" sort="list" cellpadding="0" cellspacing="0">
    <display:column title="Póliza"          media="csv excel xml">${miLista.NPOLIZA         }</display:column>
    <display:column title="Comisión"          media="csv excel xml">${miLista.ICOMISINET         }</display:column>
    <display:setProperty name="export.excel.filename" value="nombre_de_fichero_para_grabarlo_local.xls" />
    <display:setProperty name="export.csv.filename" value="nombre_de_fichero_para_grabarlo_local.csv" />
    <display:setProperty name="export.xml.filename" value="nombre_de_fichero_para_grabarlo_local.xml" /> 
</display:table>--%>

        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir,109006</c:param> 
        </c:import>
        
        <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FDESDE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FDESDE", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
     <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FHASTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FHASTA", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <c:import url="../include/modal_estandar.jsp">
    				<c:param name="f">axisctr501export</c:param> 
            <c:param name="nid">axisctr501export</c:param>
            <c:param name="botonCerrar" value="true" />
    </c:import>
    
</body>
</html>