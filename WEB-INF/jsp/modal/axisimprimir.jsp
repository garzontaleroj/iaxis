<%
/**
*  Fichero: axisimprimir.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  Fecha: 07/01/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
  <head>
  
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
    
        var nuevaVentana      = null;
        var idVentanas        = new Array();
        var contadorVentanas  = 0;
    
        function f_onload() {
            f_ctl_Mensaje();
            f_imprimir();
        }

        function f_imprimir_doc_nt(doc) { 
            location.href="modal_axisimprimir.do?operation=tunnel_doc&document=" + doc;
        }


        function f_imprimir() {
            <c:if test="${! empty sessionScope.axisimprimir_f}">
            document.miForm.operation.value = "tunnel"
            document.miForm.target = "_new";
            document.miForm.submit();
            </c:if>
        }  
        
        function f_imprimir_doc(doc) {            
            nuevaVentana = window.open("modal_axisimprimir.do?operation=tunnel_doc&document=" + doc);    
            // Abrir un proceso con setInterval para cerrar la ventana recién abierta
            if (document.all) {
                idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                contadorVentanas++;
            }            
        }  
        
      function  f_enviar_correo(){
        var EMAILENVIODOC = objDom.getValorPorId("EMAILENVIODOC");
        if (objUtiles.estaVacio(EMAILENVIODOC)){
            return;
        }
        if (objValidador.validaEntrada()) {
             objUtiles.ejecutarFormulario ("modal_axisimprimir.do", "enviarcorreo", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
      }
        
        
         function f_imp_diferida(doc,desc,fich,tipo,id){
                        
            var DIFERIDO_check= eval("document.miForm.CDIFERIDO_"+id+".checked");
            var CATEGORIA= eval("document.miForm.CCATEGORIA_"+id+".value");
            
            if (DIFERIDO_check) 
                var DIFERIDO = 1;            
            else
                var DIFERIDO = 0;
                        
            
            //objAjax.invokeAsyncCGI("modal_axisage006.do", callbackAjaxCambiarAgente2, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            objAjax.invokeAsyncCGI("modal_axisimprimir.do", callbackAjaxImpDiferida, "operation=ajax_imp_diferida&DOC=" + doc + "&DESC="+desc+"&FICH="+fich+"&TIPO="+tipo+"&DIFERIDO="+DIFERIDO+"&CATEGORIA="+CATEGORIA, this, objJsMessages.jslit_actualizando_registro);
         
        }
        
        function callbackAjaxImpDiferida(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);

            /*if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
            }*/
        }

        function f_cerrar_nuevaVentana() {
            try {
                if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                    nuevaVentana.window.close();
                }
            } catch (e) {}
        }        

        function f_but_salir(){
            // Para IE, limpiar las funciones setInterval
            if (document.all) {
                for (var i=0; i < idVentanas.length; i++)
                    clearInterval(idVentanas[i]);
            }
            parent.f_cerrar_axisimprimir();
        }
        function f_ctl_Mensaje(){
            //f_cargar_propiedades_pantalla();
            if (document.getElementById("MENSAJE").value=="MENSAJE_EN_PARENT"){
                if (document.getElementById("TMENSAJE01")!=null){
                    document.getElementById("TMENSAJE01").innerHTML = parent.getMensajeParaAxisimprimir(); 
                }
                if (document.getElementById("TMENSAJE02")!=null){
                    document.getElementById("TMENSAJE02").innerHTML = parent.getMensajeParaAxisimprimir(); 
                }
            }else {
                if (document.getElementById("TMENSAJE01")!=null){
                    document.getElementById("TMENSAJE01").innerHTML = document.getElementById("MENSAJE").value; 
                }
                if (document.getElementById("TMENSAJE02")!=null){
                    document.getElementById("TMENSAJE02").innerHTML = document.getElementById("MENSAJE").value; 
                }
            }
            
        }
        
        
        /* ********************************* AXISCTR186 ******************************** */
        
        function f_abrir_firma_digital(FICHERO,IDDOC,TCONFIRMA,CCODPLAN){
            //alert(FICHERO);
            f_abrir_modal('axisctr186');
            objUtiles.abrirModal("axisctr186","src","modal_axisctr186.do?operation=init&IDDOC="+IDDOC+"&TCONFIRMA="+TCONFIRMA+"&FICHERO="+FICHERO+"&CCODPLAN="+CCODPLAN);
        }
      
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
          
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form");        
        }            
      
        function f_cerrar_axisctr186() {
            
            objUtiles.cerrarModal('axisctr186');
        }
   
   
   
    </script>
  </head>
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="modal_axisimprimir.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="document" name="document" value=""/>
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${SEGURO}"/>
            <input type="hidden" id="MODO" name="MODO" value="GENERAL"/>
            <input type="hidden" id="EVENTO" name="EVENTO" value="ENVIODOCGEN"/>
            <input type="hidden" id="CIDIOMA" name="CIDIOMA" value="${CIDIOMA}"/>
            <input type="hidden" id="CTIPO" name="CTIPO" value="${CTIPO}"/>
            <input type="hidden" id="TIPO" name="TIPO" value="${TIPO}"/>
            <textarea style="display:none" name="MENSAJE" id="MENSAJE">${MENSAJE}</textarea>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisimprimir" c="FORMULARIO" lit="1000205" /></c:param>
                <c:param name="producto"> </c:param>
                <c:param name="form">axisimprimir</c:param>
            </c:import>
            <!-- Area de campos  -->
            
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr186|<axis:alt f="axisimprimir" c="MODAL186" lit="9903656" /></c:param>
            </c:import>
  
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                        <!--campos-->
                     
                        <table class="seccion">
                            <th style="width:32%;height:0px"></th>                                
                            <th style="width:68%;height:0px"></th>
                             <c:if test="${empty sessionScope.lista_impresion}">
                                <tr>
                                <td class="campocaja"> 
                                    <b><axis:alt f="axisimprimir" c="LISTA" lit="112267" />&nbsp;  <a href="javascript:f_imprimir()">${sessionScope.axisimprimir_f.name}</a></b>
                                </td>
                                <td style="valign:middle">
                                    <c:if test="${!empty sessionScope.axisimprimir_f.name}">
                                    <c:choose>
                                    <c:when test="${!empty sessionScope.axisimprimir_ico}">                                        
                                        <img src="images/filetypes/${sessionScope.axisimprimir_ico}.jpg" height="21px" width="21px">                                        
                                    </c:when>
                                    <c:otherwise><img src="images/filetypes/(DEFAULT).jpg" height="21px" width="21px"></c:otherwise>
                                    </c:choose>
                                    </c:if>
                                </td>
                                </tr>
                    
                                <tr>
                                    <td class="campocaja" colspan="2">
                                    <b id="TMENSAJE01">${MENSAJE}</b>
                                    </td>
                                </tr>
                             </c:if>
                        </table>
                    </td>
                </tr>
                
                <!-- SECCION LISTA FICHEROS -->

                <c:if test="${! empty sessionScope.lista_impresion}">
                <tr>
                    <td class="campocaja" >  
                    <b id="TMENSAJE02">${MENSAJE}</b>
                    </td>
                </tr>
                <tr>
        
                   <td> 
                        <!-- DisplayTag Ficheros -->
                        <c:set var="title1"><axis:alt f="axisimprimir" c="DESCRIPCION" lit="105330" /></c:set>
                        <c:set var="title2"><axis:alt f="axisimprimir" c="FICHERO" lit="1000110" /></c:set>
                        <c:set var="title3"><axis:alt f="axisimprimir" c="EXT" lit="100565" /></c:set> 
                        <c:set var="title4"><axis:alt f="axisimprimir" c="FIRMAR" lit="9903656" /></c:set>   
                        <c:set var="title5"><axis:alt f="axisimprimir" c="CCATEGORIA" lit="1000612" /></c:set>         
                        <c:set var="title6"><axis:alt f="axisimprimir" c="CDIFERIDO" lit="9901446" /></c:set> 
                        <% int contador = 0; %>
                        <div class="separador">&nbsp;</div>
                       
                        <div class="displayspace">
                          <display:table name="${sessionScope.lista_impresion}" id="lista_impresion" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="" >
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title2}" sortable="false" sortProperty="DESCRIPCION" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">
                                <a href="javascript:f_imprimir_doc('<%= contador %>')">${lista_impresion.OB_IAX_IMPRESION.DESCRIPCION}</a>
                                </div>
                            </display:column> 
                            <display:column title="${title1}" sortable="false" sortProperty="FICHERO" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">
                                <a href="javascript:f_imprimir_doc('<%= contador %>')">${lista_impresion.OB_IAX_IMPRESION.FICHERO}</a> 
                                <input type="hidden" id="FICHERO_<%= contador %>" name="FICHERO_<%= contador %>"  value="${lista_impresion.OB_IAX_IMPRESION.FICHERO}" />
                                 <input type="hidden" id="DIRECTORIO_<%= contador %>" name="DIRECTORIO_<%= contador %>"  value="${lista_impresion.OB_IAX_IMPRESION.INFO_CAMPOS[4].OB_IAX_INFO.VALOR_COLUMNA}" />                                                                                                    
                                </div>
                            </display:column>
                            <display:column title="${title3}" sortable="false" sortProperty="icono" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcons">
                                    <c:choose>
                                        <c:when test="${!empty lista_impresion.OB_IAX_IMPRESION.EXT}"><img src="images/filetypes/${lista_impresion.OB_IAX_IMPRESION.EXT}.jpg" height="15px" width="15px" onclick="f_imprimir_doc_nt(<%= contador %>)"></c:when>
                                        <c:otherwise><img src="images/filetypes/(DEFAULT).jpg" height="15px" width="15px" onclick="f_imprimir_doc_nt(<%= contador %>)"></c:otherwise>
                                    </c:choose>
                                </div>                                
                            </display:column>
                            <c:if test="${lista_impresion.OB_IAX_IMPRESION.CFIRMA == '1'}"> 
                            <axis:visible f="axisimprimir" c="BT_FIRMAR">
                                <display:column title="${title4}" sortable="false" sortProperty="icono" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspIcons">
                                        <img src="images/firmar.gif" height="16px" width="16px" onclick="f_abrir_firma_digital('${lista_impresion.OB_IAX_IMPRESION.FICHERO_AUX}','${lista_impresion.OB_IAX_IMPRESION.IDDOC}','${lista_impresion.OB_IAX_IMPRESION.TCONFFIRMA}','${lista_impresion.OB_IAX_IMPRESION.CCODPLAN}')" title="<axis:alt f='axisimprimir' c='FIRMAR' lit='9903656' />" alt="<axis:alt f='axisimprimir' c='FIRMAR' lit='9903656' />" />
                                        <!--input type="button" onclick="f_abrir_firma_digital('${lista_impresion.OB_IAX_IMPRESION.FICHERO_AUX}','${lista_impresion.OB_IAX_IMPRESION.INFO_CAMPOS[0].OB_IAX_INFO.IDDOC}','${lista_impresion.OB_IAX_IMPRESION.INFO_CAMPOS[0].OB_IAX_INFO.TCONFIRMA}')" class="boton" style="margin-right:20px;" value="<axis:alt f='axisimprimir' c='FIRMAR' lit='9903656' />"/-->
                                    </div>                                
                                </display:column>
                            </axis:visible>
                            </c:if>
                            <axis:visible f="axisimprimir" c="CCATEGORIA">
                                <display:column title="${title5}" sortable="false" sortProperty="CCATEGORIA" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">
                                        <select name="CCATEGORIA_<%= contador %>" id="CCATEGORIA_<%= contador %>" onchange="javascript:f_imp_diferida('${lista_impresion.OB_IAX_IMPRESION.IDDOC}','${lista_impresion.OB_IAX_IMPRESION.DESCRIPCION}','${lista_impresion.OB_IAX_IMPRESION.FICHERO}','${lista_impresion.OB_IAX_IMPRESION.CTIPO}','<%= contador %>');"  <axis:atr f="axisimprimir" c="CCATEGORIA" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisimprimir" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${lista_impresion.OB_IAX_IMPRESION.LSTCATEGORIAS}">
                                            <option value = "${element.CCATEGORIA}" />
                                                ${element.TDESCATEGORIA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    </div>
                                </display:column>
                            </axis:visible>                            
                            <axis:visible f="axisimprimir" c="CDIFERIDO">
                                <display:column title="${title6}" sortable="false" sortProperty="CDIFERIDO" headerClass="sortable" media="html" autolink="false" >
                                <input onclick="javascript:f_imp_diferida('${lista_impresion.OB_IAX_IMPRESION.IDDOC}','${lista_impresion.OB_IAX_IMPRESION.DESCRIPCION}','${lista_impresion.OB_IAX_IMPRESION.FICHERO}','${lista_impresion.OB_IAX_IMPRESION.CTIPO}','<%= contador %>')" <c:if test="${lista_impresion.OB_IAX_IMPRESION.CDIFERIDO==1}">checked</c:if> 
                                             type="checkbox" id="CDIFERIDO_<%= contador %>" name="CDIFERIDO_<%= contador %>" value="${lista_impresion.OB_IAX_IMPRESION.CDIFERIDO}"/>
                                </display:column>    
                            </axis:visible>
                        <% contador++; %>    
                        </display:table>
                        </div>
                        <div class="separador">&nbsp;</div>
                        
               </td>
            </tr>
            </c:if>
           
            </table> 
        <axis:ocultar f="axisimprimir" c="EMAILENVIODOC" dejarHueco="false"> 
        <table class="area" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="EMAILENVIODOC" f="axisimprimir" lit="9901500" /></div>
           <table class="seccion" width="90%">  
           <tr>
                <th style="width:15%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:15%;height:0px"></th>
                <th style="width:40%;height:0px"></th>                                                                
            </tr>
             <tr>
               
                  <td class="titulocaja" colspan="3" id="tit_EMAILENVIODOC">
                   <b id="label_EMAILENVIODOC"><axis:alt c="EMAILENVIODOC" f="axisimprimir" lit="9903325" /></b>                                   
                  </td>
                    
            </tr>
            <tr>
            
                <td class="campocaja" colspan="3" id="td_EMAILENVIODOC" >
                    <input type="text"
                    formato="correo"
                    class="campowidthinput campo campotexto"
                    size="60"
                    value="${EMAILENVIODOC}"
                    name="EMAILENVIODOC"
                    id="EMAILENVIODOC"
                    style="width:80%;"
                    alt="<axis:alt c="EMAILENVIODOC" f="axisimprimir" lit="9903325" />"
                    title="<axis:alt c="EMAILENVIODOC" f="axisimprimir" lit="9903325" />"
                    onchange="this.value=this.value.toUpperCase();"
                    />
                    <a href="javascript:f_enviar_correo();" >
                        <img border="0" 
                        alt="<axis:alt f='axisimprimir' c='EMAILENVIODOC' lit='9901500'/>" 
                        title="<axis:alt f='axisimprimir' c='EMAILENVIODOC' lit='9901500'/>" 
                        src="images/mail.gif" style="style="vertical-align:top;"/>
                    </a>
                </td>
            
            </tr>
            </table>
           
           </td>
           </tr>
           </table>
        </axis:ocultar >  
            
         </form>  
    <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisimprimir</c:param>
                <c:param name="__botones">salir</c:param>
            </c:import>     
    <c:import url="../include/mensajes.jsp" />

    </body>
</html>

