<%/*
*  Fichero: axiscomi015.jsp
*  Fecha: 24/01/2013
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
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        //alert("on load");
        revisarEstilos();
        f_cargar_propiedades_pantalla();
        
        var LISTAPRODUCTOS = "${__formdata.LISTAPRODUCTOS}"
            <c:if test="${__formdata.OK=='OK'}" >
                    //alert('<axis:alt f="axiscomi015" c="LIT_MESA_OK" lit="1000405" />');
                    parent.f_aceptar_axiscomi015(LISTAPRODUCTOS);
            </c:if>
        
        }
             
        function f_but_aceptar(SSEGURO,SRECREN) {
            var hayChecked = objUtiles.f_GuardaCasillasChecked ("selProduct");
            var valores = new Array();  
            var cadena = obtener_marcados();
            var nulos = obtener_desmarcados();
            objUtiles.ejecutarFormulario("modal_axiscomi015.do?LISTACONVE="+cadena+"&NULOS="+nulos, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
         
        function f_but_buscar() {
         if (objValidador.validaEntrada())
           objUtiles.ejecutarFormulario("modal_axiscomi015.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_recargar() { //thiss
           //if (thiss.value > 0) 
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axiscomi015.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axiscomi015');
            
        }
        
        /* **************************************************** FUNCIONES PANTALLA ************************************************ */
        
        function f_recarga_combos(comboOrigen) {
        //alert("en recarga de combos");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("modal_axiscomi015.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
        }       
            
            
        function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);    
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); 
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
        }              
            
            
        function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                // The rest of the method, is unreachable code here, in AXISADM036. We've kept it for future extensions.
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
        }
        
        
        function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                    }
                    
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes
                        combo[0].selected = "1";
                        combo.onchange(); 
                    }
                }
        }
            
        function f_sel_renta(valor){
        
            document.miForm.selRentaValor.value=valor;
        
        }
        
        
        /* ***************************************************************************************************** */
        /* ***************************************** SEL/DESEL TODOS  ****************************************** */
        /* ***************************************************************************************************** */
        function ChequearTodosBut() { 

            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
            var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked =true;
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
            var cadena="";
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                      
                         if( elemento.checked ){
                             
                             //objDom.setValorPorId("SELEC_"+j,1);
                             //alert("SELEC"+j+":  "+1);
                             var sproduc_selected   = objDom.getValorPorId("SPRODUC_"+j);  
                             var tproduc_selected   = objDom.getValorPorId("TPRODUC_"+j); 
                             
                             if( objUtiles.estaVacio(cadena))
                                cadena = sproduc_selected+"/"+tproduc_selected;
                             else
                                cadena = cadena +"x"+sproduc_selected+"/"+tproduc_selected;
                                
                             
                         }
                         
                        j =j+1;
                    } 
            }  
        return cadena;
        }
        
        
         //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
        function obtener_desmarcados(){
            var j=0;
            var cadena="";
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                      
                         if( elemento.checked ){
                             
                         }else{

                             var sproduc_selected   = objDom.getValorPorId("SPRODUC_"+j);  
                             var tproduc_selected   = objDom.getValorPorId("TPRODUC_"+j);  
                             
                             cadena = cadena +"x"+sproduc_selected+"/"+tproduc_selected;
                         }
                         
                        j =j+1;
                    } 
            }  
         
        return cadena;
        }
        
    
        
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operacion" value=""/>
            <input type="hidden" name="selRentaValor" id="selRentaValor" value=""/>
            <input type="hidden" name="IDCONVENIO" id="IDCONVENIO" value="${__formdata.IDCONVENIO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi015" c="LIT_FORMULARIO_1" lit="9904207" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi015" c="LIT_PANTALLA_1" lit="9904207" /></c:param>
                <c:param name="form">axiscomi015</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscomi015" c="LIT_INC_1" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                     
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                       
                                        <tr>
                                      	
                                           <axis:visible f="axiscomi015" c="CRAMO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscomi015" c="LIT_CRAMO" lit="100784" /></b>
                                                </td>
                                             </axis:visible>	
                                         
                                           	                                             
                                        </tr>
                                        <tr>
                                   
                                            <axis:ocultar f="axiscomi015" c="CRAMO"> 
                                             <td class="campocaja">  
                                                            <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                            title="<axis:alt f="axiscomi015" c="LIT_TIT_CRAMO" lit="100784" />" onchange="f_recargar();"
                                                            <axis:atr f="axiscomi015" c="CRAMO" a="isInputText=false"/>>
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi015" c="LIT_SEL_CRAMO" lit="108341" /> - </option>
                                                                <c:forEach items="${lista_ramos}" var="item">
                                                                    <option value = "${item.CRAMO}" <c:if test="${(!empty __formdata.CRAMO  && __formdata.CRAMO == item.CRAMO)}"> selected </c:if>>${item.TRAMO}</option>
                                                                </c:forEach>
                                                            </select>
                                              </td>  
                                            </axis:ocultar>
                                  
                                    
                                          </tr>
                                          
                                          
                                          <!-- ************************************************************************************************************************************* -->
                                       
                                        <!-- titulo -->
                                        <!--tr>
                                                            <td class="campocaja" colspan="2">
                                                                <div style="float:right;" id="DATOS_CORRETAJE"><img id="DSP_CORRETAJE_parent" src="images/new.gif" onclick="f_alta_convenio()" style="cursor:pointer"/></div>
                                                            </td>                    
                                        </tr-->
                                                       
                                        <tr>
                                                <td align="left" colspan="2">
                                                     <table border="0" class="area" align="left" style="width:100%;">
                                                       
                                                        <tr>
                                                            <td > 
                                                                <c:set var="title0"><axis:alt f="axiscomi015" c="LISTA_PRODUCTO" lit="109155"/></c:set>
                                                                <c:set var="title1"><axis:alt f="axiscomi015" c="LISTA_DESCPROD" lit="100588"/></c:set>
                                                                
                                                
                                                               
                                                                <%int contador = 0;%>
                                                                <div class="seccion displayspaceGrande">
                                                                <display:table name="${lista_prod_total}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  defaultorder="ascending" requestURI="modal_axiscomi015.do?paginar=true"
                                                                sort="list" cellpadding="0" cellspacing="0">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                    <!-- Nueva tabla - Columnas -->
                                                                    <display:column title=" " sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                                        <div class="dspIcons">
                                                                        <input <c:if test="${miListaId['MARCADO']==1}">checked</c:if> onclick="" type="checkbox" id="selProduct" name="selProduct" value="${miListaId.SPRODUC}"/>
                                                                        <input type="hidden" name="SPRODUC_<%= contador %>" id="SPRODUC_<%= contador %>" value="${miListaId.SPRODUC}"/>
                                                                        </div>
                                                                    </display:column>
                                                                 
                                                                    <%--display:column title="${title0}" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId.SPRODUC}</div>
                                                                    </display:column --%>
                                                                    <display:column title="${title1}" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId.TTITULO}</div>
                                                                        <input type="hidden" name="TPRODUC_<%= contador %>" id="TPRODUC_<%= contador %>" value="${miListaId.TTITULO}"/>
                                                                    </display:column>
                                                                    <%contador++;%>
                                                                 </display:table> 
                                                                </div>	
                                                                <!-- *************************  Botones Sel./Des. ********************* -->
                                                                <axis:visible f="axiscomi015" c="BUT_SEL_TODOS">
                                                                <input type="button" onclick="ChequearTodosBut()" class="boton" value="<axis:alt f="axisadm070" c="LIT_BUT_SELTODOS" lit="9000756"/>"/>
                                                                </axis:visible>
                                                                <axis:visible f="axiscomi015" c="BUT_DSEL_TODOS">
                                                                <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<axis:alt f="axisadm070" c="LIT_BUT_DESELTODOS" lit="9000757"/>"/>
                                                                </axis:visible>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                          
                      
                                          
                                          
                                          
                                          <!-- ************************************************************************************************************************************* -->
                                          

                                </table>
                               </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi015</c:param><c:param name="f">axiscomi015</c:param>
                <c:param name="f">axiscomi015</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />

    </body>
</html>