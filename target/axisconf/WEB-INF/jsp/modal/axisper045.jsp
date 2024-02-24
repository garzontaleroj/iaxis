<%-- 
*  Fichero: axisper044.jsp
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css">
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en funcin del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper044');
					</c:if>
            f_cargar_propiedades_pantalla();
            var OK = "${requestScope.OK}"; 
            
            PSPERSONOUT = "${__formdata.SPERSON}";
            PCAGENTEOUT = "${__formdata.CAGENTE}";
            if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisper044(PSPERSONOUT,PCAGENTEOUT);
        }
                
       
        function f_but_cancelar() {
              parent.f_cancelar_axisper045();
             
             
        }   
        
        function f_but_aceptar() {
        	if (document.miForm.OBSERVACION.value==null || document.miForm.OBSERVACION.value.trim()==''){
        		alert('Observaciones es obligatorio')
        	} else{
		        parent.f_cancelar_axisper045(); 
                objUtiles.ejecutarFormulario("modal_axisper045.do", "crearMarca", document.miForm, "_self", objJsMessages.jslit_cargando);   
        	}   
        }
		
		
        function f_ondblclick(ths) {       
        }
        
        function callbackonchange(responseText) {
            //alert("["+responseText+"]")
            if (responseText.substring(0,1)!="0") {
                alert("<axis:alt f="axisper044" c="CALLBACK" lit="101283" />");
            }
        }
        function f_onchange(ths) {
            var vmarca = 0;
            var cmarca = ths.name;
            var vcampo = ths.id;

            if (ths.checked){
                vmarca = 1;
            }
            
            var qs="operation=crearMarca";
            qs=qs+"&CMARCA="+cmarca
            qs=qs+"&VMARCA="+vmarca
            qs=qs+"&VCAMPO="+vcampo
            qs=qs+"&SPERSON="+"${__formdata.SPERSON}"
            
                                    
            if (vcampo == "TODOS"){
           
                var x = document.getElementsByName(cmarca);
                
                var i;
                for (i = 0; i < x.length; i++) {
                    if (!x[i].disabled){
                    
                       x[i].checked = ths.checked; 
                    }                    
                }                                
            }
            
                objAjax.invokeAsyncCGI("modal_axisper044.do", callbackonchange, qs, this, objJsMessages.jslit_cargando)
            
        }
            
        /* Cambio para IAXIS-2126 : start */
        function soloLetrasNumeros(e) {
    		key = e.keyCode || e.which;
    		tecla = String.fromCharCode(key).toLowerCase();
    		letras = " abcdefghijklmnñopqrstuvwxyz1234567890.áéíóú";
    		especiales = "8-37-39-46";

    		tecla_especial = false;
    		for ( var i in especiales) {
    			if (key == especiales[i]) {
    				tecla_especial = true;
    				break;
    			}
    		}

    		if (letras.indexOf(tecla) == -1 && !tecla_especial) {
    			return false;
    		}
    	}
        /* Cambio para IAXIS-2126 : end */	

        
    </script>
  </head>
<body onload="f_onload()">
	<div id="wrapper" class="wrapper">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" />
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    <input type="hidden" name="CMARCA"  value="${__formdata.CMARCA}" />
    <input type="hidden" name="PERSONA_MARCA"  value="${__formdata.PERSONA_MARCA}" />
    <input type="hidden" name="OBSERVACIONES"  value="${__formdata.OBSERVACION}" />
    
    <c:import url="../include/titulo_nt.jsp">
           <%-- <c:param name="modalidad">null</c:param>--%>
            <c:param name="titulo"><axis:alt f="axisper044" c="TITULO" lit="101162"/></c:param>
            <c:param name="formulario"><axis:alt f="axisper044" c="FORMULARIO" lit="101162"/></c:param>
            <c:param name="form">axisper045</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom002|axiscom002</c:param>
    </c:import>

<!-- Area de campos de parametros -->

<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                                            
                    
                    <table class="seccion">                                            
                        <tr>
                            <th style="width:5%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:25%;height:0%">&nbsp;</th>
                            <th style="width:30%;height:0%">&nbsp;</th>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="TOBSERVACIONES" lit="101162"/></b>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->                                
                                     <textarea class="campowidthinput campo campotexto" cols = 100 rows= 10 style="width:100%;" 
                                     onkeypress="return soloLetrasNumeros(event)" <axis:atr f="axisper045" c="TOBSERV" a="modificable=true&obligatorio=true"/> 
                                     name="OBSERVACION" id="OBSERVACION">${__formdata.OBSERVACION}</textarea>                                 
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
         </form> 





</form>





&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<!-- Area de campos  -->
 <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper044</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>

    </form>
<c:import url="../include/mensajes.jsp" />



</div>
</body>
</html>
