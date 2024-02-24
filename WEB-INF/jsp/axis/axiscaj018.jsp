<%/*
*  Fichero: axismnt014.jsp : Mantenimiento productos. Datos internos
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axiscaj018" c="PANT_LITERAL" lit="9907223"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function recargarMoneda() {
                //objUtiles.ejecutarFormulario ("axis_axiscaj018.do", "cambiomoneda", document.miForm, "_self");
                
                $("#IMOVIMI").val(objNumero.quitarSeparadorMiles($("#IMOVIMI").val()));
				$("#IMOVIMI").val(objNumero.cambiarSeparadorDecimalesPorMiles($("#IMOVIMI").val()));
                objUtiles.ejecutarFormulario("axis_axiscaj018.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
			
			function replaceAll( text, busca, reemplaza ){
				while (text.toString().indexOf(busca) != -1)
				    text = text.toString().replace(busca,reemplaza);
				
				return text;
			}

            function f_onload() {
                //document.miForm.initialLocale.value = "${__formdata.OB_IAX_USER.CIDIOMA}";
                //parent.fcabecera.location.reload();
				
				var CMONEOP = '${__formdata.CMONEOP}';
				if (!objUtiles.estaVacio(CMONEOP)){
					$("#CMONEOP").val(CMONEOP);
				}
                f_cargar_propiedades_pantalla();
            }
          
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj018", "cancelar", document.miForm, "_self");
            }           

			function recargar(IMPORTE){
                try{
                   IMPORTE = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                   if(objNumero.validaNumero(IMPORTE, true)) {
                   document.miForm.IMOVIMI.value = IMPORTE;                        
                   }else{
                    document.miForm.IMOVIMI.value = '';
                    document.miForm.IMOVIMI.focus();
                    }
                }catch(e){
					alert (e.name + " " + e.message);
                }	
            }

            function f_but_100009() {
                if (objValidador.validaEntrada()){
                 objUtiles.ejecutarFormulario("axis_axiscaj018.do","guardar",document.miForm, "_self", objJsMessages.jslit_cargando);   
                 f_onload();
                }
            }  
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="initialLocale" id="initialLocale" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscaj018" c="FORM_NOM" lit="9907223" /></c:param>
                <c:param name="form">axiscaj018</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área Datos Usuario -->
                                    <table class="area">
                                        <tr>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:40%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscaj018" c="CTIPMOV" lit="9001195"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscaj018" c="CUSUARI" lit="100894"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CTIPMOV" name="CTIPMOV" <axis:atr f="axiscaj018" c="CTIPMOV" a="obligatorio=true&isInputText=false"/> size="1"
                                                style="width:81%" value="${__formdata.CTIPMOV}" obligatorio="true"/>
                                                    <c:forEach var="LISTA_APUNTES" items="${__formdata.LISTA_APUNTES}" varStatus="cont">
                                                        <option value="${LISTA_APUNTES.CATRIBU}"
                                                        <c:if test="${__formdata.CTIPMOV == LISTA_APUNTES.CATRIBU}">selected</c:if>>
                                                        ${LISTA_APUNTES.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CUSUARI" name="CUSUARI" size="15"
                                                style="width:80%" value="${__formdata.CUSUARI}" readonly="true"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscaj018" c="CMONEOP" lit="108645"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CMONEOP" name="CMONEOP" onchange="recargarMoneda()" <axis:atr f="axiscaj018" c="CMONEOP" a="obligatorio=true&isInputText=false"/> size="1"
                                                style="width:81%" value="${__formdata.CMONEOP}" obligatorio="true"/>
                                                	<option value="null">
															<axis:alt f="axiscaj018" c="SELECCIONAR" lit="108341"/>                                
													</option>
                                                    <c:forEach var="LISTA_MONEDAS" items="${__formdata.LISTA_MONEDAS}">
                                                        <option value="${LISTA_MONEDAS.CMONEDA}">
                                                        ${LISTA_MONEDAS.TMONEDA}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscaj018" c="IMOVIMI" lit="9904351"/></b>
                                            </td>
                                        </tr>
                                        <tr>
										    <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" name="IMOVIMI" id="IMOVIMI"  onchange="recargarMoneda()"
                                                    title="<axis:alt f="axiscaj018" c="IMOVIMI" lit="9904351"/>"
                                                    <axis:atr f="axiscaj018" c="IMOVIMI" a="obligatorio=true"/> 
                                                    size="15" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONEOP]}" value="${__formdata.IMOVIMI}"/>"/>
                                            </td>
                                        </tr>                                        
                                    </table>
                                    <table class="area">
                                        <tr>
                                            <th style="width:80%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscaj018" c="TMOTAPU" lit="102577"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TMOTAPU" name="TMOTAPU" size="15"
                                                style="width:80%" value="${__formdata.TMOTAPU}" title="<axis:alt f="axiscaj018" c="TMOTAPU" lit="102577"/>" obligatorio="true"/>
                                            </td>
                                        </tr>                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscaj018</c:param><c:param name="f">axiscaj018</c:param>
                <c:param name="f">axiscaj018</c:param>
                <c:param name="__botones">salir,100009</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>