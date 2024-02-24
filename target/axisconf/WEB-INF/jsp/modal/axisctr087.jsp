<%
/**
*  Fichero: axisctr087.jsp
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
            parent.f_cerrar_axisctr087();
        }        
        
        
         
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9001955" /></c:param>
                <c:param name="producto"><fmt:message key="9001955"/></c:param>
                <c:param name="form">axisctr087</c:param>
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
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:23%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="9001875" /></b>
                                </td>
                                <td class="titulocaja" colspan="4">
                                    <b><fmt:message key="101028" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="9001911" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">${DATOS_POL}
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"  size="15" 
                                   <axis:atr f="axisctr087" c="NPOLIZA" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja" colspan="4">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    value="${__formdata.TOMADOR}" name="TOMADOR" id="TOMADOR"  size="15" 
                                    <axis:atr f="axisctr087" c="TOMADOR" a="modificable=false"/> />
                                </td>
                                <td class="campocaja" colspan="3">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.BENEFI}" 
                                    name="BENEFI" id="BENEFI"  size="15" <axis:atr f="axisctr087" c="BENEFI" a="modificable=false"/> />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="101332" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="9001946" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="800636" /></b>
                                </td>
                                <td class="titulocaja" >
                                    <b><fmt:message key="100563" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatDate value="${__formdata.FEFECTOPOL}" pattern="dd/MM/yyyy"/>" 
                                   name="FEFECTOPOL" id="FEFECTOPOL"  size="15" 
                                   <axis:atr f="axisctr087" c="FEFECTOPOL" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    value="<fmt:formatDate value="${__formdata.FFECPAG}" pattern="dd/MM/yyyy"/>" 
                                    name="FFECPAG" id="FFECPAG"  size="15" 
                                    <axis:atr f="axisctr087" c="FFECPAG" a="modificable=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.SRECREN}" 
                                    name="SRECREN" id="SRECREN"  size="15" <axis:atr f="axisctr087" c="SRECREN" a="modificable=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.ICONRET}" 
                                    name="ICONRET" id="ICONRET"  size="15" <axis:atr f="axisctr087" c="ICONRET" a="modificable=false"/> />
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <div  class="titulo" style="float:left;"><img src="images/flecha.gif"/><b><fmt:message key="1000581"/></b></div>
                        <table class="seccion">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:60%;height:0px"></th>
                                <th style="width:38%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div class="separador">&nbsp;</div>
                                    <div class="displayspace">
                                    
                                        <c:set var="title0"><fmt:message key="9001954" /></c:set>
                                        <c:set var="title1"><fmt:message key="1000553" /></c:set>
                                        <c:set var="title2"><fmt:message key="9000526" /></c:set>                               
                                        <c:set var="title3"><fmt:message key="9000527" /></c:set>
                                        <c:set var="title4"><fmt:message key="101006" /></c:set>
                                        <display:table name="${MOVIMIENTOS}" id="MOVIMIENTOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                       requestURI="modal_axisctr087.do?paginar=true&tabla=tomador" > 
                                                       <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable"   media="html" autolink="false" style="width:15%">
                                                <div class="dspText">${MOVIMIENTOS.SMOVPAG} </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="" headerClass="headwidth5 sortable"   media="html" autolink="false" style="width:20%" >
                                                <div class="dspText">${MOVIMIENTOS.ESTADO} </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" style="width:15%">
                                                <div class="dspText"><fmt:formatDate value='${MOVIMIENTOS.FMOVINI}' pattern='dd/MM/yyyy'/> </div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="" headerClass="headwidth5 sortable"   media="html" autolink="false" style="width:15%">
                                                <div class="dspText"><fmt:formatDate value='${MOVIMIENTOS.FMOVFIN}' pattern='dd/MM/yyyy'/> </div>
                                            </display:column>                                   
                                            <display:column title="${title4}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" style="width:20%">
                                                <div class="dspText"><fmt:formatDate value='${MOVIMIENTOS.FEFECTO}' pattern='dd/MM/yyyy'/></div>
                                            </display:column>                                                                      
                                        </display:table>
                                    </div>
                                    <div class="separador">&nbsp;</div>
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

