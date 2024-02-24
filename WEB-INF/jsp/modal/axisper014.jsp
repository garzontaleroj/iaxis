<%/* Revision:# FTOyiuZb2yRkXBo7zVKwkA== # */%>
<%-- 
*  Fichero: axisper014.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
<script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
        
        function f_onload_axisper014() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper014');
					</c:if>
             var grabarOK = '${requestScope.grabarOK}';

                
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisper014("${__formdata.SPERSON}");             
                // Se ha grabado correctamente la CCC
                // Cerrar modal y volver a la pantalla padre
              f_cargar_propiedades_pantalla();  
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
        function f_but_aceptar2() {
            f_habilitar_campos();
            //if (objValidador.validaEntrada()) {
              //       if(document.axisper014Form.FVENCIM && (document.axisper014Form.FVENCIM.value==null || document.axisper014Form.FVENCIM.value=='')){
              //          alert("<axis:alt f="axisper014" c="CBANCAR_TIT" lit="9902663"/>");
              //      }else{
                        objUtiles.ejecutarFormulario("modal_axisper014.do", "grabarCCC", document.axisper014Form, "_self", objJsMessages.jslit_cargando);   
              //      }

           // }
        }
        
        function f_but_aceptar(){
            //Bug 0028612 - RCL - 22/10/2013 - Abans de validaEntrada, habilitem el camp FVENCIM, ja que els readonly no es validen.
            $("#FVENCIM").removeAttr("readonly");
            if (objValidador.validaEntrada()) {
                     if(document.axisper014Form.FVENCIM && (document.axisper014Form.FVENCIM.value==null || document.axisper014Form.FVENCIM.value=='')){
                        alert("<axis:alt f="axisper014" c="CBANCAR_TIT" lit="9902663"/>");
                    }else{
                        
                        if(objDom.esVisible('CPAGSIN') ){
                            var dd = document.axisper014Form.CPAGSIN.value;
                            if(objUtiles.estaVacio(dd)){
                                dd = 0;
                            }
                            if(dd == 0){
                                objAjax.invokeAsyncCGI('modal_axisper014.do', callbackAjaxAceptar, 'operation=ajax_ValidarPago&SPERSON=' + document.axisper014Form.SPERSON.value + '&CAGENTE=' + document.axisper014Form.CAGENTE.value, this);
                            }
                            else{
                                f_but_aceptar2();
                            }
                        }
                        else
                            f_but_aceptar2();
                    }
            }
            else
            {
                //Bug 0028612 - RCL - 22/10/2013 - Si hi ha algun error en la validacio, retornem readonly a FVENCIM
                $("#FVENCIM").attr("readonly", true);
            }
        }
        
        function callbackAjaxAceptar(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    // País
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("LITERAL")[0])) {
                       var literal = objDom.getValorNodoDelComponente(doc.getElementsByTagName("LITERAL"), 0, 0)
                       
                       if (literal != 0)
                            alert(literal);
                        f_but_aceptar2();
                    }
                    else
                         f_but_aceptar2();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_but_cancelar() {
                parent.f_cerrar_axisper014();                
        }    
        
      
        
         function actualitzarCheckbox_1(obj){
           objDom.setValorPorId("CDEFECTO", ((objDom.getComponenteMarcado(obj))? "1" : "0" )); 
        }
        
         function actualitzarCheckbox_2(obj){
           objDom.setValorPorId("CPAGSIN", ((objDom.getComponenteMarcado(obj))? "1" : "0" )); 
        }
        
        
        function inicializaCBANCAR(){
            if(document.axisper014Form.CBANCAR){
                document.axisper014Form.CBANCAR.value = '';
            }
        }

    </script>
  
  
  </head>
  <body onload="f_onload_axisper014()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
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
  
 
    <form name="axisper014Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CNORDBAN"  value="${__formdata.CNORDBAN}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="TIPCCC" value="${__formdata.TIPCCC}"/>
        <input type="hidden" name="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" name="CTIPBANC" value="${__formdata.CTIPBAN}" /> <!-- Changes for IAXIS-4149 PK-18/07/2019 -->

        <c:if test="${__formdata.TIPCCC=='1'}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper014" c="FORMULARIO_TITLE" lit="1000213" /></c:param>
                <c:param name="producto"><axis:alt f="axisper014" c="PANTALLA_TITLE" lit="1000213" /></c:param>   
                <c:param name="form">axisper014</c:param>    
            </c:import>
        </c:if>
        <c:if test="${__formdata.TIPCCC=='2'}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper014" c="FORM_AD" lit="9902653" /></c:param>
                <c:param name="producto"><axis:alt f="axisper014" c="PANT_AD" lit="9902653" /></c:param>
                <c:param name="form">axisper014</c:param> 
            </c:import>
        </c:if>
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td> 
                
                    <!-- **************************************** CCC ******************************************* -->
                    <c:if test="${ __formdata.TIPCCC == null || __formdata.TIPCCC!='2'}">
                    <table class="seccion">
                        <tr>
                            <th style="width:16%;height:0px"></th>
                            <th style="width:16%;height:0px"></th>
                            <th style="width:16%;height:0px"></th>
                            <th style="width:16%;height:0px"></th>
                            <th style="width:16%;height:0px"></th>
                            <th style="width:16%;height:0px"></th>
                           
                        </tr>
                        <tr>
                        
                            <axis:ocultar f="axisper014" c="CTIPCC" dejarHueco="false">
                            <td class="titulocaja"><b><axis:alt f="axisper014" c="CTIPCC" lit="1000374"/></b></td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisper014" c="CTIPBAN" dejarHueco="false">
                            <td class="titulocaja"><b><axis:alt f="axisper014" c="CTIPBAN_TIT" lit="1000374"/></b></td>
                            </axis:ocultar>
                            <!--td class="campocaja" colspan="2">
                                <b><axis:alt f="axisper014" c="CBANCAR_TIT" lit="100965"/></b>
                            </td-->
                            <axis:ocultar f="axisper014" c="CBANCAR" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper014" c="CBANCAR" lit="100965"/></b>  <!-- Cuenta Bancaria -->
                                </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axisper014" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper014" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axisper014" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2" >
                                    <b><axis:alt f="axisper014" c="CCUENTA" lit="100965"/></b>  <!-- *** Cuenta Bancaria *** -->
                                </td>
                            </axis:ocultar> 
                            
                           
                            <td class="campocaja">
                                <b><axis:alt f="axisper014" c="CDEFEC_TIT" lit="100713"/></b>
                                <input onClick="javascript:actualitzarCheckbox_1(this)" <c:if test="${__formdata.CDEFECTO == 1}">checked="true"</c:if> 
                                type="checkbox" id="CDEFECTO" name="CDEFECTO" value="${__formdata.CDEFECTO}"/>
                            </td>
                            <axis:ocultar f="axisper014" c="CPAGSIN" dejarHueco="false">
                            <td class="campocaja">
                                <b id="label_CPAGSIN_TIT"><axis:alt f="axisper014" c="LIT_CPAGSIN_ALT" lit="100592"/></b>
                                <input onClick="javascript:actualitzarCheckbox_2(this)" <c:if test="${__formdata.CPAGSIN == 1}">checked="true"</c:if> 
                                type="checkbox" id="CPAGSIN" name="CPAGSIN" value="${__formdata.CPAGSIN}"/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                        
                            <axis:visible f="axisper014" c="CTIPCC">
                            <td class="campocaja" >
                                <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                        <axis:visible f="axisper014" c="CBANCAR">
                                        onchange="javascript:inicializaCBANCAR();"
                                        </axis:visible>
                                        title="<axis:alt f="axisper014" c="CTIPCC_LIT" lit="1000374"/>"
                                        <axis:atr f="axisper014" c="CTIPCC" a="obligatorio=true"/>
                                        <c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="CTIPCC_ALT2" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipBCC_cuentas}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible> 
                        
                           <axis:visible f="axisper014" c="CTIPBAN">
                            <td class="campocaja" >
                                <select name="CTIPBAN" id="CTIPBAN" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                        <axis:visible f="axisper014" c="CBANCAR">
                                        onchange="javascript:inicializaCBANCAR();"
                                         </axis:visible>
                                        title="<axis:alt f="axisper014" c="CTIPBAN_LIT" lit="1000374"/>"
                                        <axis:atr f="axisper014" c="CTIPBAN" a="obligatorio=true"/>
                                        <c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="CTIPBAN_ALT2" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                        <option value = "${element.CTIPBAN}" 
                                        <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                           ${element.TTIPO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                            
                            <axis:visible f="axisper014" c="CBANCAR">
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:99%;"
                                       title="<axis:alt f="axisper014" c="CBANCAR_LIT" lit="100965"/>"
                                       <axis:atr f="axisper014" c="CBANCAR" a="obligatorio=false"/>
                                       <c:if test="${ __formdata.MODO == 'MODIF'}">readonly</c:if>/>
                            </td>
                            </axis:visible>
                            
                            <axis:ocultar f="axisper014" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id="CBANCO"  <axis:atr f="axisper014" c="CBANCO" a="obligatorio=false&isInputText=false"/> title="<axis:alt f="axisper014" c="CBANCO_ALT1" lit="9000964"/>" 
                                     size="1" class="campowidthselect campo campotexto" style="width:99%;" 
                                     <c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axisper014" c="CCUENTA" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper014" c="CCUENTA"  a="obligatorio=false"/>  
                                    title="<axis:alt f="axisper014" c="CCUENTA_ALT" lit="100965"/>"  onkeypress="return ValidNum(event);"
                                    class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA}" 
                                    name="CCUENTA" id="CCUENTA" style="width:99%;"/>
                                </td>
                            </axis:ocultar>
                            
                            
                            
                          
                        </tr>                
                    </table>
					<!--  ************con este hidden conseguimos que al apretar return en un input, no lo valide******* -->
					<input style="visibility:hidden;display:none" type="text" name="XXXXXX" id="XXXXXX">
                    </c:if>
                    <!--  ******************************** **************** ******************************************** -->
                    
                    <!--  ******************************** SECCION TARJETA  ******************************************** -->
                    <c:if test="${__formdata.TIPCCC!=null && __formdata.TIPCCC=='2'}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper014" c="TARJETAS" lit="9902645"/></div>
                        <%-- Datos cuentas bancarias --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                            </tr>
                            <tr>
                                
                                
                                <axis:ocultar f="axisper014" c="CTIPCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper014" c="CTIPCC" lit="9902671"/></b> <!-- Tipo CC Tarjeta -->
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper014" c="CTIPBAN" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper014" c="CTIPBAN" lit="9902671"/></b> <!-- Tipo Tarjeta -->
                                </td>
                                </axis:ocultar>   
                                
                                <axis:ocultar f="axisper014" c="CBANCAR" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper014" c="CBANCAR" lit="9902646"/></b>  <!-- Num. Tarjeta -->
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper014" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper014" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper014" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper014" c="CCUENTA" lit="9902646"/></b>  <!-- *** Num. Tarjeta *** -->
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                
                                
                                   <axis:visible f="axisper014" c="CTIPCC">
                                    <td class="campocaja" >
                                        <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                               onchange="javascript:inicializaCBANCAR();"
                                                title="<axis:alt f="axisper014" c="CTIPCC_LIT" lit="9902671"/>"
                                                <axis:atr f="axisper014" c="CTIPCC" a="obligatorio=true&isInputText=false"/>
                                                <c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="CTIPCC_ALT2" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipBCC_tarjetas}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    </axis:visible> 
                                
                                
                                <axis:visible f="axisper014" c="CTIPBAN">
                                <td class="campocaja">
                                    <select name="CTIPBAN" id="CTIPBAN"  <axis:atr f="axisper014" c="CTIPBAN" a="obligatorio=true&isInputText=false"/> 
                                    title="<axis:alt f="axisper014" c="CTIPBAN_ALT1" lit="9902671"/>" size="1" 
                                    class="campowidthselect campo campotexto" style="width:99%;" 
                                    <c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipTARJETA}">
                                            <option value = "${element.CTIPBAN}" 
                                            <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                                ${element.TTIPO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper014" c="CBANCAR">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper014" c="CBANCAR"  a="obligatorio=false"/>  
                                    title="<axis:alt f="axisper014" c="CBANCAR_ALT" lit="9902646"/>"  
                                    class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR}" 
                                    name="CBANCAR" id="CBANCAR" style="width:80%;"
                                    <c:if test="${ __formdata.MODO == 'MODIF'}">readonly</c:if>/>
                                </td>
                                </axis:visible>
                                
                                <axis:ocultar f="axisper014" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id="CBANCO"  <axis:atr f="axisper014" c="CBANCO" a="obligatorio=false"/> 
                                    title="<axis:alt f="axisper014" c="CBANCO_ALT1" lit="9000964"/>" size="1" 
                                    class="campowidthselect campo campotexto" style="width:99%;" 
                                    <c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper014" c="CCUENTA" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper014" c="CCUENTA"  a="obligatorio=false"/>  
                                    title="<axis:alt f="axisper014" c="CCUENTA_ALT" lit="9902646"/>" onkeypress="return ValidNum(event);"  
                                    class="campowidthinput campo campotexto" maxlength="20" size="15" 
                                    value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" style="width:80%;"
                                    <c:if test="${ __formdata.MODO == 'MODIF'}">readonly</c:if>/>
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper014" c="FVENCIM" lit="100885"/></b> <!-- Fecha vencimiento -->
                                </td>
                                <axis:ocultar f="axisper014" c="TSEGURI" dejarHueco="false">

                                <td class="titulocaja">
                                    <b><axis:alt f="axisper014" c="TSEGURI" lit="9902634"/></b>  <!-- Cod. Seguridad -->
                                </td>
                              </axis:ocultar>
                            </tr>
                            
                            <tr>
                               
                                <td class="campocaja">
                                    <input type="text"  class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="MM/yyyy" value="${__formdata.FVENCIM}"/>" name="FVENCIM" id="FVENCIM"  style="width:65%;"
                                    <axis:atr f="axisper014" c="FVENCIM" a="obligatorio=true"/> readonly title="<axis:alt f="axisper014" c="FVENCIM_TIT" lit="100885"/>" /> 
                                    <img id="popup_FVENCIM" alt="<axis:alt f="axisper014" c="SEL_FVENCIM" lit="100885"/>" title="<axis:alt f="axisper014" c="ALT_FVENCIM" lit="100885" />" src="images/calendar.gif"/></a>
                                </td>
                                <axis:ocultar f="axisper014" c="TSEGURI" dejarHueco="false">
																	<td class="campocaja" colspan="2">
                                    <input type="text" <axis:atr f="axisper014" c="TSEGURI"/> title="<axis:alt f="axisper014" c="TSEGURI_ALT" lit="9902634" />" class="campowidthinput campo campotexto" size="15" value="${__formdata.TSEGURI}" name="TSEGURI" id="TSEGURI" style="width:60%;"/>
                                	</td>
                                </axis:ocultar>
                            </tr>
                            
                            
                        </table>
						<!--  ************con este hidden conseguimos que al apretar return en un input, no lo valide******* -->
						<input style="visibility:hidden;display:none" type="text" name="XXXXXX" id="XXXXXX">
                        </c:if>
                    
                    <!--  ********************************************************************************************** -->
                </td>
            </tr>
        </table>			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper014</c:param><c:param name="f">axisper014</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FVENCIM",     
                ifFormat       :    "%m/%Y",      
                button         :    "popup_FVENCIM", 
                singleClick    :    true,
                firstDay       :    1
            });    
        </script><!--%d/-->
 

    <c:import url="../include/mensajes.jsp" />
    </div>
   </body>
</html>


