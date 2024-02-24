<%--
/**
*  Fichero: axissin046.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  T?tulo: Siniestros GESTION
*
*  Fecha: 20/02/2009
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
    <title><axis:alt f="axissin046" c="TIT1" lit="9902550"/> <axis:alt f="axissin046" c="TIT2" lit="9902550"/> </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
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

        function f_onload() { 
            f_cargar_propiedades_pantalla();
            f_onloadCombos();
        }
        
        function f_onloadCombos(){
            if (document.getElementById('NLOCALI')!=null){
                f_selOpcio(document.getElementById('LOCALIZACION'),2);
            }
        }
        
        function f_selOpcio(combo, num){
            if (combo.length == num){
                combo.value = combo.options[num-1].value;
            }
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axissin046.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin046");
        }
        
        function f_recargar(){
            objUtiles.ejecutarFormulario("modal_axissin046.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
            
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin046.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="guardar" />
    <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" id="subpantalla" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" id="seccion" name="seccion" value="tramitaciones_gestiones"/>
    <input type="hidden" id="indexTramitacio" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
        
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin046" c="TIT_PANTALLA" lit="9902550"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin046" c="TIT_PANTALLA" lit="9902550"/></c:param>
        <c:param name="form">axissin046</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                       <axis:ocultar f="axissin046" c="NLOCALI" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="NLOCALI" lit="9002272"/></b>
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin046" c="CTIPGES" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="CTIPGES" lit="9902564"/></b>
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin046" c="CTIPPRO" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="CTIPPRO" lit="9902569"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin046" c="CSUBPRO" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="CSUBPRO" lit="9902570"/></b>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin046" c="NLOCALI" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="NLOCALI" id="NLOCALI" title="<axis:alt f="axissin046" c="NLOCALI" lit="9002272"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="NLOCALI" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstlocalizacion}">
                                        <option value = "${listados.NLOCALI}"
                                        <c:if test="${(!empty __formdata.NLOCALI)&& listados.NLOCALI == __formdata.NLOCALI}"> selected </c:if>>
                                        ${listados.TLOCALI}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin046" c="CTIPGES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CTIPGES" id="CTIPGES" title="<axis:alt f="axissin046" c="CTIPGES" lit="9902564"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="CTIPGES" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lsttipgestion}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CTIPGES)&& listados.CATRIBU == __formdata.CTIPGES}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin046" c="CTIPPRO" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CTIPPRO" id="CTIPPRO" title="<axis:alt f="axissin046" c="CTIPPRO" lit="9902569"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="CTIPPRO" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstprof}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CTIPPRO)&& listados.CATRIBU == __formdata.CTIPPRO}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin046" c="CSUBPRO" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CSUBPRO" id="CSUBPRO" title="<axis:alt f="axissin046" c="CSUBPRO" lit="9902570"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="CSUBPRO" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstsubprof}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CSUBPRO)&& listados.CATRIBU == __formdata.CSUBPRO}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                       <axis:ocultar f="axissin046" c="SPROFES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="SPROFES" lit="9902565"/></b>
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin046" c="SPERSED" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="SPERSED" lit="9902589"/></b>
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin046" c="SCONVEN" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="SCONVEN" lit="9902590"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin046" c="CGARANT" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="CGARANT" lit="110994"/></b>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin046" c="SPROFES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="SPROFES" id="SPROFES" title="<axis:alt f="axissin046" c="SPROFES" lit="9902565"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="SPROFES" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstprofesinal}">
                                        <option value = "${listados.SPROFES}"
                                        <c:if test="${(!empty __formdata.SPROFES)&& listados.CATRIBU == __formdata.SPROFES}"> selected </c:if>>
                                        ${listados.TLOCALI}</option>
                                    </c:forEach>
                                </select>${__formdata.lstprofesinal}
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin046" c="SPERSED" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="SPERSED" id="SPERSED" title="<axis:alt f="axissin046" c="SPERSED" lit="9902589"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="SPERSED" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstsedes}">
                                        <option value = "${listados.NLOCALI}"
                                        <c:if test="${(!empty __formdata.SPERSED)&& listados.CATRIBU == __formdata.SPERSED}"> selected </c:if>>
                                        ${listados.TLOCALI}</option>
                                    </c:forEach>
                                </select>
                                ${__formdata.lstsedes}
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin046" c="SCONVEN" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="SCONVEN" id="SCONVEN" title="<axis:alt f="axissin046" c="SCONVEN" lit="9902590"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="SCONVEN" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lsttarifas}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.SCONVEN)&& listados.CATRIBU == __formdata.SCONVEN}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                                ${__formdata.lsttarifas}
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin046" c="CGARANT" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CGARANT" id="CGARANT" title="<axis:alt f="axissin046" c="CGARANT" lit="110994"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="CGARANT" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstgarantias}">
                                        <option value = "${listados.CGARANT}"
                                        <c:if test="${(!empty __formdata.CGARANT)&& listados.CGARANT == __formdata.CGARANT}"> selected </c:if>>
                                        ${listados.TGARANT}</option>
                                    </c:forEach>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin046" c="CESTGES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="CESTGES" lit="100587"/></b>
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin046" c="CESTSUBGES" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin046" c="CESTSUBGES" lit="9902593"/></b>
                            </td>         
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin046" c="CESTGES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CESTGES" id="CESTGES" title="<axis:alt f="axissin046" c="CESTGES_" lit="9902590"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="CESTGES" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstestados}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CESTGES)&& listados.CATRIBU == __formdata.CESTGES}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin046" c="CESTSUBGES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CESTSUBGES" id="CESTSUBGES" title="<axis:alt f="axissin046" c="CESTSUBGES_" lit="110994"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin046" c="CESTSUBGES" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin046" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstsubestados}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CESTSUBGES)&& listados.CATRIBU == __formdata.CESTSUBGES}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>  
                    </tr>
                </table>               
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
    	  <c:param name="f">axissin046</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    

</body>
</html>