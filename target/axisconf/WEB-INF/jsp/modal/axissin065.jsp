<%/* Revision:# 8wWLOjrqL8K9Ct+r/vcK4g== # */%>

<%--
/**
*  Fichero: axissin065.jsp
*  
*  Titulo: Modal mantetenimniento proceso judicial
*
*  Fecha: 03/03/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin065" lit="9909411"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() { 
        	objDom.setVisibilidadPorId("TCONTRA","hidden");
        	objDom.setVisibilidadPorId("lit_TCONTRA","hidden");
        	
         if (${requestScope.grabarOK == true}) {
                    parent.f_aceptar_axissin065();
        }
    
        f_cargar_propiedades_pantalla(); 
        

        }
        
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
            
            var pasoValidacion = 0;
                 
                if(!objUtiles.estaVacio(objDom.getValorPorId("FFALLO"))){
                    if(!objUtiles.estaVacio(objDom.getValorPorId("TFALLO"))){
                        
                    }else{
                        alert("<axis:alt f='axissin065' c='LIT_FALLO' lit='9909558'/>");
                        pasoValidacion = 1;
                    }
                }
                
                if(objDom.getValorPorId("COTERRI")==11){
                    if(objUtiles.estaVacio(objDom.getValorPorId("TCONTRA"))){
                        alert("<axis:alt f='axissin065' c='LIT_OTRA_CONTRALORIA' lit='9909560'/>");
                        pasoValidacion = 1;                        
                    }
                }
                if (pasoValidacion==0){
                      objUtiles.ejecutarFormulario ("modal_axissin065.do", "guardar", document.Axissin0065Form, "_self", objJsMessages.jslit_cargando);
                }

            }
        }

        function f_but_cancelar(){
            parent.f_aceptar_axissin065();
         
        }
        function f_cerrar_modal(pantalla){
        
            objUtiles.cerrarModal(pantalla);
        }
        
        function f_orden_contraloria(VTCONTRA){
        	if(VTCONTRA==7){
        		objDom.setVisibilidadPorId("TCONTRA","visible");
        		objDom.setVisibilidadPorId("lit_TCONTRA","visible");
        	}else{
        		  objDom.setVisibilidadPorId("TCONTRA","hidden");
        		  objDom.setVisibilidadPorId("lit_TCONTRA","hidden");
        	}
        }

        function f_abrir_axisprf000(){
            objUtiles.abrirModal('axisprf000',"src","modal_axisprf000.do?operation=form&pantalla=destinatario");
        }
        
        function f_aceptar_modal(pantalla, param){
            objUtiles.cerrarModal(pantalla);
            if(pantalla=="axisprf000"){           
                var valores = param.split("&");
                var sprofes =valores[0].split("=");
                var nnumide =valores[2].split("=");
                var tnombre =valores[3].split("=");
                var parametros = sprofes+"&"+nnumide+"&"+tnombre;
                objDom.setValorPorId("SPROFES",sprofes[1]);
                objDom.setValorPorId("NNUMIDEPROFES",nnumide[1]);
                objDom.setValorPorId("NOMBREPROFES",tnombre[1]);
                
            }

        }
        function f_but_salir(){
            objUtiles.cerrarModal("axisprf000");
        
        }

 
        function f_aceptar_axissin069(){
            f_cerrar_modal("axissin069");
            objUtiles.ejecutarFormulario ("modal_axissin065.do", "form", document.Axissin0065Form, "_self", objJsMessages.jslit_cargando);
          
        } 
        function f_aceptar_axissin066(){
            f_cerrar_modal("axissin066");
            objUtiles.ejecutarFormulario ("modal_axissin065.do", "form", document.Axissin0065Form, "_self", objJsMessages.jslit_cargando);
          
        }
        function f_cargar_poblaciones(thiss){
			objAjax.invokeAsyncCGI("modal_axissin065.do", callbackAjaxCargarCombosPoblaciones, "operation=ajax_cargarPoblaciones&CPROVIN="+thiss, this, objJsMessages.jslit_cargando);  

        }
        
        
         function f_borrar_valpretension_axissin066(param){
            objAjax.invokeAsyncCGI("modal_axissin065.do", callbackAjaxBorrarvalpretensionFiscal, "operation=borrar&"+'NSINIES_RES='+'${__formdata.NSINIES}'+'&NTRAMIT_RES='+'${__formdata.NTRAMIT}'+'&TIPO_DEL=4&NORDEN_RES='+'${__formdata.NORDEN}'+param, this, objJsMessages.jslit_actualizando_registro);
        }
        
         function callbackAjaxBorrarvalpretensionFiscal(ajaxResponseText) {
         	try{
                 var doc = objAjax.domParse(ajaxResponseText);
                                 
                 if (!objAppMensajes.existenErroresEnAplicacion(doc)) { 
         	objDom.setValorPorId("ITOTPRET", objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTPRET"), 0, 0));
         	objDom.setValorPorId("ITOTASEG", objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTASEG"), 0, 0));
                 }   
                 
             }catch(e){
             }        
         }
         
        function callbackAjaxCargarCombosPoblaciones(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("VALOR");
                var CCONTRAcombo = document.Axissin0065Form.CCONTRA;
                objDom.borrarOpcionesDeCombo(CCONTRAcombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin065" c="SNV_COMBO" lit="108341"/> - ', CCONTRAcombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0); 
                    
                    objDom.addOpcionACombo(VALOR, TEXTO, CCONTRAcombo, i+1);
                }
            }
        }
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9909217"/></c:param>
        </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9909217"/></c:param>
	</c:import>
        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisprf000|<axis:alt c="axisprf000_TITULO" f="axisprf000" lit="9904783"/></c:param>
	</c:import>

        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin069|<axis:alt c="axissin069_TITULO" f="axissin069" lit="9909366"/></c:param>
        </c:import>	

        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin066|<axis:alt c="axissin066_TITULO" f="axissin066" lit="9909365"/></c:param>
        </c:import>	
    
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
    
    
    <form name="Axissin0065Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
     <input type="hidden" name="COTRA" id="COTRA" value="0"/>
    <input type="hidden" name="SPROFES" id="SPROFES" value="${__formdata.SPROFES}"/>
    <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="GUARDADO" id="GUARDADO" value="${__formdata.GUARDADO}"/>
    <input type="hidden" name="CTRAMITAD" id="CTRAMITAD" value="${__formdata.CTRAMITAD}"/>
	<input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
   
    
    <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt c="titulo" f="axissin065" lit="9909411"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin065" lit="9909411"/></c:param>
        <c:param name="form">axissin065</c:param>
    </c:import>
    <!-- MODAL -->
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
      
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper042|axisper042</c:param>
    </c:import>
  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin065" lit="9909394" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                
                            </tr>
                            <tr>
                              <axis:ocultar f="axissin065" c="NRECLAMA" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin065" c="NRECLAMA" lit="9909219"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin065" c="NPOLIZA" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin065" c="NPOLIZA" lit="9906444"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:ocultar f="axissin065" c="NCERTIF" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin065" c="NCERTIF" lit="101236"></axis:alt></b>
                                  </td>
                              </axis:ocultar>

                            </tr>
                            <tr>               
                                <td class="campocaja">
                                <axis:visible f="axissin065" c="NRECLAMA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NRECLAMA" name="NRECLAMA" size="15"   
                                     <axis:atr f="axissin065" c="NRECLAMA" a="modificable=false"/>  value="${__formdata.NRECLAMA}" title="<axis:alt c="NRECLAMA" f="axissin065" lit="9909219" />" alt="<axis:alt c="NRECLAMA" f="axissin065" lit="9909219" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin065" c="NPOLIZA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NPOLIZA" name="NPOLIZA" size="15"   
                                     <axis:atr f="axissin065" c="NPOLIZA" a="modificable=false"/>  value="${__formdata.NPOLIZA}" title="<axis:alt c="NPOLIZA" f="axissin065" lit="9906444" />" alt="<axis:alt c="NPOLIZA" f="axissin065" lit="9906444" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin065" c="NCERTIF">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:20%"   id="NCERTIF" name="NCERTIF" size="5"   
                                     <axis:atr f="axissin065" c="NCERTIF" a="modificable=false"/>  value="${__formdata.NCERTIF}" title="<axis:alt c="NCERTIF" f="axissin065" lit="101236" />" alt="<axis:alt c="NCERTIF" f="axissin065" lit="101236" />" /> 
                                 </axis:visible>
                                </td>
                               
                              </tr>
                              <tr>
                              <axis:ocultar f="axissin065" c="NRADICA" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin065" c="NRADICA" lit="9909395"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin065" c="TTRAMITAD" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" colspan="2" >
                                        <b><axis:alt f="axissin065" c="TTRAMITAD" lit="9909220"></axis:alt></b>
                                  </td>
                              </axis:ocultar>

                            </tr>
                            <tr>               
                                <td class="campocaja">
                                <axis:visible f="axissin065" c="NRADICA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NRADICA" name="NRADICA" size="15"   
                                     <axis:atr f="axissin065" c="NRADICA" a="modificable=false"/>  value="${__formdata.NRADICA}" title="<axis:alt c="NRADICA" f="axissin065" lit="9909199" />" alt="<axis:alt c="NRADICA" f="axissin065" lit="9909199" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2">
                                <axis:visible f="axissin065" c="TTRAMITAD">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="TTRAMITAD" name="TTRAMITAD" size="15"   
                                     <axis:atr f="axissin065" c="TTRAMITAD" a="modificable=false"/>  value="${__formdata.TTRAMITAD}" title="<axis:alt c="TTRAMITAD" f="axissin065" lit="9909220" />" alt="<axis:alt c="TTRAMITAD" f="axissin065" lit="9909220" />" /> 
                                 </axis:visible>
                                </td>

                               
                              </tr>
                             <tr>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FAPERTU" f="axissin065" lit="9909396" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FIMPUTA" f="axissin065" lit="9909397" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FNOTIFI" f="axissin065" lit="9900795" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FAUDIEN" f="axissin065" lit="9909398" /></b>
                                 </td>
                             </tr>
                             <tr>
                                <td class="campocaja"  >
                                <axis:visible f="axissin065" c="FAPERTU">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FAPERTU"  name="FAPERTU"  style="width:40%" alt="<axis:alt c="FAPERTU" f="axissin065" lit="9909396"/>" title="<axis:alt c="FAPERTU" f="axissin065" lit="9909396" />"
                                    <axis:atr f="axissin065" c="FAPERTU" a="modificable=true&formato=fecha&obligatorio=true"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FAPERTU}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FAPERTU"><img id="popup_calendario_FAPERTU" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin065" c="FIMPUTA">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FIMPUTA"  name="FIMPUTA"  style="width:40%" alt="<axis:alt c="FIMPUTA" f="axissin065" lit="9909397"/>" title="<axis:alt c="FIMPUTA" f="axissin065" lit="9909397" />"
                                    <axis:atr f="axissin065" c="FIMPUTA" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FIMPUTA}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FIMPUTA"><img id="popup_calendario_FIMPUTA" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin065" c="FNOTIFI">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FNOTIFI"  name="FNOTIFI"  style="width:40%" alt="<axis:alt c="FNOTIFI" f="axissin065" lit="9900795"/>" title="<axis:alt c="FNOTIFI" f="axissin065" lit="9900795" />"
                                    <axis:atr f="axissin065" c="FNOTIFI" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNOTIFI}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FNOTIFI"><img id="popup_calendario_FNOTIFI" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin065" c="FAUDIEN">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FAUDIEN"  name="FAUDIEN"  
                                    style="width:40%" alt="<axis:alt c="FAUDIEN" f="axissin065" lit="9909398"/>" 
                                    title="<axis:alt c="FAUDIEN" f="axissin065" lit="9909398" />"
                                    <axis:atr f="axissin065" c="FAUDIEN" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FAUDIEN}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FAUDIEN"><img id="popup_calendario_FAUDIEN" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>                             
                             </tr>
                             
                             <axis:ocultar c="TAUDIEN" f="axissin065" dejarHueco="false"><!-- Se oculta para que las audiencias se inputen en la agenda de citaciones -->                              
	                             <tr>
	                                 <td class="titulocaja">
	                                     <b><axis:alt c="HAUDIEN" f="axissin065" lit="9909201" /></b>
	                                 </td>
	                                 <td class="titulocaja">
	                                     <b><axis:alt c="CAUDIEN" f="axissin065" lit="9909202" /></b>
	                                 </td>
	                             </tr>
	                             <tr>
	                                <td class="campocaja"  >
	                                <axis:visible f="axissin065" c="HAUDIEN">    
	                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="HAUDIEN" f="axissin065" lit="9901534" />" title="<axis:alt c="HAUDIEN" f="axissin065" lit="9901534" />"
	                                            <axis:atr f="axissin065" c="HAUDIEN" a="modificable=true"/>
	                                            id="HAUDIEN" style="width:20%" name="HAUDIEN" size="15" value="${__formdata.HAUDIEN}"/>
	                                </axis:visible>
	                                </td>
	                                <td class="campocaja" colspan="2">
	                                    <select name = "CAUDIEN" id="CAUDIEN" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
	                                            alt="<axis:alt c="CAUDIEN" f="axissin065" lit="9909202" />" title="<axis:alt c="CAUDIEN" f="axissin065" lit="9909202" />" > 
	                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
	                                            <c:forEach var="tipos" items="${__formdata.listaCiudades}">
	                                                <option value = "${tipos.CPOSTAL}"
	                                                        <c:if test="${tipos.CPOSTAL == __formdata.CAUDIEN}">selected</c:if>>
	                                                        ${tipos.TEXTO}
	                                                </option>
	                                            </c:forEach>
	                                    </select>
	                                </td>                              
	                             </tr>
	                                                             
	                             <tr>
	                                <td class="titulocaja">
	                                    <b><axis:alt c="NNUMIDEPROFES" f="axissin065" lit="9909400" /></b>
	                                </td>
	                            </tr>
	                             <tr>
	                                <td class="campocaja"  >
	                                    <axis:visible f="axissin065" c="NNUMIDEPROFES">    
	                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NNUMIDEPROFES" f="axissin065" lit="9909226" />" title="<axis:alt c="NNUMIDEPROFES" f="axissin065" lit="9909226" />"
	                                              <axis:atr f="axissin065" c="NNUMIDEPROFES" a="modificable=true"/>
	                                             id="NNUMIDEPROFES" style="width:80%" name="NNUMIDEPROFES" size="100" value="${__formdata.NNUMIDEPROFES}"/>
	                                    <img id="findProfesional" border="0" src="images/find.gif" onclick="f_abrir_axisprf000()" style="cursor:pointer" alt=""/>                
	                                    </axis:visible>
	                                </td>
	                                <td class="campocaja" colspan="2" >
	                                    <axis:visible f="axissin065" c="NOMBREPROFES">    
	                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NOMBREPROFES" f="axissin065" lit="9909226" />" title="<axis:alt c="TCONTRA" f="axissin065" lit="9909226" />"
	                                              <axis:atr f="axissin065" c="NOMBREPROFES" a="modificable=false"/>
	                                             id="NOMBREPROFES" style="width:100%" name="NOMBREPROFES" size="100" value="${__formdata.NOMBREPROFES}"/>
	                                    </axis:visible>
	                                </td>
	                             </tr>
                            </axis:ocultar>  
                            
                            <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin065" lit="9909539" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                        <tr>

                                            <td class="titulocaja" colspan="2" >
                                                <b><axis:alt c="COTERRI" f="axissin065" lit="9909401" /></b>
                                            </td>                
							               <td class="titulocaja">
							                   <b><axis:alt f="axissin065" c="CPROVIN" lit="100756"/></b>
							               </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="CCONTRA" f="axissin065" lit="9909402" /></b>
                                            </td>    
                                            <td class="titulocaja" colspan="2" >
                                                <b><axis:alt c="CUESPEC" f="axissin065" lit="9909403" /></b>
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="2" >
                                                <select name = "COTERRI" id="COTERRI" style="width:100%" size="1"  class="campowidthselect campo campotexto" onchange="f_orden_contraloria(this.value)"
                                                    alt="<axis:alt c="COTERRI" f="axissin065" lit="9909401" />" title="<axis:alt c="COTERRI" f="axissin065" lit="9909401" />" 
                                                <axis:atr f="axissin065" c="COTERRI" a="modificable=true&obligatorio=true"/>> 
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaOrden}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.COTERRI}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            
                                            
							                <td class="campocaja"  id="td_CPROVIN" >
							                    <select name="CPROVIN" id="CPROVIN" size="1" class="campowidthselect campo campotexto_op" style="width:100%;"
                                                <axis:atr f="axissin065" c="CPROVIN" a="modificable=true&obligatorio=true"/>
						                                title="<axis:alt f="axissin065" c="td_CPROVIN" lit="100756"/>"
							                            onchange="f_cargar_poblaciones(this.value)">
							                        <option value="<%= Integer.MIN_VALUE %>">
							                            - <axis:alt f="axissin065" c="SELEC" lit="1000348"/> - 
							                        </option>
							                        <c:forEach var="element" items="${__formdata.PROVINCIAS}">
							                        <option value = "${element.CODIGO}"
							                                <c:if test="${__formdata.CPROVIN == element.CODIGO}"> selected </c:if>>
							                            ${element.TEXTO}
							                        </option>
							                        </c:forEach>
							                    </select>
							                </td>                                            
                                            
						                    <td class="campocaja" id="td_CCONTRA" colspan="2">
						                        <select name = "CCONTRA" id="CCONTRA" paramMap="true"  style="width:100%" size="1" 
		                                                <axis:atr f="axissin065" c="CCONTRA" a="modificable=true&obligatorio=true"/>
						                                title="<axis:alt f="axissin065" c="td_CCONTRA" lit="9909402"/>"
						                                class="campowidthselect campo campotexto">
						                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin065" c="SNV_COMBO" lit="1000348"/> - </option>
						                            <c:forEach var="poblaciones" items="${__formdata.POBLACIONES}">
						                                <option value = "${poblaciones.VALOR}"
						                                <c:if test="${__formdata.CCONTRA == poblaciones.VALOR}"> selected </c:if>>
						                                ${poblaciones.TEXTO}</option>
						                            </c:forEach>
						                        </select>
						                    </td>
                                            
                                            <td class="campocaja" colspan="2" >
                                                <select name = "CUESPEC" id="CUESPEC" style="width:100%" size="1"  class="campowidthselect campo campotexto"                                                    alt="<axis:alt c="CUESPEC" f="axissin065" lit="9909403" />" title="<axis:alt c="CUESPEC" f="axissin065" lit="9909403" />" > 
                                                    <axis:atr f="axissin065" c="CUESPEC" a="modificable=true&obligatorio=true"/>  
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaUnidades}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CUESPEC}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>                                             
                                        </tr>
                                        <tr>
                                        
                                            <td class="titulocaja" colspan="2">
                                             <axis:visible f="axissin065" c="TCONTRA"> 
                                                <b id="lit_TCONTRA"> <axis:alt c="TCONTRA" f="axissin065"  lit="9909404" /></b>
                                             </axis:visible>
                                            </td>                                 
                                        </tr>
                                        <tr>

                                            <td class="campocaja" colspan="2" >
                                            <axis:visible f="axissin065" c="TCONTRA">    
                                                <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="TCONTRA" f="axissin065" lit="9909404" />" title="<axis:alt c="TCONTRA" f="axissin065" lit="9909404" />"
                                                    <axis:atr f="axissin065" c="TCONTRA" a="modificable=true"/>
                                                    id="TCONTRA" style="width:100%" name="TCONTRA" size="100" value="${__formdata.TCONTRA}"/>
                                            </axis:visible>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                               
                                <td class="titulocaja">
                                        <b><axis:alt c="CTIPTRA" f="axissin065" lit="9909405" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                        <b><axis:alt c="TESTADO" f="axissin065" lit="100587" /></b>
                                </td>                                        
                            </tr>
                            <tr>
                                <td class="campocaja">
                                                <select name = "CTIPTRA" id="CTIPTRA" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                                    alt="<axis:alt c="CTIPTRA" f="axissin065" lit="9909405" />" title="<axis:alt c="CTIPTRA" f="axissin065" lit="9909405" />" > 
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaTipos}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CTIPTRA}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                </td> 
                                <td class="campocaja" colspan="2" >
                                            <axis:visible f="axissin065" c="TESTADO">    
                                                <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="TESTADO" f="axissin065" lit="100587" />" title="<axis:alt c="TESTADO" f="axissin065" lit="100587" />"
                                                    <axis:atr f="axissin065" c="TESTADO" a="modificable=true"/>
                                                    id="TESTADO" style="width:100%" name="TESTADO" size="100" value="${__formdata.TESTADO}"/>
                                            </axis:visible>
                                </td>                                        
                            </tr>
                            
                            <axis:ocultar c="TAUDIEN" f="axissin065" dejarHueco="false"><!-- Se oculta para que las audiencias se inputen en la agenda de citaciones -->                                        
	                            <tr>
	                                <td class="titulocaja">
	                                        <b><axis:alt c="CMEDIO" f="axissin065" lit="9909406" /></b>
	                                </td>                                        
	                            </tr>                                        
	                            <tr>
	                                <td class="campocaja" colspan="2">
	                                                <select name = "CMEDIO" id="CMEDIO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
	                                                    alt="<axis:alt c="CMEDIO" f="axissin065" lit="9909406" />" title="<axis:alt c="CMEDIO" f="axissin065" lit="9909406" />" > 
	                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
	                                                    <c:forEach var="tipos" items="${__formdata.listaMedios}">
	                                                        <option value = "${tipos.CATRIBU}"
	                                                            <c:if test="${tipos.CATRIBU == __formdata.CMEDIO}">selected</c:if>>
	                                                            ${tipos.TATRIBU}
	                                                        </option>
	                                                    </c:forEach>
	                                                </select>
	                                </td> 
	                            </tr>                            
                            </axis:ocultar>
                            
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="TSUBTRA" f="axissin065" lit="9902790" /></b>
                                </td>
                            </tr>
                            <tr>
                                </td>
                                <td class="campocaja" colspan="2" >
                                <axis:visible f="axissin065" c="TSUBTRA">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="TSUBTRA" f="axissin065" lit="9902790" />" title="<axis:alt c="TSUBTRA" f="axissin065" lit="9902790" />"
                                              <axis:atr f="axissin065" c="TSUBTRA" a="modificable=false"/>
                                              value="${__formdata.TSUBTRA}"
                                             id="TSUBTRA" style="width:100%" name="TSUBTRA" size="100" />
                                </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FDESCAR" f="axissin065" lit="9909407" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FFALLO" f="axissin065" lit="9909536" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="CFALLO" f="axissin065" lit="9909538" /></b>
                                 </td>
                             </tr>
                             <tr>
                                <td class="campocaja"  >
                                <axis:visible f="axissin065" c="FDESCAR">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FDESCAR"  name="FDESCAR"  style="width:40%" alt="<axis:alt c="FDESCAR" f="axissin065" lit="9909407"/>" title="<axis:alt c="FDESCAR" f="axissin065" lit="9909407" />"
                                    <axis:atr f="axissin065" c="FDESCAR" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESCAR}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FDESCAR"><img id="popup_calendario_FDESCAR" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin065" c="FFALLO">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FFALLO"  name="FFALLO"  style="width:40%" alt="<axis:alt c="FFALLO" f="axissin065" lit="9909536"/>" title="<axis:alt c="FFALLO" f="axissin065" lit="9909536" />"
                                    <axis:atr f="axissin065" c="FFALLO" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFALLO}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FFALLO"><img id="popup_calendario_FFALLO" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2">
                                                <select name = "CFALLO" id="CFALLO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                                    alt="<axis:alt c="CFALLO" f="axissin065" lit="9909406" />" title="<axis:alt c="CFALLO" f="axissin065" lit="9909406" />" > 
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaFallos}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CFALLO}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                </td>                            
                            </tr>                             
                            
                            
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="TFALLO" f="axissin065" lit="9909540" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" style="width:100%;" class="campocaja">
                                <axis:ocultar c="TFALLO" f="axissin065" dejarHueco="false">
                                    <textarea class="campowidthinput campo campotexto" style="width:100%;" maxlength="2000" name="TFALLO" id="TFALLO">${__formdata.TFALLO}</textarea>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="CRECURSO" f="axissin065" lit="9909408" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="2">
                                    <select name = "CRECURSO" id="CRECURSO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                            alt="<axis:alt c="CRECURSO" f="axissin065" lit="9909408" />" title="<axis:alt c="CRECURSO" f="axissin065" lit="9909408" />" > 
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin065" lit="1000348"/> - </option>
                                                <c:forEach var="tipos" items="${__formdata.listaRecursos}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CRECURSO}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                </c:forEach>
                                     </select>
                                </td> 
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin065" lit="9909257" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                        <tr>
                                            <td class="titulocaja" colspan="6">
                                                <div style="float:right;" id="BT_SIN_NUEVO_PRETEN">
                                                <axis:visible f="axissin006" c="BT_SIN_NUEVO_PRETEN"> <!-- Nueva pretension-->
                                                    <div id="BT_SIN_NUEVO_PRETEN">
                                                    <c:if test="${__formdata.isNew == 0}">
                                                        <a href="javascript:objUtiles.abrirModal('axissin066','src', 'modal_axissin066.do?operation=form&isNew=1&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&SSEGURO='+${__formdata.SSEGURO}+'&ORIGEN=1');">
                                                        <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_PRETEN" lit="9000906"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_PRETEN" lit="9000906"/>" src="images/new.gif"/></a>
                                                    </c:if>
                                                    </div>
                                                </axis:visible>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" id="TDVALPRETENSION">
                                    
                                            <c:set var="title0"><axis:alt f="axissin065" c="TGARANT" lit="9909013" /></c:set><!-- Amparo -->
                                            <c:set var="title1"><axis:alt f="axissin065" c="TMONEDA" lit="89907052" /></c:set><!--Moneda-->
                                            <c:set var="title2"><axis:alt f="axissin065" c="ICAPITAL" lit="9902924" /></c:set> <!-- Valor asegurado-->
                                            <c:set var="title3"><axis:alt f="axissin065" c="TMONEDAFAUL" lit="108645" /></c:set><!--Moneda-->
                                            <c:set var="title4"><axis:alt f="axissin065" c="IPRETEN" lit="9903367" /></c:set> <!-- Valor pretension-->
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.GARANTIAS}" id="VALPRETENSION" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="TGARANT" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.TGARANT}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="CMONEDA" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}</div>    
                                                </display:column>    

                                                 <display:column title="${title2}" sortable="true" sortProperty="ICAPITAL" headerClass="sortable" media="html" autolink="false" >  
                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}"/></div>
                                                </display:column>
                                                
                                                <display:column title="${title3}" sortable="true" sortProperty="TMONEDAFAUL" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${__formdata.CMONEDAFAUL}</div>    
                                                </display:column>  
                                                
                                                <display:column title="${title4}" sortable="true" sortProperty="IPRETEN" headerClass="sortable" media="html" autolink="false" >
                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN}"/></div>
                                                </display:column> 
                                                
                                                <axis:visible f="axissin006" c="BT_SIN_EDITAR_PRETENSION"> <!--boton editar persona asociada -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_PRETENSION"><img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_EDITAR_PRETENSION" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_PRETENSION" lit="9901356"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin066','src', 'modal_axissin066.do?operation=form&isNew=0&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&SSEGURO='+${__formdata.SSEGURO}+'&ORIGEN=1'+'&CGARANT=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}'+'&CMONEDA=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}'+'&IPRETEN=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN}'+'&ICAPITAL=${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                                
                                                  <axis:visible f="axissin006" c="BT_SIN_ELIMINAR_PRETENSION"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}">
                                                    <div class="dspIcons" id="BT_SIN_ELIMINAR_PRETENSION"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_valpretension_axissin066('&NVALOR='+'${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                               
                                               
                                            </display:table>
                                            </div>
                          
                                     
                                     
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"/>
                                            <td class="titulocaja"/>
                                            <td class="titulocaja">
                                                <b><axis:alt c="ITOTASEG" f="axissin065" lit="9909259" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="ITOTPRET" f="axissin065" lit="9909260" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja"/>
                                            <td class="campocaja"/>
                                            <td class="campocaja">
											<!---AB 05/24/2019 BUG4100--->
                                            <axis:visible f="axissin065" c="ITOTASEG">    
                                                <input   type="text" class="campowidthinput campo campotexto" 
                                                alt="<axis:alt c="ITOTASEG" f="axissin065" lit="9909259" />" title="<axis:alt c="ITOTASEG" f="axissin065" lit="9909259" />"
                                                value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ITOTASEG}"/>" 
                                                <axis:atr f="axissin065" c="ITOTASEG" a="modificable=false"/>
                                                id="ITOTASEG" style="width:50%" name="ITOTASEG" />            
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <axis:visible f="axissin065" c="ITOTPRET">    
                                                <input   type="text" class="campowidthinput campo campotexto" 
                                                alt="<axis:alt c="ITOTPRET" f="axissin065" lit="9909260" />" title="<axis:alt c="ITOTPRET" f="axissin065" lit="9909260" />"
                                                value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ITOTPRET}"/>" 
                                                <axis:atr f="axissin065" c="ITOTPRET" a="modificable=false"/>
                                                id="ITOTPRET" style="width:50%" name="ITOTPRET"  />            
                                            </axis:visible>
                                            </td>
                                        </tr>
                                     </table>
                                </td>

                            </tr>
                            </table> <!-- UNO -->
            
            
            
                
                
            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin065</c:param><c:param name="f">axissin065</c:param>
    <c:param name="f">axissin065</c:param>
     <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axissin065">,cancelar</axis:visible><axis:visible c="BT_ACEPTAR" f="axissin065">,aceptar</axis:visible></c:param> 
    </c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FAPERTU",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FAPERTU", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FNOTIFI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNOTIFI", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FIMPUTA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FIMPUTA", 
                singleClick    :    true,
                firstDay       :    1
            });        
               Calendar.setup({
                inputField     :    "FAUDIEN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FAUDIEN", 
                singleClick    :    true,
                firstDay       :    1
            });  
               Calendar.setup({
                inputField     :    "FDESCAR",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FDESCAR", 
                singleClick    :    true,
                firstDay       :    1
            });  
               Calendar.setup({
                inputField     :    "FFALLO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFALLO", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
