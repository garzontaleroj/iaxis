<%/* Revision:# B0fQOFxs0baoVZWE3o1wVg== # */%>
<%/**
*  Fichero: axisgca014.jsp
*  Pantalla modal (ALTA/MODIFICACION) CITAS MEDICAS)
*  @author <a href = "mailto:igil@csi-ti.com">Ivan Gil</a>  
*
*  Fecha: 08/07/2015
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisgca014" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
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
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {                
                
                if (${requestScope.grabarOK == true}) {
                    parent.f_aceptar_axisgca014();
                }
                
                if (${requestScope.isNew == "false"}) {
                   
                }
               
         
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }
            
             function f_but_aceptar() {
                        objDom.setVisibilidadPorId('but_aceptar', 'hidden'); 
                        objUtiles.ejecutarFormulario("modal_axisgca014.do", "aceptar", document.miForm, "_self"); 
    
            }           

            function f_but_cancelar() {
            
                parent.f_cerrar_axisgca014();
                
            }

          
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="CFICHERO" id="CFICHERO" value="${__formdata.CFICHERO}"/>

       
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisgca014" c="CAUTLOG_CHECK" lit="${__formdata.isNew == 'true' ? '111242' : '111242'}"/></c:param>
                <c:param name="titulo"><axis:alt f="axisgca014" c="CAUTLOG_CHECK_TIT" lit="${__formdata.isNew == 'true' ? '111242' : '111242'}"/></c:param>
                <c:param name="form">axisgca014</c:param>
            </c:import>
            
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><b id="label_CAMPOS"><axis:alt f="axisgca014" c="CAMPOS" lit="9908312"/></b></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>

                                    <tr>
                                        <axis:visible f="axisgca014" c="TFICHERO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisgca014" c="TFICHERO" lit="1000574"/></b> <%-- Fichero --%>
                                            </td>   
                                        </axis:visible>
                                      
                                        <axis:visible f="axisgca014" c="TDESCOLM">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisgca014" c="TDESCOLM" lit="89905803"/></b> <%-- Columna --%>
                                            </td>   
                                        </axis:visible>
                               
                                   </tr>
                                        <axis:visible f="axisgca014" c="TFICHERO" >
                                            <td class="campocaja">
                                            
                                                <input type="text" class="campowidthinput campo campotexto" 
                                                value="${__formdata.TFICHERO}" name="TFICHERO" id="TFICHERO" 
                                                style="width:90%;" title="<axis:alt f="axisgca014" c="TFICHERO" lit="9908046"/>" 
                                                 <axis:atr f="axisgca014" c="TFICHERO"  a="modificable=false&obligatorio=true" />/>
                                            
                                            </td> 
                                       </axis:visible> 
                                       
                                       
                                        <axis:visible f="axisgca014" c="TDESCOLM" >
                                            <td colspan="3" class="campocaja">
                                            
                                                <input type="text" class="campowidthinput campo campotexto" size="100" 
                                                value="${__formdata.TDESCOLM}" name="TDESCOLM" id="TDESCOLM"
                                                style="width:90%;" title="<axis:alt f="axisgca014" c="TDESCOLM" lit="89905803"/>" 
                                                <axis:atr f="axisgca014" c="TDESCOLM" a="modificable=false&obligatorio=true" />/>
                                            
                                            </td> 
                                       </axis:visible> 
                                    
                                        
                                   <tr>
                                        <axis:visible f="axisgca014" c="TCOLDEST">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisgca014" c="TCOLDEST" lit="89905802"/></b> <%-- Columna origen --%>
                                            </td>   
                                        </axis:visible>
                                        <axis:visible f="axisgca014" c="TCOLORI">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisgca014" c="TCOLORI" lit="89905801"/></b> <%-- Mapeo columna destino--%>
                                            </td>   
                                        </axis:visible>
                                        
                        
                                        </tr>
                                        <tr>
                                        
                                        <axis:visible f="axisgca014" c="TCOLDEST" >
                                            <td class="campocaja">
                                            
                                                <input type="text" class="campowidthinput campo campotexto" size="100" 
                                                value="${__formdata.TCOLDEST}" name="TCOLDEST" id="TCOLDEST" 
                                                style="width:90%;" title="<axis:alt f="axisgca014" c="TCOLDEST" lit="89905802"/>" 
                                                <axis:atr f="axisgca014" c="TCOLDEST" a="modificable=false&obligatorio=true" />/>
                                            
                                            </td> 
                                       </axis:visible> 
                                       
                                       
                                        <axis:visible f="axisgca014" c="TCOLORI" >
                                            <td colspan="3" class="campocaja">
                                            
                                                <input type="text" class="campowidthinput campo campotexto" size="1000" 
                                                value="${__formdata.TCOLORI}" name="TCOLORI" id="TCOLORI"
                                                style="width:90%;" title="<axis:alt f="axisgca014" c="TCOLORI" lit="89905801"/>" 
                                                <axis:atr f="axisgca014" c="TCOLORI" a="modificable=true&obligatorio=true" />/>
                                            
                                            </td> 
                                       </axis:visible>
                                       
                        
                         			</tr> 
                   
                                    </table>
                                </td>
                            </tr>
                        </table>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgca014</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEVIDEN",     
                ifFormat       :    "%d/%m/%Y %H:%M",      
                button         :    "SEL_FEVIDEN", 
                singleClick    :    true,
                firstDay       :    1,
                showsTime      :    true,
                timeFormat     :    24
            });    

        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
