<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" isErrorPage="true" import="java.io.CharArrayWriter, java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title><fmt:message key="100014" />  - ${param.CFORM}, ${param.CITEM}</title>
        <link rel="shortcut icon" href="images/ayuda.ico" type="image/x-icon" />
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">

        <script language="Javascript">
            window.resizeTo(screen.availWidth/3, screen.availHeight*.95);
            window.moveTo(screen.availWidth - screen.availWidth/3-5,1);
           
            function f_CheckClose(){
                var done=false;
                //alert(window.opener)
                if (!done && window.opener==null) {
                    done=true;
                    window.close() 
                }
                if (!done && window.opener==undefined) {
                    done=true;
                    window.close() 
                }
                try {
                    if (!done && window.opener.objAyuda==null) {
                        done=true;
                        window.close() 
                    }
                }
                catch(e) {
                    done=true;
                    window.close() 
                }
                try {
                    if (!done && window.opener.objAyuda==undefined) {
                        done=true;
                        window.close() 
                    }
                }
                catch(e) {
                    done=true;
                    window.close() 
                }
            }
        </script>
        
  </head>
  <body onload="self.focus(); window.setInterval('f_CheckClose()', 1000)" xonblur="f_CheckClose()">
  <table class="seccion" >
    <tr>
        <td>
        <div >
        
          <!-- Tabla con valores -->
          <table cellpadding="0"  cellspacing="0" id="miListaId">
            <thead>
            <tr>
            <th class="sortable gridsortable" style="width:30%;height:0px"><fmt:message key="109373" /></th>
            <th class="sortable gridsortable" style="width:70%;height:0px"><fmt:message key="100588" /></th>
            </tr>
            <tbody>
<c:forEach items="${ayudalista}" var="item" varStatus="status">
            <c:set var="status__count__mod__2" value="${status.count mod 2}" />
            <tr class="grid<c:if test="${status__count__mod__2==1}">Not</c:if>Even" >
                <c:set var="tTITEM"><fmt:message key="${item.TITEM}" /></c:set>
                <c:if test="${fn:contains(tTITEM,'???')}"><c:set var="tTITEM" value=""/></c:if>
                <td><a name="${item.CFORM}__${item.CITEM}" id="${item.CFORM}__${item.CITEM}"></a>    
                <div class="dspText">
                    <c:if test="${! empty tTITEM}">
                        <b>${tTITEM}</b><br />
                    </c:if>
                    <c:choose>
                        <c:when test="${item.CITEM=='[FORM]'}">(${item.CFORM})</c:when>
                        <c:otherwise>(${item.CITEM})</c:otherwise>
                    </c:choose>
                </div>
                </td>
                <td>    
                <div class="dspText">
                ${item.TAYUDA}
                
                </div>
                </td>
            </tr>
</c:forEach>
            </tbody>
        </table>
          <!-- Fin tabla         -->
        </div>
<div style="width:99%;height:800px" />&nbsp;</div>        
  </body>
</html>
