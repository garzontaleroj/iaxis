<%/*
*  Fichero: axisdesc013.jsp
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
            parent.f_cerrar_modal('axisdesc013');
       }
       
       
       function f_onload(){
        
            var ok = "${__formdata.OK}";
            var modo = "${__formdata.CMODO}";
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
               f_but_cancelar();
            }
            
             f_cargar_propiedades_pantalla();
            
            if(document.getElementById('CCAMPANYA').disabled==true){
                document.getElementById('TTITULO_0').focus();
            }else{
            
             if ( !objUtiles.estaVacio(document.getElementById('CCAMPANYA').value))
               document.getElementById('TTITULO_0').focus();
              else
                document.getElementById('CCAMPANYA').focus();
                
            }
            f_tab2_input();
            
       }
       
        function f_tab2_input(){
            var codi = document.getElementById("CCAMPANYA");
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
            /*if (objValidador.validaEntrada()) {
                f_habilitar_campos();
               objUtiles.ejecutarFormulario ("modal_axisdesc013.do", "aceptar", document.axisdesc013Form, "_self", objJsMessages.jslit_cargando);
            }*/
            if (objValidador.validaEntrada()) 
                parent.f_aceptar_axisdesc013(document.axisdesc013Form.CCAMPANYA.value);
       }
       
       function f_guardar_fila(num_fila){
            //var cadena=parametro.split("#");
            //alert("En continuar");
            //alert(num_fila);
            var idioma = eval('document.axisdesc013Form.CIDIOMA_'+num_fila+'.value');
            var titulo = eval('document.axisdesc013Form.TTITULO_'+num_fila+'.value');
           
           if(!objUtiles.estaVacio(titulo))
            objAjax.invokeAsyncCGI("modal_axisdesc013.do?CIDIOMA="+idioma+"&TCAMPANYA="+titulo+"&CCAMPANYA="+document.axisdesc013Form.CCAMPANYA.value, callbackAjaxGuardar, "operation=ajax_guardar_lista", this, objJsMessages.jslit_cargando);
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
       
       function f_act_campanya(){
             if (objNumero. validaNumero(document.axisdesc013Form.CCAMPANYA.value, true)) {
             f_habilitar_campos();
                objUtiles.ejecutarFormulario ("modal_axisdesc013.do", "actccampanya", document.axisdesc013Form, "_self", objJsMessages.jslit_cargando);
            }else{
                document.axisdesc013Form.CCAMPANYA.focus();
                alert(objJsMessages.jslit_formato_numero_incorrecto_validador);
                
            }
       }
       
       
       function f_recargar(thiss){
       	
       	  if (thiss.value == 2){
          	  f_habilitar_campos();
              objUtiles.ejecutarFormulario ("modal_axisdesc013.do", "form", document.axisdesc013Form, "_self", objJsMessages.jslit_cargando);
          }else{
          	if (thiss.value != 2){
          		var ctipo = "${__formdata.CTIPO}";
          		
          		 if ( !objUtiles.estaVacio(ctipo) && ctipo == 2) {
          			f_habilitar_campos();
          			objUtiles.ejecutarFormulario ("modal_axisdesc013.do", "form", document.axisdesc013Form, "_self", objJsMessages.jslit_cargando);
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
        <form name="axisdesc013Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">
            <input type="hidden" name="ESTADO" value="${__formdata.CESTADO}">
            <input type="hidden" name="TIPO" value="${__formdata.CTIPO}">
            <input type="hidden" name="CIDIOMA_USU" id="CIDIOMA_USU" value="${__formdata.CIDIOMA_USU}">
            

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc013" c="FORM" lit="9905560" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc013" c="FORM" lit="9905560" /></c:param>
                <c:param name="form">axisdesc013</c:param>
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
                                            <b><axis:alt f="axisdesc013" c="CCAMPANYA" lit="1000109" /></b>
                                        </td>
                                    </tr>    
                                    <tr>    
                                        <td class="campocaja"  >
                                            <input type="text" name="CCAMPANYA" id="CCAMPANYA"  value="${__formdata.CCAMPANYA}" title="<axis:alt f="axisdesc013" c="CCAMPANYA" lit="1000109" /> " 
                                                   style="width:50%;"  maxlength="4" class="campowidthinput campo campotexto" onchange="javascript:f_act_campanya()"
                                                   <c:if test="${__formdata.CMODO == 'NUEVO'}"> <axis:atr f="axisdesc013" c="CCAMPANYA" a="modificable=true&obligatorio=true&formato=decimal"/></c:if> 
                                                   <c:if test="${__formdata.CMODO != 'NUEVO'}"> <axis:atr f="axisdesc013" c="CCAMPANYA" a="modificable=false&obligatorio=true&formato=decimal"/></c:if>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"> 
                                            <c:set var="title1"><axis:alt f="axisdesc013" c="CIDIOMA" lit="100654"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisdesc013" c="TTITULO" lit="9901320"/></c:set>
                                            <div class="seccion displayspacePersonas">
                                                <c:set var="miI" value="0" />
                                                
                                                  <display:table name="${__formdata.CAMPANYA}" id="DESCRIPCION"  export="false" class="dsptgtable" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                   requestURI="modal_axispro003.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                   
                                                    <display:column title="${title1}" sortable="false" sortProperty="DESCRIPCION.OB_IAX_DESCCUADROCOMISION.TIDIOMA" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:20%;"  >
                                                        <div class="dspText">${DESCRIPCION.OB_IAX_CAMPANYAS.TIDIOMA}</div>
                                                        <input type="hidden" name="CIDIOMA_${miI}" id="CIDIOMA_${miI}" value="${DESCRIPCION.OB_IAX_CAMPANYAS.CIDIOMA}"/>
                                                        <input type="hidden" name="TIDIOMA_${miI}" id="TIDIOMA_${miI}" value="${DESCRIPCION.OB_IAX_CAMPANYAS.TIDIOMA}"/>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="false" sortProperty="DESCRIPCION.OB_IAX_CAMPANYAS.TCAMPANYA" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:80%;"  >
                                                        <div class="dspText">
                                                      
                                                        <input type="text" class="campowidthinput campo campotexto" style="width:80%" id="TTITULO_${miI}" name="TTITULO_${miI}" size="30" maxlength="100"
                                                         title="${title2} - ${DESCRIPCION.OB_IAX_CAMPANYAS.TIDIOMA}"
                                                        value="${DESCRIPCION.OB_IAX_CAMPANYAS.TCAMPANYA}"  onchange="f_guardar_fila(${miI})" 
                                                         <axis:atr f="axisdesc013" c="TTITULO_${miI}" a="modificable=true"/> 
                                                         <c:if test="${__formdata.CIDIOMA_USU == DESCRIPCION.OB_IAX_CAMPANYAS.CIDIOMA}">
                                                            <axis:atr f="axisdesc013" c="TTITULO_${miI}" a="modificable=true&obligatorio=true"/> 
                                                         </c:if> />
                                                      
                                                        </div>
                                                    </display:column>
                                                    <c:set var="miI" value="${miI+1}" />
                                                  </display:table>
                                            </div>	
                                        </td>
                                    </tr>
                                    
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc013</c:param><c:param name="f">axisdesc013</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
               
           
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

