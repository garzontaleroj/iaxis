<%/**
*  Fichero: axispro028.jsp
*  Pantalla de gestión de provisiones.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 12/11/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axispro028" c="LIT" lit="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          

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

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                  f_cargar_propiedades_pantalla();            
            }
            
            function f_cargar_propiedades_pantalla(){
               revisarEstilos();
               document.getElementById("CEMPRES").focus();
               f_reescribir_links_ordenacion(); 
            }
            
            function f_but_buscar() {
                try {
                    document.miForm.CMES.setAttribute("obligatorio", "false"); 
                    document.miForm.CANY.setAttribute("obligatorio", "false"); 
                    //alert("antes");
                    //div = document.getElementById("listaImpresion");
                    //div.style.display="none";
                    //alert("después");

                } catch (e) {}
            
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("axis_axispro028.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro028", "cancelar", document.miForm, "_self");
            }           

            function f_imprimir_fitxer(pfitxer){
            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
            } 
            
            function f_but_108525() {
                var selectedCPROVISDiv    = document.getElementById("selectedCPROVISDiv");
                var selectedCPROVISInputs = selectedCPROVISDiv.getElementsByTagName("input");
                var checkBoxes = document.getElementsByName("checkboxmap");
                var CPROVIS2Print         = "";
                var descPROVIS2Print      = "";
                var notCPROVIS2Print         = "";
                var notdescPROVIS2Print      = "";
                var isAnyInputChecked     =false;
                var isAnyInputWhitOutMap     =false;
        
                if (objValidador.validaEntrada()) {
                    if (!objUtiles.estaVacio(selectedCPROVISInputs)) {
                        if (objUtiles.estaVacio(selectedCPROVISInputs.length)) {
                            if (selectedCPROVISInputs.value == "1") {
                                isAnyInputChecked=true;
                                CPROVIS2Print += selectedCPROVISInputs.name + "@";                                                                            
                                descPROVIS2Print += selectedCPROVISInputs.title  + "@";                                                                      
                            }
                        } else {
                            for (i = 0; i < selectedCPROVISInputs.length; i++) {
                                if (selectedCPROVISInputs[i].value == "1") {
                                    isAnyInputChecked=true;
                                    if (selectedCPROVISInputs[i].name=="" || selectedCPROVISInputs[i].name==null ){
                                        isAnyInputWhitOutMap=true;
                                        notdescPROVIS2Print += " - " + selectedCPROVISInputs[i].title  + "\n"; 
                                    }else{
                                        CPROVIS2Print += selectedCPROVISInputs[i].name  + "@";                                                                     
                                        descPROVIS2Print += selectedCPROVISInputs[i].title  + "@";   
                                    }
                                }
                            }
                        }
                        
                        objDom.setValorPorId("CPROVIS2Print", CPROVIS2Print);
                        objDom.setValorPorId("descPROVIS2Print", descPROVIS2Print);                            
                    }
                
                    if (!isAnyInputChecked){
                        alert("<axis:alt f='axispro028' c='LIT' lit='9000633'/>");
                    } else if  (isAnyInputWhitOutMap){
                        alert("<axis:alt f='axispro028' c='LIT' lit='9904803'/>"+ "\n" + notdescPROVIS2Print );
                    } else {
                        if (f_validarAny()) {
                            objDom.setValorPorId("TMES", 
                                document.getElementById("CMES")[document.getElementById("CMES").selectedIndex].text);
                                
                            //objUtiles.ejecutarFormulario("axis_axispro028.do", "imprimir", document.miForm, "_self", objJsMessages.jslit_cargando);        
                       
                            
                            var EsPPNC = descPROVIS2Print.substr(0,4);
                            //if (objUtiles.utilEquals(EsPPNC, 'PTPP')) {
                            
                                var CEMPRES = objDom.getValorPorId("CEMPRES");
                                var CMES = objDom.getValorPorId("CMES");
                                var CANY = objDom.getValorPorId("CANY");
                            
                                var VPARAMETROS = "||"+CEMPRES+"||||"
                                

                                  if(CMES>9) {
                                        objAjax.invokeAsyncCGI("axis_axispro028.do?CMAPS="+CPROVIS2Print+"&PANY="+CANY+"&PMES="+CMES+"&CEMPRES=" + CEMPRES
                                        , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                                 } else {
                                        objAjax.invokeAsyncCGI("axis_axispro028.do?CMAPS="+CPROVIS2Print+"&PANY="+CANY+"&PMES=0"+CMES+"&CEMPRES=" + CEMPRES
                                        , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);                                              
                                 }


                              //}
                                                
                        }   
                    }
                    
                }
            }            
            function f_seleccionar_provision(CPROVIS, value) {
                objDom.setValorPorId(CPROVIS, value ? '1' : '0');
            }
            
            function f_validarAny() {
                var CANY = document.getElementById("CANY");
                var any  = CANY.value;
                
                if (any.length == 1) {
                    any = "0" + any;
                }
                
                if (any.length == 2) {
                    // Ex. Any = 02
                    // Ex. Any = 98
                    if (any > 50) {
                        // Ex. Any = 98 --> 1998
                        any = parseInt(any, 10) + 1900;
                    } else {
                        // Ex. Any = 02 --> 2002
                        any = parseInt(any, 10) + 2000;
                    }
                    
                    objDom.setValorPorId("CANY", any);                
                    return true;                
                
                } else if (any.length != 4) {                    
                    alert(objJsMessages.jslit_campo_validador + " '" + CANY.title + "' : <axis:alt f='axispro028' c='LIT' lit='9000634'/>");
                    return false;
                } else {
                    return true;
                }
            }
            
            function f_reescribir_links_ordenacion() {
                var linksDt = objLista.obtenerFilasHeadLista("LSTPROVISIONES");
                var campos  = new Array(3);
                
                campos[0] = 'TCPROVIS';
                campos[1] = 'FCALCULO';
                campos[2] = 'FLANZAMIENTO';
                campos[3] = 'CMAPEAD';
                
                for (var i = 0; i < linksDt.length; i++) {                
                    if (!objUtiles.estaVacio(linksDt[i].className) && linksDt[i].className.indexOf("gridsortable") != -1 ) {
                        var ahead = linksDt[i].getElementsByTagName("a");
                        ahead[0].href = "javascript:f_ordenar('" + campos[i] + "')";
                    }
                }            
            }
            
            function f_ordenar(campo) {
                <c:if test="${empty requestScope.reportsList}">
                    objUtiles.ejecutarFormulario("axis_axispro028.do?ordenar=true&tabla=LSTPROVISIONES&campo=" + campo, 
                                                 "buscar", document.miForm, 
                                                 "_self", objJsMessages.jslit_cargando);
                </c:if>
                <c:if test="${!empty requestScope.reportsList}">
                    objUtiles.ejecutarFormulario("axis_axispro028.do?ordenar=true&tabla=LSTPROVISIONES&campo=" + campo, 
                                                 "imprimir", document.miForm, 
                                                 "_self", objJsMessages.jslit_cargando);
                                                 
                </c:if>
            }

/* ********************************************** */
/* ************ CALLBACKS *************************/
/* ********************************************** */

            function callbackAjaxGenerarResultado_map (ajaxResponseText) {
                                     
                 objDom.setValorPorId("SORTIDA", "");   
                 objDom.setValorPorId("CXML", "");  
                                

                //alert(ajaxResponseText);
                
                var doc = objAjax.domParse(ajaxResponseText);

                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FICHERO")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FICHERO"), 0, 0) : "";               
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                      
                     var F = new Array();
                     
                     for (var i=1; i <=  fichero.match(/@/g).length; i++) {
                          F[i] = objUtiles.utilSplit(fichero, "@")[i-1];
                           objDom.setValorPorId("F"+i,F[i]); // SPERSON                          
                     
                    //var F11 = objUtiles.utilSplit(fichero, "@")[0]; // CTIPDES  
                    //var F22 = objUtiles.utilSplit(fichero, "@")[1]; // CTIPDES  
                    //var F33 = objUtiles.utilSplit(fichero, "@")[2]; // CTIPDES  
                    //var F44 = objUtiles.utilSplit(fichero, "@")[3]; // CTIPDES  
                    //var F55 = objUtiles.utilSplit(fichero, "@")[4]; // CTIPDES  
                    //var F66 = objUtiles.utilSplit(fichero, "@")[5]; // CTIPDES  
                    //var F77 = objUtiles.utilSplit(fichero, "@")[6]; // CTIPDES  
                    //var F88 = objUtiles.utilSplit(fichero, "@")[7]; // CTIPDES  
                    //var F99 = objUtiles.utilSplit(fichero, "@")[8]; // CTIPDES  

                    //objDom.setValorPorId("F1",F11); // SPERSON
                    //objDom.setValorPorId("F2",F22); // SPERSON
                    //objDom.setValorPorId("F3",F33); // SPERSON
                    //objDom.setValorPorId("F4",F44); // SPERSON
                    //objDom.setValorPorId("F5",F55); // SPERSON
                    //objDom.setValorPorId("F6",F66); // SPERSON
                    //objDom.setValorPorId("F7",F77); // SPERSON
                    //objDom.setValorPorId("F8",F88); // SPERSON
                    //objDom.setValorPorId("F9",F99); // SPERSON
                    }
                    
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='axispro028' c='LIT' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                              

                              // AHORA LA LISTA /////
                                var tableM = document.getElementById("ReportsList");
                                var tbodyM = tableM.getElementsByTagName("tbody")[0];
                                var trM = tbodyM.getElementsByTagName("tr");
                    
                                objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axispro028' c='LIT' lit='1000254' />");
                    
                        ///      
                            for (var j=1; j <=  fichero.match(/@/g).length ; j++) {
                                objLista.borrarFilaVacia(tbodyM, trM);
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd = new Array(1);
        
                                var llamada = "javascript:f_imprimir_fitxer(document.getElementById('F"+j+"').value)";
        
                                //newtd[0] = objLista.addTextoEnLista(F[i],
                                //"javascript:f_imprimir_fitxer(document.getElementById('F1').value)");
                                
                                 newtd[0] = objLista.addTextoEnLista(F[j],llamada);
                                

                                objLista.addNuevaFila(newtd, newtr, tbodyM);   
                                }
                     ///////////////////////                     
 
                         }
                   }                
            }        

        </script>
    </head>

    <c:set var="onKeyPress">
        <c:if test="${empty requestScope.LSTPROVISIONES}">
            if (event.keyCode==13)  { f_but_buscar() }
        </c:if>
        <c:if test="${!empty requestScope.LSTPROVISIONES}">
            if (event.keyCode==13)  { f_but_108525() }
        </c:if>
    </c:set>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="${onKeyPress}">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axispro028" c="LIT" lit="1000205" />|true</c:param>
        </c:import>          
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SORTIDA" id="SORTIDA" value=""/>                          
            
            <input type="hidden" name="F1" id="F1" value=""/>                          
            <input type="hidden" name="F2" id="F2" value=""/>                          
            <input type="hidden" name="F3" id="F3" value=""/>                          
            <input type="hidden" name="F4" id="F4" value=""/>                          
            <input type="hidden" name="F5" id="F5" value=""/>                          
            <input type="hidden" name="F6" id="F6" value=""/>                                      
            <input type="hidden" name="F7" id="F7" value=""/>                          
            <input type="hidden" name="F8" id="F8" value=""/>                          
            <input type="hidden" name="F9" id="F9" value=""/>                                                  
            
            <input type="hidden" id="TMES" name="TMES" value="${__formdata.TMES}"/>
            <input type="hidden" id="CPROVIS2Print" name="CPROVIS2Print" value="${__formdata.CPROVIS2Print}"/>
            <input type="hidden" id="descPROVIS2Print" name="descPROVIS2Print" value="${__formdata.descPROVIS2Print}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axispro028" c="LIT" lit="9000630"/></c:param> <%-- Impresión de provisiones --%>
                <c:param name="titulo"><axis:alt f="axispro028" c="LIT" lit="9000630"/></c:param>     <%-- Gestión de provisiones --%>
                <c:param name="form">axispro028</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
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
                                            <td class="titulocaja">
                                                <b><axis:alt f="axispro028" c="LIT" lit="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                    
                                        </tr>
                                        <tr>
                                            <%-- Empresa --%>
                                            <td class="campocaja">
                                                <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="f_but_buscar()" class="campo campotexto" style="width:90%" obligatorio="true"
                                                title="<axis:alt f="axispro028" c="LIT" lit="101619"/>">
                                                    <option value="null"> - <axis:alt f="axispro028" c="LIT" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                        <option value = "${item.CEMPRES}" <c:if test="${__formdata.CEMPRES != null && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="campocaja">
                                                <!--img id="find" border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<axis:alt f="axispro028" c="LIT" lit="9000508"/>" title="<axis:alt f="axispro028" c="LIT" lit="9000508"/>"/-->
                                            </td>
                                        <tr>
                                            <td colspan = "4">
                                                <div class="separador">&nbsp; </div>                                        
                                                <div class="separador">&nbsp; </div>                                        
                                                <%-- DisplayTag Provisiones --%>
                                                <c:set var="title0"><axis:alt f="axispro028" c="LIT" lit="1000518"/></c:set>  <%-- Provisión --%>
                                                <c:set var="title1"><axis:alt f="axispro028" c="LIT" lit="9000629"/></c:set>  <%-- F. último cálculo --%>
                                                <c:set var="title2"><axis:alt f="axispro028" c="LIT" lit="9000628"/></c:set>  <%-- F. lanzamiento --%>
                    
                                                <div id="selectedCPROVISDiv">
                                                    <c:forEach items="${requestScope.LSTPROVISIONES}" var="provision">
                                                        <c:set var="myChecked">
                                                            checked_${provision.CPROVIS}
                                                        </c:set>
                                                        <input type="hidden" id="valProvis_${provision.CPROVIS}" name="${provision.CMAPEAD}"
                                                        value="${__formdata[myChecked]}" title="${provision.TCPROVIS} - ${provision.TLPROVIS}"/>                            
                                                    </c:forEach>
                                                </div>
        
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${requestScope.LSTPROVISIONES}" id="LSTPROVISIONES" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axispro028.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="true" sortProperty="TCPROVIS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPROVISIONES.TCPROVIS} - ${LSTPROVISIONES.TLPROVIS}  <c:if test="${empty LSTPROVISIONES.CMAPEAD}">(<axis:alt f="axispro028" c="LIT" lit="9904806"/>)</c:if>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="FCALCULO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value="${LSTPROVISIONES.FCALCULO}" pattern="dd/MM/yyy"/>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="FLANZAMIENTO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value="${LSTPROVISIONES.FLANZAMIENTO}" pattern="dd/MM/yyy"/>
                                                            </div>
                                                        </display:column>
                                                        <c:set var="myChecked">
                                                            checked_${LSTPROVISIONES.CPROVIS}
                                                        </c:set>
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                             <div class="dspIcons">
                                                                <input id="checkProvis_${LSTPROVISIONES.CPROVIS}" name="checkboxmap" type="checkbox"  
                                                                onclick="f_seleccionar_provision('valProvis_${LSTPROVISIONES.CPROVIS}', this.checked)"
                                                                <c:if test="${__formdata[myChecked] == '1'}"> checked="checked"</c:if>
                                                                <c:if test="${empty LSTPROVISIONES.CMAPEAD}"> <axis:atr f="axispro028" c="checkProvis_${LSTPROVISIONES.CPROVIS}"  a="modificable=false&isInputText=false"/> </c:if>
                                                                  />
                                                            </div>
                                                        </display:column>          
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>                        
                        
                        <c:if test="${!empty requestScope.LSTPROVISIONES}">
                            <div class="separador">&nbsp; </div>                                        
                            <table class="seccion">
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
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro028" c="LIT" lit="9000495"/></b> <%-- Mes --%>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro028" c="LIT" lit="101606"/></b> <%-- Año --%>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <%-- MES --%>
                                                <td class="campocaja">
                                                    <select name = "CMES" id ="CMES" size="1" class="campo campotexto" style="width:60%" obligatorio="true"
                                                    title="<axis:alt f="axispro028" c="LIT" lit="9000495"/>">
                                                        <option value="null"> - <axis:alt f="axispro028" c="LIT" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LISTVALORES.LSTMESES}" var="item">
                                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata.CMES != 'null' && __formdata.CMES == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <!-- ANYO -->
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CANY" name="CANY" size="15"
                                                    style="width:58%" value="${__formdata.CANY}" obligatorio="true" formato="entero" alt="<axis:alt f="axispro028" c="LIT" lit="101606"/>" title="<axis:alt f="axispro028" c="LIT" lit="101606"/>"/>
                                                </td>
                                                <td class="campocaja">
                                                    <div style="text-align:left;">
                                                        <input type="radio" id="PPREVIO" name="PPREVIO" size="15" value="1"
                                                        <c:if test='${empty __formdata.PPREVIO || __formdata.PPREVIO == 1}'> checked </c:if>/>
                                                        <b><axis:alt f="axispro028" c="LIT" lit="9000632"/></b> <%-- Previo --%>   <br/>                                            
                                                        <input type="radio" id="PPREVIO" name="PPREVIO" size="15" value="2"
                                                        <c:if test='${__formdata.PPREVIO == 2}'> checked </c:if>/>
                                                        <b><axis:alt f="axispro028" c="LIT" lit="9000506"/></b> <%-- Real --%> 
                                                    </div>
                                                </td>
                                            </tr>
                                            <%--
                                            <tr>
                                                <td align="right" colspan="5">
                                                <c:if test="${!empty requestScope.LSTPROVISIONES}">                                                
                                                <input type="button" class="boton" id="but_imprimir" name="but_imprimir"  value="<axis:alt f="axispro028" c="LIT" lit="108525" />" 
                                                    onclick="f_but_imprimir()"/>
                                                </c:if>                                                
                                                </td>                                                
                                            <tr>
                                            --%>
                                            <c:if test="${!empty sessionScope.reportsList}">
                                           
                                                <tr id="listaImpresion">
                                                    <td colspan="5">
                                                        <div class="separador">&nbsp;</div>     
                                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axispro028" c="LIT" lit="112247"/></div> <%-- Listados --%>
                                                        <%-- DisplayTag Provisiones --%>
                                                        <c:set var="title0"><axis:alt f="axispro028" c="LIT" lit="1000518"/></c:set>  <%-- Provisión --%>
                                                        <c:set var="title1"><axis:alt f="axispro028" c="LIT" lit="100588"/></c:set>   <%-- Descripción --%>
                                                        <c:set var="title2"><axis:alt f="axispro028" c="LIT" lit="100562"/></c:set>   <%-- Fecha --%> 
                                                        <div class="displayspaceMaximo">
                                                            <display:table name="${sessionScope.reportsList}" id="reportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axispro028.do?paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title0}" sortable="true" sortProperty="CPROVIS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                        <a href="javascript:void(0)" onclick="window.open('axis_reports.do?indiceReport=${reportsList.indiceReport}')">
                                                                            ${reportsList.codigoPROVIS}
                                                                        </a>
                                                                    </div>
                                                                </display:column>  
                                                                <display:column title="${title1}" sortable="true" sortProperty="descPROVIS" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                        <a href="javascript:void(0)" onclick="window.open('axis_reports.do?indiceReport=${reportsList.indiceReport}')">
                                                                            ${reportsList.descPROVIS}
                                                                        </a>
                                                                    </div>
                                                                </display:column>  
                                                                <display:column title="${title2}" sortable="false" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                        <a href="javascript:void(0)" onclick="window.open('axis_reports.do?indiceReport=${reportsList.indiceReport}')">
                                                                            ${__formdata.TMES} / ${__formdata.CANY}
                                                                        </a>
                                                                    </div>
                                                                </display:column>  
                                                            </display:table>    
                                                         </div>
                                                         <div class="separador">&nbsp; </div>
                                                    </td>
                                                </tr>
                                           
                                            </c:if>
                                        </table>
                                    </td>
                                </tr>
                                                <tr id="listaImpresion">
                                                    <td colspan="2">
                                                        <div class="separador">&nbsp;</div>     
                                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axispro028" c="LIT" lit="112247"/></div>
                                                        
                                                        <c:set var="title0"><axis:alt f="axispro028" c="LIT" lit="107913"/></c:set>  
                                                        <div class="displayspaceMaximo">
                                                            <display:table name="${sessionScope.reportsList}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisctr050.do?paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                        <a href="javascript:void(0)" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+FILE)">  <%-- +"&mimetype=csv" --%>
                                                                            ${reportsList.codigoPROVIS}
                                                                        </a>
                                                                    </div>
                                                                </display:column>  >                                                             
                                                            </display:table>    
                                                         </div>                                                         
                                                         <div class="separador">&nbsp; </div>
                                                    </td>
                                                </tr>                                  
                            </table>
                        </c:if>
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axispro028</c:param>
                            <c:param name="__botones">salir<c:if test="${!empty requestScope.LSTPROVISIONES}">,108525</c:if></c:param>
                        </c:import>
                        
                    </td>
                </tr>
            </table>
            
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
