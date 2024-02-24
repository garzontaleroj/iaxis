<%/**
*  Fichero: axisfinv008.jsp
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisfinv008" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
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
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {                
                var ok = "${guardado}";
                
                if (!objUtiles.estaVacio(ok) && ok == 0){
                    parent.f_aceptar_axisfinv008();        
                }

                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisfinv008");  
            }    
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                    if (document.getElementById("MONORIG").value != document.getElementById("MONDEST").value){
                        objUtiles.ejecutarFormulario ("modal_axisfinv008.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    } else{
                        alert("<axis:alt f='axisfinv008' c='ERROR_COTITZACIO' lit='9901985' />");
                    }
                }
            }
          function recargar(IMPORTE){
                try{
                   IMPORTE = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                   if(objNumero.validaNumero(IMPORTE, true)) {
                    document.miForm.ITASA.value = IMPORTE;                        
                   }else{
                    document.miForm.ITASA.value = '';
                    document.miForm.ITASA.focus();
                    }
                   
               }catch(e){
                 alert (e.name + " " + e.message);
                }
            }
        </script>
    </head>
    
    <body onload="f_onload()" >
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operation" value=""/>
            
            <input type="hidden" name="NOU" id="NOU" value="${__formdata.NOU}"/>

            
             <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv008" c="TITULO_PANTALLA" lit="9901970" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv008" c="TITULO_FORM" lit="9901970" /></c:param>
                <c:param name="form">axisfinv008</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!-- Área 1 -->
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:31%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv008" c="MONORIG">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv008" c="MONORIG" lit="9901972"/></b>   <%-- Monorig --%>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv008" c="MONDEST">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv008" c="MONDEST" lit="9901973"/></b>   <%-- MonDest --%>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv008" c="MONORIG">
                                    <td class="campocaja">
                                        <select name="MONORIG" id="MONORIG" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv008" c="MONORIG" lit="9901972"/>">
                                            <option value="null"> - <axis:alt f="axisfinv008" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${listaMon}" var="item">
                                                <option value = "${item.CMONEDA}" <c:if test="${!empty __formdata.CMONORI && __formdata.CMONORI == item.CMONEDA}"> selected </c:if>>${item.TMONEDA}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv008" c="MONDEST">
                                    <td class="campocaja">
                                        <select name="MONDEST" id="MONDEST" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv008" c="MONDEST" lit="9901973"/>">
                                            <option value="null"> - <axis:alt f="axisfinv008" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${listaMon}" var="item">
                                                <option value = "${item.CMONEDA}" <c:if test="${!empty __formdata.CMONDEST && __formdata.CMONDEST == item.CMONEDA}"> selected </c:if>>${item.TMONEDA}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv008" c="ITASA">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv008" c="ITASA" lit="9901974"/></b>  
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv008" c="FCAMBIO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv008" c="ITASA">
                                    <td class="campocaja">
                                        <input type="text" name="ITASA" onchange="recargar(this.value)" id="ITASA" value="<fmt:formatNumber pattern="###,##0.000000" value='${__formdata.ITASA}'/>" class="campowidthinput campo campotexto"  style="width:50%"
                                        <axis:atr f="axisfinv008" c="ITASA" a="decimal=true&obligatorio=true"/>
                                        alt="<axis:alt f="axisfinv008" c="ITASA" lit="9901974"/>" title="<axis:alt f="axisfinv008" c="ITASA" lit="9901974"/>"/>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv008" c="FCAMBIO">
								<!-- CELSO - 05/06/19 - IAXIS-4219 - INICIO Mantenimiento Cotizaciones modificable --> 
								<!-- Este é um comentário 
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:30%;" 
                                        value="<fmt:formatDate value='${__formdata.FCAMBIO}' pattern='dd/MM/yyyy'/>" name="FCAMBIO" id="FCAMBIO"
                                        title="<axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/>" 
										alt="<axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/>"/> 
                                      -->

									 
									<td class="campocaja"> 
                                        <input type="text" name="FCAMBIO" id="FCAMBIO" value="<fmt:formatDate value="${__formdata.FCAMBIO}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto" size="15" style="width:30%;"   
                                        <axis:atr f="axisfinv008" c="FCAMBIO" a="formato=fecha&obligatorio=true"/> 
                                        alt="<axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/>" title="<axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/>" 
                                        <c:if test="${__formdata.CMONORI != 'TPS'}"> readonly </c:if>
                                        
                                        />	
										<!-- CELSO - 05/06/19 - IAXIS-4219 - FIN Mantenimiento Cotizaciones modificable -->
										
										
										
										<a style="vertical-align:middle;"><img id="icon_FCAMBIO" alt="<axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/>" title="<axis:alt f="axisfinv008" c="FCAMBIO" lit="9900897"/>" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisfinv008</c:param>
                            <c:param name="__botones">cancelar<axis:visible f="axisfinv008" c="ACEPTAR">,aceptar</axis:visible></c:param>
                        </c:import>
                        
                        <script type="text/javascript">
                            Calendar.setup({
                                inputField     :    "FCAMBIO",     
                                ifFormat       :    "%d/%m/%Y",      
                                button         :    "icon_FCAMBIO", 
                                singleClick    :    true,
                                firstDay       :    1
                            });
                        </script>
                        
                        <div class="separador">&nbsp; </div>       
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
