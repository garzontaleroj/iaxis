<%/*
*  Fichero: axisctr072.jsp
*  Fecha: 20/05/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr072" c="TITPANT" lit="101807"/></title> <%-- Rehabilitación de Pólizas --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspace {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla();       
            if (objUtiles.estaVacio(objDom.getValorPorId("SSEGURO")))            
                f_abrir_modal("axisctr071", "&PTIPO=PERMITE_REHABILITA");
              else{
              	 <axis:visible f="axisctr072" c="IMPRIMIR" >
              	var grabarOk = "${grabarOk}";
              	
              	if (!objUtiles.estaVacio(grabarOk) && grabarOk == 'true')
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&TIPO=REHABILITACION&SEGURO=" + objDom.getValorPorId("SSEGURO"));          
              </axis:visible>
                }
                
                
        }
         function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                
            } 
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr072", "cancelar", document.miForm, "_self");
        }
        
        function f_but_9001649(){
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisctr072.do", "rehabilitar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

        function f_abrir_modal(cual, optionalQueryString, noXButton) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);        
        }

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_axisctr071(SSEGURO,COBJASE){                          
         objDom.setValorPorId("SSEGURO", SSEGURO);
         objDom.setValorPorId("COBJASE", COBJASE);
         objUtiles.cerrarModal("axisctr071");
         objUtiles.ejecutarFormulario("axis_axisctr072.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_9902515(){
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisctr072.do", "sol_rehabilitar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisctr213(){
            var NPOLIZA = document.miForm.NPOLIZA.value; 
            var SPRODUC = document.miForm.SPRODUC.value;
            var NCERTIF = document.miForm.NCERTIF.value;
            objUtiles.abrirModal("axisctr213","src","modal_axisctr213.do?operation=form&DONDE=AXISCTR072&SPRODUCSEL="+SPRODUC+"&NPOLIZASEL="+NPOLIZA+"&NCERTIFSEL="+NCERTIF);
        }
            
        function f_cerrar_axisctr213() {
            objUtiles.cerrarModal("axisctr213");
        }
        
        function f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM){ 
            objUtiles.cerrarModal("axisctr213");
            <axis:ocultar c="NCASO_BPM" f="NCASO_BPM" dejarHueco="false">
                document.miForm.NCASO_BPM.value = NCASO_BPM;
                document.miForm.NNUMCASO.value = NNUMCASO;
            </axis:ocultar>
            <axis:ocultar c="NSOLICI_BPM" f="axisctr016" dejarHueco="false">
                if (document.miForm.NCERTIF.value!=0) document.miForm.NSOLICI_BPM.value = NSOLICI_BPM;
            </axis:ocultar>
            f_cargar_casobpm();
        }
        
        function f_cargar_casobpm(){
        
            var NCASO_BPM = document.miForm.NCASO_BPM.value;
            var NSOLICI_BPM;                
            var NNUMCASO=null;
            document.miForm.NNUMCASO.value=null;
            document.miForm.TNOMCOM.value = "";
            
            if (!objUtiles.estaVacio(NCASO_BPM)){
                var NCERTIF = document.miForm.NCERTIF.value;
                if (NCERTIF !=0){
                   NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
                   if (objUtiles.estaVacio(NSOLICI_BPM)){
                       document.miForm.NSOLICI_BPM.focus();
                       return;
                    }
                }
                objAjax.invokeAsyncCGI("axis_axisctr072.do", callbackAjaxCargarCasoBPM, "operation=ajax_cargar_casobpm&NNUMCASO=" + NNUMCASO +"&NCASO_BPM="+NCASO_BPM+"&NSOLICI_BPM="+NSOLICI_BPM, this, objJsMessages.jslit_cargando);
            }
        }
        
        function callbackAjaxCargarCasoBPM (ajaxResponseText){
            //alert(ajaxResponseText);
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNOMCOM")[0])){
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNOMCOM"), 0, 0);
                    objDom.setValorPorId("TNOMCOM", NOMBREformateado); 
                }else{
                    
                    objDom.setValorPorId("TNOMCOM",""); 
                }
            }
        }
        
        function f_abrir_axisctr019() {
                document.miForm.FANULAC.value = '';
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisctr072" c="TITPANT" lit="101807"/></c:param>     <%-- Rehabilitación de Pólizas --%>
            <c:param name="formulario"><axis:alt f="axisctr072" c="TITPANT" lit="101807"/></c:param> <%-- Rehabilitación de Pólizas --%>
            <c:param name="form">axisctr072</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisctr071|<axis:alt f="axisctr072" c="BUSQPOL" lit="9001668"/><%-- Buscador de pólizas anuladas --%>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="LIT_IMPRIMIR" f="axisctr072" lit="1000205" /></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr213|<axis:alt c="axisctr213_TITULO" f="axisctr016" lit="9906011"/></c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>       
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="ANULA_EXTORN" name="ANULA_EXTORN" value="${__formdata.ANULA_EXTORN}"/>
        <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/>
        <input type="hidden" id="NNUMCASO" name="NNUMCASO" value="${NNUMCASO}"/>
        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${datosPoliza.SPRODUC}"/>
        <input type="hidden" id="grabarOk" name="grabarOk" value="${__formdata.grabarOk}"/>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr072" c="DATPOL" lit="104925"/><%-- Datos póliza --%> <img border="0" src="images/find.gif" onclick='f_abrir_modal("axisctr071", "&PTIPO=PERMITE_REHABILITA")' style="cursor:pointer" alt="<axis:alt f="axisctr072" c="BUSQ" lit="9000508"/>" title="<axis:alt f="axisctr072" c="BUSQ" lit="9000508"/>"/></div>

                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr072" c="NPOLIZA" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NPOLIZA"><axis:alt f="axisctr072" c="NPOLIZA" lit="9001514"/></b> <%-- Nº póliza --%>
                                            </td>
                                        </axis:ocultar>
                                        <td >
												<table cellspacing="0" cellpadding="0px" >
													<tr >
														<axis:ocultar f="axisctr072" c="NCERTIF" dejarHueco="false">
															<!-- Numero de CERTIF -->
															<td class="titulocaja"><b id="label_NCERTIF"><axis:alt
																		f="axisctr072" c="NCERTIF" lit="101168" /></b></td>
														</axis:ocultar>
														<!-- Numero de NRENOV BUG 39659 AAC-->

														<axis:visible f="axisctr072" c="NRENOVCOLM">
															<td class="titulocaja" width="50%"><b><axis:alt
																		f="axisctr072" c="NRENOVCOLM" lit="9908732" /></b></td>
														</axis:visible>
														<!-- BUG 39659 AAC -->
													</tr>
												</table>
											</td>
                                        <axis:ocultar f="axisctr072" c="TSITUAC" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_TSITUAC"><axis:alt f="axisctr072" c="TSITUAC" lit="100874"/></b> <%-- Situación --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr072" c="TPRODUC" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TPRODUC"><axis:alt f="axisctr072" c="TPRODUC" lit="100829"/></b> <%-- Producto --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>                 
                                        <axis:ocultar f="axisctr072" c="NPOLIZA" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" 
                                                <axis:atr f="axisctr072" c="NPOLIZA" a="modificable=false"/>
                                                value="${datosPoliza.NPOLIZA}" style="width:60%"
                                                title="<axis:alt f="axisctr072" c="NPOLIZA" lit="9001514"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <td>
												<table cellspacing="0" cellpadding="0px">
													<tr>
														<td><axis:ocultar f="axisctr072" c="NCERTIF" dejarHueco="false">
																<td class="campocaja">
																	<!-- Numero de certificado --> <input type="text"
																	class="campo campotexto" id="NCERTIF" name="NCERTIF"
																	size="3" style="width: 100%"
																	value="${datosPoliza.NCERTIF}" readonly="true" />

																</td>
															</axis:ocultar></td>
														<td>
															<!-- Numero de NRENOV BUG 39659 AAC--> <axis:visible
																f="axisctr072" c="NRENOVCOLM">
																<td class="campocaja" align="left" width="50%">
																	<!-- Numero de certificado --> <input type="text"
																	class="campo campotexto" id="NRENOVCOLM"
																	name="NRENOVCOLM" size="2" style="width: 90%" 
																	value="${datosPoliza.NRENOVCOLM}" readonly="true" />
																</td>
															</axis:visible> <!-- BUG 39659 AAC-->
														</td>
													</tr>
												</table>
											</td>
                                        <axis:ocultar f="axisctr072" c="TSITUAC" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15" 
                                                <axis:atr f="axisctr072" c="TSITUAC" a="modificable=false"/>
                                                value="${datosPoliza.TSITUAC}" style="width:60%"
                                                title="<axis:alt f="axisctr072" c="TSITUAC" lit="100874"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr072" c="TPRODUC" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15" 
                                                <axis:atr f="axisctr072" c="TPRODUC" a="modificable=false"/>
                                                value="${datosPoliza.TPRODUC}" style="width:90%"
                                                title="<axis:alt f="axisctr072" c="TPRODUC" lit="100829"/>"/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr072" c="FEFECTO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt f="axisctr072" c="FEFECTO" lit="100883"/></b> <%-- Fecha efecto --%>
                                            </td>
                                        </axis:ocultar>                                       
                                        <axis:ocultar f="axisctr072" c="FVENCIM" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt f="axisctr072" c="FVENCIM" lit="100885"/></b> <%-- Fecha vencimiento --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr072" c="FANULAC" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FANULAC"><axis:alt f="axisctr072" c="FANULAC" lit="140214"/></b> <%-- Fecha anul·lació --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr072" c="TMOTIVO" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TMOTIVO"><axis:alt f="axisctr072" c="TMOTIVO" lit="103218"/></b> <%-- Motiu anul·lació --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr072" c="FEFECTO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" 
                                                <axis:atr f="axisctr072" c="FEFECTO" a="modificable=false"/>
                                                value="<fmt:formatDate value="${datosPoliza.FEFECTO}" pattern="dd/MM/yyyy"/>"
                                                style="width:60%" title="<axis:alt f="axisctr072" c="FEFECTO" lit="100883"/>"/>
                                            </td>
                                        </axis:ocultar>                                    
                                        <axis:ocultar f="axisctr072" c="FVENCIM" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15" 
                                                <axis:atr f="axisctr072" c="FVENCIM" a="modificable=false"/>
                                                value="<fmt:formatDate value="${datosPoliza.FVENCIM}" pattern="dd/MM/yyyy"/>"
                                                style="width:60%" title="<axis:alt f="axisctr072" c="FVENCIM" lit="100885"/>"/>
                                            </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisctr072" c="FANULAC" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FANULAC" name="FANULAC" size="15" 
                                                <axis:atr f="axisctr072" c="FANULAC" a="modificable=false"/>
                                                value="<fmt:formatDate value="${datosPoliza.FANULAC}" pattern="dd/MM/yyyy"/>"
                                                style="width:60%" title="<axis:alt f="axisctr072" c="FANULAC" lit="140214"/>"/>
                                            </td>
                                        </axis:ocultar>    
                                         <axis:ocultar f="axisctr072" c="TMOTIVO" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TMOTIVO" name="TMOTIVO" size="35" style="width:90%"
                                                <axis:atr f="axisctr072" c="TMOTIVO" a="modificable=false"/>
                                                value="${datosPoliza.TMOTIVO}"
                                                title="<axis:alt f="axisctr072" c="TMOTIVO" lit="103218"/>"/>
                                            </td>
                                        </axis:ocultar>             
                                    </tr>                                       
                                    <tr>
                                         <axis:ocultar f="axisctr072" c="NSUPLEM" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_TSUPLEM"><axis:alt f="axisctr072" c="NSUPLEM" lit="9001641"/></b> <%-- Suplement --%>
                                            </td>
                                        </axis:ocultar>                                       
                                        <axis:ocultar f="axisctr072" c="FSUPLEM" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FSUPLEM"><axis:alt f="axisctr072" c="FSUPLEM" lit="1000149"/></b> <%-- Data suplement --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                         <axis:ocultar f="axisctr072" c="NSUPLEM" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NSUPLEM" name="NSUPLEM" size="15" 
                                                    <axis:atr f="axisctr072" c="NSUPLEM" a="modificable=false"/>
                                                    value="${datosPoliza.det_Poliza.NSUPLEM}"
                                                    style="width:60%" title="<axis:alt f="axisctr072" c="NSUPLEM" lit="9001641"/>"/>
                                                </td>
                                          </axis:ocultar>                                    
                                         <axis:ocultar f="axisctr072" c="FSUPLEM" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FSUPLEM" name="FSUPLEM" size="15" 
                                                    <axis:atr f="axisctr072" c="FSUPLEM" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${datosPoliza.FSUPLEM}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr072" c="FSUPLEM" lit="1000149"/>"/>
                                                </td>
                                         </axis:ocultar> 
                                    </tr>    
                                    <tr>      
                                      <axis:ocultar f="axisctr072" c="CAGENTE" dejarHueco="false">
                                            <td class="titulocaja" colspan="3">
                                                <b id="label_CAGENTE"><axis:alt f="axisctr072" c="CAGENTE" lit="100584"/></b> <%-- Suplement --%>
                                            </td>
                                        </axis:ocultar> 
                                        <axis:ocultar f="axisctr072" c="TACTIVI" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TACTIVI"><axis:alt f="axisctr072" c="TACTIVI" lit="103481"/></b> <%-- 103481 --%>
                                            </td>
                                        </axis:ocultar> 
                                    </tr>
                                    <tr>
                                      <axis:ocultar f="axisctr072" c="CAGENTE" dejarHueco="false">
                                            <td class="campocaja" colspan="3">
                                                <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" 
                                                <axis:atr f="axisctr072" c="CAGENTE" a="modificable=false"/>
                                                value="${datosPoliza.CAGENTE}" style="width:30%"
                                                title="<axis:alt f="axisctr072" c="CAGENTE" lit="100584"/>"/> 
                                                <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="15" 
                                                <axis:atr f="axisctr072" c="TAGENTE" a="modificable=false"/>
                                                value="${datosPoliza.TAGENTE}" style="width:60%"
                                                title="<axis:alt f="axisctr072" c="CAGENTE" lit="100584"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr072" c="TACTIVI" dejarHueco="false">
                                            
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TACTIVI" name="TACTIVI" 
                                                <axis:atr f="axisctr072" c="TACTIVI" a="modificable=false"/>
                                                value="${datosPoliza.TACTIVI}" style="width:90%"
                                                title="<axis:alt f="axisctr072" c="TACTIVI" lit="103481"/>"/> 
                                            </td>
                                        </axis:ocultar>
                                        
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr072" c="TOMADOR" lit="1000181"/><%-- Tomadores --%></div>                                            
                                            <div class="separador">&nbsp;</div>
                                            
                                            <c:set var="title0"><axis:alt f="axisctr072" c="NOMBRE" lit="105940"/></c:set>   <%-- Nombre --%>
                                            <c:set var="title1"><axis:alt f="axisctr072" c="FECNACIMI" lit="1000064"/></c:set>  <%-- Fecha nacimiento --%>                                 
                                            <c:set var="title2"><axis:alt f="axisctr072" c="DOMICI" lit="101078" /></c:set>  <%-- Domicilio --%>              
                                            
                                            <div id="dt_polizas" class="seccion displayspace">
                                                <display:table name="${T_IAX_TOMADORES}" id="T_IAX_TOMADORES" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axisctr072.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="T_IAX_TOMADORES.OB_IAX_TOMADORES.TNOMBRE" headerClass="fixed sortable"  media="html" autolink="false" style="width:30%">
                                                        <div class="dspText">
                                                            ${T_IAX_TOMADORES.OB_IAX_TOMADORES.TNOMBRE} ${T_IAX_TOMADORES.OB_IAX_TOMADORES.TAPELLI1} ${T_IAX_TOMADORES.OB_IAX_TOMADORES.TAPELLI2}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="T_IAX_TOMADORES.OB_IAX_TOMADORES.FNACIMI" headerClass="fixed sortable"  media="html" autolink="false" style="width:15%">
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_TOMADORES.OB_IAX_TOMADORES.FNACIMI}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="T_IAX_TOMADORES.OB_IAX_TOMADORES.TDOMICI" headerClass="fixed sortable"  media="html" autolink="false" style="width:55%">
                                                        <div class="dspText">
                                                            ${T_IAX_TOMADORES.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}
                                                        </div>
                                                    </display:column>
                                                </display:table>                                                        
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">            
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo" ><img src="images/flecha.gif"/><b id="label_LIT_ASEG" ><axis:alt c="LIT_ASEG" f="axisctr072" lit="108228"/></b> <%-- Asegurados --%></div>
                                            <div class="separador">&nbsp;</div>
                                            <c:set var="title0"><axis:alt f="axisctr072" c="NOMBRE" lit="105940"/></c:set>   <%-- Nombre --%>                                                                       
                                            <div id="dt_polizas" class="seccion displayspace">
                                                <display:table name="${T_IAX_ASEGURADOS}" id="T_IAX_ASEGURADOS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axisctr072.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="T_IAX_ASEGURADOS.OB_IAX_GESTRIESGOS.TRIESGO" headerClass="fixed sortable"  media="html" autolink="false" style="width:80%">
                                                        <div class="dspText">
                                                            ${T_IAX_ASEGURADOS.OB_IAX_GESTRIESGOS.TRIESGO} 
                                                        </div>
                                                    </display:column>                                                    
                                                </display:table>                                                        
                                            </div>

                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
            <!-- INI bpm -->
           
            <axis:ocultar c="DSP_BPM" f="axisctr072" dejarHueco="false">            
                <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisctr072" c="titulo" lit="9906103" />
                </div> 
                <table class="seccion" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table class="area" align="center"> 
                                <tr>
                                    <th style="width:10%;height:0px"></th>
                                    <c:if test="${datosPoliza.NCERTIF != 0}">
                                        <th style="width:10%;height:0px"></th>
                                    </c:if>
                                    <th style="width:5%;height:0px"></th>
                                    <th style="width:75%;height:0px"></th>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr072" c="NCASO_BPM" dejarHueco="false"> 
                                        <td class="titulocaja" id="tit_NCASO_BPM">
                                            <b><axis:alt f="axisctr072" c="NCASO_BPM" lit="9906097" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr072" c="NSOLICI_BPM" dejarHueco="false">
                                        <c:if test="${datosPoliza.NCERTIF != 0}"> 
                                            <td class="titulocaja" id="tit_NSOLICI_BPM">                                                                                       
                                                <b><axis:alt c="NSOLICI_BPM" f="axisctr072" lit="9906098" /></b> 
                                            </td>
                                        </c:if>
                                        <td></td>
                                        <td class="titulocaja" id="tit_TNOMCOM">
                                            <b><axis:alt f="axisctr072" c="TNOMCOM" lit="105940" /></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr072" c="NCASO_BPM" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" id="NCASO_BPM" name="NCASO_BPM" title="<axis:alt f="axisctr072" c="NCASO_BPM" lit="9906097" />" value="${NCASO_BPM}" class="campowidthinput campo campotexto"  formato="entero"
                                                <axis:atr f="axisctr072" c="NCASO_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm()" style="width:130px;"/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr072" c="NSOLICI_BPM" dejarHueco="false">                                        
                                        <c:if test="${datosPoliza.NCERTIF != 0}">
                                            <td class="campocaja">
                                                <input type="text" id="NSOLICI_BPM" name="NSOLICI_BPM" title="<axis:alt f="axisctr072" c="NSOLICI_BPM" lit="9906098" />" value="${NSOLICI_BPM}" class="campowidthinput campo campotexto" formato="entero"
                                                    <axis:atr f="axisctr072" c="NSOLICI_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm()" style="width:130px;"/>
                                            </td> 
                                        </c:if>
                                        <td>                                            
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisctr213()" style="cursor:pointer" id="BUSQNCASO_BPM"/>
                                        </td>
                                        <td class="campocaja">
                                            <input readonly="true" type="text" name="TNOMCOM" id="TNOMCOM" value="${TNOMCOM}" class="campowidthinput campo campotexto" />
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </axis:ocultar>
            
            <!-- FIN bpm -->        

                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr072" c="NMOVIPOL" lit="1000298"/> <%-- Movimientos póliza --%></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:70%;height:0px"></th>
                                    </tr>
                                     <tr>
                                        <axis:ocultar f="axisctr072" c="CMOTMOV" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CMOTMOV"><axis:alt f="axisctr072" c="CMOTMOV" lit="9001749"/></b> <%-- Motiu rehabilitació --%>
                                            </td>
                                        </axis:ocultar>                                        
                                        <c:if test="${!empty requestScope.PREGUNTA}">
                                            <td class="titulocaja">              
                                                <b>${requestScope.PREGUNTA}</b>
                                            </td>                                        
                                        </c:if>
                                    </tr>
                                    
                                    <tr>
                                        <td class="campocaja">
                                            <select name="CMOTMOV" id="CMOTMOV" size="1" class="campowidthselect campo campotexto" style="width:80%;"
                                            obligatorio="true" title="<axis:alt f="axisctr072" c="CMOTMOV" lit="9001749"/>">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr072" c="LST_MOTIVOSREHAB" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${requestScope.LST_MOTIVOSREHAB}">
                                                    <option value="${element.CMOTMOV}"
                                                    <c:if test="${fn:length(requestScope.LST_MOTIVOSREHAB) == 1}"> selected="selected"</c:if>
                                                    <c:if test="${fn:length(requestScope.LST_MOTIVOSREHAB) != 1 && __formdata.CMOTMOV == element.CMOTMOV}"> selected="selected"</c:if>
                                                    >
                                                        ${element.TMOTMOV}   
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>            
                                        <c:if test="${!empty requestScope.PREGUNTA}">
                                            <td>
                                                <axis:alt f="axisctr072" c="RESPS" lit="101778"/>
                                                <input type="radio" name="RADIO_ANULAR" 
                                                onclick="javascript:objDom.setValorPorId('ANULA_EXTORN', this.checked ? '1' : '0')"
                                                <c:if test="${__formdata.ANULA_EXTORN == '1'}"> checked="checked" </c:if>/>  
                                                &nbsp;
                                                <axis:alt f="axisctr072" c="RESPN" lit="101779"/>
                                                <input type="radio" name="RADIO_ANULAR" 
                                                onclick="javascript:objDom.setValorPorId('ANULA_EXTORN', this.checked ? '0' : '1')"
                                                <c:if test="${__formdata.ANULA_EXTORN != '1'}"> checked="checked" </c:if>/>                                                  
                                            </td>
                                        </c:if>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </table>
                    
                </td>     
            </tr>            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisctr072</c:param>
       <c:param name="__botones">salir<c:if test="${requestScope.grabarOk != true}"><axis:visible f="axisctr072" c="BT_REHABILITA">,9001649</axis:visible><axis:ocultar f="axisctr072" c="BT_SOL" dejarHueco="false">,9902515</axis:ocultar></c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>