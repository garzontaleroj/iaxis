<%/*
*  Fichero: axiscaj003.jsp
*
*  Fecha: 04/07/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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
    <script type="text/javascript">
		function f_onload() {
            f_cerrar_axiscaj015();
			f_cargar_propiedades_pantalla();
		}
		function  f_abrir_axisper008() {
			objUtiles.abrirModal("axisper008", "src", "modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008&ORIGEN=AXISCAJ003" );
		}
		
		function f_aceptar_mtn_axisper008 (selectedPerson,selectedAgent){
        //    objDom.setValorPorId ("CAGENTE", selectedAgente);
			//alert("f_aceptar_mtn_axisper008\n"+"selectedPerson:"+selectedPerson+"\nselectedAgent:"+selectedAgent);
			obtenerPersona(selectedPerson, selectedAgent); 
			
			f_cerrar_axisper008();
            //document.miForm.CAGENTE.value = selectedAgent;
        }
		
		function f_cerrar_axisper008(){
			objUtiles.cerrarModal("axisper008");
            
		}
        function f_borrar_campos(){
                    objDom.setValorPorId("NPOLIZA","");
                     objDom.setValorPorId("ITEM","");
                      objDom.setValorPorId("NRECIBO","");
                       objDom.setValorPorId("NNUMIDE","");
                        objDom.setValorPorId("TNOMBRE","");
                        objDom.setValorPorId("SPERSON","");
                        objDom.setValorPorId("FEMISIO","");
                         objDom.setValorPorId("CMONOPE","<%= Integer.MIN_VALUE %>");
                         $('input[name=tomador]').attr('checked',false);
                         $('input[name=asegurado]').attr('checked',false);
                         $('input[name=pagador]').attr('checked',false);
                               
                             
        }
		function f_cerrar_modal(pantalla){
			objUtiles.cerrarModal(pantalla);
		}
		
		function f_but_aceptar(){
			if (!objValidador.validaEntrada()) {
				return false;
			}
			$.ajax({ //Comunicación jQuery hacia Strut
			type: "POST",
			url: "axis_axiscaj003.do",
			data: {
				operation:"ajax_ins_pago_inicial",
				SPERSON:$("#SPERSON").val(),
				SPRODUC:$("#SPRODUC").val(),
				CMEDMOV:$("#CMEDMOV").val(),
				NCHEQUE:$("#NCHEQUE").val(),
				CBANTRANS:$("#CBANTRANS").val(),
				IMOVIMI:$("#IMOVIMI").val(),
				CMONOPE:$("#CMONOPE").val(),
				CTIPCOB:$("#CTIPCOB").val()
			},
			dataType: "html",
			success: function(ajaxResponseText){
				callbackAjaxInsPagoInicial(ajaxResponseText);
			},
			error: function(xml,msg){
				alert("error: "+ xml +"\n\n msg:" +msg );
			}
			});
		   
		}
	
	
	function f_buscar_recibos(){
        if (!objValidador.validaEntrada()) {
                    return false;
                }
		//objAjax.invokeAsyncCGI("axis_axiscaj003.do?", callbackAjaxObtenerPersona, "operation=busqueda_recibos", this, objJsMessages.jslit_cargando);
        NRECIBO=$("#NRECIBO").val();
		NPOLIZA=$("#NPOLIZA").val();
		ITEM=$("#ITEM").val();
		CMONOPE=$("#CMONOPE").val();
		TIPO=$("#TIPO_PERS").val();
		SPERSON=$("#NNUMIDE").val();
        FEMISIO=$("#FEMISIO").val();

		objUtiles.abrirModal("axiscaj015", "src", "modal_axiscaj015.do?operation=form&ORIGEN=AXISCAJ003&NRECIBO="+NRECIBO+"&NPOLIZA="+
				NPOLIZA+"&ITEM="+ITEM+"&CMONOPE="+CMONOPE+"&TIPO="+TIPO+"&NNUMIDE="+SPERSON+"&FEMISIO="+FEMISIO);
		//objUtiles.abrirModal("axiscaj015", "src", "modal_axiscaj015.do?operation=form&ORIGEN=AXISCAJ003" ); */
	}
	
	function f_cerrar_axiscaj015(){
		objUtiles.cerrarModal("axiscaj015");
		
	}
	
	function callbackAjaxObtenerRecibos(ajaxResponseText){
		var doc=objAjax.domParse(ajaxResponseText);
		alert("doc:"+doc);
	}
	
    
			
	function obtenerPersona(selectedPerson, selectedAgent){
		//alert("obtenerPersona In");
		objAjax.invokeAsyncCGI("axis_axiscaj003.do?", callbackAjaxObtenerPersona, "operation=ajax_obtener_persona&SPERSON="+selectedPerson+
							"&CAGENTE="+selectedAgent, this, objJsMessages.jslit_cargando);
		objDom.setValorPorId ("SPERSON", selectedPerson);
		//alert("obtenerPersona Out");
	}
	
	function callbackAjaxObtenerPersona(ajaxResponseText){
      var NNUMIDE = "";
      var NOMBRE ="";
      var TDIGITOIDE="";
      var result="";
        if (window.DOMParser)
        {
                  doc = objAjax.domParse(ajaxResponseText);
                  try{
                   //NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                        result = doc.evaluate('/ajax/__node/OBPERSONA/__node/NNUMIDE', doc, null, XPathResult.STRING_TYPE, null);
                        NNUMIDE=  result.stringValue;
                  }catch(e){}
                  
                  try{
                   //NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
                        result = doc.evaluate('/ajax/__node/OBPERSONA/__node/TNOMBRE', doc, null, XPathResult.STRING_TYPE, null);
                        NOMBRE = result.stringValue;
                        }catch(e){}
                  try{
                   //NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
                  result = doc.evaluate('/ajax/__node/OBPERSONA/__node/TAPELLI1', doc, null, XPathResult.STRING_TYPE, null);
                       NOMBRE+=" " +result.stringValue;
                        }catch(e){}
                  try{
                  // NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
                  result = doc.evaluate('/ajax/__node/OBPERSONA/__node/TAPELLI2', doc, null, XPathResult.STRING_TYPE, null);
                        NOMBRE+=" " +result.stringValue;
                        }catch(e){}
        }
        else 
        {
             try {
                    doc = new ActiveXObject("Microsoft.XMLDOM");
                    doc.async = "false";
                    doc.loadXML(ajaxResponseText);
                 } catch (e) {
                   try {
                        parser = new DOMParser();
                        doc = parser.parseFromString(ajaxResponseText, "text/xml");
                        } catch (e) {
                            alert(e.message);
                            return;
                        }
                    }

          if(doc != null){
            var _node1_tag = doc.getElementsByTagName("ajax")[0].getElementsByTagName("__node");
            for(var x = 0; x <= _node1_tag[0].childNodes.length; x++){
                if(_node1_tag[0].childNodes[x].nodeName == "OBPERSONA"){
                    _obpersona2 = _node1_tag[0].childNodes[x];
                    break;
                }
            }
            if(_obpersona2 != null && _obpersona2.nodeName == "OBPERSONA"){
                var _node2 = _obpersona2.childNodes[0];
                for(var j=0; j<_node2.childNodes.length; j++){
                    if(_node2.childNodes[j].tagName == "NNUMIDE"){
                        var _nnumide = _node2.childNodes[j];
                        if(_nnumide != null && _nnumide.childNodes[0] && _nnumide.childNodes[0].nodeValue){
                            NNUMIDE = _nnumide.childNodes[0].nodeValue;
                            
                        }
                    }
                    if(_node2.childNodes[j].tagName == "TNOMBRE"){
                        var _tnombre = _node2.childNodes[j];
                        if(_tnombre != null && _tnombre.childNodes[0] && _tnombre.childNodes[0].nodeValue){
                            NOMBRE = _tnombre.childNodes[0].nodeValue;
                            
                        }
                    }
                    if(_node2.childNodes[j].tagName == "TAPELLI1"){
                        var _tapelli1 = _node2.childNodes[j];
                        if(_tapelli1 != null && _tapelli1.childNodes[0] && _tapelli1.childNodes[0].nodeValue){
                            NOMBRE +=" "+ _tapelli1.childNodes[0].nodeValue;
                        }
                    }
                    if(_node2.childNodes[j].tagName == "TAPELLI2"){
                        var _tapelli2 = _node2.childNodes[j];
                        if(_tapelli2 != null && _tapelli2.childNodes[0] && _tapelli2.childNodes[0].nodeValue){
                            NOMBRE +=" "+ _tapelli2.childNodes[0].nodeValue;
                            
                        }
                    }
                 }
            
             }
          }
        }
      objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE) + TDIGITOIDE);
      objDom.setValorPorId ("TNOMBRE", NOMBRE);
     }
 
 function f_checkea_persona(tipo){
        
         if (tipo == 1)
            {
            document.getElementById("tomador").checked=true;
            document.getElementById("asegurado").checked=false;
            document.getElementById("pagador").checked=false;
            }
         else if (tipo == 2) 
            {
            document.getElementById("tomador").checked=false;
            document.getElementById("asegurado").checked=true;
            document.getElementById("pagador").checked=false;
            }
         else if (tipo == 3) 
            {
            document.getElementById("tomador").checked=false;
            document.getElementById("asegurado").checked=false;
            document.getElementById("pagador").checked=true;
            }  
            
        objDom.setValorPorId("TIPO_PERS",tipo);
               
        }
		
	function f_cambiar(){
		f_cargar_propiedades_pantalla();
	}
	function f_cleanInvalidChars(idobject){
		var value="";
		value=f_stripInvalidChars(objDom.getValorPorId(idobject));
		objDom.setValorPorId(idobject,value);
	}
	
	function f_but_salir(){
		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj003", "cancelar", document.miForm, "_self");            
	}
	
	var monto_pagar = 0;
	function f_onclickCheckRebut(input){
		 if (input.checked){
			  monto_pagar += input.value;
			  
		 }else {
			  monto_pagar -= input.value;
		 }
		 $("#MONPAG").val(monto_pagar);
	}
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()"<axis:visible f="axiscaj003" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }" </axis:visible>>
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axiscaj003.do" method="POST">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axiscaj003" c="TITULO" lit="1000552"/></c:param>
            <c:param name="formulario"><axis:alt f="axiscaj003" c="TITULO" lit="1000552"/></c:param>
            <c:param name="form">axiscaj003</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo"><axis:alt c="titulo14" f="axiscaj003" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisper008|<axis:alt f="axiscaj003" c="MODAL_AXISper008" lit="1000065" /></c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axiscaj015|<axis:alt f="axiscaj015" c="MODAL_AXISCAJ015" lit="9906266" /></c:param>
		</c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">   
        <input type="hidden" name="LSSELRECIBOS" id="LSSELRECIBOS" value="${__formdata.LSSELRECIBOS}"/>
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="TIPO_PERS" name="TIPO_PERS" value="${__formdata.TIPO_PERS}"/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" name="CCONDICION" id="CCONDICION" value="${__formdata.CCONDICION}" > 
        <input type="hidden" name="TCONDICION" id="TCONDICION" value="${__formdata.TCONDICION}" >

        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                        </tr>
                        <tr>
                             <td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="POLIZA" lit="100836"/></b> <%-- Pòlissa --%>
                                <b id="label_NCERTIF" style="visibility:hidden"><axis:alt f="axiscaj003" c="CERTIFICADO" lit="101300"/></b> <%-- Certificat --%>
                            </td>
							<td class="titulocaja">
                                <b>Item</b> <%-- Item --%>
                            </td>
							<td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="REBUT" lit="800636"/></b> <%-- Nº Rebut --%>
                            </td>
                            <axis:ocultar f="axiscaj003" c="FEMISIO" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="FEMISIO_TIT" lit="9906996"/></b> <%-- Fecha Pago --%>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                             
							<td class="campocaja">                             
								<input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
								title="<axis:alt f="axiscaj003" c="NPOLIZA" lit="100836"/>" <axis:atr f="axiscaj003" c="NPOLIZA" a="formato=entero"/> />
						   </td>
							<td class="campocaja">                             
								<input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.ITEM}" name="ITEM" id="ITEM"
								title="<axis:alt f="axiscaj003" c="ITEM" lit="800636"/>" <axis:atr f="axiscaj003" c="ITEM" a="formato=entero"/> />
						   </td>							   
						   <td class="campocaja">                             
								<input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
								title="<axis:alt f="axiscaj003" c="NRECIBO" lit="800636"/>" <axis:atr f="axiscaj003" c="NRECIBO" a="formato=entero"/> />
						   </td>
                           <axis:ocultar f="axiscaj003" c="FEMISIO" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIO}"/>" name="FEMISIO" id="FEMISIO"
                                title="<axis:alt f="axiscaj003" c="FEMISIO" lit="9906996"/>"
                                <axis:atr f="axiscaj003" c="FEMISIO" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIO" alt="<axis:alt f="axiscaj003" c="FEMISIO" lit="9906996"/>" title="<axis:alt f="axiscaj003" c="FEMISIO" lit="9906996"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:8.6%;height:0%;"/>
                            <th style="width:8.4%;height:0%;"/>
                        </tr>
                        <tr>
                            <td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                            </td>                             
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axiscaj003" c="TNOMBRE" lit="1000560"/> <axis:alt f="axiscaj003" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                            </td>                            
                            <td class="titulocaja">
                                <input type="radio" id="tomador" name="tomador" onclick="f_checkea_persona(1)"                                
                                <c:if test="${__formdata['tomador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
							
                        </tr>
                        <tr>
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                <axis:atr f="axiscaj003" c="NNUMIDE" a="obligatorio=false"/>" style="width:50%;"
                                title="<axis:alt f="axiscaj003" c="NNUMIDE2" lit="1000559"/>" />
                                        
                            </td>
                            <td class="campocaja" colspan="3">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                <axis:atr f="axiscaj003" c="TNOMBRE" a="obligatorio=false" /> "  style="width:80%;"/>
                                        &nbsp;<img border="0" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="CAMPO003" lit="101028"/></b> <%-- Assegurat --%>                                
                            </td>      
                            <td class="titulocaja">
                                <input type="radio" id="asegurado" name="asegurado" onclick="f_checkea_persona(2)"
                                <c:if test="${__formdata['asegurado'] == 'on'}">checked</c:if>/>
                            </td>
                        </tr>
						<tr>
                         <td class="titulocaja" colspan = "4">
                            <td class="titulocaja">
                                <b><axis:alt f="axiscaj003" c="PAGADOR" lit="9903157"/></b> <%-- Pagador --%>
                            </td>
                             <td class="titulocaja">
                                <input type="radio" id="pagador" name="pagador" onclick="f_checkea_persona(3)"                               
                                <c:if test="${__formdata['pagador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                        </tr>
						<tr>
							<td class="titulocaja">
							   <b><axis:alt f="axiscaj003" c="CMONOPE" lit="108645"/></b>
							</td>
						</tr>
						<tr>							
							<td class="campocaja">
								<select name="CMONOPE" id="CMONOPE" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
									title="<axis:alt f="axiscaj001" c="CMONOPE" lit="108645"/>"
									<axis:atr f="axiscaj001" c="CMONOPE" a="obligatorio=true&isInputText=false"/> ">
									<option value="<%= Integer.MIN_VALUE %>">
										<axis:alt f="axiscaj001" c="SELECCIONAR" lit="108341"/>                                
									</option>
									<c:forEach var="lstmoneda" items="${__formdata.MONEDAS}">
										<option value="${lstmoneda.CMONEDA}"
										<c:if test="${__formdata.CMONOPE == lstmoneda.CMONEDA}">selected</c:if>>
										${lstmoneda.TMONEDA}
										</option>
									</c:forEach>
								</select>
							</td>
							
						</tr>						
                        <tr>
                            <td align="center" colspan="5">
                                <div class="separador">&nbsp;</div>
                                <input type="button" class="boton" value="<axis:alt f="axiscaj003" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                 
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" class="boton" value="<axis:alt f="axiscaj003" c="CAMPO005" lit="9903614"/>" onclick="f_buscar_recibos()" />
                                 
                                <div class="separador">&nbsp;</div>
                            </td>
                            
                          
                          
                        </tr>
                  
                                       
                    </table>
                </td>
            </tr>


        </table>
        
      
      <c:import url="../include/botonera_nt.jsp">
		<c:param name="f">axiscaj003</c:param>
		<c:param name="__botones"><axis:ocultar f="axiscaj003" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
      </c:import>
        
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEMISIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEMISIO", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEMISIOINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEMISIOINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEMISIOFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEMISIOFIN",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FEFEINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFEINI",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FEFEFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFEFIN",  
            singleClick    :    true,
            firstDay       :    1
        });        
    </script>




</body>
</html>