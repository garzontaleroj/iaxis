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
               parent.f_aceptar_modal("axisprf003");
            }
            var modo = "${__formdata.MODO}";
            if ((modo == "modificar") || (guardat == "1")){
                f_cargar_subtipos();
            }    
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf003');                      
        }           
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf003.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
        
        function f_cargar_subtipos(){
           objAjax.invokeAsyncCGI("modal_axisprf003.do", callbackAjaxCargarSubtipos, "operation=ajax_busqueda_subtipos&SPROFES=" +
                                                                                     objDom.getValorPorId("pCodiProf") + 
                                                                                     "&CTIPPRO="+$("#CTIPPRO").val(),
                                  this, objJsMessages.jslit_cargando);
        }  
        
        function callbackAjaxCargarSubtipos(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CSUBPRO"); 
                var cuantos = elementos.length;
                var CSUBPROCombo = document.getElementById("CSUBPRO");//document.miForm.CSUBPRO;
                objDom.borrarOpcionesDeCombo(CSUBPROCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf003" c="SELECC" lit="108341"/> - ',
                                       CSUBPROCombo, 0);
                for (i = 0; i < cuantos; i++) {
                     var CSUBPRO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CSUBPRO"), i, 0);
                     var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0); 
                     objDom.addOpcionACombo(CSUBPRO, TITULO, CSUBPROCombo, i+1);
                }
            }// recarrega scroll pane
            var modo = "${__formdata.MODO}";
            if (modo = "modificar"){
                $("#CSUBPRO").val("${__formdata.CSUBPRO}")
            }
            $.reinitialiseScroll(); 
        } 
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisprf003" c="TITULO" lit="9904774" /></c:param>
                <c:param name="nid" value="axisprf003" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf003" lit="9904774" />
		   </c:param>
           <c:param name="producto">
                <axis:alt f="axisprf003" c="formulario" lit="9904774"/>
           </c:param>
           <c:param name="form">axisprf003</c:param>
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
                <axis:ocultar f="axisprf003" c="CTIPPRO" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf003" c="CTIPPRO" lit="9903408"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf003" c="CSUBPRO" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf003" c="CSUBPRO" lit="9902570"/></b>
                    </td>
                </axis:ocultar>
            </tr> 
            <tr>
              <axis:ocultar f="axisprf003" c="CTIPPRO" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CTIPPRO" id="CTIPPRO" size="1" onchange="f_cargar_subtipos()" class="campowidthselect campo campotexto_ob"
                        title= "<axis:alt f="axisprf003" c="CTIPPRO" lit="9903408"/>"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf003" c="CTIPPRO" a="obligatorio=true&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf003" c="CTIPPRO" a="obligatorio=true&isInputText=false"/>
                        </c:if>
                        >
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf003" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="tipo_prof" items="${__formdata.TIPOSPROF}">
                        <option value="${tipo_prof.CTIPPRO}"
                                <c:if test="${__formdata['CTIPPRO'] == tipo_prof.CTIPPRO}">selected</c:if>>
                            ${tipo_prof.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
              <axis:ocultar f="axisprf003" c="CSUBPRO" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CSUBPRO" id="CSUBPRO" size="1" class="campowidthselect campo campotexto_ob"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf003" c="CSUBPRO" a="obligatorio=true&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf003" c="CSUBPRO" a="obligatorio=true&isInputText=false"/>
                        </c:if>
                        title= "<axis:alt f="axisprf003" c="CSUBPRO" lit="9902570"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf003" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="tipo_subprof" items="${__formdata.TIPOSSUBPROF}">
                        <option value="${tipo_subprof.CATRIBU}"
                                <c:if test="${__formdata['CSUBPRO'] == tipo_subprof.CATRIBU}">selected</c:if>>
                            ${tipo_subprof.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar>
            </tr>
           </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf003</c:param><c:param name="f">axisprf003</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
