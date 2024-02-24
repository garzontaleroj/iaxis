<%/* Revision:# DkC2wYXd4EKiniElFcfNNQ== # */%>
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
            var mensaje_aviso = "${__formdata.mensaje_aviso}";
            if (!objUtiles.estaVacio(guardat)){
                if(guardat=="0"){
                    parent.f_aceptar_modal("axisprf002", "pCodiProf="+"${__formdata.SPROFES}"+"&SPERSON="+"${__formdata.SPERSON}");
                }else if (guardat=="1"){
                    if (!objUtiles.estaVacio(mensaje_aviso)){
                        alert(mensaje_aviso);    
                    }
                }
            }
            var modo = "${__formdata.MODO}";
            var CNOASIS = "${__formdata['OBPROF'].CNOASIS}";
            if ((modo == "modificar") &&(CNOASIS == 1)){
                $("#CNOASIS").prop("checked","true");
            }
            /*if ((modo == "modificar") || (guardat == "1")){
                f_cargar_subtipos();
            }    */
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf002');                      
        }           
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf002.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
        
        function f_cargar_subtipos(){
           objAjax.invokeAsyncCGI("modal_axisprf002.do", callbackAjaxCargarSubtipos, "operation=ajax_busqueda_subtipos&SPROFES=" +
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
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf002" c="SELECC" lit="108341"/> - ',
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
                <c:param name="titulo"><axis:alt f="axisprf002" c="TITULO" lit="9904788" /></c:param>
                <c:param name="nid" value="axisprf002" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf002" lit="9904788" />
		   </c:param>
           <c:param name="producto">
                <axis:alt f="axisprf002" c="formulario" lit="9904788"/>
           </c:param>
           <c:param name="form">axisprf002</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:15%;height:0px"></th>
                <th style="width:20%;height:0px"></th>
                <th style="width:15%;height:0px"></th>                                
                <th style="width:20%;height:0px"></th>   
                <th style="width:20%;height:0px"></th>   
                <th style="width:10%;height:0px"></th>
            </tr>        
            <tr>
                <axis:ocultar f="axisprf002" c="SPROFES" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="SPROFES" lit="9904784"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="TTIPPER" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="TTIPPER" lit="102844"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="TTIPIDE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="TTIPIDE" lit="150996"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="NNUMIDE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="NNUMIDE" lit="9903661"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="TNOMBRE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="TNOMBRE" lit="105940"/></b>
                    </td>
                </axis:ocultar>
            </tr> 
            <tr>
                <axis:visible f="axisprf000" c="SPROFES" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SPROFES']}" name="SPROFES" id="SPROFES" 
                               readonly="true" style="width:67%" size="15"/>
                    </td>
                </axis:visible>
                <axis:visible f="axisprf000" c="CTIPPER" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['TTIPPER']}" name="TTIPPER" id="TTIPPER" 
                               readonly="true"  style="width:70%" size="15"/>
                    </td>
                </axis:visible>
                <axis:visible f="axisprf000" c="CTIPIDE" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['TTIPIDE']}" name="TTIPIDE" id="TTIPIDE" 
                               readonly="true" style="width:60%" size="15" />
                    </td>
                </axis:visible>
                <axis:visible f="axisprf000" c="NNUMIDE" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE" 
                               readonly="true" style="width:40%" size="15" />
                    </td>
                </axis:visible>
                <axis:visible f="axisprf000" c="TNOMBRE" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['TNOMBRE']}" name="TNOMBRE" id="TNOMBRE" 
                               readonly="true" size="15" />
                    </td>
                </axis:visible>
            </tr>
            <tr>
                <axis:ocultar f="axisprf002" c="CDOMICI" dejarHueco="false"> 
                    <td class="titulocaja" colspan="2">
                       <b><axis:alt f="axisprf002" c="CDOMICI" lit="9903470"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="NREGMER" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="NREGMER" lit="9904789"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="FREGMER" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="FREGMER" lit="9904790"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="NLIMITE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="NLIMITE" lit="9904791"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
              <axis:ocultar f="axisprf002" c="CDOMICI" dejarHueco="false"> 
                <td class="campocaja" colspan="2">
                <select name="CDOMICI" id="CDOMICI" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                <axis:atr f="axisprf002" c="CDOMICI" a="obligatorio=true&isInputText=false"/> 
                title= "<axis:alt f="axisprf002" c="CDOMICI" lit="101078"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf002" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="domis_prof" items="${__formdata.DOMISPROF}">
                        <option value="${domis_prof.CDOMICI}"
                                <c:if test="${__formdata['OBPROF'].CDOMICI == domis_prof.CDOMICI}">selected</c:if>>
                            ${domis_prof.TDOMICI}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
              <axis:visible f="axisprf000" c="NREGMER" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['OBPROF'].NREGMER}" 
                               name="NREGMER" id="NREGMER" size="15"  />
                    </td>
              </axis:visible>
              <axis:visible f="axisprf000" c="FREGMER" >
                    <td class="campocaja">
                        <input  type="text" class="campowidthinput campo campotexto_ob" size="10" 
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['OBPROF'].FREGMER}"/>" name="FREGMER" 
                                id="FREGMER" 
                                title= "<axis:alt f="axisprf002" c="FREGMER" lit="9904790"/>"  
                                        <axis:atr f="axisprf002" c="FREGMER" a="modificable=true&obligatorio=false&formato=fecha"/> 
                                style= "width:60%"/>
                        <a style="vertical-align:middle;">
                           <img id="popup_calendario_FREGMER" alt="<axis:alt f="axisprf002" c="FREGMER" lit="108341"/>"  
                                src="images/calendar.gif" />
                        </a>
                    </td>
              </axis:visible>
              <axis:visible f="axisprf000" c="NLIMITE" >
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['OBPROF'].NLIMITE}" 
                               name="NLIMITE" id="NLIMITE" size="15"  />
                    </td>
              </axis:visible>
            </tr>
            <tr>
                <axis:ocultar f="axisprf002" c="CNOASIS" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="CNOASIS" lit="9904792"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf002" c="CTELCLI" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf002" c="CTELCLI" lit="9904793"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
              <axis:visible f="axisprf000" c="CNOASIS" >
                    <td class="campocaja">
                        <input type="checkbox" class="campowidthinput campo campotexto" value="1" name="CNOASIS" id="CNOASIS"
                               style="width:40%" size="15" />
                    </td>
              </axis:visible>
              <axis:ocultar f="axisprf002" c="CTELCLI" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CTELCLI" id="CTELCLI" size="1" class="campowidthselect campo campotexto_ob" style="width:71%"
                    <axis:atr f="axisprf002" c="CTELCLI" a="obligatorio=true&isInputText=false"/>
                    title= "<axis:alt f="axisprf002" c="CTELCLI" lit="9904793"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf002" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="telefs_prof" items="${__formdata.TELFSPROF}">
                        <option value="${telefs_prof.CMODCON}"
                                <c:if test="${__formdata['OBPROF'].CMODCON == telefs_prof.CMODCON}">selected</c:if>>
                            ${telefs_prof.TVALCON}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar>
            </tr>
           </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf002</c:param><c:param name="f">axisprf002</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FREGMER",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FREGMER", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>     
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
