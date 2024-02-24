<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        function f_onload() {
            document.miForm.SPRODUC.focus();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axismpr001();
        }        
        
        function f_but_aceptar () {
            parent.f_aceptar_axismpr001(document.miForm.SPRODUC.value);
        }
         
    </script>
  </head>
    <body class=" " onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="1000206" /></c:param>
                <c:param name="producto"><fmt:message key="102177"/></c:param>
                <c:param name="form">axismpr001</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td class="titulocaja">
                                    <b><fmt:message key="100829" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="" class="campo campotexto_ob" style="width:300px">
                                        <c:forEach items="${axismprbuscar1}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                    <%-- <axis:ayuda c="axismpr001" f="SPRODUC" /> 
                                    <img src="images/ayuda1.gif" />
                                    <img src="images/ayuda2.gif" />
                                    <img src="images/ayuda3.gif" />
                                    <img src="images/help_orange.gif" />
                                    <img src="images/informacion.gif" />--%>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

