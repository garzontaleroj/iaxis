<%  
session.invalidate();
String redirectURL = "axis.do?operation=init";
response.sendRedirect(redirectURL);
%>