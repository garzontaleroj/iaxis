<%/* Revision:# fn4qjwuzk7w2HL53UMTbXA== # */%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

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
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">



        function f_onload() {
          
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";


            var NSINIES = "${__formdata.NSINIES}";
            var NTRAMIT = "${__formdata.NTRAMIT}";
            var ISNEW = "${__formdata.isNew}";

            f_cargar_propiedades_pantalla();
            f_campos_adicionales();
        }
        
        function f_abrir_axisper021 () {
        	
         	var SSEGURO = "${__formdata.SSEGURO}";
         	var CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
        }
          
        function f_cerrar_axisper021(){
        	f_cerrar_modalespersona("axisper021");
        }   
        
        function f_cerrar_modalespersona(modal){
            objUtiles.cerrarModal(modal);
        } 
        
        function f_aceptar_persona(SPERSON, CAGENTE, SNIP, modal){
            f_cerrar_modalespersona(modal);

            objDom.setValorPorId("SPERSON", SPERSON);
            objDom.setValorPorId("CAGENTE", CAGENTE);

            if (!objUtiles.estaVacio(SPERSON)){
           		objUtiles.ejecutarFormulario ("modal_axissin071.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, "actualizar_persona", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_actTime(thiss){

            thiss.value = f_formattime(thiss);
            
        } 
        
        function f_formattime(entrada){
        	
        	if (!objUtiles.estaVacio(entrada.value)){

	         	if (entrada.value.lenght > 5 || entrada.value.lenght < 5 || entrada.value.indexOf(":") != 2){ 
	        	 	         		
	         		entrada.value = '';
	
	        	}else if (!objUtiles.esNumero(entrada.value.substring(0,2)) || entrada.value.substring(0,2)>24 || !objUtiles.esNumero(entrada.value.substring(3,5)) || entrada.value.substring(3,5)>60){
	        		
	        		entrada.value = '';
	        		
	        	}
        	}
        	return entrada.value;
        }
        
        function f_actData(thiss){

            thiss.value = f_formatdate(thiss);
            
        } 
        
        function f_formatdate(entrada){
        	var jDate = new JsFecha();

         	if (!jDate.validaFecha(entrada.value) || entrada.value.indexOf("/") == -1){ 
        	 	if(entrada.value.length>0){
                	entrada.value=jDate.formateaFecha(entrada.value); 
                
                	if(jDate.validaFecha(entrada.value)){
                 	   entrada.value=jDate.formateaFecha(entrada.value);
                	}else{
                   	 entrada.value = '';
                	}
        		}
        	}
        	return entrada.value;
        }
        
        function f_cargar_combos(){

            if (!objUtiles.estaVacio($("#CPROVIN").val())){
                f_cargar_poblaciones($("#CPROVIN").val());
            }

        }
        function f_cargar_poblaciones(thiss){

			objAjax.invokeAsyncCGI("modal_axissin071.do", callbackAjaxCargarCombosPoblaciones, "operation=ajax_cargarPoblaciones&CPROVIN="+thiss, this, objJsMessages.jslit_cargando);  

        }
        
        
        function callbackAjaxCargarCombosPoblaciones(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("VALOR");
                var CPOBLACcombo = document.miForm.CPOBLAC;  
                objDom.borrarOpcionesDeCombo(CPOBLACcombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin071" c="SNV_COMBO" lit="108341"/> - ', CPOBLACcombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0); 
                    
                    objDom.addOpcionACombo(VALOR, TEXTO, CPOBLACcombo, i+1);
                }
            }
        }
        
        function f_but_cancelar() {
        	 parent.f_cerrar_modal("axissin071");
        } 
        
        function f_but_aceptar() {
        	var NCITACION = document.getElementById("NCITACION").value;
        	var FCITACION = document.getElementById("FCITACION").value;
        	var HCITACION = document.getElementById("HCITACION").value;
        	var CPAIS     = document.getElementById("CPAIS").value;
        	var CPROVIN   = document.getElementById("CPROVIN").value;
        	var CPOBLAC   = document.getElementById("CPOBLAC").value;
        	var TLUGAR    = document.getElementById("TLUGAR").value;
        	var NNUMIDE   = document.getElementById("NNUMIDE").value;
        	var NOMBRE    = document.getElementById("NOMBRE").value;
        	var SPERSON   = document.getElementById("HSPERSON").value;
        	var TAUDIEN   = document.getElementById("TAUDIEN").value;
        	var CORAL     = document.getElementById("CORAL").value;
        	var CESTADO   = document.getElementById("CESTADO").value;
        	var CRESOLU   = document.getElementById("CRESOLU").value;
        	var FNUEVA    = document.getElementById("FNUEVA").value;
        	var TRESULT   = document.getElementById("TRESULT").value;
        	var CMEDIO    = document.getElementById("CMEDIO").value;
        	
        	if (objValidador.validaEntrada()) { 
        		parent.f_aceptar_citacion(NCITACION, FCITACION, HCITACION, CPAIS, CPROVIN, CPOBLAC, TLUGAR, NNUMIDE, NOMBRE, SPERSON, TAUDIEN, CORAL, CESTADO, CRESOLU, FNUEVA, TRESULT, CMEDIO);
        	}
        } 
        function selectElement(id, valueToSelect) {    
            let element = document.getElementById(id);
            element.value = valueToSelect;
        }
        function f_campos_adicionales(){
            
            var CORAL =objDom.getValorPorId("CORAL");
            objDom.setVisibilidadPorId("CESTADO_td", "hidden");
            objDom.setVisibilidadPorId("CESTADO_tit", "hidden");
            if(objUtiles.estaVacio(objDom.getValorPorId("CORAL"))){
            	ocultar_campos();
            	selectElement("CESTADO",-2147483648);
            	selectElement("CRESOLU",-2147483648);
            	document.getElementById("FNUEVA").value="";
            }else{
            	if(CORAL == 2){
            		selectElement("CESTADO",3);	
            		selectElement("CRESOLU",-2147483648);
            		objDom.setVisibilidadPorId("CESTADO_td", "visible");
            		objDom.setVisibilidadPorId("CESTADO_tit", "visible");
            	}else{
            		selectElement("CESTADO",1);
            		
            	}
            		
            }
            var CESTADO =objDom.getValorPorId("CESTADO");
            
            if( objUtiles.estaVacio(objDom.getValorPorId("CORAL")) || objUtiles.estaVacio(objDom.getValorPorId("CESTADO"))){
                ocultar_campos();
                selectElement("CESTADO",-2147483648);
            }else{ 
            	
                if(CESTADO == 1){
                    //ocultar_campos();
                    objDom.setVisibilidadPorId("CRESOLU_td", "visible");
                    objDom.setVisibilidadPorId("FNUEVA_td", "visible");
                    objDom.setVisibilidadPorId("CRESOLU_tit", "visible");
                    objDom.setVisibilidadPorId("FNUEVA_tit", "visible");
                }else if(CESTADO == 2){
                	
                    //ocultar_campos();
                }else if(CESTADO == 3){
                    //ocultar_campos();
                    objDom.setVisibilidadPorId("CRESOLU_td", "hidden");
                    objDom.setVisibilidadPorId("CRESOLU_tit", "hidden");
                    objDom.setVisibilidadPorId("FNUEVA_td", "visible");
                    objDom.setVisibilidadPorId("FNUEVA_tit", "visible");
                }
            }
            var CRESOLU =objDom.getValorPorId("CRESOLU");
            if(CRESOLU == 1||CRESOLU == 2||objUtiles.estaVacio(objDom.getValorPorId("CORAL")) ||(objUtiles.estaVacio(objDom.getValorPorId("CRESOLU"))&&CORAL == 1)){
            	objDom.setVisibilidadPorId("FNUEVA_td", "hidden");
                objDom.setVisibilidadPorId("FNUEVA_tit", "hidden");
                document.getElementById("FNUEVA").value="";
            }else{
            	objDom.setVisibilidadPorId("FNUEVA_td", "visible");
                objDom.setVisibilidadPorId("FNUEVA_tit", "visible");
            }
        }
        
        function ocultar_campos(){
           objDom.setVisibilidadPorId("CRESOLU_td", "hidden");
           objDom.setVisibilidadPorId("FNUEVA_td", "hidden");
           objDom.setVisibilidadPorId("CRESOLU_tit", "hidden");
           objDom.setVisibilidadPorId("FNUEVA_tit", "hidden");            
        }
        
    </script>
  </head>
    <body onload="f_onload()">
         <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_021" f="axissin071" lit="1000235"/></c:param>
            <c:param name="nid" value="axisper021"/>
        </c:import>    
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>   
            <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}" />  
            <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}" />
            <input type="hidden" name="NCITACION" id="NCITACION" value="${__formdata.NCITACION}" />
            <input type="hidden" name="CPAIS" id="CPAIS" value="${__formdata.CPAIS}" />
            <input type="hidden" name="HSPERSON" id="HSPERSON" value="${__formdata.SPERSON}" />
			<input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
               
  
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin076" c="FORM" lit="9909802" /></c:param>
                <c:param name="producto"><axis:alt f="axissin076" c="FORM" lit="9909802" /></c:param>
                <c:param name="form">axissin071</c:param>
            </c:import>

			<div class="separador">&nbsp;</div>

            <!-- Area de campos  -->
            <table class="seccion" style="padding: 20px;">
		        <tr>
		            <td >
		                <table>
		                    <tr>
		                    
		                       <axis:ocultar f="axissin071" c="FCITACION" dejarHueco="false"> 
		                            <td class="titulocaja">
		                                <b><axis:alt f="axissin071" c="FCITACION_LIT" lit="100562"/></b><!-- Fecha -->
		                            </td>
		                       </axis:ocultar>    
		                       <axis:ocultar f="axissin071" c="HCITACION" dejarHueco="false"> 
		                           <td class="titulocaja">
		                                <b><axis:alt f="axissin071" c="HCITACION_LIT" lit="9909800"/></b><!-- Hora  -->
		                            </td>         
		                        </axis:ocultar>
		                        
		                        <td class="titulocaja" colspan="2" >
		                            <b><axis:alt c="TAUDIEN" f="axissin071" lit="9909236" /></b>
		                        </td>  
	                        </tr>
	                        
		                    <tr>
		                    
		                        <axis:ocultar f="axissin071" c="FCITACION" dejarHueco="false"> 
		                            <td class="campocaja">
		                             	<input   type="text"  class="campowidthinput campo" id="FCITACION"  style="width:65%" name="FCITACION" onblur="javascript:f_actData(this)"
                                	 	<axis:atr f="axissin071" c="FCITACION" /> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCITACION}"/>"
                                				  title="<axis:alt f="axissin012" c="FCITACION" lit="100562"/>"/>                                    
                                		<a style="vertical-align:middle;"><img id="popup_calendario_FCITACION" alt="<axis:alt f="axissin071" c="popup_calendario_FCITACION" lit="100562"/>" title="<axis:alt f="axissin071" c="popup_calendario_FCITACION" lit="100562" />" src="images/calendar.gif"/></a>                            
		                            </td>
		                        </axis:ocultar>    
		                        <axis:ocultar f="axissin071" c="HCITACION" dejarHueco="false"> 
		                            <td class="campocaja">
		                             <input type="text" id="HCITACION" name="HCITACION" onblur="javascript:f_actTime(this)" value="${__formdata.HCITACION}" class="campodisabled campo campotexto" style="width:90%" title="<axis:alt f="axissin071" c="HCITACION_ALT" lit="9909800"/>"
		                                <axis:atr f="axissin071" c="HCITACION"/> />                                
		                            </td>                        
		                        </axis:ocultar>
			                        <td class="campocaja" colspan="2" >
			                            <select name = "TAUDIEN" id="TAUDIEN" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
			                                alt="<axis:alt c="TAUDIEN" f="axissin071" lit="9909236" />" title="<axis:alt c="TAUDIEN" f="axissin071" lit="9909236" />" > 
			                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin071" lit="1000348"/> - </option>
			                                <c:forEach var="tipos" items="${__formdata.listaClases}">
			                                    <option value = "${tipos.CATRIBU}"
			                                        <c:if test="${tipos.CATRIBU == __formdata.TAUDIEN}">selected</c:if>>
			                                        ${tipos.TATRIBU}
			                                    </option>
			                                </c:forEach>
			                            </select>
			                        </td>
			                        
		                    </tr>
		                    
	                        <tr>  
		                        <axis:ocultar f="axissin071" c="CPROVIN" dejarHueco="false">                 
					               <td class="titulocaja">
					                   <b><axis:alt f="axissin071" c="CPROVIN" lit="100756"/></b>
					               </td> 
					            </axis:ocultar>
					            <axis:visible f="axissin071" c="CPOBLAC">
					                <td class="titulocaja" id="tit_CPOBLAC">
					                    <b id="label_CPOBLAC"><axis:alt f="axissin071" c="CPOBLAC" lit="9903660"/></b>
					                </td>
					            </axis:visible>
					            
		                        <axis:ocultar f="axissin071" c="TLUGAR" dejarHueco="false"> 
		                            <td class="titulocaja">
		                                <b><axis:alt f="axissin071" c="LUGAR_LIT" lit="9909799"/></b><!-- Lugar -->
		                            </td>
		                        </axis:ocultar> 
		                           
		                    </tr>
		                    
		                    <tr>    
		                        <axis:ocultar f="axissin071" c="CPROVIN" dejarHueco="false">
					                <td class="campocaja"  id="td_CPROVIN" >
					                    <select name="CPROVIN" id="CPROVIN" size="1" class="campowidthselect campo campotexto_op" style="width:85%;"
				                                title="<axis:alt f="axissin071" c="td_CPROVIN" lit="100756"/>"
					                            onchange="f_cargar_poblaciones(this.value)" 
					                            <axis:atr f="axissin071" c="CPROVIN" a="isInputText=false"/>>
					                        <option value="<%= Integer.MIN_VALUE %>">
					                            - <axis:alt f="axissin071" c="SELEC" lit="1000348"/> - 
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
					            <axis:visible f="axissin071" c="CPOBLAC">
				                    <td class="campocaja" id="td_CPOBLAC">
				                        <select name = "CPOBLAC" id="CPOBLAC" paramMap="true"    size="1" 
				                                title="<axis:alt f="axissin071" c="td_CPOBLAC" lit="9903660"/>"
				                                class="campowidthselect campo campotexto"   
				                                <axis:atr f="axissin071" c="CPOBLAC" a="isInputText=false"/>>
				                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin071" c="SNV_COMBO" lit="108341"/> - </option>
				                            <c:forEach var="poblaciones" items="${__formdata.POBLACIONES}">
				                                <option value = "${poblaciones.VALOR}"
				                                <c:if test="${__formdata.CPOBLAC == poblaciones.VALOR}"> selected </c:if>>
				                                ${poblaciones.TEXTO}</option>
				                            </c:forEach>
				                        </select>
				                    </td>
				                </axis:visible>
				                
		                        <axis:ocultar f="axissin071" c="TLUGAR" dejarHueco="false"> 
		                            <td class="campocaja" colspan="2">
		                                <input type="text" name="TLUGAR" id="TLUGAR" value="${__formdata.TLUGAR}" class="campodisabled campo campotexto" style="width:100%" title="<axis:alt f="axissin071" c="LUGAR_ALT" lit="9909799"/>"
		                                <axis:atr f="axissin071" c="TLUGAR"/> />
		                            </td>
		                        </axis:ocultar>
				                  
		                    </tr>
		                    
		                    <tr>
			                    <axis:ocultar f="axissin071" c="NNUMIDE" dejarHueco="false">
			                        <td class="titulocaja">
			                                <b><axis:alt f="axissin071" c="LIT_SPERSON" lit="9909801"/></b><!-- Document -->                                
			                        </td>
			                    </axis:ocultar>
			                    <td></td>
			                </tr>
		                    <tr>
			                    <axis:ocultar f="axissin071" c="NNUMIDE" dejarHueco="false">
			                        <td class="campocaja">
			                            <input type="text" name="NNUMIDE" id="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:90%" title="<axis:alt f="axissin071" c="NNUMIDE_ALT" lit="9909801"/>"
			                            <axis:atr f="axissin071" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
			                            <axis:visible f="axissin071" c="BUSCAR_PER">
			                            	<img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
			                            </axis:visible>
			                        </td>
			                    </axis:ocultar>
			                    <axis:ocultar f="axissin071" c="NOMBRE" dejarHueco="false">
			                        <td class="campocaja" colspan="3">
			                            <input type="text" name="NOMBRE" id="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:100%"
			                            <axis:atr f="axissin071" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
			                        </td>                        
			                    </axis:ocultar> 
			                        
			                </tr>

<!-- CAMPOS NUEVOS DE AUDIENCIA -->

                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="CMEDIO" f="axissin071" lit="9909406" /></b>
                                </td>
                            </tr> 
                            <tr>
                                <td class="campocaja" colspan="2">
                                    <select name = "CMEDIO" id="CMEDIO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                        alt="<axis:alt c="CMEDIO" f="axissin071" lit="9909406" />" title="<axis:alt c="CMEDIO" f="axissin071" lit="9909406" />" > 
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin071" lit="1000348"/> - </option>
                                        <c:forEach var="tipos" items="${__formdata.listaMedios}">
                                            <option value = "${tipos.CATRIBU}"
                                                <c:if test="${tipos.CATRIBU == __formdata.CMEDIO}">selected</c:if>>
                                                ${tipos.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
			                
		                    <tr>
		           
		                        <td class="titulocaja">
		                            <b><axis:alt c="CORAL" f="axissin071" lit="9909245" /></b>
		                        </td>
		                        <td class="titulocaja" id="CESTADO_tit">
		                            <b><axis:alt c="CESTADO" f="axissin071" lit="100587" /></b>
		                        </td>
		                        <td class="titulocaja" id="CRESOLU_tit">
		                            <b><axis:alt c="CRESOLU" f="axissin071" lit="9903489" /></b>
		                        </td>  
		                        <td class="titulocaja" id="FNUEVA_tit">
		                            <b><axis:alt c="FNUEVA" f="axissin071" lit="9909248" /></b>
		                        </td> 
		                    </tr>
		                    <tr>
		                        <td class="campocaja">
		                            <select name = "CORAL" id="CORAL" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
		                                onchange="javascript:f_campos_adicionales();"
		                                alt="<axis:alt c="CORAL" f="axissin071" lit="9909245" />" title="<axis:alt c="CORAL" f="axissin071" lit="9909245" />" > 
		                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin071" lit="1000348"/> - </option>
		                                <c:forEach var="tipos" items="${__formdata.listaOral}">
		                                    <option value = "${tipos.CATRIBU}"
		                                        <c:if test="${tipos.CATRIBU == __formdata.CORAL}">selected</c:if>>
		                                        ${tipos.TATRIBU}
		                                    </option>
		                                </c:forEach>
		                            </select>
		                        </td> 
		                        <td class="campocaja" id="CESTADO_td">
		                            <select name = "CESTADO" disabled="true" id="CESTADO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
		                                onchange="javascript:f_campos_adicionales();"
		                                alt="<axis:alt c="CESTADO" f="axissin071" lit="100587" />" title="<axis:alt c="CESTADO" f="axissin071" lit="100587" />" > 
		                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin071" lit="1000348"/> - </option>
		                                <c:forEach var="tipos" items="${__formdata.listaEstados}">
		                                    <option value = "${tipos.CATRIBU}"
		                                        <c:if test="${tipos.CATRIBU == __formdata.CESTADO}">selected</c:if>>
		                                        ${tipos.TATRIBU}
		                                    </option>
		                                </c:forEach>
		                            </select>
		                        </td> 
		                        <td class="campocaja" id="CRESOLU_td">
		                            <select name = "CRESOLU" id="CRESOLU" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
		                                onchange="javascript:f_campos_adicionales();" alt="<axis:alt c="CRESOLU" f="axissin071" lit="9903489" />" title="<axis:alt c="CRESOLU" f="axissin071" lit="9903489" />" > 
		                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin071" lit="1000348"/> - </option>
		                                <c:forEach var="tipos" items="${__formdata.listaResolucion}">
		                                    <option value = "${tipos.CATRIBU}"
		                                        <c:if test="${tipos.CATRIBU == __formdata.CRESOLU}">selected</c:if>>
		                                        ${tipos.TATRIBU}
		                                    </option>
		                                </c:forEach>
		                            </select>
		                        </td> 
		                        <td class="campocaja"  id="FNUEVA_td">
		                            <axis:visible f="axissin071" c="FNUEVA">
		                            <input   type="text"  class="campowidthinput campo campotexto" id="FNUEVA"  name="FNUEVA"  style="width:40%" 
		                            alt="<axis:alt c="FNUEVA" f="axissin071" lit="9909248"/>" title="<axis:alt c="FNUEVA" f="axissin071" lit="9909248" />"
		                                <axis:atr f="axissin071" c="FNUEVA" a="modificable=true&formato=fecha&obligatorio=false"/> 
		                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNUEVA}"/>"/>                                    
		                            <a style="vertical-align:middle;" id="icon_FNUEVA"><img id="popup_calendario_FNUEVA" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
		                            </axis:visible>
		                        </td> 
		                    </tr>
		                    <tr>
		                        <td class="titulocaja">
		                            <b><axis:alt c="TRESULT" f="axissin071" lit="9909249" /></b>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td colspan="6" style="width:100%;" class="campocaja">
		                            <axis:ocultar c="TRESULT" f="axissin071" dejarHueco="false">
		                            <textarea maxlength="500" class="campowidthinput campo campotexto" style="width:100%;" name="TRESULT" id="TRESULT">${__formdata.TRESULT}</textarea>
		                            </axis:ocultar>
		                        </td>
		                    </tr>
		                    
		                </table>
               		</td>
           		</tr>
			</table>		
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axissin071</c:param>
                <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axissin071">,cancelar</axis:visible><axis:visible c="BT_ACEPTAR" f="axissin071">,aceptar</axis:visible></c:param>
                </c:import>
        </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCITACION",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCITACION", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FNUEVA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNUEVA", 
                singleClick    :    true,
                firstDay       :    1
            });
		</script>    
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
</html>