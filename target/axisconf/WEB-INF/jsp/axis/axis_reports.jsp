<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=windows-1252" import="java.util.*"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<html>
    <head>
    </head>

    <%! org.apache.commons.logging.Log logger = org.apache.commons.logging.LogFactory.getLog(this.getClass()); %>
    
    <%              
    List<Map> reportsList     = (List<Map>) session.getAttribute("reportsList");
    Map<String,String> report = null;
    int indiceReport;
    
    try {
        indiceReport          = Integer.valueOf(request.getParameter("indiceReport"));            
    } catch (Exception e) {
        logger.warn("indiceReport es nulo. Se considerará indiceReport == 0.");            
        indiceReport = 0;
    }
    
    if (reportsList != null && reportsList.size() > 0) {
        report = reportsList.get(indiceReport);
        logger.debug("Envío de petición a Oracle REPORTS por POST");
        logger.debug("Action -> '" + report.get("URLContext") + "'");                   
    } else {
        report = (Map<String, String>) session.getAttribute("report");
    }
    
    %>
        
    <body onload='<%= report != null ? "document.miForm.submit()" : ""%>'>        
        <div class="titulocaja" style="margin:30% 0 0 35%"><b><fmt:message key='<%= report != null ? "9000893" : "9000894"%>'/></b></div>
        
        <form name="miForm" action='<%= report != null ? report.get("URLContext") : "" %>' method="POST">            
            <%
            if (report != null) {
                String URLParams = report.get("URLParams");
                
                if (URLParams != null) {
                    String[] params  = URLParams.split("&");
                            
                for (String param : params) {          
                    String[] splittedParams = param.split("=");
                    String name  = splittedParams.length >= 1 ? param.split("=")[0] : "";
                    String value = splittedParams.length >= 2 ? param.split("=")[1] : "";
                    logger.debug("Encontrado parámetro -> '" + name + "', valor -> '" + value + "'");
            %>
            
            <input type="hidden" name="<%=name%>" value="<%=value%>"/>    
             
            <%      
                    }
                }
            }
            %>
        </form>
    </body>    
</html>