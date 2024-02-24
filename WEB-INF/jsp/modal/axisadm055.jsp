<%/*
*  Fichero: axisadm055.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
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
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisadm055();
       }       
    
       function f_onload(){
                f_cargar_propiedades_pantalla();                                
       }            
            
       function f_cargar_propiedades_pantalla(){
                f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
            }
       
       function f_but_buscar(){   
       
            var CEMPRES = objDom.getValorPorId("CEMPRES");
            var SPRODUC = objDom.getValorPorId("SPRODUC");
            var NPOLIZA = objDom.getValorPorId("NPOLIZA");
            var NCERTIF = objDom.getValorPorId("NCERTIF");
            var FVALORA = objDom.getValorPorId("FVALORA");
            var CRAMO = objDom.getValorPorId("CRAMO");
            if (objValidador.validaEntrada()) {
                parent.f_but_buscar(CEMPRES,SPRODUC,NPOLIZA,NCERTIF,FVALORA,CRAMO);
            }
       }
       
       
       function f_recarga_combos(comboOrigen) {
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("modal_axisadm055.do", callbackAjaxActualizarCombos, 
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
            
            function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<fmt:message key="1000421"/>");
                    }
                }
            }  
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="f">axisadm055</c:param>
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisadm055Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9901474" /></c:param>
                <c:param name="producto"><fmt:message key="9901474" /></c:param>
                <c:param name="form">axisadm055</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm055" c="CEMPRES"> 
                                    <td class="titulocaja" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisadm055" c="CEMPRES" lit="101619"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm055" c="CRAMO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm055" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>     
                                 <axis:ocultar f="axisadm055" c="SPRODUC"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm055" c="SPRODUC" lit="100829"></axis:alt></b>
                                    </td>
                                </axis:ocultar>  
                             </tr>
                             <tr>
                               <axis:ocultar f="axisadm055" c="CEMPRES"> 
                                   <c:choose>  
                                                <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                                  <td class="campocaja">
                                                        <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                        title="<fmt:message key="101619"/>" onchange="f_recarga_combos('E')"
                                                        <axis:atr f="axisadm036" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="108341"/> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                    <c:otherwise> 
                                                 <td class="campocaja">
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                 <axis:atr f="axisadm055" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                 </axis:ocultar>
                                 <axis:ocultar f="axisadm055" c="CRAMO"> 
                                     <td class="campocaja">
                                                    <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<fmt:message key="100784"/>" onchange="f_recarga_combos('R');"
                                                    <axis:atr f="axisadm055" c="CRAMO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                        <c:forEach items="${DOM_LSTRAMOS}" var="item">
                                                            <option value = "${item.CRAMO}" <c:if test="${__formdata.CRAMO != 'null' && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                                        </c:forEach>
                                                    </select>
                                      </td>  
                                  </axis:ocultar>
                                  
                                  <axis:ocultar f="axisadm055" c="SPRODUC"> 
                                      <td class="campocaja" colspan="1">
                                                    <select name="SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:95%"
                                                    title="<fmt:message key="100829"/>" <axis:atr f="axisadm055" c="SPRODUC" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                        <c:forEach items="${DOM_LSTPRODUCTOS}" var="item">
                                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata.SPRODUC != 'null' && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                        </c:forEach>
                                                    </select>
                                       </td> 
                                   </axis:ocultar>
                             </tr>
                             <%-- SECCION 2 --%>
                             <tr> 
                            
                                <axis:ocultar f="axisadm055" c="NPOLIZA"> 
                                    <td class="titulocaja" ><!-- PÓLIZA -->
                                         <b><axis:alt f="axisadm055" c="NPOLIZA" lit="9001875"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisadm055" c="NCERTIF"> 
                                    <td class="titulocaja" ><!-- NCERTIF -->
                                         <b><axis:alt f="axisadm055" c="NCERTIF" lit="101236"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>  
                                <axis:ocultar f="axisadm055" c="FVALORA"> 
                                    <td class="titulocaja" ><%-- Fecha Valoración --%>
                                        <b><axis:alt f="axisadm055" c="FVALORA" lit="105957"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>  
                             </tr>
                             <tr>       
                             
                                <%-- Póliza --%>
                                <axis:ocultar f="axisadm055" c="NPOLIZA"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" style="width:80%"
                                                           value =  "${__formdata.NPOLIZA}" />                                                        
                                    </td>
                                </axis:ocultar>
                                <%-- Cert --%>
                                <axis:ocultar f="axisadm055" c="NCERTIF"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NCERTIF" name="NCERTIF" size="15" style="width:20%"
                                                           value =  "${__formdata.NCERTIF}" />                                                        
                                    </td>
                                </axis:ocultar>                             
                                <%-- Fecha Valoración --%>
                                <axis:ocultar f="axisadm055" c="FVALORA"> 
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto_ob" size="15"                                               
                                                    value="<fmt:formatDate value='${__formdata.FVALORA}' pattern='dd/MM/yyyy'/>" name="FVALORA" id="FVALORA" obligatorio="true" onblur="javascript:f_formatdate(this,'')"
                                                    style="width:40%;" alt="<fmt:message key="105957"/>" title="<fmt:message key="105957"/>"
                                                    <axis:atr f="axisadm055" c="FVALORA" a="formato=fecha"/> /><a id="icon_FVALORA" style="vertical-align:middle;"><img 
                                                    alt="<fmt:message key="105957"/>" title="<fmt:message key="105957" />" src="images/calendar.gif"/></a>
                                    </td>                             
                                </axis:ocultar>
                             </tr>
                        
                        
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FVALORA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FVALORA", 
            singleClick    :    true,
            firstDay       :    1
            });            
            
         
</script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

