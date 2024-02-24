<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- Manteniment de comptes tècniques coaseguro--%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <script type="text/javascript">        
            function f_onload() {
            
                f_cargar_propiedades_pantalla(); 
                var CEMPRES = "${__formdata.CAB_COASEGURO[0].TEMPRES}";
                
                
                var identificadorFila001 = $('#identificadorFila001').val(); //CCOMPAPR|CCOMPANI|CTIPCOA|FCIERRE|SPROCES
                var idSplitted = identificadorFila001.split('|');
                $('#FCIERRE').val(idSplitted[3]);
				
				var identificador = $('#identificador').val(); //TMONEDA
                var idSplitted = identificador.split('|');
				$('#TMONEDA').val(idSplitted[6]);

                //ecg20121128 AXIS5378, bug 24894
                var onew_div=document.getElementById("new_div");
                if (onew_div!=null && onew_div!=undefined) {
                	if (objUtiles.estaVacio(CEMPRES)) {
                		onew_div.style.visibility="hidden";
                	}	
                }

               /* if (objUtiles.estaVacio(CEMPRES) ){
                    f_abrir_axiscoa001();
                }*/
            }

            function f_recuperar(identificador,filtros,identificadorFila001) {
                objUtiles.cerrarModal("axiscoa001");
                document.miForm.identificador.value = identificador;
                document.miForm.identificadorFila001.value = identificadorFila001;
                document.miForm.filtros.value = filtros;
                objUtiles.ejecutarFormulario ("axis_axiscoa002.do", "recuperar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }

            function f_abrir_axiscoa001(){
                objUtiles.abrirModal("axiscoa001","src","modal_axiscoa001.do?operation=form");
            }

            
            function f_cerrar_axiscoa003(recargar){
                objUtiles.cerrarModal("axiscoa003");
                if (recargar) {
                    f_recuperar(document.miForm.identificador.value,document.miForm.filtros.value,document.miForm.identificadorFila001.value)
                }
            }
            
            
             /*function f_but_9001771(){
                var identificador=document.miForm.identificador.value;
                var url="axis_axiscoa002.do?operation=recuperarsprocesajaxjson&identificador="+escape(identificador);
                jQuery.ajax({
                    url: url,
                    dataType: 'json',
                    success: callMeBack_recuperarsprocesajaxjson, 
                    error: callMeBack_recuperarsprocesajaxjson_error 
                });
            }*/
            
            function callMeBack_recuperarsprocesajaxjson(q) {
                //alert(JSON.stringify(q));
                if (q.JSON2.MENSAJES!=null && q.JSON2.MENSAJES.length>0) {
                    var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa002" lit="108953" />";
                    for (var i=0;i<q.JSON2.MENSAJES.length;i++) {
                        var miMENSAJESitem=q.JSON2.MENSAJES[i];
                        errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
                    }
                    alert(errmsg);
                }
                else {
                    var NPROCESO=q.JSON2.PNPROCESO;
                    if (confirm ("<axis:alt c="CONFIRM_NPROCESO" f="axiscoa002" lit="9000493" />: "+NPROCESO+"\n<axis:alt c="EJECUTAR_NPROCESO" f="axiscoa002" lit="9000711" />")){
                        document.miForm.SPROCES.value=NPROCESO;
                        objUtiles.ejecutarFormulario ("axis_axiscoa002.do", "liquidar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    }
                }
            }
            
            function callMeBack_recuperarsprocesajaxjson_error() {
                var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa002" lit="108953" />";
                alert(errmsg);
            }
     
            function f_but_alta_linea(q) {
                objUtiles.abrirModal("axiscoa003","src","modal_axiscoa003.do?operation=recuperar&identificador="+escape(document.miForm.identificador.value)+"&IDREGISTRO="+escape(q));
            }   

            function f_but_consultar_linea(q) {
                objUtiles.abrirModal("axiscoa003","src","modal_axiscoa003.do?operation=recuperar&identificador="+escape(document.miForm.identificador.value)+"&IDREGISTRO="+escape(q));
            }   
            
            function f_but_editar_linea(q) {
                objUtiles.abrirModal("axiscoa003","src","modal_axiscoa003.do?operation=recuperar&identificador="+escape(document.miForm.identificador.value)+"&IDREGISTRO="+escape(q));
            }       
            
            function f_but_delete_linea(q){
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer!=undefined && answer){
                    document.miForm.IDREGISTRO.value=q;
                    objUtiles.ejecutarFormulario ("axis_axiscoa002.do", "delete_linea", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
            }
            
            function f_aceptar_axiscoa003(){
                f_cerrar_axiscoa003();
            }
      
            /*function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscoa002", "cancelar", document.miForm, "_self");
            } */
            
            function f_but_cancelar() {    
                //Volvemos a Axiscoa005 y le pasamos el identificador del registro en la pantalla axiscoa001 para que pueda cargar la información correctamente
                document.miForm.identificador.value = $('#identificadorFila001').val();;
                objUtiles.ejecutarFormulario("modal_axiscoa005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
    
           function f_cerrar_axiscoa001(){
                objUtiles.cerrarModal("axiscoa001");
            }

            function f_but_aceptar(){
                //objUtiles.abrirModal("axiscoa001","src","modal_axiscoa001.do?operation=form&cancelar=1&filtros=" + $('#filtros').val() + "&identificadorFila001=" + $('#identificadorFila001').val() );
                parent.f_cerrar_axiscoa005();
            }

            function ver_todos() {
                objUtiles.ejecutarFormulario ("axis_axiscoa002.do", "recuperar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }

        </script>
    </head>
    <body onload="f_onload()">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
<!-- __formdata.CAB_COASEGURO[0]=${__formdata.CAB_COASEGURO[0]} -->
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPROCES" value=""/>
			<input type="hidden" id="TMONEDA" name="TMONEDA" value=""/>
            <input type="hidden" id="identificador" name="identificador" value="${__formdata.identificador}"/>
            <input type="hidden" id="identificadorFila001" name="identificadorFila001" value="${__formdata.identificadorFila001}"/>
            <input type="hidden" id="filtros" name="filtros" value="${__formdata.filtros}"/>
          
            <!-- este campo oculto identifca al registro objeto actual -->
            <input type="hidden" name="IDREGISTRO" id="IDREGISTRO" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <axis:alt f="axiscoa002" c="TIT_COA002" lit="9001941"/>
                </c:param>
                <c:param name="form">axiscoa002</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                    <axis:alt f="axiscoa002" c="COA001" lit="104907"/>
                </c:param>
                <c:param name="nid" value="axiscoa001"/>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                    <axis:alt f="axiscoa002" c="COA003" lit="9001947"/>
                </c:param>
                <c:param name="nid" value="axiscoa003"/>
            </c:import>
			<c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                    <axis:alt f="axiscoa002" c="COA005" lit="104907"/>
                </c:param>
                <c:param name="nid" value="axiscoa005"/>
            </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="8">
                                                <div class="separador">&nbsp;</div>
                                                <div class="titulo">
                                                    <img src="images/flecha.gif"/><axis:alt f="axiscoa002" c="TIT" lit="9903039"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axiscoa002" c="TEMPRES">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="TEMPRES" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="COASEGURADORA">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="COASEGURADORA" lit="9904160"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="TIPOCOASEGURO">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="TIPOCOASEGURO" lit="9902935"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="FCIERRE">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="FCIERRE" lit="9000490"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="TRAMO">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="TRAMO" lit="100784"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="TPRODUC">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="TPRODUC" lit="100829"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="NPOLIZA">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="NPOLIZA" lit="109546"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="ISALDO">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="ISALDO" lit="104910"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axiscoa002" c="TEMPRES">
                                                <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].TEMPRES}" name="TEMPRES" id="TEMPRES"
                                                           title="<axis:alt f="axiscoa002" c="TEMPRES" lit="101619"/>" <axis:atr f="axiscoa002" c="TEMPRES"  a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="COASEGURADORA">
                                                <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].TCOMPANI}" name="COASEGURADORA" id="COASEGURADORA"
                                                           title="<axis:alt f="axiscoa002" c="COASEGURADORA" lit="9904160"/>" <axis:atr f="axiscoa002" c="COASEGURADORA" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="TIPOCOASEGURO">
                                                <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].TTIPCOA}" name="TIPOCOASEGURO" id="TIPOCOASEGURO"
                                                           title="<axis:alt f="axiscoa002" c="TIPOCOASEGURO" lit="9902935"/>" <axis:atr f="axiscoa002" c="TIPOCOASEGURO" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="FCIERRE">
                                                <td class="campocaja">											
                                                    <input type="text" class="campo campotexto" value='<fmt:formatDate value="${__formdata.CAB_COASEGURO[0].FCIERRE}" pattern="dd/MM/yyyy"/>'
                                                           title="<axis:alt f="axiscoa002" c="FCIERRE" lit="9000490"/>" name="FCIERRE" id="FCIERRE" <axis:atr f="axiscoa002" c="FCIERRE" a="formato=fecha&modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="TRAMO">
                                                <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].TRAMO}" name="TRAMO" id="TRAMO"
                                                           title="<axis:alt f="axiscoa002" c="TRAMO" lit="100784"/>" <axis:atr f="axiscoa002" c="TRAMO" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="TPRODUC">
                                                <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].TPRODUC}" name="TPRODUC" id="TPRODUC"
                                                           title="<axis:alt f="axiscoa002" c="TPRODUC" lit="100829"/>" <axis:atr f="axiscoa002" c="TPRODUC" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="NPOLIZA">
                                                <td class="campocaja">
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].NPOLIZA}" name="NPOLIZA" id="NPOLIZA" style="width:75%"
                                                           title="<axis:alt f="axiscoa002" c="NPOLIZA" lit="109546"/>" <axis:atr f="axiscoa002" c="NPOLIZA" a="modificable=false"/>/>
                                                    <input type="text" class="campo campotexto" value="${__formdata.CAB_COASEGURO[0].NCERTIF}" name="NCERTIF" id="NCERTIF" style="width:15%"
                                                           title="<axis:alt f="axiscoa002" c="NPOLIZA" lit="109546"/>" <axis:atr f="axiscoa002" c="NPOLIZA" a="modificable=false"/>/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscoa002" c="ISALDO" dejarHueco="false">
                                                <td class="campocaja">
													<c:choose>
														<c:when test="${__formdata.CAB_COASEGURO[0].CEMPRES == '16'}">
															<input type="text" class="campo campotexto" size="15" value='<fmt:formatNumber value="${__formdata.CAB_COASEGURO[0].ISALDO}" pattern="#,##0"/>'
                                                           title="<axis:alt f="axiscoa002" c="ISALDO" lit="104910"/>" name="ISALDO" id="ISALDO" <axis:atr f="axiscoa002" c="ISALDO" a="modificable=false"/>/>
														</c:when>    
														<c:otherwise>
															<input type="text" class="campo campotexto" size="15" value='<fmt:formatNumber value="${__formdata.CAB_COASEGURO[0].ISALDO}" pattern="#,##0"/>'
                                                           title="<axis:alt f="axiscoa002" c="ISALDO" lit="104910"/>" name="ISALDO" id="ISALDO" <axis:atr f="axiscoa002" c="ISALDO" a="modificable=false"/>/>
														</c:otherwise>
													</c:choose>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <axis:ocultar f="axiscoa002" c="ISALDO_MONCON" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscoa002" c="ISALDO_MONCON" lit="9903052"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <axis:ocultar f="axiscoa002" c="ISALDO_MONCON" dejarHueco="false">
                                                <td class="campocaja">
													<c:choose>
														<c:when test="${__formdata.CAB_COASEGURO[0].CEMPRES == '16'}">
															<input type="text" class="campo campotexto" size="15" value="<fmt:formatNumber value="${__formdata.CAB_COASEGURO[0].ISALDO_MONCON}" pattern="#,##0"/>" name="ISALDO_MONCON" id="ISALDO_MONCON"
                                                           title="<axis:alt f="axiscoa002" c="ISALDO_MONCON" lit="9903052"/>" <axis:atr f="axiscoa002" c="ISALDO_MONCON"                                              a="modificable=false"/>/>
														</c:when>    
														<c:otherwise>
															<input type="text" class="campo campotexto" size="15" value="<fmt:formatNumber value="${__formdata.CAB_COASEGURO[0].ISALDO_MONCON}" pattern="#,##0"/>" name="ISALDO_MONCON" id="ISALDO_MONCON"
                                                           title="<axis:alt f="axiscoa002" c="ISALDO_MONCON" lit="9903052"/>" <axis:atr f="axiscoa002" c="ISALDO_MONCON"                                              a="modificable=false"/>/>
														</c:otherwise>
													</c:choose>
                                                    
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                         <tr>
                                            <td class = "campocaja" >
                                                <axis:visible f="axiscoa002" c="VER_TODOS">
                                                        <input id="CHECK_VER_TODOS" name="CHECK_VER_TODOS" type="checkbox"
                                                               <c:if test="${__formdata.CHECK_VER_TODOS == 'on'}">checked</c:if>
                                                               onClick="ver_todos()">
                                                               <b><axis:alt f="axiscoa002" c="CHECK_VER_TODOS" lit="9906739" /></b>
                                                        </input>                            
                                                </axis:visible>
                                            </td>
                                         </tr>
                                        
                                        <tr>
                                            <td class="campocaja" colspan="9">
                                                <div class="separador">&nbsp;</div>
                                                <div class="titulo">
                                                    <div style="float:left;">
                                                        <img src="images/flecha.gif"/><axis:alt f="axiscoa002" c="TIT_CUENTAS" lit="9903040"/>
                                                    </div>
                                                      <axis:ocultar f="axiscoa002" c="BUT_NEW" dejarHueco="false">
                                                    <div style="float:right;" id="new_div">
                                                        <a href="javascript:f_but_alta_linea(-1)"><img title="<axis:alt c="form_lit" f="axisrea038" lit="1000428"/>" border="0" src="images/new.gif"/></a>
                                                    </div>
                                                    </axis:ocultar>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                        
                                        
                                        <axis:ocultar f="axiscoa002" c="DSP_CUENTAS" dejarHueco="false">
                                            <tr>
                                                <td class="campocaja" colspan="9">
                                                    <c:set var="title1">
                                                        <axis:alt f="axiscoa002" c="NNUMLIN" lit="9001727"/>
                                                    </c:set>
                                                    <c:set var="title2">
                                                        <axis:alt f="axiscoa002" c="RECIBO" lit="100895"/>
                                                    </c:set>
                                                    <c:set var="title3">
                                                        <axis:alt f="axiscoa002" c="PAGOSIN" lit="9903655"/>
                                                    </c:set>
                                                    <c:set var="title4">
                                                        <axis:alt f="axiscoa002" c="TIPOIMPORTE" lit="9002015"/>
                                                    </c:set>
                                                    <c:set var="title5">
                                                        <axis:alt f="axiscoa002" c="TIPO" lit="100565"/>
                                                    </c:set>
                                                    <c:set var="title6">
                                                        <axis:alt f="axiscoa002" c="FMOVIMI" lit="1000590"/>
                                                    </c:set>
                                                    <c:set var="title7">
                                                        <axis:alt f="axiscoa002" c="ESTADO" lit="101510"/>
                                                    </c:set>
                                                    <c:set var="title8">
                                                        <axis:alt f="axiscoa002" c="TCONCEP" lit="9000715"/>
                                                    </c:set>
                                                    <c:set var="title9">
                                                        <axis:alt f="axiscoa002" c="DEBE" lit="101003"/>
                                                    </c:set>
                                                    <c:set var="title10">
                                                        <axis:alt f="axiscoa002" c="HABER" lit="101004"/>
                                                    </c:set>
                                                    <c:set var="title11">
                                                        <axis:alt f="axiscoa002" c="TDESCRI" lit="100588"/>
                                                    </c:set>
                                                    <div class="displayspaceGrande">
                                                        <c:set var="IDREGISTRO" value=""/><%-- NNUMLIN--%>
                                                         
                                                        <display:table name="${__formdata.GET_MOV_CTACOA}" id="miListaId" export="false" style="width:98%;" class="dsptgtable" pagesize="-1" sort="list"
                                                                       cellpadding="0" cellspacing="0" requestURI="axis_axiscoa002.do?paginar=true">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                            <axis:visible c="NNUMLIN" f="axiscoa002">
                                                                <display:column title="${title1}" sortable="true" style="width:4%;" sortProperty="NNUMLIN" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <c:set var="IDREGISTRO" value="${miListaId['NNUMLIN']}"/>
                                                                    <div class="dspNumber">
                                                                        ${miListaId['NNUMLIN']}
                                                                        <!-- 
                                                                        ${miListaId}
                                                                        
                                                                        -->
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="RECIBO" f="axiscoa002">
                                                                <display:column title="${title2}" sortable="true" style="width:7%;" sortProperty="RECIBO" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['NRECIBO']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="PAGOSIN" f="axiscoa002">
                                                                <display:column title="${title3}" sortable="true" style="width:7%;" sortProperty="PAGOSIN" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['SIDEPAG']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TIPOIMPORTE" f="axiscoa002">
                                                                <display:column title="${title4}" sortable="true" style="width:7%;" sortProperty="TIPOIMPORTE" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TIPOIMP']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TIPO" f="axiscoa002">
                                                                <display:column title="${title5}" sortable="true" style="width:7%;" sortProperty="TIPO" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TTIPMOV']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="FMOVIMI" f="axiscoa002">
                                                                <display:column title="${title6}" sortable="true" style="width:7%;" sortProperty="FMOVIMI" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        <fmt:formatDate value="${miListaId[\'FMOVIMI\']}" pattern="dd/MM/yyyy"/>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="ESTADO" f="axiscoa002">
                                                                <display:column title="${title7}" sortable="true" style="width:7%;" sortProperty="ESTADO" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TESTADO']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TCONCEP" f="axiscoa002">
                                                                <display:column title="${title8}" sortable="true" style="width:7%;" sortProperty="TCONCEP" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TCONCEP']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="DEBE" f="axiscoa002">
                                                                <display:column title="${title9}" sortable="true" style="width:7%;" sortProperty="DEBE" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">																
																		<c:choose>
																			<c:when test="${__formdata.CAB_COASEGURO[0].CEMPRES == '16'}">
																				<fmt:formatNumber value="${miListaId[\'IDEBE\']}" pattern="#,##0"/>
																			</c:when>    
																			<c:otherwise>
																				<fmt:formatNumber value="${miListaId[\'IDEBE\']}" pattern="#,##0"/>
																			</c:otherwise>
																		</c:choose>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="HABER" f="axiscoa002">
                                                                <display:column title="${title10}" sortable="true" style="width:7%;" sortProperty="HABER" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">															
																		<c:choose>
																			<c:when test="${__formdata.CAB_COASEGURO[0].CEMPRES == '16'}">
																				<fmt:formatNumber value="${miListaId[\'IHABER\']}" pattern="#,##0"/>
																			</c:when>    
																			<c:otherwise>
																				<fmt:formatNumber value="${miListaId[\'IHABER\']}" pattern="#,##0"/>
																			</c:otherwise>
																		</c:choose>
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <axis:visible c="TDESCRI" f="axiscoa002">
                                                                <display:column title="${title11}" sortable="true" style="width:7%;" sortProperty="TDESCRI" headerClass="sortable fixed" media="html"
                                                                                autolink="false">
                                                                    <div class="dspText">
                                                                        ${miListaId['TDESCRI']}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed" media="html" autolink="false">
                                                                    <div class="dspIcons">
                                                                        <!-- CTIPMOV:${miListaId.CTIPMOV} CESTADO:${miListaId.CESTADO} ver http://mantis.srvcsi.com/view.php?id=22076#c124126 -->
                                                                        <c:set var="imgstylevisibilityED">hidden</c:set>
                                                                        <%-- BUG 29347/161211 - RCL - 12/12/2013 --%>
                                                                        <c:if test="${(miListaId.CTIPMOV==0||miListaId.CTIPMOV==1) && (miListaId.CESTADO==1 || miListaId.CESTADO==3) && (miListaId.FCONTAB == null)}"><c:set var="imgstylevisibilityED">visible</c:set></c:if>
                                                                        <c:set var="imgstylevisibilityCO">hidden</c:set>
                                                                        <c:if test="${imgstylevisibilityED=='hidden'}"><c:set var="imgstylevisibilityCO">visible</c:set></c:if>
                                                                        <c:set var="imgstylevisibilityBO">hidden</c:set>
                                                                        <%-- BUG 29347/161211 - RCL - 12/12/2013 --%>
                                                                        <c:if test="${(miListaId.CTIPMOV==1) && (miListaId.CESTADO==1) && (miListaId.FCONTAB == null)}"><c:set var="imgstylevisibilityBO">visible</c:set></c:if>

                                                                        <a href="javascript:f_but_editar_linea('${IDREGISTRO}')"><img style="visibility:${imgstylevisibilityED}" border="0" title="<axis:alt f='axiscoa002' c='LIT_ED_BO' lit='9901356'/>" src="images/lapiz.gif"/></a>
                                                                        <a href="javascript:f_but_consultar_linea('${IDREGISTRO}')"><img style="visibility:${imgstylevisibilityCO}" border="0" title="<axis:alt f='axiscoa002' c='LIT_CO_BO' lit='1000439'/>" src="images/mas.gif"/></a>
                                                                        <a href="javascript:f_but_delete_linea('${IDREGISTRO}')"><img style="visibility:${imgstylevisibilityBO}" border="0" title="<axis:alt f='axiscoa002' c='LIT_BO_BO' lit='9001333'/>" src="images/delete.gif"/></a>
                                                                    </div>
                                                                </display:column>
                                                        </display:table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </axis:ocultar>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axiscoa002</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>