<%/*
*  Fichero: axisrmb003.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 22/08/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
    /*    function f_but_cancelar() {
           parent.f_cerrar_modal('axisrmb003');                      
           // TODO: Esto sólo si es nuevo, si modificamos no
           parent.f_abrir_modal('axisrmb001');  
        }*/
        
        function f_but_cancelar() {
        //isNew ='${__formdata.isNew}';
        if(document.miForm.NREEMB){
        parent.f_cerrar_axisrmb003(false);
        }else{
        parent.f_cerrar_axisrmb003(true);
        }
        } 

        
        
        function f_onload() {
            revisarEstilos();
            var PSNREEMB = "${__formdata.NREEMB_OUT}"; 
            var SALTAR = "${__formdata.SALTAR}"; 
            
            if (!objUtiles.estaVacio(PSNREEMB))
                parent.f_aceptar_axisrmb003( PSNREEMB,SALTAR);
                
                
            <axis:visible c="SKIP_AXISRMB003" f="axisrmb003">   
            if (!objUtiles.estaVacio(SALTAR) && SALTAR == 1) 
                  f_but_aceptar();                
            </axis:visible>
                
        }
        
         
             
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisrmb003.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisrmb003.do" method="POST">     
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" id="SALTAR" name="SALTAR" value="${__formdata.SALTAR}"/>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><fmt:message key="9000444"/></c:param>      <%-- ALTA DE REEMBOLSOS --%>
            <c:param name="formulario"><fmt:message key="9000444"/></c:param>  <%-- ALTA DE REEMBOLSOS --%>
            <c:param name="form">axisrmb003</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                               <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="104925" /></div>
                                <table class="area" align="center">                    
                                    <tr>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                    </tr>
                                      <tr>
                                <!-- Numero de poliza -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9001514" /></b>
                                </td>
                                <!-- Certificado -->
                                <td class="titulocaja">
                                    <b><fmt:message key="101168" /></b>
                                </td>
                                <!-- Situación -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100874" /></b>
                                </td>
                                  <!-- Producto -->
                                <td class="titulocaja" >
                                    <b><fmt:message key="100829"/></b>
                                </td>
                             </tr>
                             <tr>
                                <!-- Numero de poliza -->
                                <td class="campocaja">
                                    <input readonly="true" type="text" style="width:50%;" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                    value="${__formdata.NPOLIZA}"/>
                                </td>
                                <!-- Certificado -->
                                <td class="campocaja" >
                                    <input readonly="true" type="text" style="width:25%;" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"
                                    value="${__formdata.NCERTIF}"/>
                                </td>
                                 <!-- Situación -->
                                <td class="campocaja">
                                    <input readonly="true" type="text" style="width:95%;" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15"
                                    value="${__formdata.TSITUAC}"/>
                                </td>
                                  <!-- Producto -->
                                <td colspan="2" class="campocaja">
                                    <input readonly="true" style="width:97.5%;" type="text" class="campo campotexto" id="TPRODUC" name="TPRODUC"
                                    value="${__formdata.TPRODUC}"/>
                                </td>
                               
                            </tr>
                            </td>
                            </tr>
                            </table>
                            <table style="width:100%;border-style: none;border-width: 1px;border-color: #EEEEEE;">
                            
                        <tr>
                            <td> 
                            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9000468" /></div>
                                   <table class="area" align="center">                    
                                        <tr>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                    </tr>
                                    <tr>
                                    
                                     <c:if test="${!empty __formdata.NREEMB}">
                                        <td class="titulocaja">
                                            <b><fmt:message key="9001512"/></b> <%-- Nº Reembolso --%>
                                        </td>
                                    </c:if>
                                        <td class="titulocaja">
                                            <b><fmt:message key="100587"/></b>                              <%-- Estado --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><fmt:message key="9000450"/></b>                             <%-- F. Estado --%>
                                        </td>                            
                                        <td class="titulocaja">
                                            <b><fmt:message key="9000437"/></b>                             <%-- F. Recepción --%>
                                        </td> 
                                        <td class="titulocaja">
                                            <b><fmt:message key="9000523"/></b>                             <%-- F. Recepción --%>
                                        </td>  
                                    </tr>
                                    <tr>
                                    <c:if test="${!empty __formdata.NREEMB}">
                                        <td class="campocaja">                             
                                            <input type="text" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.NREEMB}" name="NREEMB" id="NREEMB"
                                            style="width:50%;" <axis:atr f="axisrmb003" c="NREEMB" a="formato=entero"/>
                                            title="<fmt:message key="9001512"/>"/>
                                        </td>
                                        </c:if>
                                        <td class="campocaja">  
                                        <c:choose>
                                            <c:when test="${!empty __formdata.NREEMB}">
                                                <select name="CESTADO"  id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:98%;" <axis:atr f="axisrmb003" c="CESTADO" a="isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.lstEstados}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CESTADO}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden"  value="${__formdata.CESTADO}" name="CESTADOHIDDEN" id="CESTADOHIDDEN"/>
                                                
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" value="${__formdata.CESTADO}" name="CESTADO" id="CESTADO"/>
                                                <input type="text" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.TESTADO}" name="TESTADO" id="TESTADO" style="width:95%;" />
                                             </c:otherwise>
                                        </c:choose>
                                        
                                        </td>        
                                        <td class="campocaja">   
                                                <input type="text" readonly class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value="${__formdata.FESTADO}" pattern="dd/MM/yyyy"/>" style="width:50%;"  name="FESTADO" id="FESTADO">
                                        </td>        
                                        <td class="campocaja">  
                                        
                                                <input type="text" readonly class="campowidthinput campo campotexto" size="15" style="width:50%;"  value="<fmt:formatDate value="${__formdata.FALTA}" pattern="dd/MM/yyyy"/>" name="FALTA" id="FALTA">
                                        
                                        </td>  
                                        
                                        <td class="campocaja">  
                                      <%--   <c:choose>
                                           <c:when test="${empty __formdata.NREEMB}">--%>
                                                <input type="text" readonly class="campowidthinput campo campotexto" size="15" style="width:65%;"  value="${__formdata.NCASS_ASE}" name="NCASS" id="NCASS">
                                          <%--  </c:when>
                                            <c:otherwise>
                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:95%;"  value="${__formdata.NCASS}" name="NCASS" id="NCASS">
                                            </c:otherwise>
                                        </c:choose>%--%>
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><fmt:message key="101027"/></b> <%-- Tomador --%>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><fmt:message key="101028"/></b> <%-- Asegurado --%>
                                        </td>
                                                                                            
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">  
                                        <c:choose>
                                            <c:when test="${!empty T_IAX_TOMADORES && fn:length(T_IAX_TOMADORES)>0}">
                                                 <div class="displayspace">
                                                 <c:set var="title1"><fmt:message key="105330" /></c:set>
                                                 <c:set var="title2"><fmt:message key="105940" /></c:set>                               
                                                 <display:table name="${T_IAX_TOMADORES}" id="tomadores" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axisctr009.do?paginar=true&tabla=tomador"> 
                                                   <%@ include file="../include/displaytag.jsp"%>
                                                   <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${tomadores.OB_IAX_TOMADORES.NNUMIDE}</div>
                                                   </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" style="width:23%" media="html" autolink="false" >
                                                       <div class="dspText">${tomadores.OB_IAX_TOMADORES.TNOMBRE} ${tomadores.OB_IAX_TOMADORES.TAPELLI1} ${tomadores.OB_IAX_TOMADORES.TAPELLI2}</div>
                                                   </display:column>
                                                </display:table>
                                            </div>
                                            </c:when>
                                            <c:otherwise>
                                            <input type="text" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMBRE_TOM}" name="NOMBRE_TOM" id="NOMBRE_TOM"
                                            style="width:97.5%;"  <axis:atr f="axisrmb003" c="NOMBRE_TOM"/> title="<fmt:message key="101027"/>" />
                                            </c:otherwise>
                                        </c:choose>
                                            
                                        </td>
                                        <td class="campocaja" colspan="2">                             
                                            <input type="text" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMBRE_ASEG}" name="NOMBRE_ASEG" id="NOMBRE_ASEG"
                                            style="width:97.5%;"  <axis:atr f="axisrmb003" c="NOMBRE_ASEG"/> title="<fmt:message key="101027"/>" />
                                        </td>
                                      <tr>  
                                       <td class="titulocaja" colspan="2">
                                            <b><fmt:message key="110994"/></b> <%-- Garantía --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><fmt:message key="151348"/>    <%-- Tipo Cuenta --%>
                                        </td>                            
                                        <td class="titulocaja" colspan="2">
                                            <b><fmt:message key="100965"/></b> <%-- Cuenta Bancaria --%>
                                        </td>    
                                        </tr>
                                        
                                        <tr>
                                        <td class="campocaja" colspan="2">                                
                                            <select name="CGARANT" id="CGARANT" title="<fmt:message key="110994"/>"  <axis:atr f="axisrmb003" c="CGARANT" a="obligatorio=true&isInputText=false"/> size="1" <c:if test="${empty __formdata.NREEMB}">class="campowidthselect campo campotexto" </c:if> <c:if test="${!empty __formdata.NREEMB}"> disabled class="campowidthselect campo campotexto"</c:if>  style="width:98%;" >&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listValores.tipGaran}">
                                                    <option value = "${element.CGARANT}"
                                                    <c:if test="${__formdata.CGARANT == element.CGARANT}">selected</c:if>
                                                    <c:if test="${__formdata.listValores.tipGaran[1] == null && __formdata.CGARANT != element.CGARANT}">selected</c:if> 
                                                    >
                                                        ${element.TGARANT} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                          
                                             <input type="hidden"  value="${__formdata.CGARANT}" name="CGARANTHIDDEN" id="CGARANTHIDDEN"/>
                         
                                             
                                        </td>        
                                        <td class="campocaja">                              
                                            <select name="CTIPBAN" id="CTIPBAN" title="<fmt:message key="151348"/>" <axis:atr f="axisrmb003" c="CTIPBAN" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;" 
                                            onchange="javascript:document.miForm.CBANCAR.value = '';">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                                    <option value = "${element.CTIPBAN}" 
                                                    <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                                        ${element.TTIPO} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden"  value="${__formdata.CTIPBAN}" name="CTIPBANHIDDEN" id="CTIPBANHIDDEN"/>
                                        </td>        
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR"
                                            style="width:98%;"  <axis:atr f="axisrmb003" c="CBANCAR" a="obligatorio=true" /> title="<fmt:message key="100965"/>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><fmt:message key="100588"/></b> <%-- Descripción --%>
                                        </td>                                                 
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="8">                             
                                            <textarea cols="" rows="3" class="campo campotexto" title="<fmt:message key="100588"/>" id="DESCRIPCION" <axis:atr f="axisrmb001" c="DESCRIPCION"  /> name="DESCRIPCION" size="15" 
                                                style="width:99%;overflow:hidden">${__formdata.TOBSERV}</textarea>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
<%--
 <c:if test="${!empty __formdata.NREEMB}">    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FESTADO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FESTADO", 
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FALTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FRECEP", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
 </c:if>
 --%>   
  </body>
</html>