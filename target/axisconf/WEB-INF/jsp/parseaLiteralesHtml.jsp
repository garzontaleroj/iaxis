<%@ page contentType="text/html;charset=utf-8"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <title>
            Resultados al parsear archivos con extensi&oacute;n 
            ${extension}
            .
        </title>
    </head>
    <body><c:if test="${!empty items}">
            <c:forEach items="${items}" var="item">
                <b>${item}</b>
            </c:forEach>
        </c:if><c:if test="${!empty extension && !empty locale}">
            <b>Resultados al parsear archivos con extensi&oacute;n: 
                ${extension}.</b>
            <br/>
            <b>Traducciones efectuadas con locale: 
                ${locale}.</b>
            <br/>
            <c:if test="${!empty itemsJSPTraducidos}">
                <b>------------------------------------------------</b>
                <br/>
                <b>Literales con traducciones en .jsp:</b>
                <br/>
                <b>------------------------------------------------</b>
                <br/>
                <c:forEach items="${itemsJSPTraducidos}" var="itemJSPTraducido">
                    ${itemJSPTraducido}
                    <br/>
                </c:forEach>
                <br/>
            </c:if>
            <c:if test="${!empty itemsJAVATraducidos}">
                <b>------------------------------------------------</b>
                <br/>
                <b>Literales con traducciones en .java:</b>
                <br/>
                <b>------------------------------------------------</b>
                <br/>
                <c:forEach items="${itemsJAVATraducidos}"
                           var="itemJAVATraducido">
                    ${itemJAVATraducido}
                    <br/>
                </c:forEach>
                <br/>
            </c:if>
            <b>-------------------------------------------------</b>
            <br/>
            <b>Literales con errores al traducir:</b>
            <br/>
            <b>-------------------------------------------------</b>
            <br/>
            <c:forEach items="${itemsNoTraducidos}" var="itemNoTraducido">
                ${itemNoTraducido}
                <br/>
            </c:forEach>
        </c:if></body>
</html>