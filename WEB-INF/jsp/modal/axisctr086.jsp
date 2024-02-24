<%
/**
*  Fichero: axisctr086.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 09/07/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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
               revisarEstilos();
        }
        
        function f_but_salir() {
            parent.f_cerrar_axisctr086();
        }        
        
        
         
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9001953" /></c:param>
                <c:param name="producto"><fmt:message key="9001953"/></c:param>
                <c:param name="form">axisctr086</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="9001909" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="9001910" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="101332" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="100587" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="9001911" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.SRECREN}" name="SRECREN" id="SRECREN"  size="15" 
                                   <axis:atr f="axisctr086" c="SRECREN" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" name="FFECEFE" id="FFECEFE"  size="15"
                                    value="<fmt:formatDate value="${__formdata.FFECEFE}" pattern="dd/MM/yyyy"/>"  
                                    <axis:atr f="axisctr086" c="FFECEFE" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    value="<fmt:formatDate value="${__formdata.FFECPAG}" pattern="dd/MM/yyyy"/>" 
                                    name="FFECPAG" id="FFECPAG"  size="15" <axis:atr f="axisctr086" c="FFECPAG" a="modificable=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    value="${__formdata.ESTADO}" name="ESTADO" id="ESTADO"  size="15" 
                                    <axis:atr f="axisctr086" c="ESTADO" a="modificable=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.BENEFI}" 
                                    name="BENEFI" id="BENEFI"  size="15" <axis:atr f="axisctr086" c="BENEFI" a="modificable=false"/> />
                                </td>
                                
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <div  class="titulo" style="float:left;"><img src="images/flecha.gif"/><b><fmt:message key="9001944"/></b></div>
                        <table class="seccion">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:180%;height:0px"></th>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja">
                                   <b><fmt:message key="9001945" /></b>
                                </td>
                                <td class="titulocaja">
                                   <b><fmt:message key="9001946" /></b>
                                </td>
                                <td colspan="5"></td>
                                <td class="titulocaja">
                                   <b><fmt:message key="109058" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NREMESA}" 
                                   name="NREMESA" id="NREMESA"  size="15" <axis:atr f="axisctr086" c="NREMESA" a="modificable=false"/> />
                                </td>
                                <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" 
                                   value="<fmt:formatDate value="${__formdata.FFECPAG}" pattern="dd/MM/yyyy"/>" 
                                   name="FFECPAG" id="FFECPAG"  size="15" <axis:atr f="axisctr086" c="FFECPAG" a="modificable=false"/> />
                                </td>
                                <td colspan="5"></td>
                                <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.ISINRET}" 
                                   name="ISINRET" id="ISINRET"  size="15" <axis:atr f="axisctr086" c="ISINRET" a="modificable=false"/> />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" colspan="2">
                                   <b><fmt:message key="100965" /></b>
                                </td>
                                <td colspan="3"></td>
                                <td class="titulocaja">
                                   <b><fmt:message key="109476" /></b>
                                </td>
                                <td class="titulocaja">
                                   <b><fmt:message key="101467" /></b>
                                </td>
                                <td class="titulocaja">
                                   <b><fmt:message key="101714" /></b>
                                </td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja" colspan="2">
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCTACOR}" 
                                   name="NCTACOR" id="NCTACOR"  size="15" <axis:atr f="axisctr086" c="NCTACOR" a="modificable=false"/> />
                                </td>
                                <td colspan="3"></td>
                                <td class="campocaja" >
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.IBASE}" 
                                   name="IBASE" id="IBASE"  size="15" <axis:atr f="axisctr086" c="IBASE" a="modificable=false"/> />
                                </td>
                                <td class="campocaja" >
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.PRETENC}" 
                                   name="PRETENC" id="PRETENC"  size="15" <axis:atr f="axisctr086" c="PRETENC" a="modificable=false"/> />
                                </td>
                                <td class="campocaja" >
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.IRETENC}" 
                                   name="IRETENC" id="IRETENC"  size="15" <axis:atr f="axisctr086" c="IRETENC" a="modificable=false"/> />
                                </td>
                                
                            </tr>
                             <tr>
                                <td></td>
                                <td class="titulocaja" >
                                   <b><fmt:message key="109061" /></b>
                                </td>
                                <td class="titulocaja" colspan="3">
                                   <b><fmt:message key="103218" /></b>
                                </td>
                                <td colspan="3"></td>
                                <td class="titulocaja">
                                   <b><fmt:message key="1000527" /></b>
                                </td>
                                
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja" >
                                   <input type="text" class="campowidthinput campo campotexto" 
                                   value="<fmt:formatDate value="${__formdata.FFECANU}" pattern="dd/MM/yyyy"/>" 
                                   name="FFECANU" id="FFECANU"  size="15" <axis:atr f="axisctr086" c="FFECANU" a="modificable=false"/> />
                                </td>
                                <td class="campocaja"  colspan="3">
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.MOTANUL}" 
                                   name="MOTANUL" id="MOTANUL"  size="15" <axis:atr f="axisctr086" c="MOTANUL" a="modificable=false"/> />
                                </td>
                                <td colspan="3"></td>
                                <td class="campocaja" >
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.ICONRET}" 
                                   name="ICONRET" id="ICONRET"  size="15" <axis:atr f="axisctr086" c="ICONRET" a="modificable=false"/> />
                                </td>
                                
                                
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir</c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

