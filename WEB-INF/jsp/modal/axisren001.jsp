<%/*
*  Fichero: axisren001.jsp
*  Fecha: 14/03/2011
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        
        <c:if test="${ fn:length(__formdata.listValores.lstempresas) == 1 && (empty __formdata.CRAMO && empty __formdata.SPRODUC)}">
            
            f_recarga_combos('E');
        </c:if>
        
        <c:if test="${!empty __formdata.CEMPRES  && (empty __formdata.CRAMO && empty __formdata.SPRODUC) }">
            f_recarga_combos('E');
        </c:if>
        
        }
                

         
         
        function f_but_aceptar(SSEGURO,SRECREN) {
            var hayChecked = objUtiles.f_GuardaCasillasChecked ("selRenta");
            var valores = new Array();  
            
            if (typeof hayChecked == 'boolean' && objUtiles.estaVacio(SSEGURO)) {
                alert(objJsMessages.jslit_selecciona_registro);
            } else {
                
                // Se han de obtener los valores de la función o del radio
                if(!objUtiles.estaVacio(SSEGURO)){
                
                    parent.f_aceptar_axisren001(SSEGURO,SRECREN);
                    
                }else{
                    
                    var registro = document.miForm.selRentaValor.value;
                    //alert("registro"+registro);
                    valores= registro.split("#");
                    SSEGURO = valores[0];
                    SRECREN = valores[1];
                    
                    parent.f_aceptar_axisren001(SSEGURO,SRECREN);
                }
                
            }
        }
         
         
         
        function f_but_buscar() {
         if (objValidador.validaEntrada())
           objUtiles.ejecutarFormulario("modal_axisren001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_recargar(thiss) {
           if (thiss.value > 0) 
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axisren001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisren001');
            
        }
        
        /* **************************************************** FUNCIONES PANTALLA ************************************************ */
        
        function f_recarga_combos(comboOrigen) {
        //alert("en recarga de combos");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("modal_axisren001.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
        }       
            
            
        function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);    
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); 
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }              
            
            
        function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                // The rest of the method, is unreachable code here, in AXISADM036. We've kept it for future extensions.
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
        }
        
        
        function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                    }
                    
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes
                        combo[0].selected = "1";
                        combo.onchange(); 
                    }
                }
        }
            
        function f_sel_renta(valor){
        
            document.miForm.selRentaValor.value=valor;
        
        }
        
       /* ************************************************************************************************************************* */
       /* ************************************************************************************************************************* */
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operacion" value=""/>
            <input type="hidden" name="selRentaValor" id="selRentaValor" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisren001" c="LIT_FORMULARIO_1" lit="1000206" />&nbsp;<axis:alt f="axisren001" c="LIT_FORMULARIO_2" lit="9001908" /></c:param>
                <c:param name="producto"><axis:alt f="axisren001" c="LIT_PANTALLA_1" lit="1000206" />&nbsp;<axis:alt f="axisren001" c="LIT_PANTALLA_2" lit="9001908" /></c:param>
                <c:param name="form">axisren001</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                      
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisren001" c="CEMPRES" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren001" c="LIT_CEMPRES" lit="101619" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisren001" c="CRAMO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren001" c="LIT_CRAMO" lit="100784" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisren001" c="SPRODUC" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren001" c="LIT_SPRODUC" lit="100829" /></b>
                                                </td>
                                             </axis:visible>	
                                           	                                             
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axisadm054" c="CEMPRES"> 
                                            <c:choose>  
                                                <c:when test="${fn:length(__formdata.listValores.lstempresas) > 1 && !empty __formdata.listValores.lstempresas}">
                                                  <td class="campocaja">
                                                        <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto" obligatorio="true" style="width:90%"
                                                        title="<axis:alt f="axisren001" c="LIT_SEL_CEMPRES" lit="101619" />" onchange="f_recarga_combos('E');"
                                                        <axis:atr f="axisren001" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisren001" c="LIT_SELEC_CEMPRES" lit="108341" /> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.listValores.lstempresas}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                            <c:otherwise> 
                                                 <td class="campocaja">
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="TEMPRES" name="TEMPRES" value = "${__formdata.listValores.lstempresas[0].TEMPRES}"
                                                 <axis:atr f="axisren001" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                 
                                                 <input type= "hidden"  obligatorio="false" id="CEMPRES" name="CEMPRES" value = "${__formdata.listValores.lstempresas[0].CEMPRES}"
                                                 <axis:atr f="axisadm036" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                    </axis:ocultar>
                                    <axis:ocultar f="axisren001" c="CRAMO"> 
                                     <td class="campocaja">
                                                    <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisren001" c="LIT_TIT_CRAMO" lit="100784" />" onchange="f_recarga_combos('R');"
                                                    <axis:atr f="axisren001" c="CRAMO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisren001" c="LIT_SEL_CRAMO" lit="108341" /> - </option>
                                                        <c:forEach items="${DOM_LSTRAMOS}" var="item">
                                                            <option value = "${item.CRAMO}" <c:if test="${!empty __formdata.CRAMO  && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                                        </c:forEach>
                                                    </select>
                                      </td>  
                                    </axis:ocultar>
                                  
                                    <axis:ocultar f="axisren001" c="SPRODUC"> 
                                      <td class="campocaja" colspan="1">
                                                    <select name="SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:95%"
                                                    title="<axis:alt f="axisren001" c="LIT_TIT_SPRODUC" lit="100829" />" <axis:atr f="axisadm054" c="SPRODUC" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisren001" c="LIT_SEL_SPRODUC" lit="108341" /> - </option>
                                                        <c:forEach items="${DOM_LSTPRODUCTOS}" var="item">
                                                            <option value = "${item.SPRODUC}" <c:if test="${!empty __formdata.SPRODUC  && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                        </c:forEach>
                                                    </select>
                                       </td> 
                                   </axis:ocultar>
                                          </tr>
                                          
                                          <tr>
                                           <axis:visible f="axisren001" c="NPOLIZA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren001" c="LIT_NPOLIZA" lit="101273" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisren001" c="NCERTIF" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren001" c="LIT_NCERTIF" lit="101168" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisren001" c="ESTADO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren001" c="LIT_ESTADO" lit="101510" /></b>
                                                </td>
                                             </axis:visible>	
                                           	                                             
                                        </tr>
                                          
                                          <tr>
                                            <axis:visible f="axisren001" c="NPOLIZA">
                                                 <td class="campocaja"> 
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                                    value ="${__formdata.NPOLIZA}" title="<axis:alt f="axisren001" c="ALT_NPOLIZA" lit="100885"/>" <axis:atr f="axisren001" c="NPOLIZA" a="modificable=true"/>/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisren001" c="NCERTIF">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"
                                                    value ="${__formdata.NCERTIF}" title="<axis:alt f="axisren001" c="ALT_NCERTIF" lit="100885"/>" <axis:atr f="axisren001" c="NCERTIF" a="modificable=true"/>/>
                                                 </td>
                                            </axis:visible>
                                            <axis:visible f="axisren001" c="CESTADO">
                                                    <td class="campocaja">
                                                            <select name = "CESTADO" id="CESTADO" style="width:75%;" <axis:atr f="axisctr063" c="CESTADO" a="modificable=true&obligatorio=false"/> size="1" onchange="" class="campowidthselect campo campotexto" >
                                                               <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisren001" c="ALT_SEL_CESTADO" lit="1000348"/> - </option>
                                                               <c:forEach var="testado" items="${__formdata.listvalores.lstestados}">
                                                                  <option value = "${testado.CATRIBU}"
                                                                     <c:if test="${testado.CATRIBU == __formdata.CESTADO}">selected</c:if>>
                                                                     ${testado.TATRIBU}
                                                                  </option>
                                                               </c:forEach>
                                                            </select>
                                                     </td>  
                                              </axis:visible>
                                            <%--axis:visible f="axisren001" c="FCARGA">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FCARGA" name="FCARGA" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCARGA}"/>" title="<axis:alt f="axisren001" c="x" lit="100885"/>" <axis:atr f="axisren001" c="FCARGA" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FCARGA" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisren001" c="ddd" lit="108341" />" title="<axis:alt f="axisren001" c="x1" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible --%>
                                         </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
<div class="separador">&nbsp;</div>                       
                        <!--campos-->
                  <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisren001" c="LISTA_NPAGO" lit="9001909"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisren001" c="LISTA_SDEVOLU" lit="9001911"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisren001" c="LISTA_FEFECTO" lit="101274"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisren001" c="LISTA_TPRENOM" lit="101027"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisren001" c="LISTA_CDOMSUC" lit="101236"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisren001" c="LISTA_CDOMENT" lit="100874"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisren001" c="LISTA_FSOPORT" lit="100883"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisren001" c="LISTA_NPOLIZA" lit="101273"/></c:set>

                                            <div class="seccion displayspaceGrande">
                                            <display:table name="${lista_rentas}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisren001.do?paginar=true"
                                            sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <!-- Nueva tabla - Columnas -->
                                                <display:column title=" " sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                    <div class="dspIcons"><input <c:if test="${miListaId['selRenta']}">checked</c:if> onclick="f_sel_renta('${miListaId.OB_IAX_PAGORENTA.SSEGURO}#${miListaId.OB_IAX_PAGORENTA.SRECREN}');" type="radio" id="selRenta" name="selRenta" value="${miListaId.OB_IAX_PAGORENTA.SSEGURO}#${miListaId.OB_IAX_PAGORENTA.SRECREN}"/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title0}" headerClass="sortable" sortProperty="NUMPAGO"  media="html" autolink="false" >
                                                    <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_PAGORENTA.SSEGURO}','${miListaId.OB_IAX_PAGORENTA.SRECREN}')">${miListaId.OB_IAX_PAGORENTA.SRECREN}</a></div>
                                                </display:column> 
                                                <display:column title="${title1}" headerClass="sortable" sortProperty="BENEFICIARIO"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PAGORENTA.TNOMBRE}</div>
                                                </display:column>
                                                <display:column title="${title6}" headerClass="sortable" sortProperty="FEFECTO"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PAGORENTA.FFECPAG}"/></div>    
                                                </display:column>
                                                <display:column title="${title2}" headerClass="sortable" sortProperty="FEMISION"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_PAGORENTA.FFECEFE}"/></div>    
                                                </display:column>
                                                <display:column title="${title5}" headerClass="sortable" sortProperty="SITUAC"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PAGORENTA.TESTREC}</div>
                                                </display:column>
                                                <display:column title="${title7}" headerClass="sortable" sortProperty="NPOLIZA"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PAGORENTA.NPOLIZA}</div>
                                                </display:column> 
                                                <display:column title="${title4}" headerClass="sortable" sortProperty="NCERTIF"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PAGORENTA.NCERTIF}</div>
                                                </display:column> 
                                                <display:column title="${title3}" headerClass="sortable" sortProperty="TNOMTOM"  media="html" autolink="false" >
                                                    <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId.OB_IAX_PAGORENTA.SSEGURO}','${miListaId.OB_IAX_PAGORENTA.SRECREN}')">${miListaId.OB_IAX_PAGORENTA.TNOMTOM}</a></div>
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
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisren001</c:param><c:param name="f">axisren001</c:param>
                <c:param name="f">axisren001</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FSOPORTE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FSOPORTE", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FCARGA",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCARGA",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>    
    </body>
</html>