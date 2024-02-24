<%/*
*  Fichero: axispen006.jsp
*
*  Fecha: 15/12/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9900863"/></title> <%-- Buscador de promotors --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>  
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                                 
            revisarEstilos();          
            document.getElementById("CCODDEP").focus();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen006');
        }
        
        function f_but_buscar() {   
           /* original
            if (objValidador.validaEntrada()) 
                var CCODDEP = objDom.getValorPorId("CCODDEP");
                var TNOMDEP = objDom.getValorPorId("TNOMDEP");               
                parent.f_aceptar_axispen06(CCODDEP,TNOMDEP);     
                */

            /* multiregistro */               
            objUtiles.ejecutarFormulario("modal_axispen006.do", "busqueda_depo", document.miForm, "_self", objJsMessages.jslit_cargando);       
        }

            function f_but_aceptar(CODDEP) {
            if (!objUtiles.estaVacio(document.miForm.radioDepositaria)) {
                // Checkeada por el radio button
                CODDEP = objUtiles.f_GuardaCasillasChecked("radioDepositaria");
            } 
             if (typeof CODDEP == 'boolean' || objUtiles.estaVacio (CODDEP)) 
                alert(objJsMessages.jslit_selecciona_registro);
            else
                parent.f_aceptar_axispen06(CODDEP);       
            }                    
               
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9900863"/></c:param>     <%-- Buscador de dipositaries --%>
                <c:param name="formulario"><fmt:message key="9900863"/></c:param> <%-- Buscador de dipositaries --%>
                <c:param name="form">axispen006</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CESTADO2" name="CESTADO2" value="${__formdata.CESTADO}"/>       
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>       
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axispen006" c="CCODDEP">
                                            <td class="titulocaja"> 
                                                <b id="label_CCODDEP"><fmt:message key="1000109"/></b> <%-- Codi pensión --%>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen006" c="TNOMDEP">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMDEP"><fmt:message key="105940"/></b> <%-- Non DEPOSITARIA --%>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                      <axis:visible f="axispen006" c="CCODDEP">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CCODDEP}" name="CCODDEP" id="CCODDEP" style="width:75%;"
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen006" c="TNOMDEP">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMDEP}" name="NNUMIDE" id="TNOMDEP" style="width:100%;"
                                            </td>
                                        </axis:visible>                                        
                                    </tr>
                                    
                    <tr>
                        <!-- Lista de Depositarias -->
                            <div class="separador">&nbsp;</div>
                            <div class="separador">&nbsp;</div>

                            <table class="area" align="left">                                    
                                <tr>
                                  <td>
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                        <fmt:message key="1000109"/> <!--CODI DEPOSITARIA-->
                                    </c:set>
                                    <c:set var="title2">
                                        <fmt:message key="105904"/> <!--NIF-->
                                    </c:set>
                                    <c:set var="title3">
                                        <fmt:message key="9000759"/> <!--Nombre y Apellidos-->
                                    </c:set>
                                    <c:set var="title4">
                                        <fmt:message key="9001192"/> <!--Fecha Alta-->
                                    </c:set>
                                    <c:set var="title5">
                                        <fmt:message key="9001510"/> <!--Fecha Baja-->
                                    </c:set>                                             
                                    <div id="dt_depositarias" class="seccion displayspace">
                                    <%int contador = 0;%>
                                        <display:table name="${sessionScope.AXIS_DEPOSITARIAS}"
                                                       id="miListaDepositarias"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="axis_axispen001.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                             <c:set var="contador"><%=contador%></c:set>  
                                            <display:column headerClass="sortable fixed headwidth5"
                                                            title=""
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">
                                                <div class="dspIcons">
                                                   <input <c:if test="${miListaDepositarias['radioDepositaria']}">checked</c:if> 
                                                           type="radio" id="radioDepositaria" name="radioDepositaria" value="${miListaDepositarias.OB_IAX_PDEPOSITARIAS['CCODDEP']}"/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="CCODDEP"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:5%">                                                            
                                                <div class="dspNumber">
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS['CCODDEP']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}"
                                                            sortable="true"
                                                            sortProperty="NNUMIDE"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:10%">
                                                <div class="dspText">
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['NNUMIDE']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            <display:column title="${title3}"
                                                            sortable="true"
                                                            sortProperty="TNOMBRE"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:30%">
                                                <div class="dspText">
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['TNOMBRE']}
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['TAPELLI1']}&nbsp;
                                                        ${miListaDepositarias.OB_IAX_PDEPOSITARIAS.PERSONA['TAPELLI2']}
                                                </div>
                                            </display:column>
                                            <display:column title="${title4}"
                                                            sortable="true"
                                                            sortProperty="FALTA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:15%">
                                            <div class="dspText"><fmt:formatDate value="${miListaDepositarias.OB_IAX_PDEPOSITARIAS['FALTA']}" pattern="dd/MM/yy" />
                                                   <a onclick="f_seleccionar_depositaria.OB_IAX_PDEPOSITARIAS('${miListaDepositarias['CCODDEP']}','${contador}');"></a>                                                        
                                            </div>                                                 
                                            </display:column>                                            
                                            <display:column title="${title5}"
                                                            sortable="true"
                                                            sortProperty="FBAJA"
                                                            headerClass="sortable fixed"
                                                            media="html"
                                                            autolink="false"
                                                            style="width:15%">
                                            <div class="dspText"><fmt:formatDate value="${miListaDepositarias.OB_IAX_PDEPOSITARIAS['FBAJA']}" pattern="dd/MM/yy" />
                                                   <a onclick="f_seleccionar_depositaria.OB_IAX_PDEPOSITARIAS('${miListaDepositarias['CCODDEP']}','${contador}');"></a>                                                        
                                            </div>                                                      
                                                
                                            </display:column>                                                
                                            <%contador++;%>
                                        </display:table>
                                    </div>
                                </td>                                    
                                </table>
                    </tr>
                    </table>
                </td>
            </tr>
        </table>
                
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar,buscar</c:param> 
        </c:import>    
    </form>    
    <c:import url="../include/mensajes.jsp"/>   
</body>
</html>