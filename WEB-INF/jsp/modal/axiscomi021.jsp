<%/*
*  Fichero: axiscomi021.jsp
*  Fecha: 11/13/2019
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axiscomi021"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />

		<%--<style type="text/css">
		#LSTGARANTIAS > thead:nth-child(1){
			position: sticky;
			top: 0;
		}
		</style> --%>
	    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	var ok = "${__formdata.OK}";        	
        	revisarEstilos();
        	f_cargar_propiedades_pantalla();   
        	if(ok == "1"){
        		parent.f_aceptar_modal('axiscomi021');
        	}
        	
        }
        
        function f_but_aceptar(){
        	if(validar_datos()){
        		var infosel = obtener_datos();
            	var ccodigo = $('#CCODIGO').val();
            	//var listaGarantias = objDom.getValorPorId("LSTGARANTIAS");
            	//console.log("listaGarantias: "+listaGarantias);
                objUtiles.ejecutarFormulario("modal_axiscomi021.do?INFOSELEC="+infosel+"&CCODIGOSEL="+ccodigo, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            	//objUtiles.ejecutarFormulario("modal_axiscomi021.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
        	}else{
        		alert("Los valores de la Tasa deben ser mayores o iguales a 0.");	
        	}        	
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axiscomi021');            
        }
        
        function validar_datos(){
        	for (var i=0;i < document.forms["miForm"].elements.length;i++){
        		var elemento = document.forms[0].elements[i];
        		if(elemento.id == "NTASA"|| elemento.id == "PRIMA_NUEVA"|| elemento.id == "PRIMA_ENDOSO"){//**  TASK 72 EDSS 
        			if(elemento.value == null || elemento.value == ""){
        				return false;
        			}else{
        				if(parseFloat(elemento.value) < 0){
        					return false;
        				}
        			}
        		}
        	}
        	return true;
        }
        
        function obtener_datos(){
        	var cadena = "";
        	for (var i=0;i < document.forms["miForm"].elements.length;i++){
        		var elemento = document.forms[0].elements[i];
        		if(elemento.id == "CGARANT" || elemento.id == "NTASA"|| elemento.id == "PRIMA_NUEVA"|| elemento.id == "PRIMA_ENDOSO"){//**  TASK 72 EDSS 
        			cadena = cadena + elemento.value + "-";
        			if(elemento.id == "PRIMA_ENDOSO"){//**  TASK 72 EDSS 
        				cadena = cadena + "~";
        			}
        		}
        	}
        	return cadena;
        }
        
        /* **************************************************** FUNCIONES PANTALLA ************************************************ */
        
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operacion" value=""/>
            <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi021" c="LIT_FORMULARIO_1" lit="89907078" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi021" c="LIT_PANTALLA_1" lit="89907078" /></c:param>
                <c:param name="form">axiscomi021</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="seccion">
            	<tr>
            		<td>
            			<!-- Ã�rea Asegurado -->
                  		<table class="area" align="center">
                  			<tr>
		                      <th style="width:20%;height:0px">
		                        &nbsp;
		                      </th>
		                      <th style="width:20%;height:0px">
		                        &nbsp;
		                      </th>
		                      <th style="width:20%;height:0px">
		                        &nbsp;
		                      </th>
		                      <th style="width:20%;height:0px">
		                        &nbsp;
		                      </th>
		                      <th style="width:20%;height:0px">
		                        &nbsp;
		                      </th>
		                    </tr>
		                    <tr>
		                      <!-- Numero Producto  -->
		                      <axis:visible f="axiscomi021" c="CCODIGO">
		                        <td class="titulocaja">
		                          <b><axis:alt f="axiscomi021" c="LIT_CCODIGO" lit="9905179"/></b>
		                        </td>
		                      </axis:visible>
		                      <!-- Nombre Producto -->
		                      <axis:visible f="axiscomi021" c="NNOMBRE">
		                        <td class="titulocaja" colspan="3">
		                          <b><axis:alt f="axiscomi021" c="LIT_TNOMBRE" lit="1000307"/></b>
		                        </td>
		                      </axis:visible>
		                    </tr>
		                    <tr>
		                      <axis:visible f="axiscomi021" c="CCODIGO">
		                        <td class="campocaja">
		                          <input style="width:90%" type="text"
		                                 class="campowidthinput campo campotexto"
		                                 id="CCODIGO" name="CCODIGO" size="15"
		                                 value="${__formdata.CCODIGO}"
		                                 <axis:atr f="axiscomi021" c="CCODIGO" a="modificable=false&obligatorio=true"/>/>
		                        </td>
		                      </axis:visible>
		                      <axis:visible f="axiscomi021" c="NNOMBRE">
		                        <td class="campocaja" colspan="3">
		                          <input style="width:98%" type="text"
		                                 class="campowidthinput campo campotexto"
		                                 id="NNOMBRE" name="NNOMBRE" size="15"
		                                 value="${__formdata.NNOMBRE}"
		                                 <axis:atr f="axiscomi021" c="NNOMBRE" a="modificable=true&obligatorio=true"/>/>
		                        </td>
		                      </axis:visible>
		                    </tr>
		                    <tr>
		                      <td>&nbsp;&nbsp;&nbsp;</td>
		                    </tr>
		                    <tr>
		                    	<td align="left" colspan="6">
		                    		<table border="0" class="area" align="left"
                               			style="width:100%;">
                               			<tr>
                               				<td>
                               				  <c:set var="title0">
					                                <axis:alt f="axiscomi021" c="LISTA_CODPGAR"
					                                          lit="103465"/>
				                              </c:set>
				                              <c:set var="title1">
					                                <axis:alt f="axiscomi021" c="LISTA_GAR"
					                                          lit="89906159"/>
				                              </c:set>
				                              <c:set var="title2">
				                                <axis:alt f="axiscomi021" c="LISTA_TASA"
				                                          lit="9901974"/>
				                              </c:set>
				                              <c:set var="title3">
				                                <axis:alt f="axiscomi021" c="PRIMA_NUEVA"
				                                          lit="89908189"/>
				                              </c:set>
				                              <c:set var="title4">
				                                <axis:alt f="axiscomi021" c="PRIMA_ENDOSO"
				                                          lit="9908661"/>
				                              </c:set>
				                              
				                              <div class="seccion displayspaceGrande" style ="max-height:100% ">
				                              	<display:table name="${__formdata.LSTGARANTIAS}"
	                                               id="LSTGARANTIAS" export="false"
	                                               class="dsptgtable" pagesize="-1"
	                                               defaultorder="ascending"
	                                               sort="list" cellpadding="0"
	                                               cellspacing="0">
	                                  				<%@ include file="../include/displaytag.jsp"%>
					                                  <display:column title="${title0}"
					                                                  headerClass="sortable"
					                                                  media="html" autolink="false">
					                                    <input type="hidden" class="campo campotexto"
					                                           value="${LSTGARANTIAS.CGARANT}"
					                                           name="CGARANT" id="CGARANT" size="15"
					                                           style="width:70%" formato="decimal"
					                                           title='<axis:alt f="axiscomi021" c="CGARANT" lit="103465"/>'
					                                           />
					                                           ${LSTGARANTIAS.CGARANT}<%-- INI **  TASK 72 EDSS --%>
					                                  </display:column>
					                                  <axis:visible f="axiscomi021" c="TGARANT">
	                                  				  <display:column title="${title1}"
					                                                  headerClass="sortable"
					                                                  media="html" autolink="false">
					                                   ${LSTGARANTIAS.TGARANT}  
					                                  </display:column>
					                                  </axis:visible>
					                                  <display:column title="${title2}"
					                                                  headerClass="sortable"
					                                                  media="html" autolink="false">
					                                    <input type="text" class="campo campotexto"
					                                           value="${LSTGARANTIAS.NTASA}"
					                                           name="NTASA" id="NTASA" size="15"
					                                           style="width:70%" formato="decimal"
					                                           title='<axis:alt f="axiscomi021" c="NTASA" lit=""/>'
					                                           />
					                                  </display:column>
					                                 <c:if test="${requestScope.retVal == '1'}"><%-- INI **  TASK 72 EDSS --%> 
					                                  <display:column title="${title3}"
					                                                  headerClass="sortable"
					                                                  media="html" autolink="false">
					                                    <input type="text" class="campo campotexto"
					                                           value="${LSTGARANTIAS.PRIMA_NUEVA}"
					                                           name="PRIMA_NUEVA" id="PRIMA_NUEVA" size="15"
					                                           style="width:70%" formato="decimal"
					                                           
					                                           />
					                                  </display:column>
					                                  <display:column title="${title4}"
					                                                  headerClass="sortable"
					                                                  media="html" autolink="false">
					                                    <input type="text" class="campo campotexto"
					                                           value="${LSTGARANTIAS.PRIMA_ENDOSO}"
					                                           name="PRIMA_ENDOSO" id="PRIMA_ENDOSO" size="15"
					                                           style="width:70%" formato="decimal"
					                                           title='<axis:alt f="axiscomi021" c="PRIMA_ENDOSO" lit=""/>'
					                                           />
					                                  </display:column>
					                                </c:if><%--  FIN **  TASK 72 EDSS --%> 
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
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi021</c:param><c:param name="f">axiscomi021</c:param>
                <c:param name="f">axiscomi021</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />

    </body>
</html>