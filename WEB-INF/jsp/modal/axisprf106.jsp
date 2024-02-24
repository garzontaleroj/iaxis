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
               parent.f_aceptar_modal("axisprf106");
            }
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf106');                      
        }           
        
        function f_but_aceptar(){          
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf106.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
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
                <c:param name="titulo"><axis:alt f="axisprf106" c="TITULO" lit="9904706" /></c:param>
                <c:param name="nid" value="axisprf106" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pSPROFES" name="pSPROFES" value="${__formdata.SPROFES}"/>
        <input type="hidden" id="pSCONVEN" name="pSCONVEN" value="${__formdata.SCONVEN}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axisprf106" lit="9904706" /></c:param>
           <c:param name="producto"><axis:alt c="formulario" f="axisprf106" lit="9904706" /></c:param>
           <c:param name="form">axisprf106</c:param>
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
                <axis:ocultar f="axisprf106" c="CESTADO" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf106" c="CESTADO" lit="9904901"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf106" c="FESTADO" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axisprf106" c="FESTADO" lit="9900983"/></b>
                    </td> 
                </axis:ocultar>
            </tr> 
            <tr>
            <axis:ocultar f="axisprf106" c="CESTADO" dejarHueco="false"> 
            <td class="campocaja">
                <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto_ob"
                        <axis:atr f="axisprf106" c="CESTADO" a="obligatorio=true"/> title="<axis:alt f="axisprf106" c="CESTADO" lit="9904901"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf106" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="estado" items="${__formdata.ESTADOSCONVENIO}">
                        <option value="${estado.CATRIBU}" <c:if test="${__formdata['CESTADO'] == estado.CATRIBU}">selected</c:if>>
                            ${estado.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
            </td>
            </axis:ocultar>            
            <axis:ocultar f="axisprf106" c="FESTADO" dejarHueco="false">                 
             <td class="campocaja" >
                 <input type="text" class="campowidthinput campo campotexto_ob" size="10" 
                        value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FESTADO}'/>" name="FESTADO" id="FESTADO"  
                        style="width:50%;" 
                        title= "<axis:alt f="axisprf106" c="FESTADO" lit="9900983"/>"  <axis:atr f="axisprf106" c="FESTADO" a="modificable=true&obligatorio=true&formato=fecha"/>  />
                 <a style="vertical-align:middle;">
                    <img id="popup_calendario_FESTADO" alt="<axis:alt f="axisprf106" c="FESTADO" lit="108341"/>"  
                         src="images/calendar.gif" />
                 </a>
              </td>            
            </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf106" c="TOBSERV" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf106" c="TOBSERV" lit="101162"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:visible f="axisprf106" c="TOBSERVACIONES">
                    <td>
                        <textarea rows="8" class="campo campotexto" cols="" 
                        <axis:atr f="axisprf106" c="TOBSERVACIONES" a="modificable=true&isInputText=false"/> 
                                  style="width:100%;"  name="TOBSERVACIONES" id="TOBSERVACIONES">${__formdata.TOBSERVACIONES}</textarea>
                    </td>
                </axis:visible>                
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf106</c:param><c:param name="f">axisprf106</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FESTADO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FESTADO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>     
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
