<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
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
               parent.f_aceptar_modal("axisprf007");
            }
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf007');                      
        }           
        
        function f_but_aceptar(){          
          //parent.f_cerrar_modal('axisprf007');
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf007.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
         // window.location.reload();
        }
        
        function f_cargar_combos(){
            if($("#CTPZONA").val()==3){
                if (!objUtiles.estaVacio($("#CPROVIN").val())){
                    f_cargar_poblaciones($("#CPROVIN").val());
                }
            }
        }
        function f_cargar_poblaciones(thiss){
            if($("#CTPZONA").val()==3){
                objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosPoblaciones, "operation=ajax_cargarPoblaciones&CPROVIN="+thiss, this, objJsMessages.jslit_cargando);  
            }
        }
        
        function callbackAjaxCargarCombosPoblaciones(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("VALOR");
                var CPOBLACcombo = document.miForm.CPOBLAC;     
                objDom.borrarOpcionesDeCombo(CPOBLACcombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', 
                                       CPOBLACcombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);                                     
                    objDom.addOpcionACombo(VALOR, TEXTO, CPOBLACcombo, i+1);
                }
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
                <c:param name="titulo"><axis:alt f="axisprf007" c="TITULO" lit="9904711" /></c:param>
                <c:param name="nid" value="axisprf007" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>
        <input type="hidden" id="CNORDZN" name="CNORDZN" value="${__formdata.CNORDZN}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf007" lit="9904711" />
		   </c:param>
           <c:param name="producto">
			<axis:alt c="formulario" f="axisprf007" lit="9904711" />
		   </c:param>
           <c:param name="form">axisprf007</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
            </tr>        
            <tr>
                <axis:ocultar f="axisprf007" c="CTPZONA" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf007" c="CTPZONA" lit="9904713"/></b>
                    </td>
                </axis:ocultar>
            </tr> 
            <tr>
              <axis:ocultar f="axisprf007" c="CTPZONA" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CTPZONA" id="CTPZONA" size="1" class="campowidthselect campo campotexto_ob" onchange="f_cargar_combos()"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf007" c="CTPZONA" a="obligatorio=true&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf007" c="CTPZONA" a="obligatorio=true&isInputText=false"/>
                        </c:if> 
                        title= "<axis:alt f="axisprf007" c="CTPZONA" lit="9904713"/>">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf007" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="tipo_zona" items="${__formdata.TIPOSZONA}">
                        <option value="${tipo_zona.CATRIBU}"
                                <c:if test="${__formdata['CTPZONA'] == tipo_zona.CATRIBU}">selected</c:if>>
                            ${tipo_zona.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
            </tr>
            <tr>
            <axis:ocultar f="axisprf007" c="CPROVIN" dejarHueco="false">                 
               <td class="titulocaja">
                   <b><axis:alt f="axisprf007" c="CPROVIN" lit="100756"/></b>
               </td> 
            </axis:ocultar>
            <axis:visible f="axisprf007" c="CPOBLAC">
                <td class="titulocaja" id="tit_CPOBLAC">
                    <b id="label_CPOBLAC"><axis:alt f="axisprf007" c="CPOBLAC" lit="9903660"/></b>
                </td>
            </axis:visible>
            <axis:ocultar f="axisprf007" c="CPOSINI" dejarHueco="false">                 
               <td class="titulocaja">
                   <b><axis:alt f="axisprf007" c="CPOSINI" lit="9904709"/></b>
               </td> 
            </axis:ocultar>
            <axis:ocultar f="axisprf007" c="CPOSFIN" dejarHueco="false">                 
               <td class="titulocaja">
                   <b><axis:alt f="axisprf007" c="CPOSFIN" lit="9904710"/></b>
               </td> 
            </axis:ocultar>
            </tr>
            
            <tr>
                <axis:ocultar f="axisprf007" c="CPROVIN" dejarHueco="false">
                <td class="campocaja"  id="td_CPROVIN" >
                    <select name="CPROVIN" id="CPROVIN" size="1" class="campowidthselect campo campotexto_op" style="width:85%;"
                            onchange="f_cargar_poblaciones(this.value)"
                        <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf007" c="CPROVIN" a="obligatorio=false&isInputText=false&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                        <axis:atr f="axisprf007" c="CPROVIN" a="obligatorio=false&isInputText=false"/>
                        </c:if>>
                        <option value="<%= Integer.MIN_VALUE %>">
                            - <axis:alt f="axisprf007" c="SELEC" lit="1000348"/> - 
                        </option>
                        <c:forEach var="element" items="${__formdata.PROVINCIAS}">
                        <option value = "${element.CODIGO}"
                                <c:if test="${__formdata['CPROVIN'] == element.CODIGO}"> selected </c:if>>
                            ${element.TEXTO}
                        </option>
                        </c:forEach>
                    </select>
                </td>
                </axis:ocultar>
                <axis:visible f="axisprf007" c="CPOBLAC">
                    <td class="campocaja" id="td_CPOBLAC">
                        <select name = "CPOBLAC" id="CPOBLAC" paramMap="true"    size="1" 
                                title="<axis:alt f="axisprf007" c="td_CPOBLAC" lit="9903660"/>"
                                class="campowidthselect campo campotexto" 
                                <c:if test="${__formdata.MODO == 'modificar'}">
                                    <axis:atr f="axisprf007" c="CPOBLAC" a="obligatorio=false&isInputText=false&modificable=false"/>
                                </c:if>
                                <c:if test="${__formdata.MODO != 'modificar'}">
                                    <axis:atr f="axisprf007" c="CPOBLAC" a="obligatorio=false&isInputText=false"/>
                                </c:if>>
                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf007" c="SNV_COMBO" lit="108341"/> - </option>
                            <c:forEach var="poblaciones" items="${__formdata.POBLACIONES}">
                                <option value = "${poblaciones.VALOR}"
                                <c:if test="${__formdata.CPOBLAC == poblaciones.VALOR}"> selected </c:if>>
                                ${poblaciones.TEXTO}</option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:visible>
                <axis:ocultar f="axisprf007" c="CPOSINI">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSINI}" name="CPOSINI"
                           id="CPOSINI" style="text-transform:uppercase;width:40%;" 
                           <c:if test="${__formdata.MODO == 'modificar'}"><axis:atr f="axisprf007" c="CPOSINI" a="modificable=false"/></c:if>/>
                </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf007" c="CPOSFIN">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSFIN}" name="CPOSFIN"
                           id="CPOSFIN" style="text-transform:uppercase;width:40%;" 
                           <c:if test="${__formdata.MODO == 'modificar'}"><axis:atr f="axisprf007" c="CPOSFIN" a="modificable=false"/></c:if>/>
                </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf007" c="FDESDE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf007" c="FDESDE" lit="9902360"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf007" c="FHASTA" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf007" c="FHASTA" lit="9902361"/></b>
                    </td>
                </axis:ocultar>
            </tr>
                <axis:ocultar f="axisprf007" c="FDESDE" dejarHueco="false">                 
            <tr>
                <td class="campocaja" >
                 <input  type="text" class="campowidthinput campo campotexto_ob" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESDE}"/>" 
                         name="FDESDE" id="FDESDE" style="width:50%;" title= "<axis:alt f="axisprf007" c="FDESDE" lit="9902360"/>"  
                         <c:if test="${__formdata.MODO == 'modificar'}">
                        <axis:atr f="axisprf007" c="FDESDE" a="obligatorio=true&formato=fecha&modificable=false"/>
                        </c:if>
                        <c:if test="${__formdata.MODO != 'modificar'}">
                         <axis:atr f="axisprf007" c="FDESDE" a="obligatorio=true&formato=fecha"/>
                        </c:if>/>
                       <a style="vertical-align:middle;">
                       <img id="popup_calendario_FDESDE" alt="<axis:alt f="axisprf007" c="FDESDE" lit="108341"/>"  
                            src="images/calendar.gif" 
                       </a>
                </td>            
                </axis:ocultar>    
                <axis:ocultar f="axisprf007" c="FHASTA" dejarHueco="false">                 
                <td class="campocaja" >
                 <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FHASTA}"/>" 
                         name="FHASTA" id="FHASTA" style="width:50%;" title= "<axis:alt f="axisprf007" c="FHASTA" lit="108341"/>"
                        <axis:atr f="axisprf007" c="FHASTA" a="obligatorio=false&formato=fecha"/>
                       <a style="vertical-align:middle;">
                       <img id="popup_calendario_FHASTA" alt="<axis:alt f="axisprf007" c="FHASTA" lit="108341"/>"  
                            src="images/calendar.gif" 
                       </a>
                </td>            
                </axis:ocultar> 
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf007</c:param><c:param name="f">axisprf007</c:param>
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
