<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>axisajaxpeditar</title>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <script language="Javascript">
    function f_but_cancelar() {
        parent.f_cerrar_axislistaform()
    }
    function f_but_aceptar() {
        document.miForm.operation.value="modalformaceptar"
        document.miForm.submit()
    }
    function f_onload() {
        <c:if test="${!empty OK}">
        parent.actualizar(document.miForm.XMIDATO.value)
        </c:if>
    }
    </script>
  </head>
  <body onload="f_onload()">
  ${__formdata}
<form name="miForm" action="axis_comun_axislista.do" method="POST"> 
<input type="hidden" name="operation" value="" />
<input type="hidden" name="origen" value="${__formdata.origen}" />
<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:50px">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th style="height:0px;width:25%"></th>
                    <th style="height:0px;width:75%"></th>
                </tr>
                <tr>
                    <td>
                        <b>${__formdata.__meta.TITULO}</b>
                    </td>
                    <td>
                        <c:if test="${__formdata.__meta.FORMATO=='VARCHAR'}">
                        <textarea name="XMIDATO" rows="2" cols="50" class="campo">${__formdata.MIDATO}</textarea>
                        </c:if>
                        <c:if test="${__formdata.__meta.FORMATO=='DATE'}">
                        <input type="text" name="XMIDATO" class="campo" style="width:100px" value="${__formdata.MIDATO}" />
                        </c:if>
                        <c:if test="${__formdata.__meta.FORMATO=='NUMBER'}">
                        <input type="text" name="XMIDATO" class="campo" style="width:100px" value="${__formdata.MIDATO}" />
                        </c:if>
                        <c:if test="${__formdata.__meta.FORMATO=='LIST'}">
                        <select name="XMIDATO" size="1" class="campo">
                        <option value="">(null)</option>
                        <c:forEach items="${LIST}" var="item">
                        <option value="${item.K}" <c:if test="${item.K==__formdata.MIDATO}">selected</c:if>>${item.V}</option>
                        </c:forEach>
                        </select>
                        </c:if>
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
<%@ page contentType="text/html;charset=windows-1252"%>
