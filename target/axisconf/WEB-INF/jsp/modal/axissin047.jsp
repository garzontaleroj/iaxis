<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%--
/**
*  Fichero: axissin047.jsp
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
            var ok = "${__formdata.OK}"; 
             var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
            if (!objUtiles.estaVacio(ok) && ok==1){
                    parent.f_aceptar_axissin047();
            } 
            f_cargar_propiedades_pantalla();
            f_onloadCombos();
        }
        
        function f_onloadCombos(){
            if (document.getElementById('CTIPMOV')!=null){
                f_selOpcio(document.getElementById('CTIPMOV'),2);
            }
        }
        
        function f_selOpcio(combo, num){
            if (combo.length == num){
                combo.value = combo.options[num-1].value;
            }
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axissin047.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin047");
        }
        
        function f_usuario_permitido(){
            var qs="operation=ajax_usuario_permitido";
            qs=qs+"&CTIPMOV="+$("#CTIPMOV").val();
            qs=qs+"&NSINIES="+$("#NSINIES").val();
            qs=qs+"&NTRAMIT="+$("#NTRAMIT").val();
            qs=qs+"&SGESTIO="+$("#SGESTIO").val();
            objAjax.invokeAsyncCGI("modal_axissin047.do", f_callbackajaxUsuarioPermitido, qs, this, objJsMessages.jslit_cargando);
        }
        
        function f_callbackajaxUsuarioPermitido(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("PCPERMIT");
                if (elementos.length > 0){
                    var ele = doc.getElementsByTagName("PCPERMIT");
                    var e;
                    var CPERMIT = ele[0].textContent;
                    if (isNaN(CPERMIT)){
                        CPERMIT = ele.context.text;
                    }
                    if (CPERMIT==0){
                        alert("<axis:alt f="axissin047" c="MSG_CAUTORI" lit="9905761"/>");
                        /*$("#CTIPMOV").attr("disabled","true");
                        $("#TCOMENT").attr("disabled","true");
                        $("#but_aceptar").attr("disabled","true");*/
                        $("#CTIPMOV").val("");
                    }
                }
            }
        }
            
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="axissin047.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="guardar" />
    <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" id="subpantalla" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" id="seccion" name="seccion" value="tramitaciones_gestiones"/>
    <input type="hidden" id="indexTramitacio" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    <input type="hidden" id="SGESTIO" name="SGESTIO" value="${__formdata.SGESTIO}"/>    
    <input type="hidden" id="CTIPGES" name="CTIPGES" value="${__formdata.CTIPGES}"/>    
    <input type="hidden" id="CSUBGES" name="CSUBGES" value="${__formdata.CSUBGES}"/>    
    <input type="hidden" id="CESTGES" name="CESTGES" value="${__formdata.CESTGES}"/>    
        
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin047" c="TIT_PANTALLA" lit="100913"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin047" c="TIT_PANTALLA" lit="100913"/></c:param>
        <c:param name="form">axissin047</c:param>
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
            <td>
            <table class="seccion">
            <tr>
                     <axis:ocultar f="axissin045" c="NSINIES" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin047" c="NSINIES" lit="101298"/></b>
                                    </td>
                     </axis:ocultar>
                    </tr>
                    <tr>
                     <axis:ocultar f="axissin047" c="NSINIES" dejarHueco="false"> 
                             <td class="campocaja">
                              <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:200px"
                                <axis:atr f="axissin047" c="NSINIES" a="modificable=false"/> />
                                
                            </td>
                        </axis:ocultar>
                    </tr>
            </table>
            </td>
            </tr>
                    <tr>
                    
                       <axis:ocultar f="axissin047" c="CTIPMOV" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin047" c="CTIPMOV" lit="1000591"/></b>
                            </td>
                       </axis:ocultar>
                       <axis:ocultar f="axissin047" c="TCOMENT" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin047" c="TCOMENT" lit="101162"/></b>
                            </td>
                       </axis:ocultar> 
                    </tr>
                    <tr>
                    
                        <axis:ocultar f="axissin047" c="CTIPMOV" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CTIPMOV" id="CTIPMOV" title="<axis:alt f="axissin047" c="CTIPMOV" lit="1000591"/>"  size="1" 
                                        onchange="f_usuario_permitido()"
                                        class="campowidthselect campo campotexto_ob"  <axis:atr f="axissin047axissin047" c="CTIPMOV" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                    <option value = ""> - <axis:alt f="axissin047" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstmovs}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CTIPMOV)&& listados.CATRIBU == __formdata.CTIPMOV}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin047" c="TCOMENT" dejarHueco="false"> 
                            <td class="campocaja" colspan="3">
                                <textarea name="TCOMENT" id="TCOMENT" rows="2" cols="50" class="campo campotexto" obligatorio="true" >${__formdata['TCOMENT']}</textarea>
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