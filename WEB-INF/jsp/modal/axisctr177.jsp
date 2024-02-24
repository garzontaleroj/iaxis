<%/* Revision:# bLHQDbQujNjppwWbOBezww== # */%>
<%-- * Fichero: axisctr177.jsp * datos beneficiarios a nivel de riesgo *--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
       function  f_abrir_axisper005(faceptar, SPERSON) {
            // Si SPERSON está informado, quiere decir que modificamos una persona.
            f_abrir_modal("axisper005", false, "&faceptar=" + faceptar + "&SPERSON=" + SPERSON+"&ORIGEN=AXISCTR177");
      
        }
        
        function f_aceptar_axisper005(faceptar, SPERSON) {
          objUtiles.cerrarModal("axisper005");
           //if (!objUtiles.estaVacio(faceptar) && faceptar.indexOf("axisper005") > 0) {
               objUtiles.ejecutarFormulario ("modal_axisctr177.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
           //}
        }
        
        function f_cerrar_axisper005() {
            objUtiles.cerrarModal("axisper005");
        }
        
    
        <!-- 34866/209952  -->
	function f_setDefaultTipoContingencia() {
            var x = document.getElementById("CTIPOCON");
            if (x) {
		for (i=0; i<x.length; i++) {
                    if (x.options[i].value == "1") {   // Death is default
			x.selectedIndex = i;
                    }
		}
            }
        }   
        
        function f_onload_axisctr177() {
           f_cargar_propiedades_pantalla();
           
           f_setDefaultTipoContingencia();
                       
            var grabarOK = '${requestScope.grabarOK}';
			
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
               parent.f_cerrar_axisctr177();
                
        }
                
        function f_but_aceptar() {
             if (objValidador.validaEntrada()) {           
                //objUtiles.ejecutarFormulario("modal_axisctr177.do", "altamodi", document.miForm, "_self", objJsMessages.jslit_cargando);             
                var PPARTICIP = objDom.getValorPorId("PPARTICIP");
                var VALORformateado=objNumero.formateaNumero(PPARTICIP, true);
                var numericoVALOR=hacerNumerico(VALORformateado);
				if (document.miForm.CPAREN && document.miForm.CPAREN.disabled ){
                    document.miForm.CPAREN.disabled ="";
                    }
                if (document.miForm.CTIPBEN && document.miForm.CTIPBEN.disabled){
                    document.miForm.CTIPBEN.disabled="";
                }
                if(0 <= numericoVALOR && numericoVALOR <= 100){
                    objUtiles.ejecutarFormulario("modal_axisctr177.do?PPARTICIPdep="+document.miForm.PPARTICIP.value, "altamodi", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                    alert("<axis:alt f="axisctr177" c="LIT_1000390" lit="1000390"/>");
                    objDom.setValorPorId("PPARTICIP","");
                    $("#PPARTICIP").focus();
                }
            }
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_axisctr177();
        }    
        
        function f_mod_ctipben(thiss){
        	
        	f_cargar_propiedades_pantalla();
        	
        	if (thiss.value == 3 )
        		document.miForm.SPERSON_TIT.value = 0;
        }
        
         /* *********************************************************************************************** */
         /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            objUtiles.cerrarModal(cual);
            objDom.setValorPorId("params",params);
            
            if (cual == 'axisadm001')
                objUtiles.ejecutarFormulario("axis_axisadm002.do" + params , "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function hacerNumerico(miDato) {
           var miDatoStripped=objNumero.stripNonNumeric(miDato);
           if (miDatoStripped.indexOf(objNumero.getSeparadorDecimales())>=0) { //separador decimal ha sido una ",", hay q cambiarlo a un punto
               miDatoStripped=objNumero.cambiarSeparadorDecimalesPorMiles(miDatoStripped);
           }
           return (eval(miDatoStripped));
        } 
        
        function f_validar_checkbox(cual){
        } 
    </script>
    </head>
    <body onload="f_onload_axisctr177()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif" />
        </c:import>
    <form name="miForm" action="modal_axisctr177.do" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}" />
            <input type="hidden" id="NORDEN" name="NORDEN" value="${__formdata.NORDEN}" />
            <input type="hidden" name="SPERSON" value="${__formdata.map_get_beneident_r.SPERSON}" />
			<input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />


<br />


            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr177" c="LIT_NOMBRE_PANTALLA" lit="9902578"/></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisctr177</c:param>
            </c:import>
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0" style="height:130px">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr177" c="TITULO" lit="9902579"/></div>
                        <table class="area">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                            </tr>

                            <tr>
                                <axis:ocultar f="axisctr177" c="TTIPIDE" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_TTIPIDE"><axis:alt f="axisctr177" c="ALT_TTIPIDE" lit="109774"/></b></td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="NNUMIDE" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_NNUMIDE"><axis:alt f="axisctr177" c="ALT_NNUMIDE" lit="105330"/></b></td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="NOMBRE_BEN" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_NOMBRE_BEN"><axis:alt f="axisctr177" c="ALT_NOMBRE_BEN" lit="105940"/></b></td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="CTIPBEN" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_CTIPBEN"><axis:alt f="axisctr177" c="LIT_CTIPBEN" lit="9901522"/></b></td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr177" c="TTIPIDE" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" title="<axis:alt f="axisctr177" c="ALT_TTIPIDE" lit="109774"/>" readonly="readonly" name="TTIPIDE" id="TTIPIDE" class="campo" value="${__formdata.map_get_beneident_r.TTIPIDE}" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="NNUMIDE" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" title="<axis:alt f="axisctr177" c="ALT_NNUMIDE" lit="105330"/>"  class="campowidthinput campo campotexto" style="width:80%;"  size="15"  name="NNUMIDE" id="NNUMIDE"  value="${__formdata.map_get_beneident_r.NNUMIDE}"  <axis:atr f="${pantalla}" c="NNUMIDE" a="modificable=false"/> />
                                   
                                </axis:ocultar>
                                
                                <axis:visible f="${pantalla}"
                                                          c="BT_EDITAR_PER">
                                                <a id="tomadores_abrir_axisper005_a"
                                                   style="visibility:true"
                                                   href="javascript:f_abrir_axisper005('f_aceptar_beneficiario_axisper005',${__formdata.map_get_beneident_r.SPERSON})">
                                                    <img border="0"
                                                         alt='<axis:alt f="axisctr177" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         title='<axis:alt f="axisctr177" c="ICO_EDIT_PER" lit="1000214"/>'
                                                         src="images/lapiz.gif"/>
                                                </a>
                                            </axis:visible>
                                
                                    </td>
                                            
                                <axis:ocultar f="axisctr177" c="NOMBRE_BEN" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" title="<axis:alt f="axisctr177" c="ALT_NOMBRE_BEN" lit="105940"/>" readonly="readonly" name="NOMBRE_BEN" id="NOMBRE_BEN" class="campo" value="${__formdata.map_get_beneident_r.NOMBRE_BEN}" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="CTIPBEN" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name="CTIPBEN" title='<axis:alt f="axisctr177" c="LIT_CTIPBEN" lit="9901522"/>' onchange= "f_mod_ctipben(this)" id="CTIPBEN" class="campo" style="width:140px" obligatorio="true" <axis:atr f="axisctr177" c="CTIPBEN" a="modificable=true&isInputText=false"/>>
                                            <option value=""> -  <axis:alt f="axisctr177" c="LIT_CTIPBEN_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.lista_detvalores_ctipben}" var="item">
                                            <option value="${item.CATRIBU}" <c:if test="${__formdata.map_get_beneident_r.CTIPBEN==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            <tr>
                                <axis:ocultar f="axisctr177" c="CPAREN" dejarHueco="false">
                                    <td class="titulocaja" colspan="2">
                                        <b id="label_CPAREN"><axis:alt f="axisctr177" c="CPAREN" lit="9902580"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisctr177" c="CESTADO" dejarHueco="false">
                                    <td class="titulocaja" >
                                        <b id="label_CESTADO"><axis:alt f="axisctr177" c="CESTADO" lit="9000793"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="PPARTICIP" dejarHueco="false">
                                    <td class="titulocaja"> 
                                        <b id="label_PPARTICIP"><axis:alt f="axisctr177" c="PPARTICIP" lit="9902581"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="CTIPOCON" dejarHueco="false">
                                    <td class="titulocaja"> 
                                        <b id="label_CTIPOCON"><axis:alt f="axisctr177" c="CTIPOCON" lit="9908160"/></b>
                                    </td>
                                </axis:ocultar>                                
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr177" c="CPAREN" dejarHueco="false">
                                    <td class="campocaja" colspan="2">
                                        <select name="CPAREN" id="CPAREN" title = '<axis:alt f="axisctr177" c="CPAREN" lit="9902580"/>' class="campo" obligatorio="true" <axis:atr f="axisctr177" c="CPAREN" a="modificable=true&isInputText=false"/>>
                                            <option value=""> - <axis:alt f="axisctr177" c="LIT_CPAREN_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.lista_detvalores_capren}" var="item">
                                            <option value="${item.CATRIBU}" <c:if test="${__formdata.map_get_beneident_r.CPAREN==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr177" c="CESTADO" dejarHueco="false">
                                    <td class="campocaja" >
                                        <select name="CESTADO" title = '<axis:alt f="axisctr177" c="CESTADO" lit="9000793"/>' id="CESTADO" <axis:atr f="axisctr177" c="CESTADO" a="modificable=true&obligatorio=true"/> class="campo">
                                            <option value=""> - <axis:alt f="axisctr177" c="LIT_CESTADO_SELECCIONE" lit="9000793"/> - </option>
                                            <c:forEach items="${__formdata.ejecuta_detvalores_cestado}" var="item">
                                            <option value="${item.CATRIBU}" <c:if test="${__formdata.map_get_beneident_r.CESTADO==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                           
                                <axis:ocultar f="axisctr177" c="PPARTICIP" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" title = "<axis:alt f="axisctr177" c="PPARTICIP" lit="9902581"/>"  id="PPARTICIP" name="PPARTICIP" value="${__formdata.map_get_beneident_r.PPARTICIP}" formato="decimal" style="width:80px" <axis:atr f="axisctr177" c="PPARTICIP" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisctr177" c="CTIPOCON" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name="CTIPOCON" title='<axis:alt f="axisctr177" c="LIT_CTIPOCON" lit="9901522"/>'  id="CTIPOCON" class="campo" style="width:140px" obligatorio="false" <axis:atr f="axisctr177" c="CTIPOCON" a="modificable=true&isInputText=false"/>>
                                            <option value=""> -  <axis:alt f="axisctr177" c="LIT_CTIPOCON_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.lista_detvalores_ctipocon}" var="item">
                                            <option value="${item.CATRIBU}" <c:if test="${__formdata.map_get_beneident_r.CTIPOCON==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                 
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr177" c="SPERSON_TIT" dejarHueco="false">
                                    <td class="titulocaja" colspan="3">
                                        <b id="label_SPERSON_TIT"><axis:alt f="axisctr177" c="SPERSON_TIT" lit="9902583"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr177" c="SPERSON_TIT" dejarHueco="false">
                                    <td class="campocaja" colspan="3">
                                        <select name="SPERSON_TIT" title = '<axis:alt f="axisctr177" c="SPERSON_TIT" lit="9902583"/>' id="SPERSON_TIT" <axis:atr f="axisctr177" c="SPERSON_TIT" a="modificable=true&obligatorio=true"/> class="campo">
                                            <option value=""> - <axis:alt f="axisctr177" c="LIT_SPERSON_TIT_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.list_get_beneident_tit}" var="item">
                                                <option value="${item.OB_IAX_BENEIDENTIFICADOS.SPERSON}" <c:if test="${__formdata.map_get_beneident_r.SPERSON_TIT==item.OB_IAX_BENEIDENTIFICADOS.SPERSON}">selected</c:if>> ${item.OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN} </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                          
                        </table>
                    </td>
                </tr>
            </table>
            
<c:import url="../include/modal_estandar.jsp">
	<c:param name="titulo"><axis:alt f="axisctr177" c="TIT_AXISPER005" lit="9902578" /></c:param>
	<c:param name="nid" value="axisper005" />
</c:import>            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr177</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>