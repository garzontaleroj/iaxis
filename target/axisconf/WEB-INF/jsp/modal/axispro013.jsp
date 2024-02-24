<%/**
*  Fichero: axispro013.jsp
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner Villas</a>
*   
*  Modal para duplicar productos.
*
*  Fecha: 17/04/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
    function f_onload() {
        document.miForm.SPRODUC.focus();    
    }
    
    function f_but_salir() {
        parent.f_cerrar_modal("axispro013");                
    }
    
    function f_recargar_producto(SPRODUC) {
        if (SPRODUC != "null")
            objUtiles.ejecutarFormulario ("modal_axispro013.do?", "cargarProducto", document.miForm, "_self", objJsMessages.jslit_cargando);
        else {
            // Limpiar el form.
            document.miForm.PCRAMO.value = "";
            document.miForm.PCMODALI.value = "";
            document.miForm.PCTIPSEG.value = "";
            document.miForm.PCCOLECT.value = "";
            
            /*
            document.miForm.PRAMDEST.value = "";
            document.miForm.PMODALIDEST.value = "";
            document.miForm.PCMODALI.value = "";
            document.miForm.PTIPSEGDEST.value = "";
            document.miForm.PCOLECTDEST.value = "";            
            */
        }
    }
    
    function f_but_103669() { // 103669: Duplicar 
        if (document.miForm.SPRODUC.value == "null") 
            alert (objJsMessages.jslit_selecciona_producto);
        else if (objValidador.validaEntrada()) 
            objUtiles.ejecutarFormulario ("modal_axispro013.do?", "duplicar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
</script>
</head>
<body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="152707" /></c:param>
            <c:param name="producto"><fmt:message key="152707" /></c:param>
            <c:param name="form">axispro013</c:param>
        </c:import>

        <!-- Área de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="seccion" style="margin-left:20%;width:60%" cellspacing="10" >
                        <tr>
                            <!-- Productos -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="102177"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="4">
                                <select name="SPRODUC" id ="SPRODUC" size="1" class="campowidthselect campo campotexto_ob" style="width:90%"
                                onchange="f_recargar_producto(this.value)">
                                    <option value="null"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="PRODUCTO" items="${__formdata.PRODUCTOS}">
                                        <option value="${PRODUCTO.SPRODUC}" 
                                        <c:if test='${!empty __formdata.SPRODUC && __formdata.SPRODUC == PRODUCTO.SPRODUC}'> selected </c:if> >
                                        ${PRODUCTO.TTITULO}</option>
                                    </c:forEach>
                                </select>
                            </td> 
                        </tr>
                        <tr>
                            <!-- Ramo -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="100784"/></b>
                            </td>
                            <!-- Modalidad -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="100943"/></b>
                            </td>
                            <!-- Tipo seguro -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="102098"/></b>
                            </td>
                            <!-- Código colectividad -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="102424"/></b>
                            </td>
                        </tr>
                        <tr>
                            <!-- Ramo -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto campodisabled" style="width:30px" id="PCRAMO" name="PCRAMO" size="15"
                                       value="${__formdata.PCRAMO}" readonly />
                            </td> 
                            <!-- Modalidad -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto campodisabled" style="width:30px" id="PCMODALI" name="PCMODALI" size="15"
                                       value="${__formdata.PCMODALI}" readonly />
                            </td> 
                            <!-- Tipo seguro -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto campodisabled" style="width:30px" id="PCTIPSEG" name="PCTIPSEG" size="15"
                                       value="${__formdata.PCTIPSEG}" readonly />
                            </td> 
                            <!-- Código colectividad -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto campodisabled" style="width:30px" id="PCCOLECT" name="PCCOLECT" size="15"
                                       value="${__formdata.PCCOLECT}" readonly />
                            </td> 
                        </tr>
                        <tr>
                            <!-- Ramo -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="100784"/></b>
                            </td>
                            <!-- Modalidad -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="100943"/></b>
                            </td>
                            <!-- Tipo seguro -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="102098"/></b>
                            </td>
                            <!-- Código colectividad -->                                      
                            <td class="campocaja">
                                <b><fmt:message key="102424"/></b>
                            </td>
                        </tr>
                        <tr>
                            <!-- Ramo -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" style="width:30px" id="PRAMDEST" name="PRAMDEST" size="15"
                                       value="${__formdata.PRAMDEST}" title="<fmt:message key="100784"/>" obligatorio="true" />
                            </td> 
                            <!-- Modalidad -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" style="width:30px" id="PMODALIDEST" name="PMODALIDEST" size="15"
                                       value="${__formdata.PMODALIDEST}" title="<fmt:message key="100943"/>" obligatorio="true" />
                            </td> 
                            <!-- Tipo seguro -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" style="width:30px" id="PTIPSEGDEST" name="PTIPSEGDEST" size="15"
                                       value="${__formdata.PTIPSEGDEST}" title="<fmt:message key="102098"/>" obligatorio="true" />
                            </td> 
                            <!-- Código colectividad -->                                      
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" style="width:30px" id="PCOLECTDEST" name="PCOLECTDEST" size="15"
                                       value="${__formdata.PCOLECTDEST}" title="<fmt:message key="102424"/>" obligatorio="true" />
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <table class="seccion" style="background-color:c0c0c0;margin-left:20%;width:60%" cellpadding="0" cellspacing="0">
                                <tr style="background-color:c0c0c0">
                                <!-- Crear script o ejecutar a BD -->                                      
                                    <td class="campocaja" style="background-color:c0c0c0;">
                                        <div style="text-align:left;margin-left:35%">
                                        <input type="radio" id="PSALIDA" name="PSALIDA" size="15" value="1"
                                        <c:if test='${empty __formdata.PSALIDA || __formdata.PSALIDA == 1}'> checked </c:if>
                                        /><fmt:message key="112576"/>   </br>                                            
                                        <input type="radio" id="PSALIDA" name="PSALIDA" size="15" value="0"
                                        <c:if test='${__formdata.PSALIDA == 0}'> checked </c:if>
                                        /><fmt:message key="109006"/>                  
                                        </div>
                                    </td> 
                                </tr>
                            </table>
                        </tr>
                    </table>                    
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir,103669</c:param> <%-- 103669: Duplicar --%>
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>