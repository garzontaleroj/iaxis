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
               parent.f_aceptar_modal("axisprf014");
            }
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf014');                      
        }           
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf014.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
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
                <c:param name="titulo"><axis:alt f="axisprf014" c="TITULO" lit="9904810" /></c:param>
                <c:param name="nid" value="axisprf014" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${__formdata.SPROFES}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" id="SPERSED" name="SPERSED" value="${__formdata.SPERSED}"/>

        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf014" lit="9904810" />
		   </c:param>
           <c:param name="form">axisprf014</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:40%;height:0px"></th>
                <th style="width:40%;height:0px"></th>
                <th style="width:20%;height:0px"></th>                                
            </tr>
            <tr>
                <axis:ocultar f="axisprf014" c="TNOMBRE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf014" c="TNOMBRE" lit="105940"/></b>
                    </td>
                </axis:ocultar>
           </tr>
             <tr>
             <axis:visible f="axisprf014" c="TNOMBRE" >
                   <td class="campocaja">
                     <input type="text" class="campo campotexto" value="${__formdata['TNOMBRE']}" name="TNOMBRE" id="TNOMBRE" size="15"
                            readonly="true"/>
                   </td>
              </axis:visible>
            </tr>
           <tr>
                <axis:ocultar f="axisprf014" c="TDOMICI" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf014" c="TDOMICI" lit="9000914"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf014" c="THORARI" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf014" c="THORARI" lit="9904812"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
              <axis:ocultar f="axisprf014" c="CDOMICI" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CDOMICI" id="CDOMICI" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                <axis:atr f="axisprf014" c="CDOMICI" a="obligatorio=true&isInputText=false"/>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf014" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="domis_prof" items="${__formdata.DOMI_SPERSED}">
                        <option value="${domis_prof.CDOMICI}"
                                <c:if test="${__formdata.CDOMICI == domis_prof.CDOMICI}">selected</c:if>>
                            ${domis_prof.TDOMICI}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
              <axis:visible f="axisprf014" c="THORARI">
                    <td>
                        <textarea rows="8" class="campo campotexto" cols="" <axis:atr f="axisprf014" c="THORARI" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                  name="THORARI" id="THORARI">
                        ${__formdata.THORARI}
                        </textarea>
                    </td>
              </axis:visible>
           </tr>
            <tr>
                <axis:ocultar f="axisprf014" c="TPERCTO" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf014" c="TPERCTO" lit="9904813"/></b>
                    </td>
                </axis:ocultar>
            </tr>
           <tr>
              <axis:visible f="axisprf014" c="TPERCTO">
                    <td>
                        <textarea rows="8" class="campo campotexto" cols="" <axis:atr f="axisprf014" c="TPERCTO" a="modificable=true&isInputText=false"/> style="width:100%;"  
                                  name="TPERCTO" id="TPERCTO">
                        ${__formdata.TPERCTO}
                        </textarea>
                    </td>
              </axis:visible>
            </tr>
           </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf014</c:param><c:param name="f">axisprf014</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>