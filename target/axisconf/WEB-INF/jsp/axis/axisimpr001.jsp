<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axisimpr001.jsp
*  
*  Fecha: 04/07/2008
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
    <title><axis:alt f="axisimpr001" c="LIT_CONS_REC" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <style type="text/css">
        .displayspaceMaximo {
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
            
            
            
            var hayLSTRECIBOS = ${!empty __formdata.REC_LSTIMPDET};
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            if (!hayLSTRECIBOS && !hayErrores ) {
                f_but_buscar();
        	} 

            var hayLSTRECIBOS = ${!empty sessionScope.REC_LSTRECIBOS};
           
            if (!hayLSTRECIBOS && !hayErrores) {
                // Abrir modal buscador
                //f_abrir_modal("axisimpr002");
            } else {
                var miOffsetRecibos = "${requestScope.REC_miOffsetRecibos}";  //LCF sesión
                              // Desplazar barra scroll
                if (!objUtiles.estaVacio(miOffsetRecibos)) {
                    document.getElementById("dt_recibos").scrollTop = parseInt(miOffsetRecibos);
                }
            }
            
            var PREAVISOOK = "${requestScope.PREAVISOOK}";
            if(PREAVISOOK==1){
                var CSPROCES;
                var TTIPO = 'PREAVISOS';
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_preavisos&CSPROCES="+CSPROCES+"&CTIPO="+TTIPO);
            }
        }
        
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
            objUtiles.ejecutarFormulario("axis_axisimpr001.do" + document.miForm.PARAMSBUSC.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisimpr001.do", callbackCancelar, "operation=salir", this);
        }
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axisimpr001.do", callbackCancelar, "operation=salir", this);
        }
        
        function callbackCancelar() {
           var isModal = "${__formdata.isModal}";
            if (objUtiles.estaVacio(isModal) || isModal == 0){ 
                $("table").remove();
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisimpr001", "cancelar", document.miForm, "_self",objJsMessages.jslit_cargando);
               
            }else{
                if (isModal == 1){
                    parent.f_cerrar_axisimpr001();
                }
            }
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisimpr003');
        }
         
        function f_ver_detalle(NRECIBO) {
            var isModal = "${__formdata.isModal}";
            if (objUtiles.estaVacio(isModal) || isModal == 0){ 
                // Guardar desplazamiento barra scroll
                var miOffsetRecibos;// = document.getElementById("dt_recibos").scrollTop;
                objUtiles.ejecutarFormulario ('axis_axisimpr002.do?NRECIBO=' + NRECIBO + '&miOffsetRecibos=' + miOffsetRecibos, 
                    'form', document.miForm, '_self', objJsMessages.jslit_cargando);
            }else{
                if (isModal == 1){
                parent.f_seleccionarRecibo(NRECIBO);
                }
            }
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            objDom.setVisibilidadPorId("but_cerrar_modal_"+cual, "hidden");  
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisimpr003'){
                document.miForm.PARAMSBUSC.value = params;
                objUtiles.ejecutarFormulario("axis_axisimpr001.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        
        function f_validar_checkbox(cual){
        }
        
        /* ***************************************************************************************************** */
        /* ***************************************** UNIFICAR RECIBOS ****************************************** */
        /* ***************************************************************************************************** */
        function ChequearTodosBut() { 

            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
            var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked =true;
                    } 
               
            } 
            
        } 
		
        function ChequearTodosNoImpBut() { 

			var posicion;
			var checkear = 0;
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
				var elemento = document.forms[0].elements[i]; 
			   
				 posicion = elemento.name.indexOf("_");
				 if (posicion>0){
					  if (document.forms[0].elements[i].name.substring(0,posicion)=="SPROCES"){
						vsproces = document.getElementById("SPROCES_" + elemento.name.substring(posicion+1));
						if (vsproces.value == ''){
							checkear = 1;
						}
					  }  
				 } 
				
				if (elemento.type == "checkbox"){ 
					if (checkear == 1){
						elemento.checked =true;
						checkear = 0;
					}
				} 
            } 
        } 		

        function DesChequearTodosBut() { 
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                          elemento.checked =false;
                    } 
            }  
          
        } 
        
        //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
        function obtener_marcados(){
            var j=0;
            var k=0;
            var posicion;
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){                       
                         posicion = elemento.name.indexOf("_");
                         if (posicion>0){
                              if (document.forms[0].elements[i].id.substring(0,posicion)=="bselectedClausula"){
                                   if( elemento.checked ){  
                                         objDom.setValorPorId("BSELEC_" + elemento.name.substring(posicion+1),1);
                                   }else{
                                         objDom.setValorPorId("BSELEC_"+elemento.name.substring(posicion+1),0);
                                   }
                                 k= k + 1;  
                              } else if  (document.forms[0].elements[i].id.substring(0,posicion)=="selectedClausula"){
                                       if( elemento.checked ){  
                                             objDom.setValorPorId("ASELEC_"+elemento.name.substring(posicion+1),1);
                                       }else{
                                             objDom.setValorPorId("ASELEC_"+elemento.name.substring(posicion+1),0);
                                       }
                                    j= j + 1;  
                                }   
                    
                         } 
                    }     
            }  
        if (j>0 || k>0) return true;
        else return false;
        }
        
        function haymarcados(){
            var j=0;
            var k=0;
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){    
                        if (elemento.checked){
                            k++;
                          }
           }            }   
            if (k>0){
                return true;
            }else{
            
                return false;
             }
        }
        
        function f_but_100001(){
          //Llamada a unificar recibos abrir modal axisimpr003.jsp
          if (haymarcados()){
              if (obtener_marcados()){
                //antes de llamar, mirar cuales están seleccionados y cuáles no antes de llamar
                objUtiles.ejecutarFormulario("axis_axisimpr001.do", "imprimir", document.miForm, "_self", objJsMessages.jslit_cargando);
              }
          }    else{
                alert('<axis:alt f="axisimpr001" c="LIT_MSGFICHERO" lit="9905538"/>');
          }
          
        }
        
        
        function f_mod_tipimp(id,selsaldo){
                var sel;
              
                if (objValidador.validaEntrada()) {
                    if (!objUtiles.estaVacio(selsaldo) && selsaldo != 0 && selsaldo != 1){
                        sel = selsaldo.checked ? 1 : 0;
                        
                    }
                    
                 }
                 
            }
        
        /* ***************************************************************************************************** */
        /* ***************************************** UNIFICAR RECIBOS ****************************************** */
        /* ***************************************************************************************************** */
        function mostrar(nombreCapa){             
            document.getElementById(nombreCapa).style.visibility="visible"; 
        } 
            
        function ocultar(nombreCapa){             
         document.getElementById(nombreCapa).style.visibility="hidden"; 
        } 
        
        function f_detalleimprimir(IDCATEGORIA){
           objUtiles.abrirModal('axisimpr002', "src", "modal_axisimpr002.do?operation=form&IDCATEGORIA=" + IDCATEGORIA+'&origen=axisimpr001');        
        }
        
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
        }
                
        function f_imprimir_fitxer(cont){              
            
                pfitxer = document.getElementById('SORTIDA_'+cont).value;
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");        

                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axisimpr001.jsp",600,200);
        }  
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisimpr001" c="TITULO_CONS_REC" lit="9904251"/></c:param>     <%-- CONSULTA DE RECIBOS --%>
                <c:param name="formulario"><axis:alt f="axisimpr001" c="LIT_CONS_REC_FORM" lit="9904251"/></c:param> <%-- CONSULTA DE RECIBOS --%>
                <c:param name="form">axisimpr001</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimpr002|<axis:alt f="axisimpr001" c="MODAL_AXIIMPR002" lit="9904262"/>|XoN</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimpr003|<axis:alt f="axisimpr001" c="MODAL_AXIIMPR003" lit="9904252"/>|XoN</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisimpr001" c="TIT_AXISIMPRIMIR" lit="1000205" />|true</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="isModal" id = "isModal" value="${__formdata.isModal}"/>
        
        <input type="hidden" name="PREAVISOOK" id = "PREAVISOOK" value="${__formdata.PREAVISOOK}"/>
        
        <input type="hidden" name="PARAMSBUSC" id="PARAMSBUSC" value="${__formdata.PARAMSBUSC}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <!-- Cabecera -->
            
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                </td>
            </tr>
            <!-- FIN Cabecera -->
            <tr>
                <td>
                    <!--div class="separador">&nbsp;</div-->
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b><axis:alt f="axisimpr001" c="LIT_IMG_GO" lit="9904253"/></b>
                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisimpr001" c="LIT_ABRIR_MODAL" lit="9904252" />" onclick="f_abrir_modal('axisimpr003');" style="cursor:pointer"/>                
                    </div>
                    <div class="separador">&nbsp;</div>
                    
                    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                    <axis:visible c="DSP_IMPAGRUP" f="axisimpr001" >
                    <tr>
                        <td>
                            <div class="titulo">
                                <img src="images/flecha.gif"/><b><axis:alt f="axisimpr001" c="LIT_IMG_GO" lit="9904255"/></b>                                
                            </div> 
                            <c:set var="title10"><axis:alt f="axisimpr001" c="LIT_CATEGORIA" lit="9904257"/></c:set>   <%-- Producte --%>
                            <%int contador1 = 0;%>
                            <input type="hidden" name="CUENTA1" id="CUENTA1" value="${fn:length(__formdata.REC_LSTIMPAGRUP)}">
                            <display:table name="${__formdata.REC_LSTIMPAGRUP}" id="LSTIMPAGRUP" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_axisimpr001.do?paginar=true" style="width:100%" >
                                    <%@ include file="../include/displaytag.jsp"%>                                    
                                    <display:column title="${title10}" sortable="false" sortProperty="TDESCATEGORIA" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"> ${LSTIMPAGRUP.TDESCATEGORIA}</div>
                                    </display:column>
                                    <axis:visible f="axisimpr001" c="NRECSELEC">
                                    <display:column title="${title12}" sortable="false" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                                       <div class="dspIcons">
                                                <input onclick="javascript:f_mod_tipimp(1,this)" <c:if test="${LSTIMPAGRUP.NRECIBO==1 || __formdata['CMODO']=='UNIF'}">checked</c:if> 
                                                 type="checkbox" id="selectedClausula_<%= contador1 %>" name="selectedClausula_<%= contador1 %>" value="" <c:if test="${__configform.axisimpr001__NRECSELEC__modificable == 'false'}">readonly</c:if> />
                                                <input type="hidden" name="AIDCUENTA_<%= contador1 %>" id="AIDCUENTA_<%= contador1 %>" value="${LSTIMPAGRUP.CCATEGORIA}"/>
                                                <input type="hidden" name="ANREC_<%= contador1 %>" id="ANREC_<%= contador1 %>" value="${LSTIMPAGRUP.CCATEGORIA}"/>                                                
                                                <input type="hidden" name="ASELEC_<%= contador1 %>" id="ASELEC_<%= contador1 %>" value=""/>  
                                        </div> 
                                    </display:column>
                                    <display:column title="${title13}" sortable="false" headerClass="headwidth5 sortable fixed" style="width:5%" media="html" autolink="false" >
                                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisimpr001" c="ico_consultar" lit="1000439"/>" title1="<axis:alt f="axisimpr001" c="ico_consultarmas" lit="9904262"/>" src="images/mes.gif" width="11px" height="11px"
                                                    style="cursor:pointer;" onclick="f_detalleimprimir('${LSTIMPAGRUP.CCATEGORIA}')"/></div>
                                   </display:column>
                                  </axis:visible>
                                  <%contador1++;%>
                            </display:table>
                                    
                        </td>
                    </tr>
                    </axis:visible>
                    
                    <tr>
                        <td>
                            <div class="titulo">
                                <img src="images/flecha.gif"/><b><axis:alt f="axisimpr001" c="LIT_IMG_GO" lit="9904256"/></b>                                
                            </div>                        
                    
                            <c:set var="title0"><axis:alt f="axisimpr001" c="LIT_CATEG" lit="9904258"/></c:set>   <%-- Producte --%>
                            <c:set var="title1"><axis:alt f="axisimpr001" c="LIT_TIPO" lit="100565"/></c:set> <%--  Tipo --%>
                            <c:set var="title2"><axis:alt f="axisimpr001" c="LIT_FICHERO" lit="1000574"/></c:set>   <%-- FICHERO --%>
                            <c:set var="title3"><axis:alt f="axisimpr001" c="LIT_FECHA" lit="9001983"/></c:set>   <%-- fecha solicitud --%>
                            <c:set var="title4"><axis:alt f="axisimpr001" c="LIT_USUARI" lit="100894"/></c:set>   <%-- Usuario --%>
                            <c:set var="title5"><axis:alt f="axisimpr001" c="LIT_FULTIMP" lit="9904259"/></c:set>   <%-- Fecha ultima impresion--%>
                            <c:set var="title6"><axis:alt f="axisimpr001" c="LIT_USUULTIMP" lit="9904260"/></c:set>   <%-- usuario ultima impresion --%>
                            <c:set var="title7"><axis:alt f="axisimpr001" c="LIT_SPROCES" lit="9000493"/></c:set>
                            <c:set var="title8"><axis:alt f="axisimpr001" c="LIT_CAGENTE" lit="100584"/></c:set>
                            <c:set var="title9"><axis:alt f="axisimpr001" c="LIT_TPRODUC" lit="1000307"/></c:set>
                            <c:set var="title10"><axis:alt f="axisimpr001" c="LIT_NPOLIZA" lit="100624"/></c:set>
                            <c:set var="title11"><axis:alt f="axisimpr001" c="LIT_TESTADO" lit="9001645"/></c:set>
                            <%int contador = 0;%>
                            <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(__formdata.REC_LSTIMPDET)}">
                            <script language="Javascript">
                                //alert(objUtiles.miInnerWidth()*0.9)
                                //poniendo scroll a nivel de body o div, no lo presenta, o presenta el scroll horizontal protegido
                                document.write('<div class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+objUtiles.miInnerWidth()*0.89+'px">');
                            </script>
                            <!--div class="seccion displayspaceMaximo"-->
                                <display:table name="${__formdata.REC_LSTIMPDET}" id="LSTIMPDET" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_axisimpr001.do?paginar=true" >
                                    <%@ include file="../include/displaytag.jsp"%>   
                                    <axis:visible f="axisimpr001" c="CAGENTE"> 
                                        <display:column headerClass="sortable fixed" style="width:10%"   title="${title8}" sortable="true" sortProperty="CAGENTE"  media="html" autolink="false" >
                                            <div class="dspText"> ${LSTIMPDET.CAGENTE}-${LSTIMPDET.TAGENTE}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="TPRODUC"> 
                                        <display:column title="${title9}" sortable="true" sortProperty="TPRODUC" headerClass="sortable fixed" style="width:15%"    media="html" autolink="false" >
                                            <div class="dspText"> ${LSTIMPDET.TPRODUC}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="NPOLIZA"> 
                                        <display:column title="${title10}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed" style="width:5%"  media="html" autolink="false" >
                                            <div class="dspText"> ${LSTIMPDET.NPOLIZA}-${LSTIMPDET.NCERTIF}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="TDESCATEGORIA"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="TDESCATEGORIA" headerClass="sortable fixed" style="width:10%"  media="html" autolink="false" >
                                            <div class="dspText"> ${LSTIMPDET.TDESCATEGORIA}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="TTIPO"> 
                                        <display:column title="${title1}" sortable="true" sortProperty="TTIPO" headerClass="sortable fixed" style="width:10%"  media="html" autolink="false" >
                                            <div class="dspText">${LSTIMPDET.TTIPO}</div>
                                        </display:column>
                                    </axis:visible>
                               <%--     <axis:visible f="axisimpr001" c="TFICHERO"> 
                                        <display:column title="${title2}" sortable="true" sortProperty="TFICHERO" headerClass="sortable fixed" style="width:5%"   media="html" autolink="false" >
                                            <div class="dspText">${LSTIMPDET.TFICHERO}</div>
                                        </display:column>
                                    </axis:visible>--%>
                                    <axis:visible f="axisimpr001" c="FCREA"> 
                                        <display:column title="${title3}" sortable="true" sortProperty="FCREA" headerClass="sortable fixed" style="width:5%"  media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LSTIMPDET.FCREA}"/></div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="CUSER"> 
                                        <display:column title="${title4}" sortable="true" sortProperty="CUSER" headerClass="sortable fixed" style="width:5%"   media="html" autolink="false" >
                                            <div class="dspText">${LSTIMPDET.CUSER}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="FULTIMP"> 
                                        <display:column title="${title5}" sortable="true" sortProperty="FULTIMP" headerClass="sortable fixed" style="width:5%"  media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LSTIMPDET.FULTIMP}"/></div>
                                        </display:column> 
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="CULTUSERIMP"> 
                                        <display:column title="${title6}" sortable="true" sortProperty="CULTUSERIMP" headerClass="sortable fixed" style="width:5%" media="html" autolink="false" >
                                            <div class="dspText">${LSTIMPDET.CULTUSERIMP}</div>
                                        </display:column> 
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="TESTADO"> 
                                        <display:column title="${title11}" sortable="true" sortProperty="TESTADO" headerClass="sortable fixed" style="width:10%" media="html" autolink="false" >
                                            <div class="dspText">${LSTIMPDET.TESTADO}</div>
                                        </display:column> 
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="SPROCES"> 
                                        <display:column title="${title7}" sortable="true" sortProperty="SPROCES" headerClass="sortable fixed" style="width:5%" media="html" autolink="false" >
                                            <div class="dspText">
												${LSTIMPDET.SPROCES}
												<input type="hidden" name="SPROCES_<%= contador %>" id="SPROCES_<%= contador %>" value="${LSTIMPDET.SPROCES}"/>
											</div>
                                        </display:column> 
                                    </axis:visible>
                                    <axis:visible f="axisimpr001" c="NRECSELEC">
                                        <display:column title="${title00}" sortable="false" sortProperty="NRECIBO2" headerClass="sortable fixed" style="width:2%" media="html" autolink="false" >
                                           <div class="dspIcons">
                                                <c:if test="${LSTIMPDET.CESTADO!=3 && LSTIMPDET.CESTADO!=2}">
                                                    <input onclick="javascript:f_mod_tipimp(1,this)" <c:if test="${LSTIMPDET.NRECIBO2==1 || __formdata['CMODO']=='UNIF'}">checked</c:if> 
                                                     type="checkbox" id="bselectedClausula_<%= contador %>" name="bselectedClausula_<%= contador%>" value="" <c:if test="${__configform.axisimpr001__NRECSELEC__modificable == 'false'}">readonly</c:if> />
                                                    <input type="hidden" name="BIDCUENTA_<%= contador %>" id="BIDCUENTA_<%= contador %>" value="${LSTIMPDET.IDDOCGEDOX}"/>
                                                    <input type="hidden" name="BNREC_<%= contador %>" id="BISALDO_<%= contador %>" value="${LSTIMPDET.IDDOCGEDOX}"/>
                                                    <input type="hidden" name="BSELEC_<%= contador %>" id="BSELEC_<%= contador %>" value=""/>
                                                </c:if> 
                                            </div> 
                                        </display:column>
                                    </axis:visible>
                                    <%contador++;%>
                                </display:table>
                            </div>
                            <axis:visible f="axisimpr001" c="BUT_SEL_TODOS">
                                <input type="button" onclick="ChequearTodosBut()" class="boton" value="<axis:alt f="axisimpr001" c="LIT_BUT_SELTODOS" lit="9000756"/>"/>
                            </axis:visible>
                            <%/*<axis:visible f="axisimpr001" c="BUT_SEL_TODOS_NOIMP">
                                <input type="button" onclick="ChequearTodosNoImpBut()" class="boton" value="<axis:alt f="axisimpr001" c="LIT_BUT_SELTODOS_NOIMP" lit="9908979"/>"/>
                            </axis:visible>*/%>
                            <axis:visible f="axisimpr001" c="BUT_DSEL_TODOS">
                                <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<axis:alt f="axisimpr001" c="LIT_BUT_DESELTODOS" lit="9000757"/>"/>
                            </axis:visible>
                    </td>
                </tr>
                <axis:ocultar c="IDIMPRESORA" f="axisimpr001" dejarHueco="false" >
                <tr>
                
                    <td class="titulocaja">
                        <b><axis:alt f="axisimpr001" c="LIT_IMPRESORA" lit="9904261"/></b> <%-- Empresa --%>
                    </td>
                </tr>
                <tr>
                
                    <td>
                        <c:set var="title10"><axis:alt f="axisimpr001" c="LIT_IMPRESORA" lit="9904261"/></c:set>
                                        
                        <select title = "${title10}" name = "IDIMPRESORA" style="width:20%" id ="IDIMPRESORA" 
                                class="campowidthbig campo campotexto_ob" 
                                <axis:atr f="axisimpr001" c="IDIMPRESORA" a="modificable=true&isInputText=false"/>>&nbsp;
                                <option value="-1"><axis:alt f="axisimpr001" c="SEL" lit="1000348"/></option>
                                <c:forEach items="${__formdata.lstimpresoras}" var="element">                                                    
                                    <option value = "${element.IDIMPRESORA}">
                                         ${element.TALIAS} 
                                    </option>
                                </c:forEach>                                   
                        </td>
                    </tr>
                  </axis:ocultar>
                    
                    </table>                           
                                                      
                </td>
            </tr>
            
            <c:if test="${!empty __formdata.LIST_FICHEROS}">
            <tr>
                <td>
                    <table class="area" align="center">
                        <tr>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            
                        </tr>    
                        <tr>
                            <td colspan="3">
                                <div class="separador">&nbsp;</div>
                                <div class="titulo">
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisimpr001" c="TIT_FITX" lit="9905210"/> </b>
                                </div>
                                <%--div class="separador">&nbsp;</div--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" id="fichero" colspan="3">
                            <%int cont = 0;%>
                             <c:set var="title0"><axis:alt f="axisimpr001" c="FICHERO" lit="1000574"/>  </c:set>
                              <div class="seccion displayspace">
                                <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisimpr001.do?paginar=true" style="width:99.9%">
                                <%@ include file="../include/displaytag.jsp"%>
                                <c:set var="i"><%=cont%></c:set>
                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html"  autolink="false" >
                                       <c:if test="${OBFICHERO.OB_IAX_IMPRESION.CDIFERIDO == 0}">
                                           <a href="javascript:f_imprimir_fitxer('${i}')"> ${OBFICHERO.OB_IAX_IMPRESION.FICHERO}</a>
                                           <input type="hidden" 
                                               style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                               class="campowidthinput campo campotexto" size="15"  name="SORTIDA_${i}" id="SORTIDA_${i}"
                                               value="${OBFICHERO.OB_IAX_IMPRESION.FICHERO}"/>
                                       </c:if>
                                       <c:if test="${OBFICHERO.OB_IAX_IMPRESION.CDIFERIDO == 1}">
                                            ${OBFICHERO.OB_IAX_IMPRESION.FICHERO}
                                       </c:if>
                                    </display:column>   
                                <% cont ++ ;%>
                                </display:table>
                              </div>
                            </td> 
                        </tr>
                    </table>
                </td>
            </tr>
            </c:if>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisimpr001</c:param><c:param name="f">axisimpr001</c:param>
            <c:param name="__botones">salir,100001</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>