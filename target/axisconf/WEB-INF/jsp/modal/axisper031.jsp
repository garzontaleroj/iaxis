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
            
                var ok = "${__formdata.OK}";
                
                 if (!objUtiles.estaVacio(ok)) {
                    parent.f_aceptar_axisper031();
                 }
                f_cargar_propiedades_pantalla();
            }
	    
            function f_but_aceptar() {
          
                if (objValidador.validaEntrada()){
                
                    var ACC = objDom.getValorPorId('ACCESO');
                    var REC = objDom.getValorPorId('RECTIFICACION');
                    var CES = objDom.getValorPorId('CESION');
                    var PUB = objDom.getValorPorId('PUBLICIDAD');
                    
                    if(ACC==0 && REC==0 && CES==0 && PUB==0){
                        alert("<axis:alt f="axisper031" c="AVISO" lit="9906842"/>");
                    }
                    else
                        objUtiles.ejecutarFormulario("modal_axisper031.do", "guardar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisper031');
           }
           
           function f_checkear(thiss){
                thiss.value = thiss.checked?1:0;
           }
            
        </script>
    </head>
 <body class=" " onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper009" c="LOPD" lit="9903248"/></c:param>
                <c:param name="producto"><axis:alt f="axisper009" c="LOPD" lit="9903248"/></c:param>
                <c:param name="form">axisper031</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <!-- Area de campos  -->
             
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
              <c:if test="${!empty __formdata.PERLOPD.TESTADO}">
              	<div class="titulo">
              <b> <axis:alt f="axisper031" c="TIT_CESTLOPD" lit="9903245"/> : ${__formdata.PERLOPD.TESTADO} </b>
            </div>
          </c:if>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisper031" c="NORDEN" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper031" c="NORDEN" lit="500102" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper031" c="FMOVIMI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper031" c="FMOVIMI" lit="151474"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper031" c="CUSUARI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper031" c="CUSUARI" lit="9902948"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisper031" c="NORDEN" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"
                                        <axis:atr f="axisper031" c="NORDEN" a="modificable=false"/> 
                                         value="${__formdata.PERLOPD.NORDEN+1}" 
                                        name="NORDEN" id="NORDEN"  size="15" 
                                        title="<axis:alt c="FMOVIMI" f="axisper031" lit="500102"/>"/>
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar f="axisper031" c="FMOVIMI" dejarHueco="false">
                                <td class="campocaja">
                                  <jsp:useBean id="today" class="java.util.Date" /> 
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axisper031" c="FMOVIMI" a="modificable=false"/> 
                                     value="<fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/>" 
                                    name="FMOVIMI" id="FMOVIMI"  size="15" 
                                    title="<axis:alt f="axisper031" c="FMOVIMI" lit="151474"/>"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper031" c="CUSUARI" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axisper031" c="CUSUARI" a="modificable=false"/>
                                         size="15" value="${__formdata.CUSUARI}" name="CUSUARI" id="CUSUARI"
                                         title="<axis:alt f="axisper031" c="CUSUARI" lit="9902948"/>"/>
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                            
                            <tr>
                                  <axis:ocultar f="axisper031" c="ACCESO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper031" c="ACCESO" lit="9906825" /></b>
                                    </td>                                           
                                   </axis:ocultar>
                            
                                   <axis:ocultar f="axisper031" c="RECTIFICACION" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper031" c="RECTIFICACION" lit="9906826" /></b>
                                    </td>
                                   </axis:ocultar>
                                   
                                   <axis:ocultar f="axisper031" c="CESION" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper031" c="CESION" lit="9903252" /></b>
                                    </td>
                                   </axis:ocultar>
                          
                                  <axis:ocultar f="axisper031" c="PUBLICIDAD" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper031" c="PUBLICIDAD" lit="9903253" /></b>
                                    </td>
                                   </axis:ocultar>
                            </tr> 
                         
                            <tr>
                             <axis:ocultar f="axisper031" c="ACCESO" dejarHueco="false">
                                 <td class="campocaja">
                                    <select name = "ACCESO" id="ACCESO"  size="1" 
                                        <axis:atr f="axisper031" c="ACCESO" a="modificable=true&isInputText=false&obligatorio=false"/>
                                        class="campowidthselect campo campotexto_ob">
                                        <%--option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper031" c="SNV_COMBO" lit="108341"/> - </option--%>
                                        <c:forEach var="sino" items="${__formdata.sino}">
                                            <option value = "${sino.CATRIBU}"
                                                <c:if test="${__formdata.PERLOPD.ACCESO == sino.CATRIBU}"></c:if>>
                                                ${sino.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                 
                                    <%--input type="checkbox" id="ACCESO" onclick="f_checkear(this);" value="${__formdata.PERLOPD.ACCESO}"
                                    <axis:atr f="axisper031" c="ACCESO" a="modificable=true&isInputText=false&obligatorio=false"/>
                                    name="ACCESO" <c:if test="${__formdata.PERLOPD.ACCESO == 1}">checked="true"</c:if>/--%>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisper031" c="RECTIFICACION" dejarHueco="false">
                                 <td class="campocaja">
                                    <select name = "RECTIFICACION" id="RECTIFICACION"  size="1"
                                        <axis:atr f="axisper031" c="RECTIFICACION" a="modificable=true&isInputText=false&obligatorio=false"/>
                                     class="campowidthselect campo campotexto_ob">
                                        <%--option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper031" c="SNV_COMBO" lit="108341"/> - </option--%>
                                        <c:forEach var="sino" items="${__formdata.sino}">
                                            <option value = "${sino.CATRIBU}"
                                                <c:if test="${__formdata.PERLOPD.RECTIFICACION == sino.CATRIBU}"></c:if>>
                                                ${sino.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                 
                                    <%--input type="checkbox" id="RECTIFICACION" onclick="f_checkear(this);" value="${__formdata.PERLOPD.RECTIFICACION}"
                                    <axis:atr f="axisper031" c="RECTIFICACION" a="modificable=true&isInputText=false&obligatorio=false"/>
                                    name="RECTIFICACION" <c:if test="${__formdata.PERLOPD.RECTIFICACION == 1}">checked="true"</c:if>/--%>
                                </td>
                            </axis:ocultar>
                             <axis:ocultar f="axisper031" c="CESION" dejarHueco="false">
                                <td class="campocaja" >
                                     <select name = "CESION" id="CESION"  size="1"
                                        <axis:atr f="axisper031" c="CESION" a="modificable=true&isInputText=false&obligatorio=false"/>
                                     class="campowidthselect campo campotexto_ob">
                                        <%--option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper031" c="SNV_COMBO" lit="108341"/> - </option--%>
                                        <c:forEach var="sino" items="${__formdata.sino}">
                                            <option value = "${sino.CATRIBU}"
                                                <c:if test="${__formdata.PERLOPD.CESION == sino.CATRIBU}"></c:if>>
                                                ${sino.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    
                                    
                                    <%--input type="checkbox" id="CESION" onclick="f_checkear(this);"  value="${__formdata.PERLOPD.CESION}"
                                     <axis:atr f="axisper031" c="CESION" a="modificable=true&isInputText=false&obligatorio=false"/>
                                    name="CESION" <c:if test="${__formdata.PERLOPD.CESION == 1}">checked="true"</c:if>/--%>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisper031" c="PUBLICIDAD" dejarHueco="false">
                                 <td class="campocaja">
                                    <select name = "PUBLICIDAD" id="PUBLICIDAD"  size="1"
                                        <axis:atr f="axisper031" c="PUBLICIDAD" a="modificable=true&isInputText=false&obligatorio=false"/>
                                     class="campowidthselect campo campotexto_ob">
                                        <%--option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper031" c="SNV_COMBO" lit="108341"/> - </option--%>
                                        <c:forEach var="sino" items="${__formdata.sino}">
                                            <option value = "${sino.CATRIBU}"
                                                <c:if test="${__formdata.PERLOPD.PUBLICIDAD == sino.CATRIBU}"></c:if>>
                                                ${sino.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                 
                                    <%--input type="checkbox" id="PUBLICIDAD" onclick="f_checkear(this);" value="${__formdata.PERLOPD.PUBLICIDAD}"
                                    <axis:atr f="axisper031" c="PUBLICIDAD" a="modificable=true&isInputText=false&obligatorio=false"/>
                                    name="PUBLICIDAD" <c:if test="${__formdata.PERLOPD.PUBLICIDAD == 1}">checked="true"</c:if>/--%>
                                </td>
                            </axis:ocultar>
                           </tr>
                           
                        </table>
                      
                      </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisper031</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisper031" c = "BT_ACEPTAR">,aceptar</axis:visible> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


