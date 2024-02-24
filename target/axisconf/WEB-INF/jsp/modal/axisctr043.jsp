<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- 
*  Fichero: axisctr043.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 25/08/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
            <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />

    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload_axisctr043() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr043');
					</c:if>
            var grabarOK = ${requestScope.grabarOK == true};
            
            document.axisctr043Form.TNATRIE.focus();
                        
            if (grabarOK){
               var riesgo = "${__formdata.NNRIESGO}";
               if(riesgo > 0){
                    parent.f_aceptar_modal("axisctr043",riesgo);  
               }else{
                    parent.f_aceptar_modal("axisctr043");
               }
            }
			f_cargar_propiedades_pantalla();
        }
                
        function f_but_aceptar() {        
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisctr043.do", "grabarRieDescripcion", document.axisctr043Form, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisctr043");
        } 

		function archivoSeleccionado(listaArchivos){
        	var textoFinal = "";
        	var numCaracteres = 50;
        	var archivo = listaArchivos[0];
        	var reader = new FileReader();
        	reader.readAsText(archivo);
        	reader.onload = function(event) {
        		var csvData = event.target.result;
        		var arr = csvData.split(/\n/);
        		
        		for(var i = 0;i < arr.length-1; i++){
        			var valor = arr[i].split(";");
        				var texto1 = valor[0];
        				var texto2 = valor[1];
        				var texto3 = valor[2];
        				
        				for(var j = 0; j <= (numCaracteres - texto1.length); j++){
        					texto1 += " ";
        				}
        				
        				for(var h = 0; h <= (numCaracteres - texto2.length); h++){
        					texto2 += " ";
        				}
        				textoFinal += texto1+texto2+texto3;
        		}
        		
        		$("#TNATRIE").val(textoFinal);
        		$("#NASEGUR").val(arr.length-1);
        	};
        	
        	reader.onerror = function() {
                alert('Error al leer archivo ' + archivo.fileName);
            };
        }

    </script>  
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload_axisctr043()">
  <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
   
    <form name="axisctr043Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="NRIESGO"  value="${__formdata.NRIESGO}"/>
		<input type="hidden" name="CMODO"  value="${__formdata.CMODO}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisctr043" c="LIT_9000471" lit="9000471"/>
            <axis:visible f="axisctr043" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
            </axis:visible>
            </c:param> <%-- INTRODUCCIÓN DE UN RIESGO INNOMINADO --%>
            <c:param name="producto"><axis:alt f="axisctr043" c="LIT_9000471" lit="9000471"/></c:param>   <%-- INTRODUCCIÓN DE UN RIESGO INNOMINADO --%>
            <c:param name="form">axisctr043</c:param>
        </c:import>

        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <th style="width:4%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr043" c="LIT_100588" lit="100588"/></b> <%-- Descripción --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" colspan="3">
                            
                                <textarea cols="" rows="20" class="campo campotexto" id="TNATRIE" name="TNATRIE" size="15" title="<axis:alt f="axisctr043" c="LIT_100588" lit="100588"/>"
                                    style="width:97.5%;overflow:hidden;" <axis:atr f="axisctr043" c="TNATRIE" a="obligatorio=true&isInputText=false"/>
                                    <c:if test="${!empty __formdata.CMODO && __formdata.CMODO == 'CONSULTA'}"> readonly </c:if>
                                    >${__formdata.TDESCRIE}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>     
                            <c:if test="${__formdata.COBJASE == 4}">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr043" c="LIT_9000477" lit="9000477"/></b> <%-- Nº Asegurados --%>
                            </td>                            
                            <c:if test="${__formdata.CSUBPRO == 2 || __formdata.CSUBPRO == 3}">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr043" c="LIT_9000478" lit="9000478"/></b> <%-- Edad --%>
                            </td>
                            <td class="titulocaja">                                    
                                <b><axis:alt f="axisctr043" c="LIT_100962" lit="100962"/></b>  <%-- Sexo --%>
                            </td>
                            </c:if>
                            </c:if>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>                            
                            <c:if test="${__formdata.COBJASE == 4}">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NASEGUR}" name="NASEGUR" id="NASEGUR" style="width:18%;" 
                                <axis:atr f="axisctr043" c="NASEGUR" a="formato=entero"/> title="<axis:alt f="axisctr043" c="LIT_9000477" lit="9000477"/>"/>
								<input type="file" id="archivo" name="archivo" onchange="archivoSeleccionado(this.files)" accept=".csv"/>
								<output id="list"></output>
                            </td>                            
                            <c:if test="${__formdata.CSUBPRO == 2 || __formdata.CSUBPRO == 3}">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NEDADCOL}" name="NEDADCOL" id="NEDADCOL" style="width:18%;" 
                                <axis:atr f="axisctr043" c="NEDADCOL" a="formato=entero"/> title="<axis:alt f="axisctr043" c="LIT_9000478" lit="9000478"/>"/>
                            </td>                            
                            <td class="campocaja">
                                <select name="NSEXCOL" id="NSEXCOL" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;"
                                <axis:atr f="axisctr043" c="NSEXCOL" a="obligatorio=true"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr043" c="LIT_1000348" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.NSEXCOL}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </c:if>
                            </c:if>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr043</c:param>
            <c:param name="__botones">cancelar<axis:visible c="BT_ACEPTAR" f="axisctr043">,aceptar</axis:visible></c:param>       
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    </div>
</html>

