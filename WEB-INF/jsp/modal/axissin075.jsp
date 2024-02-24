<%/* Revision:# WInF722gKk8f7Mu/vY0P7A== # */%>
<%
/*
*  Fichero: axissin075.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 01/10/2015
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
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
            	//IAXIS 3480 AABC DECIMALES RETEICA 
            	//IAXIS 14090 AABC cambios en el porcentaje de reteica 29/07/2020
            	var IRETEN  = "${__formdata.IRETEICA}";
            	var ISINRET = "${__formdata.ISINRET}";
            	var IFRANQ  = "${__formdata.IFRANQ}";
            	var PIRETEN = (IRETEN*1000/(ISINRET-IFRANQ));
            	objDom.setValorPorId("PRETEICA", PIRETEN);
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axissin075");
            }
            
        </script>
    </head>
    <body onload="f_onload();">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin075|axissin075</c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <!-- Inicio Cambios en todos los input que no sean pag for Bug IAXIS-14090 AABC 27/07/2020  -->
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin075" c="FORM" lit="9000937" /></c:param>
                <c:param name="producto"><axis:alt f="axissin075" c="FORM" lit="9000937" /></c:param>
                <c:param name="form">axissin075</c:param>
            </c:import>
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axissin075" c="LIT32" lit="1000104"/></b>
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
                        <axis:ocultar f="axissin075" c="LIT_CONCEPTO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_CONCEPTO" lit="9000715"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin075" c="LIT_PCT" dejarHueco="false"> 
                        <td class="campocaja">
                            <b><axis:alt f="axissin075" c="LIT_PCT" lit="101502"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin075" c="LIT_IMPORTE" dejarHueco="false"> 
                        <td class="campocaja">
                            <b><axis:alt f="axissin075" c="LIT_IMPORTE" lit="9904351"/></b>
                        </td>                                            
                        </axis:ocultar> 
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_BASE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_BASE" lit="109476"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <td class="campocaja"></td>
                        <axis:visible f="axissin075" c="ISINRET">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber  value="${__formdata.ISINRET}"/>" name="ISINRET" id="ISINRET" size="10" 
                            <axis:atr f="axissin074" c="ISINRET" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_FRANQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_FRANQ" lit="9907164"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <td class="campocaja"></td>
                        <axis:visible f="axissin075" c="IFRANQ">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IFRANQ}"/>" name="IFRANQ" id="IFRANQ" size="10" 
                            <axis:atr f="axissin074" c="IFRANQ" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_BASEIPOC" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_BASEIPOC" lit="9909358"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <td class="campocaja"></td>
                        <axis:visible f="axissin075" c="IBASEIPOCPAG">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IBASEIPOC}"/>" name="IBASEIPOCPAG" id="IBASEIPOCPAG" size="10" 
                            <axis:atr f="axissin074" c="IBASEIPOCPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_BASETOT" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_BASETOT" lit="101093"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <td class="campocaja"></td>
                        <axis:visible f="axissin075" c="IBASETOTPAG">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber  value="${__formdata.ISINRET - __formdata.IFRANQ + __formdata.IBASEIPOC}"/>" name="IBASETOTPAG" id="IBASETOTPAG" size="10" 
                            <axis:atr f="axissin074" c="IBASETOTPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>                        
                        <td colspan="3">
                            <div style="clear:both;">
                                <hr class="titulo">
                            </div> 
                        </td>        
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_RETENC" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_RETENC" lit="101714"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <axis:visible f="axissin075" c="PRETENC">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${(__formdata.IRETENC * 100) / (__formdata.ISINRET - __formdata.IFRANQ + __formdata.IBASEIPOC)}"/>" name="PRETENC" id="PRETENC" size="10" 
                            <axis:atr f="axissin074" c="PRETENC" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin075" c="IRETENCPAG">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETENC}"/>" name="IRETENCPAG" id="IRETENCPAG" size="10" 
                            <axis:atr f="axissin074" c="IRETENCPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_IVA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_IVA" lit="101340"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <axis:visible f="axissin075" c="PIVA">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${(__formdata.IIVA * 100) / (__formdata.ISINRET - __formdata.IFRANQ + __formdata.IBASEIPOC)}"/>" name="PIVA" id="PIVA" size="10" 
                            <axis:atr f="axissin074" c="PIVA" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin075" c="IIVAPAG">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IIVA}"/>" name="IIVAPAG" id="IIVAPAG" size="10" 
                            <axis:atr f="axissin074" c="IIVAPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_RETEIVA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_RETEIVA" lit="9909383"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <axis:visible f="axissin075" c="PRETEIVA">
                        <td class="campocaja">
                            <c:if test="${__formdata.IIVA == 0}">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${0}"/>" name="PRETEIVA" id="PRETEIVA" size="10" 
                            <axis:atr f="axissin074" c="PRETEIVA" a="modificable=false&formato=decimal"/>/>
                            </c:if>
                            <c:if test="${__formdata.IIVA >= 1}">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${(__formdata.IRETEIVA * 100) / __formdata.IIVA}"/>" name="PRETEIVA" id="PRETEIVA" size="10" 
                            <axis:atr f="axissin074" c="PRETEIVA" a="modificable=false&formato=decimal"/>/>
                            </c:if> 
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin075" c="IRETEIVAPAG">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETEIVA}"/>" name="IRETEIVAPAG" id="IRETEIVAPAG" size="10" 
                            <axis:atr f="axissin074" c="IRETEIVAPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_RETEICA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_RETEICA" lit="9903552"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <!-- IAXIS 3480 AABC DECIMALES RETEICA -->
                        <axis:visible f="axissin075" c="PRETEICA">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="666"/>" name="PRETEICA" id="PRETEICA" size="10" 
                            <axis:atr f="axissin074" c="PRETEICA" a="modificable=false"/>/>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin075" c="IRETEICA">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETEICA}"/>" name="IRETEICA" id="IRETEICA" size="10" 
                            <axis:atr f="axissin074" c="IRETEICA" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_OTROSGAS" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_OTROSGAS" lit="9909357"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <td class="campocaja"></td>
                        <axis:visible f="axissin075" c="IOTROSGAS">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IOTROSGAS}"/>" name="IOTROSGAS" id="IOTROSGAS" size="10" 
                            <axis:atr f="axissin074" c="IOTROSGAS" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_IPOCONSUMO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_IPOCONSUMO" lit="9909384"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <axis:visible f="axissin075" c="PIPOCONSUMO">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PIPOCONSUMO}"/>" name="PIPOCONSUMO" id="PIPOCONSUMO" size="10" 
                            <axis:atr f="axissin074" c="PIPOCONSUMO" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                        <axis:visible f="axissin075" c="IIPOCONSUMO">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IIPOCONSUMO}"/>" name="IIPOCONSUMO" id="IIPOCONSUMO" size="10" 
                            <axis:atr f="axissin074" c="IIPOCONSUMO" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>                        
                        <td colspan="3">
                            <div style="clear:both;">
                                <hr class="titulo">
                            </div> 
                        </td>        
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin075" c="LIT_INETO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin075" c="LIT_INETO" lit="9001322"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        <td class="campocaja"></td>
                        <axis:visible f="axissin075" c="INETO">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber  value="${(__formdata.ISINRET - __formdata.IFRANQ + __formdata.IBASEIPOC) - __formdata.IRETENC + __formdata.IIVA - __formdata.IRETEIVA - __formdata.IRETEICA + __formdata.IOTROSGAS + __formdata.IBASEIPOC + __formdata.IIPOCONSUMO}"/>" name="INETO" id="INETO" size="10" 
                            <axis:atr f="axissin074" c="INETO" a="modificable=false&formato=decimal"/>/>
                        </td>
                        <td class="campocaja">
                            <span id="INETO_span"><b>${__formdata.CMONRES}</b></span>
                        </td>
                        </axis:visible>          
                    </tr>
                    <!-- Fin Cambios en todos los input que no sean pag for Bug IAXIS-14090 AABC 27/07/2020  -->
                    
                </table>
                </td>                        
                </tr>
                </table>
                
                
            </td>
            </tr>            
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin075</c:param>
                <c:param name="__botones"><axis:visible f="axissin075" c="BT_CANCELAR">cancelar</axis:visible></c:param>
            </c:import>
        </form> 
        
        <c:import url="../include/mensajes.jsp" />
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
        <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin075');
        </script>                   
    </c:if>
    
</html>