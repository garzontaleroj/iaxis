<%@page import="java.util.Date"%>
<%/**
*  Fichero: axisrea058.jsp
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
        <title><axis:alt f="axisrea058" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
                    parent.f_aceptar_axisrea058();        
                }

                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisrea058");  
            }    
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                    //if (document.getElementById("TRIMESTRE").value != document.getElementById("MONDEST").value){
                        objUtiles.ejecutarFormulario ("modal_axisrea058.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                   // } else{
                     //   alert("<axis:alt f='axisrea058' c='ERROR_COTITZACIO' lit='9901985' />");
                    //}
                }
            }
          function recargar(ID,IMPORTE){
                try{
                   IMPORTE = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                   if(objNumero.validaNumero(IMPORTE, true)) {
                    // Inicio IAXIS-15090 13/04/2021
                    //document.miForm.ID.value = IMPORTE;      
                    objDom.setValorPorId(ID, IMPORTE);
                    // Fin IAXIS-15090 13/04/2021                   
                   }else{
                    // Inicio IAXIS-15090 13/04/2021   
                    //document.miForm.ID.value = '';
                    objDom.setValorPorId(ID, "");
                    //document.miForm.ID.focus();
                    document.getElementById(ID).focus();
                    // Fin IAXIS-15090 13/04/2021
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
                <c:param name="titulo"><axis:alt f="axisrea058" c="TITULO_PANTALLA" lit="89906266" /></c:param>
                <c:param name="formulario"><axis:alt f="axisrea058" c="TITULO_FORM" lit="89906266" /></c:param>
                <c:param name="form">axisrea058</c:param>
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
                                <axis:visible f="axisrea058" c="ANIO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea058" c="ANIO" lit="101606"/></b>   <%-- Año --%>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisrea058" c="TRIMESTRE">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea058" c="TRIMESTRE" lit="89906265"/></b>   <%-- Trimestre --%>
                                    </td>
                                </axis:visible>
                            </tr>
                            
                            <%! Date fecha = new Date(); String sprueba = fecha.toString(); int nanio = fecha.getYear()+1900; int month = fecha.getMonth(); int anio_ant = nanio -1; %>
                            <c:set var = "varmonth" scope = "session" value = "<%= month %>"/>
                            <c:set var = "varyear" scope = "session" value = "<%= nanio %>"/>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisrea058" c="ANIO">
                                    <td class="campocaja">
                                        <select name="ANIO" id="ANIO" size="1" class="campo campotexto" style="width:90%" obligatorio = "true" 
                                        title="<axis:alt f="axisrea058" c="ANIO" lit="101606"/>">
                                            <option value="null"> - <axis:alt f="axisrea058" c="ANIO" lit="108341"/> - </option>
                                                <c:if test="${!empty __formdata.NOU || varmonth==0 || varmonth==1 || varmonth==2}"> <option value = "<%= anio_ant %>" ><%= anio_ant %></option> </c:if>
                                                <c:if test="${empty __formdata.NOU}"> <option value = "${__formdata.NANIO}" selected= "selected">${__formdata.NANIO}</option> </c:if>
                                                <c:if test="${!empty __formdata.NOU}"> <option value = "<%= nanio %>" ><%= nanio %></option> </c:if>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisrea058" c="TRIMESTRE">
                                    <td class="campocaja">
                                        <select name="TRIMESTRE" id="TRIMESTRE" size="1" class="campo campotexto" style="width:90%"  obligatorio = "true"
                                        title="<axis:alt f="axisrea058" c="TRIMESTRE" lit="89906265"/>">
                                            <option value="null"> - <axis:alt f="axisrea058" c="SNV_COMBO" lit="108341"/> - </option>                                            
                                                <option value = "1" <c:if test="${!empty __formdata.NTRIM && __formdata.NTRIM == 1}"> selected </c:if>>1</option>
                                                <option value = "2" <c:if test="${!empty __formdata.NTRIM && __formdata.NTRIM == 2}"> selected </c:if>>2</option>
                                                <option value = "3" <c:if test="${!empty __formdata.NTRIM && __formdata.NTRIM == 3}"> selected </c:if>>3</option>
                                                <option value = "4" <c:if test="${!empty __formdata.NTRIM && __formdata.NTRIM == 4}"> selected </c:if>>4</option>                                            
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
                                <axis:visible f="axisrea058" c="CMONEDA">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea058" c="CMONEDA" lit="108645"/></b>   <%-- Moneda --%>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisrea058" c="VALOR">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea058" c="VALOR" lit="101159"/></b>   <%-- Valor --%>
                                    </td>
                                </axis:visible>
                                <!-- Inicio IAXIS-15090 13/04/2021 -->
                                <axis:visible f="axisrea058" c="PORC">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisrea058" c="PORC" lit="101467"/></b>   <%-- Porcentaje base --%>
                                    </td>
                                </axis:visible>
                                <!-- Fin IAXIS-15090 13/04/2021 -->
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisrea058" c="CMONEDA">
                                    <td class="campocaja">
                                        <select name="CMONEDA" id="CMONEDA" size="1" class="campo campotexto" style="width:90%" obligatorio = "true"
                                        title="<axis:alt f="axisrea058" c="CMONEDA" lit="108645"/>">
                                            <option value="null"> - <axis:alt f="axisrea058" c="CMONEDA" lit="108341"/> - </option>
                                            <c:forEach items="${listaMon}" var="item">
                                                <option value = "${item.CMONEDA}" <c:if test="${!empty __formdata.MONEDA && __formdata.MONEDA == item.CMONEDA}"> selected </c:if>>${item.TMONEDA}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisrea058" c="VALOR">
                                    <td class="campocaja">
                                        <input type="text" name="VALOR" onchange="recargar(this.id, this.value)" id="ITASA" value="<fmt:formatNumber pattern="###,##0" value='${__formdata.IPATTEC}'/>" class="campowidthinput campo campotexto"  style="width:50%"
                                        <axis:atr f="axisrea058" c="VALOR" a="decimal=true&obligatorio=true"/>
                                        alt="<axis:alt f="axisrea058" c="VALOR" lit="101159"/>" title="<axis:alt f="axisrea058" c="VALOR" lit="101159"/>"/>
                                    </td>
                                </axis:visible>
                                <!-- Inicio IAXIS-15090 13/04/2021 -->
                                <axis:visible f="axisrea058" c="PORC">
                                    <td class="campocaja">
                                        <input type="text" name="PPORPAT" id="PPORPAT" value="<fmt:formatNumber pattern="#0" value='${__formdata.PPORPAT}'/>" class="campowidthinput campo campotexto"  style="width:50%"
                                        <axis:atr f="axisrea058" c="PPORPAT" a="decimal=true&obligatorio=true"/>
                                        alt="<axis:alt f="axisrea058" c="PPORPAT" lit="101467"/>" title="<axis:alt f="axisrea058" c="PPORPAT" lit="101467"/>"/>
                                    </td>
                                </axis:visible>
                                <!-- Fin IAXIS-15090 13/04/2021 -->
                                <td>
                                    &nbsp;
                                </td>                                 
                            </tr>
                             <tr>
                            <td>
                                    &nbsp;
                                </td>
                                 <axis:visible f="axisrea058" c="MOVIMIENTO">
                                    <td class="campocaja">
                                        <input type="hidden" name="MOVIMIENTO"  id="MOVIMIENTO" value="${__formdata.NMOVIMI}" class="campowidthinput campo campotexto"  style="width:50%"
                                        <axis:atr f="axisrea058" c="MOVIMIENTO" a="decimal=true"/>
                                        alt="<axis:alt f="axisrea058" c="VALOR" lit="101159"/>" title="<axis:alt f="axisrea058" c="VALOR" lit="101159"/>"/>
                                    </td>
                                </axis:visible>
                            </tr>
                            
                        </table>
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisrea058</c:param>
                            <c:param name="__botones">cancelar<axis:visible f="axisrea058" c="ACEPTAR">,aceptar</axis:visible></c:param>
                        </c:import>
                        
                        <div class="separador">&nbsp; </div>       
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
