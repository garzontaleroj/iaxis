<%/* Revision:# Iy5zMfBJTy8wR1o5mt264w== # */%>
<%
/*
*  Fichero: axissin074.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 30/08/2016
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
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axissin074");
            }           
                        
        </script>
    </head>
    <body onload="f_onload();">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin074|axissin074</c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin074" c="FORM" lit="9909378" /></c:param>
                <c:param name="producto"><axis:alt f="axissin074" c="FORM" lit="9909378" /></c:param>
                <c:param name="form">axissin074</c:param>
            </c:import>
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axissin074" c="LIT32" lit="9909378"/></b>
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
                        <axis:ocultar f="axissin074" c="TTIPDES" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="TTIPDES" lit="9001213"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="DESTINATARIO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="DESTINATARIO" lit="9000909"/></b>
                        </td>                                            
                        </axis:ocultar>                                                          
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="TTIPDES">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.DESTINATARI.TTIPDES}" name="TTIPDES" id="TTIPDES" size="10" <axis:atr f="axissin074" c="TTIPDES" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="DESTINATARIO">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.DESTINATARI.PERSONA.TNOMBRE}    ${__formdata.DESTINATARI.PERSONA.TAPELLI1} ${__formdata.DESTINATARI.PERSONA.TAPELLI2}" name="DESTINATARIO" id="DESTINATARIO" size="10"  <axis:atr f="axissin074" c="DESTINATARIO" a="modificable=false"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="TCONPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="TCONPAG" lit="9001284"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="TCAUIND" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="TCAUIND" lit="9001199"/></b>
                        </td>                                            
                        </axis:ocultar>                                                          
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="TCONPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TCONPAG}" name="TCONPAG" id="TCONPAG" size="10" <axis:atr f="axissin074" c="TCONPAG" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="TCAUIND">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TCAUIND}" name="TCAUIND" id="TCAUIND" size="10"  <axis:atr f="axissin074" c="TCAUIND" a="modificable=false"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
					
                        <axis:ocultar f="axissin074" c="FORDPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="FORDPAG" lit="9000910"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="TFORPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="TFORPAG" lit="9909355"/></b>
                        </td>                                            
                        </axis:ocultar>                                                          
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="FORDPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FORDPAG}'/>" name="FORDPAG" id="FORDPAG" size="10" <axis:atr f="axissin074" c="FORDPAG" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="TFORPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TFORPAG}" name="TFORPAG" id="TFORPAG" size="10"  <axis:atr f="axissin074" c="TFORPAG" a="modificable=false"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                
                    <tr>
                        <axis:ocultar f="axissin074" c="CBANCAR" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="CBANCAR" lit="9907721"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="NCHEQUE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="NCHEQUE" lit="9907717"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="TNOMBRE_PRESENTADOR" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="TNOMBRE_PRESENTADOR" lit="9909354"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="CBANCAR">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" size="10" <axis:atr f="axissin074" c="CBANCAR" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="NCHEQUE">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" size="10"  <axis:atr f="axissin074" c="NCHEQUE" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="TNOMBRE_PRESENTADOR">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.PRESENTADOR.TNOMBRE} ${__formdata.PRESENTADOR.TAPELLI1} ${__formdata.PRESENTADOR.TAPELLI2}" name="TNOMBRE_PRESENTADOR" id="TNOMBRE_PRESENTADOR" size="10"  <axis:atr f="axissin074" c="TNOMBRE_PRESENTADOR" a="modificable=false"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="NFACREF" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="NFACREF" lit="9903744"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="FFACREF" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="FFACREF" lit="9000956"/></b>
                        </td>                                            
                        </axis:ocultar>                                                          
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="NFACREF">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NFACREF}" name="NFACREF" id="NFACREF" size="10" <axis:atr f="axissin074" c="NFACREF" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="FFACREF">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FFACREF}'/>" name="FFACREF" id="FFACREF" size="10"  <axis:atr f="axissin074" c="FFACREF" a="modificable=false"/>/>
                        </td>
                        </axis:visible>               
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="TOBSERVA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="TOBSERVA" lit="101162"/></b>
                        </td>                                            
                        </axis:ocultar>
                                                                    
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="TOBSERVA">
                        <td class="campocaja" colspan="3">
                        <textarea <axis:atr f="axisadm093" c="TOBSERVA" a="modificable=false"/> 
                            title="<axis:alt f="axisadm093" c="TOBSERVA" lit="101162"/>" cols="" rows="3" class="campo campotexto"  id="TOBSERVA" name="TOBSERVA" size="15" maxlength="132"
                            style="width:98%;overflow-x:hidden;overflow-y:auto">${__formdata.TOBSERVA}</textarea>
                        </td>
                        </axis:visible>  
                             
                    </tr>                    
                    
                    <tr>  
                        <td class="campocaja">
                        <img src="images/flecha.gif"/>
                        <b><axis:alt f="axissin074" c="LIT32" lit="9909378"/> ${__formdata.CMONRES}</b> 
                        </td>
                    </tr>
                    <tr>  
                        <td class="campocaja"></td>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="IRESRCM" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRESRCM" lit="9001202"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IRESRED" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRESRED" lit="9001410"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="ISINRET" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="ISINRET" lit="9000938"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="IRESRCM">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IRESRCM}"/>" name="IRESRCM" id="IRESRCM" size="10" <axis:atr f="axissin074" c="IRESRCM" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IRESRED">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IRESRED}"/>" name="IRESRED" id="IRESRED" size="10"  <axis:atr f="axissin074" c="IRESRED" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="ISINRET">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.ISINRET}"/>" name="ISINRET" id="ISINRET" size="10"  <axis:atr f="axissin074" c="ISINRET" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="IRETENC" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRETENC" lit="9001030"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IIVA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IIVA" lit="9001321"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="IRETEIVA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRETEIVA" lit="9902698"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IRETEICA" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRETEICA" lit="9902697"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="IRETENC">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IRETENC}"/>" name="IRETENC" id="IRETENC" size="10" <axis:atr f="axissin074" c="IRETENC" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IIVA">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IIVA}"/>" name="IIVA" id="IIVA" size="10"  <axis:atr f="axissin074" c="IIVA" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IRETEIVA">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IRETEIVA}"/>" name="IRETEIVA" id="IRETEIVA" size="10"  <axis:atr f="axissin074" c="IRETEIVA" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axissin074" c="IRETEICA">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IRETEICA}"/>" name="IRETEICA" id="IRETEICA" size="10"  <axis:atr f="axissin074" c="IRETEICA" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="IOTROSGAS" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IOTROSGAS" lit="9909357"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IBASEIPOC" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IBASEIPOC" lit="9909358"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="IIPOCONSUMO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IIPOCONSUMO" lit="9909360"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="IOTROSGAS">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IOTROSGAS}"/>" name="IOTROSGAS" id="IOTROSGAS" size="10" <axis:atr f="axissin074" c="IOTROSGAS" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IBASEIPOC">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IBASEIPOC}"/>" name="IBASEIPOC" id="IBASEIPOC" size="10"  <axis:atr f="axissin074" c="IBASEIPOC" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IIPOCONSUMO">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONRES]}" value="${__formdata.IIPOCONSUMO}"/>" name="IIPOCONSUMO" id="IIPOCONSUMO" size="10"  <axis:atr f="axissin074" c="IIPOCONSUMO" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>  
                        <td class="campocaja">
                        <img src="images/flecha.gif"/>
                        <b><axis:alt f="axissin074" c="LIT32" lit="9909378"/> ${__formdata.CMONPAG}</b> 
                        </td>
                    </tr>
                    <tr>  
                        <td class="campocaja"></td>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="IRESRCMPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRESRCMPAG" lit="9001202"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IRESREDPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRESREDPAG" lit="9001410"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="ISINRETPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="ISINRETPAG" lit="9000938"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="IRESRCMPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IRESRCMPAG}"/>" name="IRESRCMPAG" id="IRESRCMPAG" size="10" <axis:atr f="axissin074" c="IRESRCMPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IRESREDPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IRESREDPAG}"/>" name="IRESREDPAG" id="IRESREDPAG" size="10"  <axis:atr f="axissin074" c="IRESREDPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="ISINRETPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.ISINRETPAG}"/>" name="ISINRETPAG" id="ISINRETPAG" size="10"  <axis:atr f="axissin074" c="ISINRETPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="IRETENCPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRETENCPAG" lit="9001030"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IIVAPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IIVAPAG" lit="9001321"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="IRETEIVAPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRETEIVAPAG" lit="9902698"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IRETEICAPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IRETEICAPAG" lit="9902697"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="IRETENCPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IRETENCPAG}"/>" name="IRETENCPAG" id="IRETENCPAG" size="10" <axis:atr f="axissin074" c="IRETENCPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IIVAPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IIVAPAG}"/>" name="IIVAPAG" id="IIVAPAG" size="10"  <axis:atr f="axissin074" c="IIVAPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IRETEIVAPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IRETEIVAPAG}"/>" name="IRETEIVAPAG" id="IRETEIVAPAG" size="10"  <axis:atr f="axissin074" c="IRETEIVAPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axissin074" c="IRETEICAPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IRETEICAPAG}"/>" name="IRETEICAPAG" id="IRETEICAPAG" size="10"  <axis:atr f="axissin074" c="IRETEICAPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axissin074" c="IOTROSGASPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IOTROSGASPAG" lit="9909357"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axissin074" c="IBASEIPOCPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IBASEIPOCPAG" lit="9909358"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin074" c="IIPOCONSUMOPAG" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axissin074" c="IIPOCONSUMOPAG" lit="9909360"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:visible f="axissin074" c="IOTROSGASPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IOTROSGASPAG}"/>" name="IOTROSGASPAG" id="IOTROSGASPAG" size="10" <axis:atr f="axissin074" c="IOTROSGASPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IBASEIPOCPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IBASEIPOCPAG}"/>" name="IBASEIPOCPAG" id="IBASEIPOCPAG" size="10"  <axis:atr f="axissin074" c="IBASEIPOCPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axissin074" c="IIPOCONSUMOPAG">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONPAG]}" value="${__formdata.IIPOCONSUMOPAG}"/>" name="IIPOCONSUMOPAG" id="IIPOCONSUMOPAG" size="10"  <axis:atr f="axissin074" c="IIPOCONSUMOPAG" a="modificable=false&formato=decimal"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                </table>
                </td>                        
                </tr>
                </table>
               
                
            </td>
            </tr>            
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin074</c:param>
                <c:param name="__botones"><axis:visible f="axissin074" c="BT_CANCELAR">cancelar</axis:visible></c:param>
            </c:import>
        </form> 
        
        <c:import url="../include/mensajes.jsp" />
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
        <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin074');
        </script>                   
    </c:if>
    
</html>
