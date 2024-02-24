<%/* Revision:# R3sGqHLFft8xm2plFy+Ong== # */%>
<%
/*
*  Fichero: axiscaj020.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 13/12/2015
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"/>
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- Especial para controlar los scroll con iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script language="Javascript" type="text/javascript">
            function f_onload() {
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_salir() {
                parent.f_cerrar_modal("axiscaj020");
            }
            
        
        </script>
    </head>
    <body onload="f_onload();">
        <form name="miForm" action="" method="POST">
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscaj020" c="FORM" lit="9907918" /></c:param>
                <c:param name="producto"><axis:alt f="axiscaj020" c="FORM" lit="9907918" /></c:param>
                <c:param name="form">axiscaj020</c:param>
            </c:import>
    
            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axiscaj020" c="LIT32" lit="112165"/></b>
                </div>
                
                <table class="seccion" >
                <tr>                        
                <td align="left">
                <table class="area" align="center">
                    <tr> 
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscaj020" c="TMEDMOV" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TMEDMOV" lit="9000719"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="TRAZON" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TRAZON" lit="9907720"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="FFECHAREC" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="FFECHAREC" lit="1000590"/></b>
                        </td>                                   
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="TBANCO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TBANCO" lit="9908476"/></b>
                        </td>                                   
                        </axis:ocultar> 
                    </tr>
                    <tr>
                        <axis:visible f="axiscaj020" c="TMEDMOV">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TMEDMOV}" name="TMEDMOV" id="TMEDMOV" size="10" <axis:atr f="axiscaj020" c="TMEDMOV" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axiscaj020" c="TRAZON">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TRAZON}" name="TRAZON" id="TRAZON" size="10" <axis:atr f="axiscaj020" c="TRAZON" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="FFECHAREC">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FFECHAREC}'/>" name="FFECHAREC" id="FFECHAREC" size="10" <axis:atr f="axiscaj020" c="FFECHAREC" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible> 
                        
                        <axis:visible f="axiscaj020" c="TBANCO">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TBANCO}" name="TBANCO" id="TBANCO" size="10" <axis:atr f="axiscaj020" c="TBANCO" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible> 
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscaj020" c="NTYPCHEQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NTYPCHEQ" lit="9907714"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="NTYPDCHEQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NTYPDCHEQ" lit="9907715"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="NCHEQUE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NCHEQUE" lit="9907717"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="CESTCHQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="CESTCHQ" lit="9908120"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>                    
                        <axis:visible f="axiscaj020" c="NTYPCHEQ">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NTYPCHEQ}" name="NTYPCHEQ" id="NTYPCHEQ" size="10" <axis:atr f="axiscaj020" c="NTYPCHEQ" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="NTYPDCHEQ">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NTYPDCHEQ}" name="NTYPDCHEQ" id="NTYPDCHEQ" size="10" <axis:atr f="axiscaj020" c="NTYPDCHEQ" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="NCHEQUE">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" size="10" <axis:atr f="axiscaj020" c="NCHEQUE" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="CESTCHQ">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.CESTCHQ}" name="CESTCHQ" id="CESTCHQ" size="10" <axis:atr f="axiscaj020" c="CESTCHQ" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscaj020" c="TOTROBAN" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TOTROBAN" lit="9907713"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="NACCNUMBER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NACCNUMBER" lit="9907721"/></b>
                        </td>                                   
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="NACCHOLDER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NACCHOLDER" lit="9908485"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="TPAYTEXT" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TPAYTEXT" lit="9907724"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:visible f="axiscaj020" c="TOTROBAN">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TOTROBAN}" name="TOTROBAN" id="TOTROBAN" size="10" <axis:atr f="axiscaj020" c="TOTROBAN" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="NACCNUMBER">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NACCNUMBER}" name="NACCNUMBER" id="NACCNUMBER" size="10" <axis:atr f="axiscaj020" c="NACCNUMBER" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible> 
                        
                        <axis:visible f="axiscaj020" c="NACCHOLDER">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NACCHOLDER}" name="NACCHOLDER" id="NACCHOLDER" size="10" <axis:atr f="axiscaj020" c="NACCHOLDER" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="TPAYTEXT">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TPAYTEXT}" name="TPAYTEXT" id="TPAYTEXT" size="10" <axis:atr f="axiscaj020" c="TPAYTEXT" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>  
                    </tr>
                    
                    <tr>                    
                    <axis:ocultar f="axiscaj020" c="NAMOPAY" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NAMOPAY" lit="9904351"/></b>
                        </td>                                            
                    </axis:ocultar>
                    
                    <axis:ocultar f="axiscaj020" c="CUSER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="CUSER" lit="100894"/></b>
                        </td>                                            
                    </axis:ocultar>
                    
                    <axis:ocultar f="axiscaj020" c="NPOLIZA_ORI" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NPOLIZA_ORI" lit="9908747"/></b>
                        </td>                                            
                    </axis:ocultar>
                    
                    <axis:ocultar f="axiscaj020" c="NPOLIZA_DTN" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NPOLIZA_DTN" lit="9908748"/></b>
                        </td>                                            
                    </axis:ocultar>
                    </tr>
                    
                    <tr>                    
                    <axis:visible f="axiscaj020" c="NAMOPAY">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.NAMOPAY}"/>" name="NAMOPAY" id="NAMOPAY" size="10" <axis:atr f="axiscaj020" c="NAMOPAY" a="modificable=false&obligatorio=false"/>/>
                        </td>
                    </axis:visible>
                    
                    <axis:visible f="axiscaj020" c="CUSER">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.CUSER}" name="CUSER" id="CUSER" size="10" <axis:atr f="axiscaj020" c="CUSER" a="modificable=false&obligatorio=false"/>/>
                        </td>
                    </axis:visible>
                    
                    <axis:visible f="axiscaj020" c="NPOLIZA_ORI">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NPOLIZA_ORI}" name="NPOLIZA_ORI" id="NPOLIZA_ORI" size="10" <axis:atr f="axiscaj020" c="NPOLIZA_ORI" a="modificable=false&obligatorio=false"/>/>
                        </td>
                    </axis:visible>
                    
                    <axis:visible f="axiscaj020" c="NPOLIZA_DTN">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NPOLIZA_DTN}" name="NPOLIZA_DTN" id="NPOLIZA_DTN" size="10" <axis:atr f="axiscaj020" c="NPOLIZA_DTN" a="modificable=false&obligatorio=false"/>/>
                        </td>
                    </axis:visible>
                    </tr>                    
                    
                </table>
                </td>                        
                </tr>
                </table>
                
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axiscaj020" c="LIT32" lit="9907686"/></b>
                </div>
                
                <table class="seccion" >
                <tr>                        
                <td align="left">
                
                <table border="0" class="area" align="left" style="width:100%">
                    <tr>
                        <td>
                            <c:set var="title1"><axis:alt c="TITULO2" f="axisint003" lit="109373"/></c:set>
                            <c:set var="title2"><axis:alt c="TITULO3" f="axisint003" lit="101159"/></c:set>
                            <div class="displayspacePersonas">
                                <display:table name="${__formdata.OBTABLA.INFO_TABLA}" id="tablaIntermedia" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="modal_axiscaj020.do?operation=form&paginar=true">
                                    
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INFO.NOMBRE_COLUMNA" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText" id=CNOMBREx>${tablaIntermedia.OB_IAX_INFO.NOMBRE_COLUMNA}</div>
                                    </display:column>                          
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INFO.VALOR_COLUMNA" headerClass="sortable fixed" media="html" autolink="false" >
                                    <div class="dspText">
                                    <c:choose>
                                    <c:when test="${tablaIntermedia.OB_IAX_INFO.TIPO_COLUMNA == 'XMLTYPE'}">                        
                                     <textarea rows="8" class="campo campotexto" style="width:100%;"  name="CVALORx" id="CVALORx">${tablaIntermedia.OB_IAX_INFO.VALOR_COLUMNA}</textarea>                                    
                                    </c:when>
                                    <c:otherwise>                                    
                                    <input type="text" class="campowidthinput campo campotexto" id="CVALORx" name="CVALORx" size="15" 
                                        <axis:atr f="axiscaj020" c="CVALORx" a="modificable=false"/> value='${tablaIntermedia.OB_IAX_INFO.VALOR_COLUMNA}'/>                                                
                                    </c:otherwise>
                                    </c:choose>
                                     </div>
                                                
                                    </display:column>
                                </display:table>
                            </div>
                        </td>
                    </tr>
                </table>
                
                </td>
                </tr>
                </table>
            
            </td>
            </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscaj020</c:param>
                        <c:param name="__botones"><axis:visible f="axiscaj020" c="BT_SALIR">salir</axis:visible></c:param>
            </c:import>
        </form>    
        <c:import url="../include/mensajes.jsp" />
    </body>
    <c:if test="${(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
        <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axiscaj020');
        </script>                   
    </c:if>
</html>
