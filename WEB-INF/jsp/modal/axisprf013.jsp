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
               parent.f_aceptar_modal("axisprf013");
            }
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf013');                      
        }           
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf013.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
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
                <c:param name="titulo"><axis:alt f="axisprf013" c="TITULO" lit="9904810" /></c:param>
                <c:param name="nid" value="axisprf013" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${__formdata.SPROFES}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>

        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf013" lit="9904828" />
		   </c:param>
           <c:param name="form">axisprf013</c:param>
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
                <axis:ocultar f="axisprf013" c="TNIF" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf013" c="TNIF" lit="100577"/></b>
                    </td>
                </axis:ocultar>
           
                <axis:ocultar f="axisprf013" c="TNOMBRE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf013" c="TNOMBRE" lit="105940"/></b>
                    </td>
                </axis:ocultar>
           </tr>
             <tr>
             <axis:visible f="axisprf013" c="TNIF" >
                   <td class="campocaja">
                     <input type="text" class="campo campotexto" value="${__formdata['TNIF']}" name="TNIF" id="TNIF" size="15"
                            readonly="true"/>
                   </td>
              </axis:visible>
             <axis:visible f="axisprf013" c="TNOMBRE" >
                   <td class="campocaja">
                     <input type="text" class="campo campotexto" value="${__formdata['TNOMBRE']}" name="TNOMBRE" id="TNOMBRE" size="15"
                            readonly="true"/>
                   </td>
              </axis:visible>
            </tr>
           <tr>
                <axis:ocultar f="axisprf013" c="NMOVIL" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf013" c="NMOVIL" lit="9903007"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf013" c="TEMAIL" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf013" c="TEMAIL" lit="9903325"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
              <axis:ocultar f="axisprf013" c="NMOVIL" dejarHueco="false"> 
                <td class="campocaja">
                <select name="NMOVIL" id="NMOVIL" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                <axis:atr f="axisprf013" c="NMOVIL" a="obligatorio=true&isInputText=false"/>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf013" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="telefs_prof" items="${__formdata.NMOVIL_SPERSON}">
                        <option value="${telefs_prof.CMODCON}"
                                <c:if test="${__formdata.CTELCON == telefs_prof.CMODCON}">selected</c:if>>
                            ${telefs_prof.TVALCON}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
              <axis:ocultar f="axisprf013" c="TEMAIL" dejarHueco="false"> 
                <td class="campocaja">
                <select name="TEMAIL" id="TEMAIL" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                <axis:atr f="axisprf013" c="TEMAIL" a="obligatorio=true&isInputText=false"/>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf013" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="emails_prof" items="${__formdata.TEMAIL_SPERSON}">
                        <option value="${emails_prof.CMODCON}"
                                <c:if test="${__formdata.CMAILCON == emails_prof.CMODCON}">selected</c:if>>
                            ${emails_prof.TVALCON}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
           </tr>
            <tr>
                <axis:ocultar f="axisprf013" c="TCARG0" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf013" c="TCARG0" lit="9902638"/></b>
                    </td>
                </axis:ocultar>
            </tr>
           <tr>
              <axis:visible f="axisprf013" c="TCARG0">
                    <td class="campocaja">
                     <input type="text" class="campo campotexto" value="${__formdata['TCARG0']}" name="TCARG0" id="TCARG0" size="15"/>
                   </td>
              </axis:visible>
            </tr>
           </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf013</c:param><c:param name="f">axisprf013</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>