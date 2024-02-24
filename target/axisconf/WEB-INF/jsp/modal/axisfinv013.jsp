<%/*
*  Fichero: axisfinv013.jsp
*  Fecha: 19/03/2009
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
    
    <script language="Javascript" type="text/javascript">
        
        
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload(){
             f_cargar_propiedades_pantalla();     
        }
        function f_but_buscar(){
                 if (objValidador.validaEntrada()) {
                  var pCEMPRES = '';
                  var pCCODFON  = document.miForm.CCODFON.value;
                  var pTCODFON  = document.miForm.TCODFON.value;
                  var lstpCMONEDA  = document.miForm.list_CMONEDA;
                  var lstpCMANAGER = document.miForm.list_CMANAGER;
                  
                 
                  var pCMONEDA  = lstpCMONEDA.options[lstpCMONEDA.selectedIndex].value;
                  var pCMANAGER = lstpCMANAGER.options[lstpCMANAGER.selectedIndex].value;
                  
                  if(pCMONEDA<0){
                      pCMONEDA = null;
                  }
                  if(pCMANAGER<0){
                      pCMANAGER = null;
                  }
                  if(lstpCMANAGER < 0){
                      lstpCMANAGER = null;
                  }
                  if(lstpCMONEDA < 0){
                      lstpCMONEDA = null;
                  }
                  //alert(pCCODFON+"#"+pTCODFON+"#"+pCMONEDA+"#"+pCMANAGER);
                    parent.f_buscar_modal('axisfinv013', "?pCEMPRES=" + pCEMPRES + "&pCCODFON=" + pCCODFON + "&pTCODFON=" + pTCODFON+"&pCMONEDA="+pCMONEDA+"&pCMANAGER="+pCMANAGER);
                 }
        }
        
         function f_but_cancelar() {
             parent.f_cerrar_axisfinv013();
        }
        
        function f_but_nuevo(){
        
            //     objUtiles.abrirModal('axisfinv015', "src", "modal_axisfinv015" + ".do?operation=form");
            parent.f_but_nuevo_axisfinv013();
        }
        
    </script>
 </head> 
 <body onload="f_onload()" >
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
     <form name="miForm" action="" method="POST">
                    <input type="hidden" id="operation" name="operation" value="form"/>
        
        
                    <c:import url="../include/titulo_nt.jsp">
                                <c:param name="formulario"><axis:alt f="axisfinv013" c="FORMULARIO" lit="9906551"/></c:param>
                                <c:param name="producto"><axis:alt f="axisfinv013" c="PRODUCTO" lit="9906551"/></c:param>
                                <c:param name="form">axisfinv013</c:param>
                    </c:import>
                    <c:import url="../include/modal_estandar.jsp">
                       <c:param name="titulo"><axis:alt f="axisfin013" c="MODAL_AXISFIN015" lit="9906552" /></c:param>
                       <c:param name="nid" value="axisfinv015"></c:param>
                    </c:import>
                <!-- Area de campos  -->
                   <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>                            
                        </tr>
                        <tr>
                            <td class="titulocaja" id="LIT_CCODFON">
                                <b><axis:alt f="axisfinv015" c="CCODFON" lit="9001352"/></b>
                             </td>
                             <td class="titulocaja" id="LIT_TCODFON">
                                <b><axis:alt f="axisfinv015" c="TCODFON" lit="9001292"/></b>
                             </td>
                        </tr>
                        <tr>
                             <td class="campocaja">
                                <input id="CCODFON" name="CCODFON" type="text" class="campowidthinput campo campotexto"  title="<axis:alt f='axisfinv013' c='CCODFON' lit='1000109'/>"></input>
                             </td>
                             <td class="campocaja">
                                <input id="TCODFON" name="TCODFON" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv013' c='TFON' lit='100588'/>"></input>
                             </td>
                        </tr>
                        <tr>
                             <td class="titulocaja" id="LIT_CMONEDA">
                                <b><axis:alt f="axisfinv015" c="CMONEDA" lit="108645"/></b>
                             </td>
                             <td class="titulocaja" id="LIT_CMANAGER">
                                <b><axis:alt f="axisfinv015" c="CMANAGER" lit="9906548"/></b>
                             </td>
                        </tr>
                        <tr>
                             <td class="campocaja">
                                <select title="<axis:alt f='axisfinv013' c='CMONEDA' lit='108645'/>" name = "list_CMONEDA" id="list_CMONEDA" size="1" 
                                                                class="campowidthselect campo campotexto">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv013" c="SNV_COMBO" lit="108341"/> - </option>
                                                                <c:forEach var="moneda" items="${monedas}">
                                                                     <option value = "${moneda.CMONEDA}"
                                                                        <c:if test="${__fromdata.selected_CMONEDA == moneda.CMONEDA}">selected</c:if>>
                                                                        ${moneda.TMONEDA}
                                                                     </option>
                                                                </c:forEach> 
                                </select>
                                <input type="hidden" id="selected_CMONEDA"/>
                             </td>
                             <td class="campocaja">
                                <select title="<axis:alt f='axisfinv013' c='CMANAGER' lit='9001288'/>" name = "list_CMANAGER" id="list_CMANAGER" size="1" 
                                                                class="campowidthselect campo campotexto">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv013" c="SNV_COMBO" lit="108341"/> - </option>
                                                                <c:forEach var="manager" items="${managers}">
                                                                     <option value = "${manager.OB_IAX_GESTORAS.CCODGES}"   
                                                                        <c:if test="${__fromdata.selected_CMANAGER == manager.OB_IAX_GESTORAS.ccodges}">selected</c:if>>
                                                                        ${manager.OB_IAX_GESTORAS.PERSONA['TNOMBRE']}
                                                                        ${manager.OB_IAX_GESTORAS.PERSONA['TAPELLI1']}&nbsp;
                                                                        ${manager.OB_IAX_GESTORAS.PERSONA['TAPELLI2']}
                                                                      </option>
                                                                </c:forEach>
                                </select>
                                <input type="hidden" id="selected_CMANAGER"/>
                            
                             </td>
                        </tr>
                    </table>
                    
                <div class="separador">&nbsp</div>
                <c:import url="../include/botonera_nt.jsp">
                   <c:param name="f">axisfinv013</c:param>
                   <c:param name="__botones">cancelar,buscar,nuevo</c:param>
                </c:import>
            
         </form> 
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>