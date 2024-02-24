<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
        	f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               parent.f_aceptar_modal("axisprf012");
            }
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf012');                      
        }           
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf012.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
    </script>
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisprf012" c="TITULO" lit="9904777" /></c:param>
                <c:param name="nid" value="axisprf012" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>
        <input type="hidden" id="pCNSEGUI" name="pCNSEGUI" value="${__formdata.pCNSEGUI}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf012" lit="9904777" />
		   </c:param>
           <c:param name="producto">
			<axis:alt c="formulario" f="axisprf012" lit="9904777" />
		   </c:param>
           <c:param name="form">axisprf012</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:34%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>                                
            </tr>        
            <tr>
                <axis:ocultar f="axisprf012" c="TOBSERV" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf012" c="TOBSERV" lit="101162"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
              <axis:visible f="axisprf012" c="TOBSERV">
                    <td>
                        <textarea rows="8" class="campo campotexto_ob" cols="" 
                        <axis:atr f="axisprf012" c="TOBSERV" a="obligatorio=true"/> style="width:100%;"  
                        name="TOBSERV" id="TOBSERV"
                        title= "<axis:alt f="axisprf012" c="TOBSERV" lit="101162"/>">${__formdata.TOBSERV}</textarea>
                    </td>
                </axis:visible>
            </tr>
            <tr>
                <axis:ocultar f="axisprf012" c="CVALORA" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf012" c="CVALORA" lit="9904778"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf012" c="CVALORA" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CVALORA" id="CVALORA" size="1" class="campowidthselect campo campotexto_ob"
                        title="<axis:alt f="axisprf012" c="CVALORA" lit="9904778"/>"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf012" c="CVALORA" a="obligatorio=true&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf012" c="CVALORA" a="obligatorio=true&isInputText=false"/>
                        </c:if>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf012" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <option value="0"
                       <c:if test="${__formdata['CVALORA'] == 0}">selected</c:if>>
                      <axis:alt f="axisprf012" c="SELECCIONAR" lit="9903556"/>                                
                    </option>
                    <option value="1"
                       <c:if test="${__formdata['CVALORA'] == 1}">selected</c:if>>
                      <axis:alt f="axisprf012" c="SELECCIONAR" lit="9903555"/>                                
                    </option>
                </select>
                </td>
              </axis:ocultar> 
            </tr>
           </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf012</c:param><c:param name="f">axisprf012</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>