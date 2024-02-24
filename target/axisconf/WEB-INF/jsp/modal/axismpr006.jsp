<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        function f_onload() {
            document.miForm.CEMPRES.focus();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axismpr006();
        }        
        
        function f_but_aceptar () {
            parent.f_aceptar_axismpr006(document.miForm.CEMPRES.value);
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
                <c:param name="producto"><fmt:message key="102071"/></c:param>
                <c:param name="form">axismpr006</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:50%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <b><fmt:message key="101619" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="" class="campo campotexto_ob" style="width:300px">
                                        <c:forEach items="${axismprbuscar1}" var="item">
                                            <option value = "${item.CEMPRES}" <c:if test="${__formdata['CEMPRES']==item.CEMPRES}">selected</c:if> >${item.TEMPRES}</option>
                                        </c:forEach>
                                    </select>
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

