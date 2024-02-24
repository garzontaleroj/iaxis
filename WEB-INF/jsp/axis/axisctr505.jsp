<%/*
*  Fichero: axisctr505.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*
*  Fecha: 14/11/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:set var="pantalla" value="axisctr505"/>

<c:choose>
    <c:when test="${sessionScope.MODO eq 'SIMULACION'}">
        <c:set var="literalTitulo">
            <axis:alt f="axisctr505" c="TITULO_ADIC" lit="108021"/>
        </c:set>
    </c:when>
    <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA'}">
        <c:set var="literalTitulo">
            <axis:alt f="axisctr505" c="TITULO_ADIC" lit="101110"/>
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="literalTitulo">
            <axis:alt f="axisctr505" c="TITULO_ADIC" lit="104752"/>
        </c:set>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="literalPantalla">
            <axis:alt f="axisctr505" c="TIT1" lit="1000183"/>/<axis:alt f="axisctr505" c="TIT2" lit="9907607"/>
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="literalPantalla">
            <axis:alt f="axisctr505" c="TIT3" lit="9907607"/>
        </c:set>
    </c:otherwise>
</c:choose>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    
    <% String pantalla = "axisctr505"; %>
    
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {        	
            f_tratarDisplayTagsPorConfiguracion();       
            f_cargar_propiedades_pantalla();
        	f_calcular_promedio();
        }
        
        function f_but_siguiente() {
            f_but_siguiente_axisctr505();
        }
    
     function f_but_anterior() {
        objDom.setValorPorId("FORM_ACT", "<%=pantalla%>");        
        f_guardarParamsPantalla();
        objUtiles.ejecutarFormulario("axis_<%=pantalla%>.do", "anterior", document.<%=pantalla%>Form, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_but_cancelar() {
     
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=<%=pantalla%>", "cancelar", document.<%=pantalla%>Form, "_self");
      
    }             
  
    function f_but_siguiente_axisctr505() {
            // Si hay alguna c.definida seleccionada, la ponemos en el hidden
        if (objValidador.validaEntrada()) {  
            objUtiles.ejecutarFormulario("axis_<%=pantalla%>.do", "siguiente", document.<%=pantalla%>Form, "_self", objJsMessages.jslit_cargando);
        }
    
    }
    function f_calcular_promedio(field){    	
    	if (objValidador.validaEntrada()) {
	    	var mes1 = objUtiles.estaVacio(document.getElementById("NMES1"))?0:parseFloat(document.getElementById("NMES1").value);
	    	var mes2 = objUtiles.estaVacio(document.getElementById("NMES2"))?0:parseFloat(document.getElementById("NMES2").value);
	    	var mes3 = objUtiles.estaVacio(document.getElementById("NMES3"))?0:parseFloat(document.getElementById("NMES3").value);
	    	var mes4 = objUtiles.estaVacio(document.getElementById("NMES4"))?0:parseFloat(document.getElementById("NMES4").value);
	    	var mes5 = objUtiles.estaVacio(document.getElementById("NMES5"))?0:parseFloat(document.getElementById("NMES5").value);
	    	var mes6 = objUtiles.estaVacio(document.getElementById("NMES6"))?0:parseFloat(document.getElementById("NMES6").value);
	    	var mes7 = objUtiles.estaVacio(document.getElementById("NMES7"))?0:parseFloat(document.getElementById("NMES7").value);
	    	var mes8 = objUtiles.estaVacio(document.getElementById("NMES8"))?0:parseFloat(document.getElementById("NMES8").value);
	    	var mes9 = objUtiles.estaVacio(document.getElementById("NMES9"))?0:parseFloat(document.getElementById("NMES9").value);
	    	var mes10 = objUtiles.estaVacio(document.getElementById("NMES10"))?0:parseFloat(document.getElementById("NMES10").value);
	    	var mes11 = objUtiles.estaVacio(document.getElementById("NMES11"))?0:parseFloat(document.getElementById("NMES11").value);
	    	var mes12 = objUtiles.estaVacio(document.getElementById("NMES12"))?0:parseFloat(document.getElementById("NMES12").value);
	    	
	    	var total = f_truncator((mes1+mes2+mes3+mes4+mes5+mes6+mes7+mes8+mes9+mes10+mes11+mes12)/12,2);
	    	var promedio = objNumero.formateaNumeroCero(total+"", true);
	    	document.getElementById("NMES13").value = promedio;
    	}else{
    		if(!objUtiles.estaVacio(field))field.value = 0;
    	}
    }
    
    </script>
  </head>
  
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>        
        
 <form name="axisctr505Form" action="" method="POST"> 
        <input type="hidden" name="operation" value=""/> 
    <input type="hidden" name="selected" id="selected"/>  
    <input type="hidden" id="SNIP" name="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
    <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
    <input type="hidden" id="CLAUSU_NOOBLIG" name="CLAUSU_NOOBLIG" value="${__formdata.CLAUSU_NOOBLIG}"/>
     <input type="hidden" name="TNOMBRE" id="TNOMBRE" value=""/>
    <input type="hidden" name="TNOMBRE1" id="TNOMBRE1" value=""/>
    <input type="hidden" name="TNOMBRE2" id="TNOMBRE2" value=""/>
    <input type="hidden" name="TAPELLI1" id="TAPELLI1" value=""/>
    <input type="hidden" name="TAPELLI2" id="TAPELLI2" value=""/>
    <input type="hidden" name="CTIPIDE" id="CTIPIDE" value=""/>
    <input type="hidden" name="TIDENTI" id="TIDENTI" value=""/>
    <input type="hidden" name="CSEXPER" id="CSEXPER" value=""/>
    <input type="hidden" name="FNACIMI" id="FNACIMI" value=""/>
    <input type="hidden" name="NNUMNIF" id="NNUMNIF" value=""/>
    <input type="hidden" name="NORDEN" id="NORDEN" value=""/>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="producto">${literalTitulo}
         <axis:visible f="axisctr505" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
         </axis:visible>
        </c:param>
        <c:param name="formulario">${literalPantalla}</c:param>
        <c:param name="form">${pantalla}</c:param>
        
    </c:import>
    <!-- Area de campos  -->
    
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:170px;"</c:if>>
        <tr>
            <td>
                <table class="seccion">
                        <tr>
                            <td style="font-size: 11px;">
                            <font color="#FF8400" ><b>
                                <axis:visible c="ETIQ_RISC" f="axisctr505">
                                        <axis:alt f="axisctr505" c="ETIQ_RISC" lit="100649"></axis:alt> 
                                </axis:visible>
                                ${__formdata.OB_IAX_RIESGOS.TRIESGO}</b></font>
                            </td>
                        </tr>
                </table>
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr505" c="TITULO_PANTALLA" lit="9907607" /></div>
                <!--campos-->
                         
                <table class="seccion">
                    <tr>
                    <td>
                     <axis:ocultar f="axisctr505" c="DSP_ASEGURADOSMES">
                    <table class="area" align="center">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>                                    
                    </tr>
                    <tr> 
                                        <axis:visible f="axisctr505" c="FECHAINI">     
                                            <td class="titulocaja">
                                                <b id="label_FECHAINI"><axis:alt f="axisctr505" c="FECHAINI" lit="9907610" /></b>
                                            </td>
                                        </axis:visible> 
                                        
                                        <axis:visible f="axisctr505" c="FECHAFIN">
                                            <td class="titulocaja">
                                                <b id="label_FECHAFIN"><axis:alt f="axisctr505" c="FECHAFIN" lit="9907611" /></b>
                                            </td>
                                        </axis:visible>
                                                                               
                                </tr>
                                <tr>    
                                    
                                    <axis:visible f="axisctr505" c="FECHAINI">
                                        <td class="campocaja">                                             
                                              <c:set var="FECHAINI"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.FECHAINI}"/></c:set>
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="FECHAINI" name="FECHAINI" size="15" title="<axis:alt f="axisctr505" c="FECHAINI" lit="9907610"/>"
                                              value="${FECHAINI}"                                            
                                              <axis:atr f="axisctr505" c="FECHAINI" a="modificable=false&formato=fecha&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>

                                    <axis:visible f="axisctr505" c="FECHAFIN">
                                        <td class="campocaja">
                                              <c:set var="FECHAFIN"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.FECHAFIN}"/></c:set>
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="FECHAFIN" name="FECHAFIN" size="15" title="<axis:alt f="axisctr505" c="FECHAFIN" lit="9907611"/>"
                                              value="${FECHAFIN}"                                            
                                              <axis:atr f="axisctr505" c="FECHAFIN" a="modificable=false&formato=fecha&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                </tr>
                                
                                 <!-- MESES  -->
                                
                                 <tr> 
                                        <axis:visible f="axisctr505" c="NMES1">     
                                            <td class="titulocaja">
                                                <b id="label_NMES1"><axis:alt f="axisctr505" c="NMES1" lit="9907612" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES2">     
                                            <td class="titulocaja">
                                                <b id="label_NMES2"><axis:alt f="axisctr505" c="NMES2" lit="9907613" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES3">     
                                            <td class="titulocaja">
                                                <b id="label_NMES3"><axis:alt f="axisctr505" c="NMES3" lit="9907614" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES4">     
                                            <td class="titulocaja">
                                                <b id="label_NMES4"><axis:alt f="axisctr505" c="NMES4" lit="9907615" /></b>
                                            </td>
                                        </axis:visible> 
                                                                               
                                </tr>
                                <tr>    
                                    
                                    <axis:visible f="axisctr505" c="NMES1">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES1" name="NMES1" size="15" title="<axis:alt f="axisctr505" c="NMES1" lit="9907612"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES1}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES1}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES1}</c:if>"                                              
                                              <axis:atr f="axisctr505" c="NMES1" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>

                                    <axis:visible f="axisctr505" c="NMES2">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES2" name="NMES2" size="15" title="<axis:alt f="axisctr505" c="NMES2" lit="9907613"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES2}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES2}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES2}</c:if>"                                                                                     
                                              <axis:atr f="axisctr505" c="NMES2" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr505" c="NMES3">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES3" name="NMES3" size="15" title="<axis:alt f="axisctr505" c="NMES3" lit="9907614"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES3}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES3}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES3}</c:if>"                                                                                      
                                              <axis:atr f="axisctr505" c="NMES3" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr505" c="NMES4">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES4" name="NMES4" size="15" title="<axis:alt f="axisctr505" c="NMES4" lit="9907615"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES4}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES4}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES4}</c:if>"                                                                                        
                                              <axis:atr f="axisctr505" c="NMES4" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                </tr>
                                
                                <tr> 
                                        <axis:visible f="axisctr505" c="NMES5">     
                                            <td class="titulocaja">
                                                <b id="label_NMES5"><axis:alt f="axisctr505" c="NMES5" lit="9907616" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES6">     
                                            <td class="titulocaja">
                                                <b id="label_NMES6"><axis:alt f="axisctr505" c="NMES6" lit="9907617" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES7">     
                                            <td class="titulocaja">
                                                <b id="label_NMES7"><axis:alt f="axisctr505" c="NMES7" lit="9907618" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES8">     
                                            <td class="titulocaja">
                                                <b id="label_NMES8"><axis:alt f="axisctr505" c="NMES8" lit="9907619" /></b>
                                            </td>
                                        </axis:visible> 
                                                                               
                                </tr>
                                <tr>    
                                    
                                    <axis:visible f="axisctr505" c="NMES5">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES5" name="NMES5" size="15" title="<axis:alt f="axisctr505" c="NMES5" lit="9907616"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES5}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES5}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES5}</c:if>"                                                                                      
                                              <axis:atr f="axisctr505" c="NMES5" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>

                                    <axis:visible f="axisctr505" c="NMES6">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES6" name="NMES6" size="15" title="<axis:alt f="axisctr505" c="NMES6" lit="9907617"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES6}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES6}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES6}</c:if>"                                                                                   
                                              <axis:atr f="axisctr505" c="NMES6" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr505" c="NMES7">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES7" name="NMES7" size="15" title="<axis:alt f="axisctr505" c="NMES7" lit="9907618"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES7}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES7}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES7}</c:if>"                                                                                 
                                              <axis:atr f="axisctr505" c="NMES7" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr505" c="NMES8">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES8" name="NMES8" size="15" title="<axis:alt f="axisctr505" c="NMES8" lit="9907619"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES8}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES8}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES8}</c:if>"                                                                                 
                                              <axis:atr f="axisctr505" c="NMES8" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                </tr>
                                
                                <tr> 
                                        <axis:visible f="axisctr505" c="NMES9">     
                                            <td class="titulocaja">
                                                <b id="label_NMES9"><axis:alt f="axisctr505" c="NMES9" lit="9907620" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES10">     
                                            <td class="titulocaja">
                                                <b id="label_NMES10"><axis:alt f="axisctr505" c="NMES10" lit="9907621" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES11">     
                                            <td class="titulocaja">
                                                <b id="label_NMES11"><axis:alt f="axisctr505" c="NMES11" lit="9907622" /></b>
                                            </td>
                                        </axis:visible> 
                                        <axis:visible f="axisctr505" c="NMES12">     
                                            <td class="titulocaja">
                                                <b id="label_NMES12"><axis:alt f="axisctr505" c="NMES12" lit="9907623" /></b>
                                            </td>
                                        </axis:visible> 
                                                                               
                                </tr>
                                <tr>    
                                    
                                    <axis:visible f="axisctr505" c="NMES9">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES9" name="NMES9" size="15" title="<axis:alt f="axisctr505" c="NMES9" lit="9907620"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES9}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES9}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES9}</c:if>"                                                                                     
                                              <axis:atr f="axisctr505" c="NMES9" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>

                                    <axis:visible f="axisctr505" c="NMES10">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES10" name="NMES10" size="15" title="<axis:alt f="axisctr505" c="NMES10" lit="9907621"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES10}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES10}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES10}</c:if>"                                                                                        
                                              <axis:atr f="axisctr505" c="NMES10" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr505" c="NMES11">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES11" name="NMES11" size="15" title="<axis:alt f="axisctr505" c="NMES11" lit="9907622"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES11}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES11}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES11}</c:if>"                                                                                        
                                              <axis:atr f="axisctr505" c="NMES11" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr505" c="NMES12">
                                        <td class="campocaja">                                                                                          
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="NMES12" name="NMES12" size="15" title="<axis:alt f="axisctr505" c="NMES12" lit="9907623"/>" onchange="f_calcular_promedio(this)"
                                              value="<c:if test="${empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES12}">0</c:if><c:if test="${!empty __formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES12}">${__formdata.OB_IAX_RIESGOS.ASEGURADOSMES.NMES12}</c:if>"                                                                                        
                                              <axis:atr f="axisctr505" c="NMES12" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                </tr>                                
                                <tr>
                                	<axis:visible f="axisctr505" c="NMES13">  
                                		<td colspan="3"></td>                                	   
                                        <td class="titulocaja">
                                            <b id="label_NMES13"><axis:alt f="axisctr505" c="NMES13" lit="9908585" /></b>
                                        </td>
                                    </axis:visible>
                                </tr>                                 	
                                <tr>                                    
                                    <axis:visible f="axisctr505" c="NMES13">
                                    	<td colspan="3"></td>
	                                	<td class="campocaja">
	                                		 <input type="text" style="width:90%" class="campowidthinput campo camponumerico" id="NMES13" name="NMES13" size="15" title="<axis:alt f="axisctr505" c="NMES13" lit="9908585"/>"
	                                              <axis:atr f="axisctr505" c="NMES13" a="modificable=false"/> />
	                                	</td>
                                	</axis:visible>
                                </tr>                                
                    </table>
                    </axis:ocultar>
                    </td>
                    </tr>
                </table>
                              
            </td>
        </tr>
    </table>

            <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr505</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisctr505" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr505" c="BT_SEG">,siguiente</axis:visible></c:param>
        </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>