<%@ page contentType="text/plain;charset=utf-8"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${!empty items}">
    <c:forEach items="${items}" var="item">
${item}
    </c:forEach>
</c:if>
<c:if test="${!empty extension && !empty locale}">
---------------------------------------------------------------
Resultados al parsear archivos con extensiónn: ${extension}.
            
Traducciones efectuadas con locale: ${locale}.
---------------------------------------------------------------

<c:if test="${!empty itemsJSPTraducidos}">
------------------------------------------------
Literales con traducciones en .jsp:
------------------------------------------------
    <c:forEach items="${itemsJSPTraducidos}" var="itemJSPTraducido">
${itemJSPTraducido}
    </c:forEach>
</c:if>
<c:if test="${!empty itemsJAVATraducidos}">
------------------------------------------------
Literales con traducciones en .java:
------------------------------------------------
    <c:forEach items="${itemsJAVATraducidos}" var="itemJAVATraducido">
${itemJAVATraducido}
    </c:forEach>
</c:if>
<c:if test="${!empty itemsNoTraducidos}">
------------------------------------------------------------
Literales sin traducir (CLAVE - FICHERO DONDE SE ENCUENTRA):
------------------------------------------------------------
    <c:forEach items="${itemsNoTraducidos}" var="itemNoTraducido">
${itemNoTraducido}
    </c:forEach>
</c:if>
</c:if>