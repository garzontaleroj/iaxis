<%/**
*  Fichero: axisadm105.jsp
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
        <title><axis:alt f="axisadm105" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
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
                    parent.f_aceptar_axisadm105();        
                }

                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisadm105");  
            }    
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                        objUtiles.ejecutarFormulario ("modal_axisadm105.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
          function recargar(IMPORTE){
                try{
                   IMPORTE = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                   if(objNumero.validaNumero(IMPORTE, true)) {
                    document.miForm.IVALPAGERP.value = IMPORTE;                        
                   }else{
                    document.miForm.IVALPAGERP.value = '';
                    document.miForm.IVALPAGERP.focus();
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
            <input type="hidden" id="NNUMORD" name="NNUMORD" value="${__formdata.NNUMORD}"/>

            
             <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm105" c="TITULO_PANTALLA" lit="89907012" /></c:param>
                <c:param name="formulario"><axis:alt f="axisadm105" c="TITULO_FORM" lit="89907012" /></c:param>
                <c:param name="form">axisadm105</c:param>
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
                                <axis:visible f="axisadm105" c="CESTERP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm105" c="CESTERP" lit="89906295"/></b>   <%-- Estado del pago ERP --%>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisadm105" c="NPRCERP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm105" c="MONDEST" lit="89906296"/></b>   <%-- MonDest --%>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisadm105" c="CESTERP">
                                    <td class="campocaja">
                                        <select name="CESTERP" id="CESTERP" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisadm105" c="CESTERP" lit="89906295"/>"
                                         <axis:atr f="axisadm105" c="CESTERP" a="obligatorio=true&modificable=true&isInputText=false"/>>
                                            <option value="null"> - <axis:alt f="axisadm105" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${listaEstErp}" var="item">
                                                <option value = "${item.CATRIBU}" <c:if test="${!empty __formdata.CESTERP && __formdata.CESTERP == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisadm105" c="NPRCERP">
                                    <td class="campocaja">
                                        <input type="text" name="NPRCERP"  id="NPRCERP" value='${__formdata.NPRCERP}' class="campowidthinput campo campotexto"  style="width:50%"
                                        <axis:atr f="axisadm105" c="NPRCERP" a="decimal=true&obligatorio=true"/>
                                        alt="<axis:alt f="axisadm105" c="NPRCERP" lit="89906296"/>" title="<axis:alt f="axisadm105" c="NPRCERP" lit="89906296"/>"/>
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
                                <axis:visible f="axisadm105" c="IVALPAGERP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm105" c="IVALPAGERP" lit="89906297"/></b>  
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisadm105" c="FFECPAGERP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm105" c="FFECPAGERP" lit="9906996"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisadm105" c="IVALPAGERP">
                                    <td class="campocaja">
                                        <input type="text" name="IVALPAGERP" id="IVALPAGERP" onchange="recargar(this.value)" value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.IVALPAGERP}'/>" class="campowidthinput campo campotexto"  style="width:50%"
                                        <axis:atr f="axisadm105" c="IVALPAGERP" a="decimal=true&obligatorio=true"/> 
                                        alt="<axis:alt f="axisadm105" c="IVALPAGERP" lit="89906297"/>" title="<axis:alt f="axisadm105" c="IVALPAGERP" lit="89906297"/>"/>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisadm105" c="FFECPAGERP">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:30%;" 
                                        value="<fmt:formatDate value='${__formdata.FFECPAGERP}' pattern='dd/MM/yyyy'/>" name="FFECPAGERP" id="FFECPAGERP"
                                        title="<axis:alt f="axisadm105" c="FFECPAGERP" lit="9906996"/>" alt="<axis:alt f="axisadm105" c="FFECPAGERP" lit="9906996"/>"
                                        <axis:atr f="axisadm105" c="FFECPAGERP" a="modificable=true&obligatorio=true"/>/>
                                        <a style="vertical-align:middle;"><img id="icon_FFECPAGERP" alt="<axis:alt f="axisadm105" c="FFECPAGERP" lit="9906996"/>" title="<axis:alt f="axisadm105" c="FFECPAGERP" lit="9906996"/>" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisadm105</c:param>
                            <c:param name="__botones">cancelar<axis:visible f="axisadm105" c="ACEPTAR">,aceptar</axis:visible></c:param>
                        </c:import>
                        
                        <script type="text/javascript">
                            Calendar.setup({
                                inputField     :    "FFECPAGERP",     
                                ifFormat       :    "%d/%m/%Y",      
                                button         :    "icon_FFECPAGERP", 
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
