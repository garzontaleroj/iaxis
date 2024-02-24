<%/*
*  Fichero: axifinv015.jsp
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
    
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_but_cancelar(){
                 parent.f_cerrar_axisfinv015();
            }
        function f_but_aceptar(){
             if(objValidador.validaEntrada()) {     
                 var form = document.miForm;
                 var pCEMPRES = form.LCEMPRES.options[form.LCEMPRES.selectedIndex].value;
                 var pTCODFON  = form.TCODFON.value;
                 var pPTFONABV  = form.pPTFONABV.value;
                 var pCMONEDA = form.LCMONEDA.options[form.LCMONEDA.selectedIndex].value;
                 var pCMANAGER= form.LCMANAGER.options[form.LCMANAGER.selectedIndex].value;
                 var pCDIVIDEND= form.CDIVIDEND.checked;
                 
                 if (pCDIVIDEND){
                     pCDIVIDEND=1
                 }
                 else{
                     pCDIVIDEND=0;
                 }
                 
                 //alert('pCDIVIDEND->'+pCDIVIDEND);
                 
                 var pMAXCONT ='';
                 if(form.EXPTRANS){
                  pMAXCONT = form.PMAXCONT.value;
                 }
                 
                 
                 var pCCLSFONS= form.LCCLSFONS.options[form.LCCLSFONS.selectedIndex].value;
                 var pCTIPFON = form.LCTIPFON.options[form.LCTIPFON.selectedIndex].value;
                 var pCCODFON = form.CCODFON.value;
                 var EXPTRANS ='';
                 if(form.EXPTRANS){
                  EXPTRANS = form.EXPTRANS.value;
                 }
                 
                 
                 var selcmodabo='';
                 if(form.selcmodabo){
                    selcmodabo = form.selcmodabo.value;
                 }
                  var ndayaft ='';
                 if(form.NDAYAFT){
                    ndayaft = form.NDAYAFT.value;
                 }
                 var pNPERIODBON = form.pNPERIODBON.value;
                 objAjax.invokeAsyncCGI("modal_axisfinv015.do?pCEMPRES="+pCEMPRES+"&pTCODFON="+pTCODFON+"&pCMONEDA="
                                    +pCMONEDA+"&pCMANAGER="+pCMANAGER+"&pMAXCONT="+pMAXCONT+"&pCCLSFONS="+pCCLSFONS+"&pCTIPFON="+pCTIPFON
                                    +"&pCCODFON="+pCCODFON+"&pEXPTRANS="+EXPTRANS+"&selcmodabo="+selcmodabo+"&NDAYAFT="+ndayaft+"&pPTFONABV="+pPTFONABV+"&pNPERIODBON="+pNPERIODBON+"&pPCDIVIDEND="+pCDIVIDEND,
                                 callbackAjaxGuardarFondo, "operation=guardarFondo", this, objJsMessages.jslit_cargando);
                
             }
        }
        function callbackAjaxGuardarFondo(){
                parent.f_cerrar_axisfinv015();
        }
        
        
 </script>
 </head> 
 <body onload="f_onload()" >
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
     <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value="form"/>
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.selected_CEMPRES}"/>
            <input type="hidden" id="CCODFON" name="CCODFON" value="${__formdata.CCODFON}"/>
           
       
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisfinv015" c="FORMULARIO" lit="9906552"/></c:param>
                <c:param name="producto"><axis:alt f="axisfinv015" c="PRODUCTO" lit="9906552"/></c:param>
                <c:param name="form">axisfinv015</c:param>
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
                     <td class="titulocaja" id="LIT_CEMPRES">
                        <b><axis:alt f="axisfinv015" c="CEMPRES" lit="101619"/></b>
                     </td>
                  </tr>
                  <tr>
                     <td class="campocaja">
                          <select title="<axis:alt f="axisfinv015" c="CEMPRES" lit="108645"/>" name = "LCEMPRES" id="LCEMPRES" size="1" 
                                                        class="campowidthselect campo campotexto" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv015" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="empresa" items="${empresas}">
                                                            <option value = "${empresa.CEMPRES}"
                                                                <c:choose>
                                                                    <c:when test="${PCEMPRES == empresa.CEMPRES}">selected</c:when>
                                                                </c:choose>>
                                                                ${empresa.TEMPRES}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                     
                     </td>
                     
                  </tr>
                  <tr>
                     <td class="titulocaja" id="LIT_CMONEDA">
                         <b><axis:alt f="axisfinv015" c="LIT_CMONEDA" lit="108645"/></b>
                     </td>
                     <td class="titulocaja" id="LIT_CMANAGER">
                         <b><axis:alt f="axisfinv015" c="LIT_CMANAGER" lit="9906548"/></b>
                     </td>
                     <axis:visible f="axisfinv015" c="CMODABO">
                     <td class="titulocaja" id="LIT_CMODABO">
                         <b><axis:alt f="axisfinv015" c="LIT_CMODABO" lit="9901319"/></b>
                     </td>
                     </axis:visible>
                  </tr>
                  <tr>
                     <td class="campocaja">
                          <select title="<axis:alt f="axisfinv015" c="CMONEDA" lit="108645"/>" name = "LCMONEDA" id="LCMONEDA" size="1" 
                                                        class="campowidthselect campo campotexto" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv015" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="moneda" items="${monedas}">
                                                            <option value = "${moneda.CMONEDA}"
                                                                <c:choose>
                                                                    <c:when test="${fondo.PCMONEDA == moneda.CMONEDA}">selected</c:when>
                                                                </c:choose>>
                                                                ${moneda.TMONEDA}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                     
                     </td>
                     <td class="campocaja">
                          <select title="<axis:alt f="axisfinv015" c="CMANAGER" lit="9001288"/>" name = "LCMANAGER" id="LCMANAGER" size="1" 
                                                        class="campowidthselect campo campotexto" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv015" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="manager" items="${managers}">
                                                           <option value = "${manager.OB_IAX_GESTORAS.CCODGES}"   
                                                                        <c:if test="${fondo.PCMANAGER == manager.OB_IAX_GESTORAS.ccodges}">selected</c:if>>
                                                                        ${manager.OB_IAX_GESTORAS.PERSONA['TNOMBRE']}
                                                                        ${manager.OB_IAX_GESTORAS.PERSONA['TAPELLI1']}&nbsp;
                                                                        ${manager.OB_IAX_GESTORAS.PERSONA['TAPELLI2']}
                                                                      </option>
                                                        </c:forEach>
                                                    </select>
                    
                     </td>
                    <axis:visible f="axisfinv015" c="CMODABO">
                     <td class="campocaja">
                               <select name="selcmodabo" id="selcmodabo" title="<axis:alt f="axisctr216" c="CTIPABO" lit="100943"/> "   class="campowidthselect campo campotexto"                                          
                                                                             <axis:atr f="axisctr216" c="CMODABO" a="obligatorio=true&modificable=true&isInputText=false"/>  size="1" <c:if  test="${__formdata.perfLibre != __formdata.CMODINV }">class="campotexto_ob"</c:if> style="width:100%">
                                                                             &nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr216" c="LST_PERFILES" lit="1000348"/> - </option>
                                                                
                                                                <c:forEach var="element" items="${LST_MODABO}">
                                                                    <option value="${element.CATRIBU}"
                                                                            <c:if  test='${fondo.PCMODABO == element.CATRIBU}'>selected</c:if>>
                                                                            
                                                                        ${element.TATRIBU}   
                                                                </option>
                                                                </c:forEach>
                                                                </select>    
                    </td>
                    </axis:visible>
                  </tr>
                  <tr>
                     <td class="titulocaja" id="LIT_CCLSFONS">
                        <b><axis:alt f="axisfinv015" c="CCLSFONS" lit="106015"/></b>
                     </td>
                     <td class="titulocaja" id="LIT_CTIPFON">
                        <b><axis:alt f="axisfinv015" c="CTIPFON" lit="106016"/></b>
                     </td>
                      <axis:visible f="axisfinv015" c="NDAYAFT">
                         <td class="titulocaja" id="LIT_NDAYAFT">
                            <b><axis:alt f="axisfinv015" c="NDAYAFT" lit="9907084"/></b>
                         </td>                      
                      </axis:visible>
                  </tr>
                  <tr>
                     <td class="campocaja">
                          <select title="<axis:alt f="axisfinv015" c="CCLSFON" lit="108645"/>" name = "LCCLSFONS" id="LCCLSFONS" size="1" 
                                                        class="campowidthselect campo campotexto" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv015" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="claseFondo" items="${claseFondos}">
                                                            <option value = "${claseFondo.CATRIBU}"
                                                                <c:choose>
                                                                    <c:when test="${fondo.PCCLSFON == claseFondo.CATRIBU}">selected</c:when>
                                                                </c:choose>>
                                                                ${claseFondo.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                    
                     </td>
                     <td class="campocaja">
                          <select title="<axis:alt f="axisfinv015" c="CTIPFON" lit="9001288"/>" name = "LCTIPFON" id="LCTIPFON" size="1" 
                                                        class="campowidthselect campo campotexto" >
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv015" c="SNV_COMBO" lit="108341"/> - </option>
                                                        <c:forEach var="tipfon" items="${tipoFondos}">
                                                            <option value = "${tipfon.CATRIBU}"
                                                                <c:choose>
                                                                    <c:when test="${fondo.PCTIPFON == tipfon.CATRIBU}">selected</c:when>
                                                                </c:choose>>
                                                                ${tipfon.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                        
                     </td>
                     <axis:visible f="axisfinv015" c="NDAYAFT">
                     <td class="campocaja">
                      <input id="NDAYAFT" name="NDAYAFT" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='NDAYAFT' lit='100588'/>" value="${fondo.PNDAYAFT}"></input>
                     </td>
                     </axis:visible>
                  </tr>
                  <tr>
                     <td class="titulocaja" id="LIT_pPTFONABV">
                          <b><axis:alt f="axisfinv015" c="pPTFONABV" lit="9907215"/></b>
                     </td>
                     <td class="titulocaja" id="LIT_TCODFON">
                          <b><axis:alt f="axisfinv015" c="TCODFON" lit="9906549"/></b>
                     </td>
                  <axis:visible f="axisfinv015" c="PMAXCONT">
                     <td class="titulocaja" id="LIT_PMAXCONT">
                          <b><axis:alt f="axisfinv015" c="PMAXCONT" lit="9906554"/></b>
                     </td>
                     </axis:visible>
                     <axis:visible f="axisfinv015" c="NPERIODBON">
                     <td class="titulocaja" id="NPERIODBON">
                          <b><axis:alt f="axisfinv015" c="NPERIODBON" lit="9907311"/></b>
                     </td>
                     </axis:visible>
                      
                     <td class="titulocaja" id="LIT_CDIVIDEND">
                        <b><axis:alt f="axisfinv015" c="LIT_CDIVIDEND" lit="9908494"/></b>
                     </td>  
                
                  </tr>
                  <tr>
                     <td class="campocaja">
                        <input id="pPTFONABV" name="pPTFONABV" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='TFONABV' lit='100588'/>" value="${fondo.PTFONABV}"></input>
                     </td>
                     <td class="campocaja">
                        <input id="TCODFON" name="TCODFON" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='TFON' lit='100588'/>" value="${fondo.PTFONCMP}"></input>
                     </td>
                     <axis:visible f="axisfinv015" c="PMAXCONT">
                     <td class="campocaja">
                        <input id="PMAXCONT" name="PMAXCONT" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='TFON' lit='100588'/>" value="${fondo.PNMAXUNI}"></input>
                     </td>
                     </axis:visible>
                     
                     <axis:visible f="axisfinv015" c="pNPERIODBON">
                     <td class="campocaja">
                        <input id="pNPERIODBON" name="pNPERIODBON" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='TFON' lit='100588'/>" value="${fondo.PNPERIODBON}"></input>
                     </td>
                     </axis:visible>
                
                 <axis:visible f="axisfinv015" c="pCDIVIDEND">
                  
                     <td class="campocaja">
                        <input id="CDIVIDEND" name="CDIVIDEND" type="checkbox" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='CDIV' lit='9908494'/>" value="${fondo.CDIVIDEND}"></input>
                     </td>
                  
               </axis:visible>
                     
                  </tr>
                 <axis:visible f="axisfinv015" c="EXTRANS">
                  <tr>
                     <td class="titulocaja" id="LIT_EXTRANS">
                        <b><axis:alt f="axisfinv015" c="EXTRANS" lit="9906550"/></b>
                     </td>  
                  </tr>
                  <tr>
                     <td class="campocaja">
                        <input id="EXPTRANS" name="EXPTRANS" type="text" class="campowidthinput campo campotexto" title="<axis:alt f='axisfinv015' c='TFON' lit='100588'/>" value="${fondo.PIGASTTRAN}"></input>
                     </td>
                  </tr>
                  </axis:visible>
                 
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axiscomi015</c:param><c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>