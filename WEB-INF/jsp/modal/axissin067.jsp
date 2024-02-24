<%/* Revision:# YGoeUnmBR1M4w+rGJ29rMQ== # */%>

<%--
/**
*  Fichero: axissin067.jsp
*  
*  Titulo: Modal mantetenimniento personas relacionadas proceso judicial
*
*  Fecha: 03/03/2009
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin067" lit="9909363"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() { 

        f_cargar_propiedades_pantalla(); 
    

        }
        
        function f_cargar_form(){
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axissin067.do", "form", document.Axissin0067Form, "_self", objJsMessages.jslit_cargando);

            }
        }

        function f_cargar_tabla2(){
        	var CTRAMITAD = document.Axissin0067Form.radioUNIDAD.value;
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axissin067.do?CTRAMITAD_SEL="+CTRAMITAD, "cargar", document.Axissin0067Form, "_self", objJsMessages.jslit_cargando);

            }
        }        

        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin067");
        }


	
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
    
     <!--********** CALENDARIO ************************* -->
      <!-- Hoja de estilo del Calendario -->
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <!-- Script principal del calendario -->
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <!-- Idioma del calendario, en función del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
     <!--*********************************** -->   
    
    
    <form name="Axissin0067Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CCAUSIN" value="${__formdata.CCAUSIN}"/>
    <input type="hidden" name="CMOTSIN" value="${__formdata.CMOTSIN}"/>
    <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}"/>    
    <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" name="CTRAMTE" value="${__formdata.CTRAMTE}"/>
    <input type="hidden" name="CESTSIN" value="${__formdata.CESTSIN}"/>
    <input type="hidden" name="CTRAMITAD_S" id="CTRAMITAD_S" value="${__formdata.CTRAMITAD_S}"/>
    <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>

    <c:import url="../include/titulo_nt.jsp">
        
        <c:param name="titulo"><axis:alt c="titulo" f="axissin067" lit="9909363"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin067" lit="9909363"/></c:param>
        <c:param name="form">axissin067</c:param>
        
    </c:import>

  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>

                                
                            </tr>
                            <tr>
                              <axis:ocultar f="axissin067" c="CUNITRA" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin067" c="CUNITRA" lit="9000900"></axis:alt></b>
                                  </td>
                              </axis:ocultar>

                            </tr>
                            <tr>  
                            
                               <axis:ocultar c="CUNITRA" f="axissin067" dejarHueco="false">
                                <td class="campocaja" id="td_CUNITRA" colspan="1">
                                    <select name = "CUNITRA" id ="CUNITRA" size="1" onchange="f_cargar_form();" 
                                        <axis:atr f="axissin067" c="CUNITRA" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                        class="campowidthselect campo campotexto_ob">                                                    
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin067" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="cunitraOp" items="${__formdata.lstcunitra}">
                                            <option value = "${cunitraOp.CTRAMITAD}" 
                                                <c:if test="${cunitraOp.CTRAMITAD == __formdata.CUNITRA}">selected</c:if>>
                                             ${cunitraOp.TTRAMITAD}
                                        </option>
                                     </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                              </tr>
                                        <tr>
                                            <td colspan="4">
                                    
                                            <c:set var="title0"><axis:alt f="axissin068" c="CTRAMITAD" lit="109155" /></c:set><!-- Tipo de persona -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="TTRAMITAD" lit="9910018" /></c:set><!--Numero identificacion-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="PROCESOS" lit="9909364" /></c:set> <!-- Importe a pagar-->
                                            <c:set var="lista_procesos" value="${__formdata.procesosTramita}" />
                                            <div class="displayspace">
                                            
                                              <display:table name="${lista_procesos}" id="CUNITRA" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                               
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons"><input onchange="f_cargar_tabla2()"
                                                    <c:if test="${__formdata.CTRAMITAD_SEL  == CUNITRA.CTRAMITAD }"> checked </c:if>
                              
                                                    value="${CUNITRA.CTRAMITAD}" type="radio"  id="radioUNIDAD" name="radioUNIDAD"/></div> 
                                                </display:column>
                                                <display:column title="${title0}" sortable="true" sortProperty="CTRAMITAD" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CUNITRA.CTRAMITAD}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="TTRAMITAD" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CUNITRA.TTRAMITAD}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="PROCESOS" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CUNITRA.PROCESOS}</div>    
                                                </display:column>
                                                	

                                            </display:table>
                                            </div>
                          
                                     
                                     
                                            </td>
                                        </tr>
                                        
                            <tr>
                                                          
	                          <axis:ocultar c="CTRAMIT" f="axissin067" dejarHueco="false">
	                        	<td class="titulocaja">
	                            	<b><axis:alt f="axissin067" c="CTRAMIT" lit="9001028"/></b><!-- Tipus tramitacio -->
	                        	</td>
	                        	</axis:ocultar>

                            </tr>
                            <tr>
                                
		                        <axis:ocultar f="axissin067" c="CTRAMIT" dejarHueco="false">
		                        <td class="campocaja">
		                            <select name="CTRAMIT" id="CTRAMIT"
		                                <axis:atr f="axissin067" c="CTRAMIT" a="isInputText=false&obligatorio=false&modificable=true"/> 
		                                size="1" onchange="javascript:f_cargar_tabla2();"  
		                                class="campowidthselect campo campotexto_ob"
		                                style="width:90%;" title="<axis:alt f='axissin067' c='CTRAMIT' lit='9001028'/>" >
		                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin067" c="SNV_COMBO" lit="1000348"/> - </option>
		                                <!-- INI IAXIS 4961 AABG: Ajuste para precargar combo -->
		                                <c:forEach var="tipotram" items="${__formdata.tipo_tramitacion}">
		                                    <option value = "${tipotram.CTRAMIT}" 
		                                    <c:if test="${tipotram.CTRAMIT == __formdata.CTRAMIT_S}">selected</c:if>>
		                                        ${tipotram.TTRAMIT} 
		                                    </option>
		                                </c:forEach>
		                                <!-- FIN IAXIS 4961 AABG: Ajuste para precargar combo -->
		                            </select>
		                        </td>
		                        </axis:ocultar>
                                
                              </tr>
                                        <tr>
                                            <td colspan="4">
                                    
                                            <c:set var="title0"><axis:alt f="axissin068" c="CTRAMITAD" lit="109155" /></c:set><!-- Tipo de persona -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="TTRAMITAD" lit="9910018" /></c:set><!--Numero identificacion-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="TPOBLAC" lit="9908410" /></c:set> <!-- Nombre de la persona-->
                                            <c:set var="title3"><axis:alt f="axissin068" c="PROCESOS" lit="9909364" /></c:set> <!-- Importe a pagar-->
                                            <c:set var="lista_procesosCiudad" value="${__formdata.procesosTramitaCiu}" />
                                            <div class="displayspace">
                                            
                                              <display:table name="${lista_procesosCiudad}" id="CIUDAD" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                               
                                                <%@ include file="../include/displaytag.jsp"%>
                                               
                                                <display:column title="${title0}" sortable="true" sortProperty="CTRAMITAD" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CIUDAD.CTRAMITAD}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="TTRAMITAD" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CIUDAD.TTRAMITAD}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="TPOBLAC" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CIUDAD.TPOBLAC}</div>    
                                                </display:column>
                                                
                                                <display:column title="${title3}" sortable="true" sortProperty="PROCESOS" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${CIUDAD.PROCESOS}</div>    
                                                </display:column>	

                                            </display:table>
                                            </div>
                          
                                     
                                     
                                            </td>
                                        </tr>
                            </table> <!-- UNO -->
                            <!-- INI IAXIS 4961 AABG: Ajuste para total de registros -->
                            <div style='text-align: right;'>
                            	<span class="titulocaja">
		                            <b><fmt:message key="9907939"/>: </b><!-- Total-->
		                            <b>${__formdata.SUMPROCESOS}</b>
		                        </span>
                            </div>
                            <!-- INI IAXIS 4961 AABG: Ajuste para total de registros -->

            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin067</c:param><c:param name="f">axissin067</c:param><c:param name="f">axissin067</c:param><c:param name="__botones">cancelar</c:param></c:import>
    </form>
    <script type="text/javascript">

</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
