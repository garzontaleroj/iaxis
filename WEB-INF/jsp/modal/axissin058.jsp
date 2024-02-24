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
               parent.f_aceptar_modal("axissin058", "&pSPROFES="+"${__formdata.SPROFES}"+
                                                    "&pSCONVEN="+"${__formdata.SCONVEN}");
            }
        }  
        
        function f_cerrar_modalespersona(modal){
            objUtiles.cerrarModal(modal);
        } 
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axissin058');                      
        }           
        
        function f_but_aceptar(){       
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axissin058.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
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
            params=param.split('&');
            p1 = params[0].split("=");
            p2 = params[1].split("=");
            $("#STARIFA").val(p1[1]);
            $("#TTARIFA b").html(p2[1]);
            
            f_cerrar_modal(pantalla, "TTARIFA="+p2[1]);
            if (pantalla == "axisprf103"){
                f_cerrar_modal("axisprf102", "TTARIFA="+p2[1]);
            }
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
            objUtiles.ejecutarFormulario("modal_axissin058.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_modal(pantalla, param){
            objUtiles.cerrarModal(pantalla);
            objUtiles.ejecutarFormulario("modal_axissin058.do?"+param, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function actualizaStarifa(STARIFA){
            $("#STARIFA").val(STARIFA);
        }
        
        function f_but_salir(){
            objUtiles.cerrarModal("axisprf102");            
        }
        
        function f_but_buscar(){
            if (!objUtiles.estaVacio($("#STARIFA").val())){
                var qs="operation=m_ajax_buscar_tarifa&STARIFA="+$("#STARIFA").val();
                $("#TTARIFA b").html("");
                objAjax.invokeAsyncCGI("modal_axissin058.do", callbackBuscarTarifa, qs, this, objJsMessages.jslit_cargando);
            }
        }
        
        function callbackBuscarTarifa(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText); 
            var elementos = doc.getElementsByTagName("TDESCRI");  
            for (i = 0; i < elementos.length; i++) {
                var TDESCRI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDESCRI"), i, 0);
                $("#TTARIFA b").html(TDESCRI);
            }
        }
        
        function mostrarEntradas(){
            if($("#CTIPO").val()==1){
               $("#NIMPORTE").removeAttr("readonly");
               $("#NIMPORTE").removeClass("campodisabled");
               $("#NIMPORTE").addClass("campotexto_op");
               $("#NIMPORTE").focus();
               $("#NPORCENT").attr("readonly", "false");
               $("#NPORCENT").removeClass("campotexto_op");
               $("#NPORCENT").addClass("campodisabled");
               $("#NPORCENT").val(null);
            }
            if($("#CTIPO").val()==2){   
               $("#NPORCENT").removeAttr("readonly");
               $("#NIMPORTE").attr("readonly",true);
               $("#NPORCENT").removeClass("campodisabled");
               $("#NPORCENT").addClass("campotexto_op");
               $("#NPORCENT").focus();
               $("#NIMPORTE").removeClass("campotexto_op");
               $("#NIMPORTE").addClass("campodisabled");
               $("#NIMPORTE").val(null);
            }
        }
        
        function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
           document.miForm.SNIP.value = SNIP;
           document.miForm.SPERSON.value = SPERSON;
           document.miForm.CAGENTE.value = CAGENTE;
           f_cerrar_modal("axisper021");
        }
        
        function f_nova_persona(){
            objUtiles.cerrarModal("axisper021");
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
        }
        
        function f_cerrar_axisper022(){
            f_cerrar_modal("axisper022");
        }
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin058" c="TITULO" lit="9905759" /></c:param>
                <c:param name="nid" value="axissin058" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf102|<axis:alt f="axissin058" c="MODAL_AXISPRF102" lit="9904887" /></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisprf103|<axis:alt f="axissin058" c="MODAL_AXISPRF103" lit="9904892" /></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper021|<axis:alt f="axissin058" c="MODAL_AXISPER021" lit="1000235" /></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper022|<axis:alt f="axissin058" c="MODAL_AXISPER022" lit="1000235" /></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper010|<axis:alt f="axissin058" c="MODAL_AXISPER010" lit="110275" /></c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
        <input type="hidden" id="CSUBPRO" name="CSUBPRO" value="${__formdata.CSUBPRO}"/>
        <input type="hidden" id="CTIPPRO" name="CTIPPRO" value="${__formdata.CTIPPRO}"/>
        <input type="hidden" id="NLOCALI" name="NLOCALI" value="${__formdata.NLOCALI}"/>
        <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
        <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axissin058" lit="9905759" /></c:param>
           <c:param name="producto"><axis:alt c="formulario" f="axissin058" lit="9905759" /></c:param>
           <c:param name="form">axissin058</c:param>
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
                <axis:ocultar f="axissin058" c="NNUMIDE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axissin058" c="NNUMIDE" lit="9905773"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axissin058" c="TNOMBRE" dejarHueco="false"> 
                    <td class="titulocaja">
                        <b><axis:alt f="axissin058" c="TNOMBRE" lit="9902379"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axissin058" c="TEMAIL" dejarHueco="false"> 
                    <td class="titulocaja">
                        <b><axis:alt f="axissin058" c="TEMAIL" lit="9903325"/></b>
                    </td>
                </axis:ocultar>
            </tr> 
            <tr>
            <axis:ocultar f="axissin058" c="NNUMIDE" dejarHueco="false"> 
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NNUMIDE}" 
                           readonly="true"
                           name="NNUMIDE" id="NNUMIDE" style="width:30%;" <axis:atr f="axissin058" c="NNUMIDE" a="obligatorio=true"/> 
                           title="<axis:alt f="axissin058" c="NNUMIDE" lit="9905773"/>"/>
                           <img id="findPersona" border="0" src="images/find.gif" onclick="f_abrir_modal('axisper021',null,'&MODO_SWPUBLI=PERSONAS_PUBPRIV');" style="cursor:pointer"/>
                </td>
            </axis:ocultar>
            <axis:ocultar f="axissin058" c="TNOMBRE" dejarHueco="false"> 
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.TNOMBRE}" 
                           readonly="true"
                           name="TNOMBRE" id="TNOMBRE" <axis:atr f="axissin058" c="TNOMBRE" a="obligatorio=true"/> 
                           title="<axis:alt f="axissin058" c="TNOMBRE" lit="9902379"/>"/>
                </td>
            </axis:ocultar>
            <axis:ocultar f="axissin058" c="TEMAIL" dejarHueco="false"> 
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.TEMAIL}" 
                           style="width:50%"
                           name="TEMAIL" id="TEMAIL" <axis:atr f="axissin058" c="TEMAIL" a="obligatorio=true"/> 
                           title="<axis:alt f="axissin058" c="TEMAIL" lit="9903325"/>"/>
                </td>
            </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axissin058" c="STARIFA" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axissin058" c="STARIFA" lit="9904895"/></b>
                    </td> 
                </axis:ocultar>
                <axis:ocultar f="axissin058" c="TERMINO" dejarHueco="false"> 
                    <td class="titulocaja">
                        <b><axis:alt f="axissin058" c="TERMINO" lit="9001991"/></b>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axissin058" c="STARIFA" dejarHueco="false"> 
                    <!-- Tarifa-->
                    <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.STARIFA}" 
                               name="STARIFA" id="STARIFA" style="width:18%;" onchange="f_but_buscar()"
                               <axis:atr f="axissin058" c="STARIFA" a="formato=entero&obligatorio=true"/> 
                               title="<axis:alt f="axissin058" c="STARIFA" lit="9904895"/>"/>&nbsp;
                            <img id="findTarifa" border="0" src="images/find.gif" onclick="f_abrir_modal('axisprf102',null,'&MODO=altaConvenio');" style="cursor:pointer"/>
                            &nbsp;<span id="TTARIFA"><b>${__formdata.TTARIFA}</b></span>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axissin058" c="TERMINO" dejarHueco="false"> 
                    <td class="campocaja">
                        <select name="TERMINO" id="TERMINO" size="1" class="campowidthselect campo campotexto"
                                title="<axis:alt f="axissin058" c="TERMINO" lit="9001991"/>">
                                <option value="<%= Integer.MIN_VALUE %>">
                                    <axis:alt f="axissin058" c="SELECCIONAR" lit="108341"/>                                
                                </option>
                                <c:forEach var="lsttermino" items="${__formdata.LSTTERMINO}">
                                <option value="${lsttermino.CODIGO}" <c:if test="${__formdata.TERMINO == lsttermino.CODIGO}">selected</c:if>>
                                    ${lsttermino.CODIGO}
                                </option>
                                </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axissin058" c="CVALOR" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axissin058" c="CVALOR" lit="101159"/></b>
                    </td>
                </axis:ocultar>
                 <axis:ocultar f="axissin058" c="CTIPO" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axissin058" c="CTIPO" lit="100565"/></b>
                    </td> 
                </axis:ocultar>
            </tr>        
            <tr>
                <axis:ocultar f="axissin058" c="CVALOR" dejarHueco="false"> 
                <td class="campocaja">
                    <select name="CVALOR" id="CVALOR" size="1" class="campowidthselect campo campotexto_op"
                            <axis:atr f="axissin058" c="CVALOR" a="obligatorio=false"/> 
                            title="<axis:alt f="axissin058" c="CVALOR" lit="101159"/>">
                        <option value="<%= Integer.MIN_VALUE %>">
                          <axis:alt f="axissin058" c="SELECCIONAR" lit="108341"/>                                
                        </option>
                        <c:forEach var="valores" items="${__formdata.VALORES}">
                            <option value="${valores.CATRIBU}" <c:if test="${__formdata.CVALOR == valores.CATRIBU}">selected</c:if>>
                                ${valores.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                </axis:ocultar>
                <axis:ocultar f="axissin058" c="CTIPO" dejarHueco="false"> 
                <td class="campocaja">
                    <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo campotexto_op"
                            <axis:atr f="axissin058" c="CTIPO" a="obligatorio=false"/> 
                            title="<axis:alt f="axissin058" c="CTIPO" lit="9901195"/>" onchange="mostrarEntradas()">
                        <option value="<%= Integer.MIN_VALUE %>">
                          <axis:alt f="axissin058" c="SELECCIONAR" lit="108341"/>                                
                        </option>
                        <c:forEach var="tipo" items="${__formdata.TIPO}">
                            <option value="${tipo.CATRIBU}" <c:if test="${__formdata.CTIPO == tipo.CATRIBU}">selected</c:if>>
                                ${tipo.TATRIBU}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                </axis:ocultar>
            </tr>        
             <tr>
                    <axis:ocultar f="axissin058" c="NIMPORTE" dejarHueco="false"> 
                        <td class="titulocaja" id="tit_NIMPORTE">
                           <b><axis:alt f="axissin058" c="NIMPORTE" lit="100563"/></b>
                        </td>
                    </axis:ocultar>
                     <axis:ocultar f="axissin058" c="NPORCENT" dejarHueco="false"> 
                        <td class="titulocaja" id="tit_NPORCENT">
                           <b><axis:alt f="axissin058" c="NPORCENT" lit="9903530"/></b>
                        </td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:ocultar f="axissin058" c="NIMPORTE" dejarHueco="false">
                        <td>
                            <input type="text" class="campo campotexto" value="${__formdata.NIMPORTE}"  name="NIMPORTE" id="NIMPORTE" size="15"
                                   style="width:25%;" readonly="true"/>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axissin058" c="NPORCENT" dejarHueco="false">
                        <td>
                            <input type="text" class="campo campotexto" value="${__formdata.NPORCENT}"  name="NPORCENT" id="NPORCENT" size="15"
                                   style="width:25%;" readonly="true"/>
                        </td>
                    </axis:ocultar>              
                </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin058</c:param><c:param name="f">axissin058</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
