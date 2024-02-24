<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" isErrorPage="true"
         import="org.apache.commons.logging.Log, org.apache.commons.logging.LogFactory"%>
<% 
Log logger = LogFactory.getLog("axisjump.jsp");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>axisjump</title>
  </head>
  <body>An error occured:<br/><pre>
    <%
      if (exception != null) {
         logger.error("Error", exception);
      } 
    %>
    </pre></body>
</html>