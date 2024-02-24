<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%--
/**
*  Fichero: axissin009.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  T?tulo: Modal datos siniestros: DAÑOS
*
*  Fecha: 20/02/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9000907"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
        var val1 = "<%=request.getAttribute("OK")%>"; 
         var NSINIES = "${__formdata.NSINIES}"; 
         objDom.setValorPorId("NSINIES_O",NSINIES);
       
        if (val1=="OK"){
            parent.f_aceptar_axissin009(NSINIES); //TODO: Dato SINIESTRO EJEMPLAR EJ. para volver a la pantalla
            this.f_but_cancelar();
        }
   }
        
        function f_but_aceptar(){
        var CTPINF=$( "#CTPINF" ).val();//$( "#CTPINF option:selected" ).text();//document.getElementById("CTINIF").value; 

        if(CTPINF!=-1){
           objUtiles.ejecutarFormulario ("modal_axissin009.do", "guardar", document.miForm, "_self"); 
        }else{
            alert("<axis:alt f="axissin009" c="SELECCIONE" lit="1000348"/> "+"<axis:alt f="axissin009" c="SELECCIONE" lit="9001733"/>");
        }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin009");
        }
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin009.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="danyos"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="NDANO" value="${__formdata.NDANO}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="subpantalla" value="${subpantalla}"/>
    <input type="hidden" name="seccion" value="${seccion}"/>   

    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="9000981"/></c:param>
        <c:param name="formulario"><fmt:message key="9000981"/></c:param>
        <c:param name="form">axissin009</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                                 <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr>
                    <tr>
                    <td class="titulocaja">
                            <b><fmt:message key="101298"/></b><!-- Tipus tramitacio -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                       <td class="titulocaja">
                            <b><fmt:message key="100588"/></b><!-- Tipus dany  -->
                        </td>                        
                        <td class="titulocaja">
                            <b><fmt:message key="9000901"/></b><!-- Tipus dany  -->
                        </td>
                       <td class="titulocaja">
                            <b><fmt:message key="9000905"/></b><!-- Tramitación informativa -->
                            
                        </td>                        
                        
                    </tr>
                    
                    <tr>
                     <td class="campocaja">
                         <input type="text" name="NSINIES_O" id="NSINIES_O" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTIPTRA" a="modificable=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTRAMIT" a="modificable=false"/> />
                            
                        </td>                        
                        <td class="campocaja">
                            <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTCAUSIN" a="modificable=false"/> />
                        </td>
                        <td class="campocaja" align="left">
                        <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin009" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                        <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                        </td>                        
                        

                    </tr>
                    
                    
                    <tr>
                    <td class="titulocaja">
                            <b><fmt:message key="100587"/></b><!-- Estado -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="9000852"/></b><!--Subestado -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="9000900"/></b><!-- Unidad tramitacion -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="140769"/></b><!-- Tramitador -->
                        </td>
 
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                    <td class="campocaja">
                            <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TESTTRA" a="modificable=false"/> />
                        </td>
                        <td class="campocaja">
                            <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TSUBTRA" a="modificable=false"/> />                        
                        </td>                          
                        <td class="campocaja">
                            <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TUNITRA" a="modificable=false"/> />
                        
                            
                        </td>
                        <td class="campocaja">
                           <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTRAMITAD" a="modificable=false"/> />
                        </td>

                                          
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                      <!-- Descripción del siniestro -->
                    <tr>
                        <td class="titulocaja">
                                   <div class="separador">&nbsp;</div>
                                    <b><fmt:message key="9001150" /></b>
                        </td>
                    </tr>
                    <tr>
                    <!--Descripción del siniestro -->
                        <td colspan="5" style="width:100%;"   class="campocaja"> 
                                     <textarea class="campowidthinput campo campotexto_ob" style="width:100%;" name="TDANO" id="TDANO">${__formdata.TDANO}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="titulocaja" colspan="5">
                            <b><fmt:message key="9001733"/></b><!--Tipo -->
                        </td>
                    </tr>
                    <tr>    
                        <td colspan="5">
                            <select name = "CTPINF" id ="CTPINF" size="1" style="width:20%;"
                            <axis:atr f="axissin009" c="CTPINF" a="modificable=true&isInputText=false&obligatorio=true"/> 
                            class="campowidthselect campo campotexto_ob" >                                                    
                                <option value="-1"> - <fmt:message key="1000348"/> - </option>
                                                        <c:forEach var="tipo" items="${listValores.tipo_inf}">
                                                            <option value = "${tipo.CATRIBU}" 
                                                            <c:if test="${tipo.CATRIBU == __formdata.CTIPINF}">selected</c:if>>
                                                                ${tipo.TATRIBU}
                                                            </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                              
                    
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html> 