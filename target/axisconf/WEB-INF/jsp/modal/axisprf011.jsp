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
               parent.f_aceptar_modal("axisprf011");
            }
            var modo = "${__formdata.MODO}";
            if ((modo == "modificar") || (guardat == "1")){
                f_cargar_subtipos();
            }    
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf011');                      
        }           
        
        function f_but_aceptar(){    
          $("#pCTIPPRO").val($("#CTIPPRO").val());
          $("#pCSUBPRO").val($("#CSUBPRO").val());
          $("#pFDESDE").val($("#FDESDE").val());
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf011.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
        
        function f_cargar_subtipos(){
           objAjax.invokeAsyncCGI("modal_axisprf011.do", callbackAjaxCargarSubtipos, "operation=ajax_busqueda_subtipos&SPROFES=" +
                                                                                     objDom.getValorPorId("pCodiProf") + 
                                                                                     "&CTIPPRO="+objDom.getValorPorId("CTIPPRO"),
                                  this, objJsMessages.jslit_cargando);
        }  
        
        function callbackAjaxCargarSubtipos(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CSUBPRO"); 
                var cuantos = elementos.length;
                var CSUBPROCombo = document.getElementById("CSUBPRO");//document.miForm.CSUBPRO;
                objDom.borrarOpcionesDeCombo(CSUBPROCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf011" c="SELECC" lit="108341"/> - ',
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
                <c:param name="titulo"><axis:alt f="axisprf011" c="TITULO" lit="9904759" /></c:param>
                <c:param name="nid" value="axisprf011" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>
        <input type="hidden" id="pCTIPPRO" name="pCTIPPRO" value="${__formdata.CTIPPRO}"/>
        <input type="hidden" id="pCSUBPRO" name="pCSUBPRO" value="${__formdata.CSUBPRO}"/>
        <input type="hidden" id="pFDESDE" name="pFDESDE" value="${__formdata.FDESDE}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf011" lit="9904759" />
		   </c:param>
           <c:param name="producto">
			<axis:alt c="formulario" f="axisprf011" lit="9904759" />
		   </c:param>
           <c:param name="form">axisprf011</c:param>
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
                <axis:ocultar f="axisprf011" c="CTIPPRO" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf011" c="CTIPPRO" lit="9903408"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf011" c="CSUBPRO" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf011" c="CSUBPRO" lit="9902570"/></b>
                    </td>
                </axis:ocultar>
            </tr> 
            <tr>
              <axis:ocultar f="axisprf011" c="CTIPPRO" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CTIPPRO" id="CTIPPRO" size="1" onchange="f_cargar_subtipos()" class="campowidthselect campo campotexto_ob"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf011" c="CTIPPRO" a="obligatorio=true&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf011" c="CTIPPRO" a="obligatorio=true&isInputText=false"/>
                        </c:if>
                        title= "<axis:alt f="axisprf011" c="CTIPPRO" lit="9903408"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf011" c="SELECCIONAR" lit="108341"/>                                
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
              <axis:ocultar f="axisprf011" c="CSUBPRO" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CSUBPRO" id="CSUBPRO" size="1" class="campowidthselect campo campotexto_ob"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf011" c="CSUBPRO" a="obligatorio=true&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf011" c="CSUBPRO" a="obligatorio=true&isInputText=false"/>
                        </c:if>
                        title= "<axis:alt f="axisprf011" c="CSUBPRO" lit="9902570"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf011" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="tipo_subprof" items="${__formdata.TIPOSSUBPROF}">
                        <option value="${tipo_subprof.CSUBPRO}"
                                <c:if test="${__formdata['CSUBPRO'] == tipo_subprof.CSUBPRO}">selected</c:if>>
                            ${tipo_subprof.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf011" c="SPRODUC" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf011" c="SPRODUC" lit="9902909"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf011" c="CCAUSIN" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf011" c="CCAUSIN" lit="101040"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
              <axis:ocultar f="axisprf011" c="SPRODUC" dejarHueco="false"> 
                <td class="campocaja">
                <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto_op"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf011" c="SPRODUC" a="obligatorio=false&isInputText=false&modificable=true"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf011" c="SPRODUC" a="obligatorio=false&isInputText=false"/>
                        </c:if>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf011" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="produc" items="${__formdata.PRODUCTOS}">
                        <option value="${produc.SPRODUC}"
                                <c:if test="${__formdata['SPRODUC'] == produc.SPRODUC}">selected</c:if>>
                            ${produc.TTITULO}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
              <axis:ocultar f="axisprf011" c="CCAUSIN" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CCAUSIN" id="CCAUSIN" size="1" class="campowidthselect campo campotexto_op"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf011" c="CCAUSIN" a="obligatorio=false&isInputText=false&modificable=true"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf011" c="CCAUSIN" a="obligatorio=false&isInputText=false"/>
                        </c:if>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf011" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="causas" items="${__formdata.CAUSAS}">
                        <option value="${causas.CATRIBU}"
                                <c:if test="${__formdata['CCAUSIN'] == causas.CATRIBU}">selected</c:if>>
                            ${causas.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf011" c="FDESDE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf011" c="FDESDE" lit="9902360"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf011" c="FHASTA" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf011" c="FHASTA" lit="9902361"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf011" c="FDESDE" dejarHueco="false">  
                <td class="campocaja" >
                 <input  type="text" class="campowidthinput campo campotexto_ob" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESDE}"/>" 
                         name="FDESDE" id="FDESDE" style="width:50%;" 
                         title= "<axis:alt f="axisprf011" c="FDESDE" lit="9902360"/>"  
                         <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf011" c="FDESDE" a="obligatorio=true&formato=fecha&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                         <axis:atr f="axisprf011" c="FDESDE" a="obligatorio=true&formato=fecha"/>
                        </c:if>/>
                       <a style="vertical-align:middle;">
                       <img id="popup_calendario_FDESDE" alt="<axis:alt f="axisprf011" c="FDESDE" lit="108341"/>"  
                            src="images/calendar.gif" 
                       </a>
                </td>            
                </axis:ocultar> 
                <axis:ocultar f="axisprf011" c="FHASTA" dejarHueco="false">  
                <td class="campocaja" >
                 <input  type="text" class="campowidthinput campo campotexto_op" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FHASTA}"/>" 
                         name="FHASTA" id="FHASTA" style="width:50%;" 
                         title= "<axis:alt f="axisprf011" c="FHASTA" lit="9902360"/>"  
                         <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf011" c="FHASTA" a="obligatorio=false&formato=fecha&modificable=true"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                         <axis:atr f="axisprf011" c="FHASTA" a="obligatorio=false&formato=fecha"/>
                        </c:if>/>
                       <a style="vertical-align:middle;">
                       <img id="popup_calendario_FHASTA" alt="<axis:alt f="axisprf011" c="FHASTA" lit="108341"/>"  
                            src="images/calendar.gif" 
                       </a>
                </td>            
                </axis:ocultar>
            </tr>
           </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf011</c:param><c:param name="f">axisprf011</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FDESDE",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FDESDE", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script> 
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FHASTA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FHASTA", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script> 
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
