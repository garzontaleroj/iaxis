

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
               var ok = "${__formdata.ok}";
                       
                if (!objUtiles.estaVacio(ok) && ok == '0')
                    parent.f_aceptar_axismap010();
	 	f_cargar_propiedades_pantalla();
	    }

           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("modal_axismap010.do", "guardar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                }
           }
           
          
           
           function f_but_cancelar() {

                parent.f_cerrar_modal('axismap010');
           }
        

            
        </script>
    </head>
 <body class=" " onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
                        <input type="hidden" id="CMAPEAD" name="CMAPEAD" value="${__formdata.CMAPEAD}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="TIT_FORM" f="axismap010" lit="9903583"/></c:param>
                <c:param name="producto"><axis:alt c="TIT_FORM" f="axismap010" lit="9903583"/></c:param>
                <c:param name="form">axismap010</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                                 
                                <axis:ocultar f="axismap010" c="CTABLA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismap010" c="CTABLA" lit="9903578" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismap010" c="NVECES" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="NVECES" f="axismap010" lit="9901593"/></b>
                                </td>
                                </axis:ocultar>
                                </tr>
                                
                            <tr>
                             <axis:ocultar f="axismap010" c="CTABLA" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axismap010" c="CTABLA" a="obligatorio=true"/> 
                                     <c:if test="${!empty __formdata.CTABLA && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if> 
                                    style="width:90%;" value="${__formdata.CTABLA}" 
                                    name="CTABLA" id="CTABLA" title="<axis:alt f="axismap010" c="CTABLA" lit="9903578" />" size="15" 
                                    />
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axismap010" c="NVECES" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axismap010" c="NVECES" a="obligatorio=true"/> 
                                    style="width:90%;" value="${__formdata.NVECES}" 
                                    <c:if test="${!empty __formdata.CTABLA && ( empty __formdata.ok || (!empty __formdata.ok && !(__formdata.ok == 1)))}">readonly</c:if> 
                                    name="NVECES" id="NVECES" title="<axis:alt c="NVECES" f="axismap010" lit="9901593"/>" size="15" 
                                    />
                                </td>
                                </axis:ocultar>
                               </tr>
                            <tr>
                                 <axis:ocultar f="axismap010" c="TRACTAMENT">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismap010" c="TRACTAMENT" lit="100565"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismap010" c="CPARAM">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismap010" c="CPARAM" lit="9903575"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axismap010" c="CPRAGMA">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismap010" c="CPRAGMA" lit="9903576"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                             <axis:ocultar f="axismap010" c="TSENTEN" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name="TSENTEN" style="width:93%" 
                                        id="TSENTEN" size="1" onchange=""
                                        class="campowidthselect campo campotexto">&nbsp;
                                              <option value="null">
                                                    - <axis:alt f="axismap003" c="SNV_COMBO" lit="108341"/> -
                                              </option>
                                              <c:forEach var="tractament"
                                                         items="${__formdata.lstQuery}">
                                                    <option value="${fn:substring(tractament.TATRIBU,0,1)}"
                                                            <c:if test="${!empty  __formdata.TSENTEN && __formdata.TSENTEN == fn:substring(tractament.TATRIBU,0,1)}">selected</c:if>>
                                                         ${tractament.TATRIBU}
                                                    </option>
                                              </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar f="axismap010" c="CPARAM" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axismap010" c="CPARAM" a="modificable=true&formato=entero"/> 
                                    style="width:90%;" value="${__formdata.CPARAM}" 
                                    name="CPARAM" id="CPARAM" title="<axis:alt f="axismap010" c="CPARAM" lit="9903575"/>" size="15" 
                                    />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismap010" c="CPRAGMA" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismap010" c="CPRAGMA" a="modificable=true&formato=entero"/>
                                        style="width:90%;" size="15" value="${__formdata.CPRAGMA}" name="CPRAGMA" id="CPRAGMA"
                                         title="<axis:alt f="axismap010" c="CPARAM" lit="9903575"/>"/>
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                        </table>
                       
                    </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axismap010</c:param>
            <c:param name="__botones"><axis:visible f="axismap010" c = "BT_CANCELAR">cancelar</axis:visible><axis:visible f="axismap010" c = "BT_ACEPTAR">,aceptar</axis:visible> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


