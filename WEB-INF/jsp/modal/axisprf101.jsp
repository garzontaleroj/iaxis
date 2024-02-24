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
               parent.f_aceptar_modal("axisprf101");
            }else{
                resetEntradas($("#CVALOR").val());
            }
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf101');                      
        }           
        
        function f_but_aceptar(){       
          if (objValidador.validaEntrada()) {          
            objUtiles.ejecutarFormulario("modal_axisprf101.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
               optionalQueryString = "";
                
            if (noXButton) 
               objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
        }
        
        function f_aceptar_modal(pantalla, param){
            f_cerrar_modal(pantalla);
            if (pantalla == "axisprf103"){
                f_cerrar_modal("axisprf102");
            }
            params=param.split('&');
            p1 = params[0].split("=");
            p2 = params[1].split("=");
            $("#STARIFA").val(p1[1]);
            $("#TTARIFA b").html(p2[1]);
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
        
        function actualizaStarifa(STARIFA){
            $("#STARIFA").val(STARIFA);
        }
        
        function f_but_salir(){
            objUtiles.cerrarModal("axisprf102");            
        }
        
        function f_but_buscar(){
            if (!objUtiles.estaVacio($("#STARIFA").val())){
                var qs="operation=ajax_buscar_tarifa&STARIFA="+$("#STARIFA").val();
                $("#TTARIFA b").html("");
                objAjax.invokeAsyncCGI("modal_axisprf101.do", callbackBuscarTarifa, qs, this, objJsMessages.jslit_cargando);
            }
        }
        
        function callbackBuscarTarifa(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText); 
            var elementos = doc.getElementsByTagName("TDESCRI"); 
            if (elementos.length > 0){
                for (i = 0; i < elementos.length; i++) {
                    var TDESCRI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDESCRI"), i, 0); 
                    $("#TTARIFA b").html(TDESCRI);                
                }
            }else{
                alert('<axis:alt f="axisprf101" c="TTARIFA" lit="9907887" />');
                $("#STARIFA").val(""); 
            }
        }
        
        function resetEntradas(valor){
            if (valor<-1){
                $("#CTIPO").val(valor);
                $("#CTIPO").attr("disabled",true);
                $("#CTIPO").addClass("campodisabled");
            }else{
                $("#CTIPO").attr("disabled",false);
                $("#CTIPO").removeClass("campodisabled");
            }
            mostrarEntradas();
        }
        
        function mostrarEntradas(){
            
            if($("#CTIPO").val()==1){
               $("#NIMPORTE").removeAttr("readonly");
               $("#NIMPORTE").removeClass("campodisabled");
               $("#NIMPORTE").addClass("campotexto_op");
               $("#NIMPORTE").focus();
               $("#NPORCENT").attr("readonly", false);
               $("#NPORCENT").removeClass("campotexto_op");
               $("#NPORCENT").addClass("campodisabled");
               $("#NPORCENT").val(null);
            }else if($("#CTIPO").val()==2){   
               $("#NPORCENT").removeAttr("readonly");
               $("#NIMPORTE").attr("readonly",true);
               $("#NPORCENT").removeClass("campodisabled");
               $("#NPORCENT").addClass("campotexto_op");
               $("#NPORCENT").focus();
               $("#NIMPORTE").removeClass("campotexto_op");
               $("#NIMPORTE").addClass("campodisabled");
               $("#NIMPORTE").val(null);
            }else{
               $("#NPORCENT").removeClass("campotexto_op");
               $("#NPORCENT").addClass("campodisabled");
               $("#NPORCENT").attr("readonly",true);
               $("#NPORCENT").val(null);
               $("#NIMPORTE").removeClass("campotexto_op");
               $("#NIMPORTE").addClass("campodisabled");
               $("#NIMPORTE").attr("readonly",true);
               $("#NIMPORTE").val(null);
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
                <c:param name="titulo"><axis:alt f="axisprf101" c="TITULO" lit="9904896" /></c:param>
                <c:param name="nid" value="axisprf101" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf102|<axis:alt f="axisprf100" c="MODAL_AXISPRF102" lit="9904887" /></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf103|<axis:alt f="axisprf104" c="MODAL_AXISPRF103" lit="9904892" /></c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pSPROFES" name="pSPROFES" value="${__formdata.SPROFES}"/>
        <input type="hidden" id="pSCONVEN" name="pSCONVEN" value="${__formdata.SCONVEN}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axisprf101" lit="9904896" /></c:param>
           <c:param name="producto"><axis:alt c="formulario" f="axisprf101" lit="9904896" /></c:param>
           <c:param name="form">axisprf101</c:param>
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
                <axis:visible f="axisprf101" c="SPERSED"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf101" c="SPERSED" lit="9902589"/></b>
                    </td>
                </axis:visible>
                <axis:visible f="axisprf101" c="STARIFA"> 
                    <td class="titulocaja">
                        <b style="margin-left:5%"><axis:alt f="axisprf101" c="STARIFA" lit="9904895"/></b>
                    </td>
                </axis:visible>
            </tr> 
            <tr>
            <axis:ocultar f="axisprf101" c="SPERSED" dejarHueco="false"> 
            <td class="campocaja">
                <select name="SPERSED" id="SPERSED" size="1" class="campowidthselect campo campotexto">
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf101" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="sede" items="${__formdata.SEDES}">
                        <option value="${sede.SPERSON}" <c:if test="${__formdata.OBIAXCONVEN.SPERSED == sede.SPERSON}">selected</c:if>>
                            ${sede.TNOMBRE}
                        </option>
                    </c:forEach>
                </select>
            </td>
            </axis:ocultar>
            <axis:ocultar f="axisprf101" c="STARIFA" dejarHueco="false"> 
                <!-- Tarifa-->
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.OBIAXCONVEN.STARIFA}" 
                           name="STARIFA" id="STARIFA" style="width:18%;margin-left:5%" onchange="f_but_buscar()"
                    <axis:atr f="axisprf101" c="STARIFA" a="formato=entero&obligatorio=true"/> 
                    title="<axis:alt f="axisprf101" c="STARIFA" lit="9904895"/>"/>&nbsp;
                    <img id="findTarifa" border="0" src="images/find.gif" onclick="f_abrir_modal('axisprf102',null,'&pSPROFES='+document.miForm.pSPROFES.value+'&MODO=altaConvenio');" style="cursor:pointer"/>
                    &nbsp;<span id="TTARIFA"><b>${__formdata.OBIAXCONVEN.TTARIFA}</b></span>
                </td>
            </axis:ocultar>
            </tr>
            <tr>
                <axis:visible f="axisprf101" c="TDESCRI">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axisprf101" c="TDESCRI" lit="100588"/></b>
                    </td> 
                </axis:visible>
                <axis:visible f="axisprf101" c="NCOMPLE"> 
                    <td class="titulocaja">
                        <b style="margin-left:5%"><axis:alt f="axisprf101" c="NCOMPLE" lit="9904907"/></b>
                    </td>
                </axis:visible>  
            </tr>
            <tr>
                <axis:visible f="axisprf101" c="TDESCRI">
                    <td style="margin-left:5%"> 
                        <textarea rows="8" class="campo campotexto" cols="" 
                        <axis:atr f="axisprf101" c="TDESCRI" a="modificable=true&isInputText=false"/> 
                                  style="width:100%;"  name="TDESCRI" id="TDESCRI">${__formdata.OBIAXCONVEN.TDESCRI}</textarea>
                    </td>
                </axis:visible> 
                <td>
                    <table style="margin-left:5%">
                        <tr>
                            <axis:ocultar f="axisprf101" c="NCOMPLE" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name="NCOMPLE" id="NCOMPLE" size="1" class="campowidthselect campo campotexto"
                                        title="<axis:alt f="axisprf101" c="NCOMPLE" lit="9904907"/>">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            <axis:alt f="axisprf101" c="SELECCIONAR" lit="108341"/>                                
                                        </option>
                                        <c:forEach var="nivel_com" items="${__formdata.NIVEL}">
                                        <option value="${nivel_com.CATRIBU}" <c:if test="${__formdata['OBIAXCONVEN'].NCOMPLE == nivel_com.CATRIBU}">selected</c:if>>
                                            ${nivel_com.TATRIBU}
                                        </option>
                                        </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:visible f="axisprf101" c="NPRIORM"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisprf101" c="NPRIORM" lit="9904908"/></b>
                                </td>
                            </axis:visible>
                            <axis:ocultar f="axisprf101" c="TERMINO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisprf101" c="TERMINO" lit="9001991"/></b>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisprf101" c="NPRIORM" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name="NPRIORM" id="NPRIORM" size="1" class="campowidthselect campo campotexto"
                                            title="<axis:alt f="axisprf101" c="NPRIORM" lit="9904908"/>">
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisprf101" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="prioridad" items="${__formdata.PRIORIDAD}">
                                            <option value="${prioridad.CATRIBU}" <c:if test="${__formdata['OBIAXCONVEN'].NPRIORM == prioridad.CATRIBU}">selected</c:if>>
                                                ${prioridad.TATRIBU}
                                            </option>
                                            </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisprf101" c="TERMINO" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name="TERMINO" id="TERMINO" size="1" class="campowidthselect campo campotexto"
                                            title="<axis:alt f="axisprf101" c="TERMINO" lit="9001991"/>">
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisprf101" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="termino" items="${__formdata.TERMINO}">
                                            <option value="${termino.CODIGO}" <c:if test="${__formdata['OBIAXCONVEN'].TERMINO == termino.CODIGO}">selected</c:if>>
                                                ${termino.CODIGO}
                                            </option>
                                            </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                    <axis:visible f="axisprf101" c="CVALOR"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axisprf101" c="CVALOR" lit="101159"/></b>
                        </td>
                    </axis:visible>
                     <axis:visible f="axisprf101" c="CTIPO">                 
                        <td class="titulocaja">
                                  <b><axis:alt f="axisprf101" c="CTIPO" lit="100565"/></b>
                        </td> 
                    </axis:visible>
                </tr>        
                <tr>
                <axis:ocultar f="axisprf101" c="CVALOR" dejarHueco="false"> 
                <td class="campocaja">
                    <select name="CVALOR" id="CVALOR" size="1" class="campowidthselect campo campotexto_op"
                            <axis:atr f="axisprf101" c="CVALOR" a="obligatorio=false"/> 
                            title="<axis:alt f="axisprf101" c="CVALOR" lit="101159"/>" onchange="resetEntradas(this.value)">
                        <option value="<%= Integer.MIN_VALUE %>">
                          <axis:alt f="axisprf101" c="SELECCIONAR" lit="108341"/>                                
                        </option>
                        <c:forEach var="valores" items="${__formdata.VALORES}">
                            <option value="${valores.CATRIBU}" <c:if test="${__formdata['OBIAXCONVEN'].CVALOR == valores.CATRIBU}">selected</c:if>>
                                ${valores.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf101" c="CTIPO" dejarHueco="false"> 
                <td class="campocaja">
                    <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo campotexto_op"
                            <axis:atr f="axisprf101" c="CTIPO" a="obligatorio=false"/>
                            title="<axis:alt f="axisprf101" c="CTIPO" lit="9901195"/>" onchange="mostrarEntradas()">
                        <option value="<%= Integer.MIN_VALUE %>">
                          <axis:alt f="axisprf101" c="SELECCIONAR" lit="108341"/>                                
                        </option>
                        <c:forEach var="tipo" items="${__formdata.TIPO}">
                            <option value="${tipo.CATRIBU}" <c:if test="${__formdata['OBIAXCONVEN'].CTIPO == tipo.CATRIBU}">selected</c:if>>
                                ${tipo.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                </axis:ocultar>
                </tr>        
                <tr>
                    <axis:visible f="axisprf101" c="NIMPORTE"> 
                        <td class="titulocaja" id="tit_NIMPORTE">
                           <b><axis:alt f="axisprf101" c="NIMPORTE" lit="100563"/></b>
                        </td>
                    </axis:visible>
                     <axis:visible f="axisprf101" c="NPORCENT"> 
                        <td class="titulocaja" id="tit_NPORCENT">
                           <b><axis:alt f="axisprf101" c="NPORCENT" lit="9903530"/></b>
                        </td>
                    </axis:visible>
                </tr>
                <tr>
                    <axis:ocultar f="axisprf101" c="NIMPORTE" dejarHueco="false">
                        <td>
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPRO]}" value="${__formdata['OBIAXCONVEN'].NIMPORTE}"/>" name="NIMPORTE" id="NIMPORTE" size="15"
                                   style="width:75%;" readonly="true"
                                   onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisprf101" c="NIMPORTE" lit="100563"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value)));this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}"/>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisprf101" c="NPORCENT" dejarHueco="false">
                        <td>
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPRO]}" value="${__formdata['OBIAXCONVEN'].NPORCENT}"/>" name="NPORCENT" id="NPORCENT" size="15"
                                   style="width:75%;" readonly="true"
                                   onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisprf101" c="NPORCENT" lit="9903530"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value)));this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}"/>
                        </td>
                    </axis:ocultar>              
                </tr>
                        </table>
                    </td>
                </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf101</c:param><c:param name="f">axisprf101</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
