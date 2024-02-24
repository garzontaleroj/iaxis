<%/*
*  Fichero: Axiscomi003.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            var modo = "${__formdata.CMODO}";
            parent.f_cerrar_axiscomi003(modo);
       }
       
       
       function f_onload(){
        
            var ok = "${__formdata.OK}";
            var modo = "${__formdata.CMODO}";
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
               f_but_cancelar();
            }
            
            if(modo == 'NUEVO'){
               objDom.setDisabledPorId("CESTADO",true);
            }
            
            if(modo == 'NVIGEN'){
                objDom.setDisabledPorId("CESTADO",true);
                objDom.setDisabledPorId("CTIPO",true);
            }
             f_cargar_propiedades_pantalla();
            if(document.getElementById('CCOMISI').disabled==true){
                document.getElementById('TTITULO_0').focus();
            }else{
            
             if ( !objUtiles.estaVacio(document.getElementById('CCOMISI').value))
               document.getElementById('TTITULO_0').focus();
              else
                document.getElementById('CCOMISI').focus();
                
            }
            f_tab2_input();
            
           
       }
       
        function f_tab2_input(){
            var codi = document.getElementById("CCOMISI");
            if(codi.addEventListener) {
               codi.addEventListener('keydown',this.keyHandler,false);
            }            
       }
       
        function keyHandler(e) {
            //TAB key on keyboard is identified by 9
            var TABKEY = 9;
            if(e.keyCode == TABKEY) {
                //this.value += "    ";
                if(e.preventDefault) {
                    e.preventDefault();
                    document.getElementById('TTITULO_0').focus();
                }
                return false;
            }
        }       
       
       
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
            
            
            
                f_habilitar_campos();
               objUtiles.ejecutarFormulario ("modal_axiscomi003.do", "aceptar", document.axiscomi003Form, "_self", objJsMessages.jslit_cargando);
            }
       }
       
       function f_guardar_fila(num_fila){
            //var cadena=parametro.split("#");
            //alert("En continuar");
            //alert(num_fila);
            var idioma = encodeURIComponent(eval('document.axiscomi003Form.CIDIOMA_'+num_fila+'.value'));
            var titulo = encodeURIComponent(eval('document.axiscomi003Form.TTITULO_'+num_fila+'.value'));
            
           objAjax.invokeAsyncCGI("modal_axiscomi003.do?CIDIOMA="+idioma+"&TCOMISI="+titulo+"&CCOMISI="+document.axiscomi003Form.CCOMISI.value, callbackAjaxGuardar, "operation=ajax_guardar_lista", this, objJsMessages.jslit_cargando);
       }
       
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
        }
    
       function callbackAjaxGuardar(ajaxResponseText) {
                //alert("volver");
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
       }    
       
       function f_act_ccomisi(){
             if (objNumero.validaNumero(document.axiscomi003Form.CCOMISI.value, true)) {
             f_habilitar_campos();
                objUtiles.ejecutarFormulario ("modal_axiscomi003.do", "actccomisi", document.axiscomi003Form, "_self", objJsMessages.jslit_cargando);
            }else{
                document.axiscomi003Form.CCOMISI.focus();
                alert(objJsMessages.jslit_formato_numero_incorrecto_validador);
                
            }
       }
       
       
       function f_recargar(thiss){
       	
       	  if (thiss.value == 2){
          	  f_habilitar_campos();
              objUtiles.ejecutarFormulario ("modal_axiscomi003.do", "form", document.axiscomi003Form, "_self", objJsMessages.jslit_cargando);
          }else{
          	if (thiss.value != 2){
          		var ctipo = "${__formdata.CTIPO}";
          		
          		 if ( !objUtiles.estaVacio(ctipo) && ctipo == 2) {
          			f_habilitar_campos();
          			objUtiles.ejecutarFormulario ("modal_axiscomi003.do", "form", document.axiscomi003Form, "_self", objJsMessages.jslit_cargando);
          		}
          	
          	}
          }
           
       }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axiscomi003Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">
            <input type="hidden" name="ESTADO" value="${__formdata.CESTADO}">
            <input type="hidden" name="TIPO" value="${__formdata.CTIPO}">
            <input type="hidden" name="CIDIOMA_USU" id="CIDIOMA_USU" value="${__formdata.CIDIOMA_USU}">
            

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi003" c="FORM" lit="9901322" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi003" c="FORM" lit="9901322" /></c:param>
                <c:param name="form">axiscomi003</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axiscomi003" c="CCOMISI" lit="1000109" /></b>
                                        </td>
                                    </tr>    
                                    <tr>    
                                        <td class="campocaja"  >
                                            <input type="text" name="CCOMISI" id="CCOMISI"  value="${__formdata.CCOMISI}" title="<axis:alt f="axiscomi003" c="CCOMISI" lit="1000109" />" 
                                                   style="width:50%;"  class="campowidthinput campo campotexto" onchange="javascript:f_act_ccomisi()"
                                                   <c:if test="${__formdata.CMODO == 'NUEVO'}"> <axis:atr f="axiscomi003" c="CCOMISI" a="modificable=true&obligatorio=true&formato=decimal"/></c:if> 
                                                   <c:if test="${__formdata.CMODO != 'NUEVO'}"> <axis:atr f="axiscomi003" c="CCOMISI" a="modificable=false&obligatorio=true&formato=decimal"/></c:if>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"> 
                                            <c:set var="title1"><axis:alt f="axiscomi003" c="CIDIOMA" lit="100654"/></c:set>
                                            <c:set var="title2"><axis:alt f="axiscomi003" c="TTITULO" lit="9901320"/></c:set>
                                            <div class="seccion displayspacePersonas">
                                                <c:set var="miI" value="0" />
                                                
                                                  <display:table name="${descripciones}" id="DESCRIPCION"  export="false" class="dsptgtable" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                   requestURI="modal_axispro003.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                   
                                                    <display:column title="${title1}" sortable="false" sortProperty="DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TIDIOMA" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:20%;"  >
                                                        <div class="dspText">${DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TIDIOMA}</div>
                                                        <input type="hidden" name="CIDIOMA_${miI}" id="CIDIOMA_${miI}" value="${DESCRIPCION.OB_IAX_DESCCUADROCOMISION.CIDIOMA}"/>
                                                        <input type="hidden" name="TIDIOMA_${miI}" id="TIDIOMA_${miI}" value="${DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TIDIOMA}"/>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="false" sortProperty="DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TTITULO" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:80%;"  >
                                                        <div class="dspText">
                                                        <%-- INI IAXIS-4219. NOTA https://segurosconfianza.atlassian.net/browse/IAXIS-4219?focusedCommentId=30636 -JLTS -28/01/2021. Se adiciona la condición
                                                        que permita moodifocar el campo TCOMISI a pesar que el estado se CESTADO = 2  --%>
                                                        <input type="text" class="campowidthinput campo campotexto" style="width:80%" id="TTITULO_${miI}" name="TITULO_${miI}" size="30"
                                                         title="${title2} - ${DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TIDIOMA}"
                                                        value="${DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TCOMISI}"  <c:if test="${__formdata.CMODO != 'NVIGEN' && (__formdata.CESTADO == 1 || __formdata.CESTADO == 2)}">  onblur="f_guardar_fila(${miI})" </c:if>
                                                        <c:if test="${__formdata.CMODO == 'NVIGEN'}"> <axis:atr f="axiscomi003" c="TTITULO_${miI}" a="modificable=false"/></c:if> 
                                                        <c:if test="${__formdata.CMODO != 'NVIGEN' && (__formdata.CESTADO == 1 || __formdata.CESTADO == 2)}"> <axis:atr f="axiscomi003" c="TTITULO_${miI}" a="modificable=true"/></c:if>
                                                        <c:if test="${__formdata.CMODO != 'NVIGEN' && __formdata.CESTADO != 1 && __formdata.CESTADO != 2}"> <axis:atr f="axiscomi003" c="TTITULO_${miI}" a="modificable=false"/></c:if>
                                                        <c:if test="${__formdata.CIDIOMA_USU eq DESCRIPCION.OB_IAX_DESCCUADROCOMISION.CIDIOMA}"> <axis:atr f="axiscomi003" c="TTITULO_${miI}" a="obligatorio=true"/></c:if>/>
                                                        <%-- FIN IAXIS-4219. NOTA https://segurosconfianza.atlassian.net/browse/IAXIS-4219?focusedCommentId=30633 -JLTS -28/01/2021  --%>
                                                        </div>
                                                    </display:column>
                                                    <c:set var="miI" value="${miI+1}" />
                                                  </display:table>
                                            </div>	
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Tipo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axiscomi003" c="CTIPO" lit="100565" /></b>
                                        </td>
                                        <!-- Estado -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi003" c="CESTADO" lit="100587" /></b>
                                        </td>
                                        <!-- Fecha Inicio -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axiscomi003" c="FINIVIG" lit="9000526" /></b>
                                        </td>
                                        <!-- Fecha fin -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi003" c="FFINVIG" lit="9000527" /></b>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td class="campocaja" > 
                                            <select name = "CTIPO" id="CTIPO"  title="<axis:alt f="axiscomi003" c="CTIPO" lit="100565" />"
                                                    value="" size="1" onchange="f_recargar(this)" class="campowidthselect campo campotexto"
                                                    <c:if test="${__formdata.CESTADO != 1}"> <axis:atr f="axiscomi003" c="CTIPO" a="modificable=false&obligatorio=false&isInputText=false"/></c:if>
                                                    <c:if test="${__formdata.CESTADO == 1}"> <axis:atr f="axiscomi003" c="CTIPO" a="modificable=true&obligatorio=true&isInputText=false"/></c:if>>
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axiscomi003" c="MINVALUE" lit="108341"/> - </option>
                                                <c:forEach var="tipos" items="${__formdata.TIPO}">
                                                    <option value = "${tipos.CATRIBU}"
                                                    <c:if test="${ (!empty __formdata.CTIPO)&& tipos.CATRIBU == __formdata.CTIPO}"> selected </c:if>>
                                                     ${tipos.TATRIBU}
                                                     </option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja"  >
                                            <select name = "CESTADO" id="CESTADO"  title="<axis:alt f="axiscomi003" c="CESTADO" lit="100587" />" 
                                                    value="${__formdata.CESTADO}" size="1" onchange="" class="campowidthselect campo campotexto"
                                                    <c:if test="${__formdata.CESTADO != 1}"> <axis:atr f="axiscomi003" c="CESTADO" a="modificable=false&obligatorio=false&isInputText=false"/></c:if>>
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axiscomi003" c="MINVALUE" lit="108341"/> - </option>
                                                <c:forEach var="estados" items="${__formdata.ESTADO}">
                                                    <option value = "${estados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CESTADO)&& estados.CATRIBU == __formdata.CESTADO}"> selected </c:if>>
                                                     ${estados.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" title="<axis:alt f="axiscomi003" c="FINIVIG" lit="9000526" />" 
                                            name="FINIVIG" id="FINIVIG" style="width:60%;"  value="<fmt:formatDate value="${__formdata.FINIVIG}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"
                                            <c:if test="${__formdata.CMODO == 'MODIF'}"> <axis:atr f="axiscomi003" c="FINIVIG" a="modificable=false&obligatorio=true"/></c:if> 
                                            <c:if test="${__formdata.CMODO != 'MODIF'}"> <axis:atr f="axiscomi003" c="FINIVIG" a="modificable=true&obligatorio=true"/></c:if>/>
                                             <c:if test="${__formdata.CMODO != 'MODIF'}">
                                            <a id="icon_FINIVIG" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axiscomi003" c="MINVALUE" lit="108341"/>" title="<axis:alt f="axiscomi003" c="FINIVIG1" lit="100883" />" src="images/calendar.gif"/></a>
                                            </c:if>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FFINVIG" id="FFINVIG" style="width:60%;"  
                                             title="<axis:alt f="axiscomi003" c="FFINVIG" lit="9000527" />"
                                            value="<fmt:formatDate value="${__formdata.FFINVIG}" pattern="dd/MM/yyyy" />" 
                                            class="campowidthinput campo campotexto" 
                                            <c:if test="${__formdata.CTIPO != 2}"><axis:atr f="axiscomi003" c="FFINVIG" a="modificable=false"/> </c:if>>
                                            	
                                            	<c:if test="${__formdata.CMODO != 'MODIF' && __formdata.CTIPO == 2}">
                                            			 <a id="icon_FFINVIG" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axiscomi003" c="MINVALUE" lit="108341"/>" title="<axis:alt f="axiscomi003" c="FFINVIG" lit="9000527" />" src="images/calendar.gif"/></a>
                                            	</c:if>
                                            
                                        </td>
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi003</c:param><c:param name="f">axiscomi003</c:param>
                <%-- INI IAXIS-4219. NOTA https://segurosconfianza.atlassian.net/browse/IAXIS-4219?focusedCommentId=30636 -JLTS -28/01/2021. Se adiciona la condición
                     que permita moodifocar el campo TCOMISI a pesar que el estado se CESTADO = 2  --%>
                <c:param name="__botones">cancelar<c:if test="${(__formdata.CESTADO == 1 || __formdata.CESTADO == 2) || __formdata.CMODO == 'NVIGEN'}">,aceptar</c:if></c:param>
                <%-- INI IAXIS-4219. NOTA https://segurosconfianza.atlassian.net/browse/IAXIS-4219?focusedCommentId=30633 -JLTS -28/01/2021. --%>
            </c:import>
               <c:if test="${__formdata.CMODO != 'MODIF'}">
            <script type="text/javascript">
                Calendar.setup({
                inputField     :    "FINIVIG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FINIVIG", 
                singleClick    :    true,
                firstDay       :    1
                });
               </script>
                <c:if test="${__formdata.CTIPO == 2}">
                <script type="text/javascript">
                  Calendar.setup({
                inputField     :    "FFINVIG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFINVIG", 
                singleClick    :    true,
                firstDay       :    1
                });
            </script>
            
            </c:if>
            </c:if>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

