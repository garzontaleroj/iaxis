<%
/**
*  Fichero: axisper032.jsp
*  Fecha: 26/11/1907
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<style type="text/css">
.displayspaceGrandeSinBorde {
    width:100%;
    height: expression( this.scrollHeight > 220 ? "320px" : "auto" );  
    max-height:320px;
    overflow-x: auto;
    overflow-y: auto;
}
</style>


<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    
    <script language="Javascript" type="text/javascript">
        var vcactivi = '';
        function f_onload() {
       
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
             
             if( ${!empty __formdata.NNUMNIF} && ${__formdata.PERSONA} == 2  && ( ${!empty __formdata.BUSCAR} && ${__formdata.BUSCAR} == 2))
                f_but_buscar();
             
             f_cargar_propiedades_pantalla();
             
        }
        
        function f_but_cerrar() {
            parent.f_cerrar_modal('axisper032');
        }              

        function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "8", "<axis:alt f="axisper032" c="miListaId" lit='1000254' />");                    
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
        }
            
        function mostrar(nombreCapa){             
              document.getElementById(nombreCapa).style.visibility="visible"; 
        } 
            
        function ocultar(nombreCapa){             
             document.getElementById(nombreCapa).style.visibility="hidden"; 
        } 
        
        function f_but_cancelar() {
            parent.f_cerrar_axisper032();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta (true), ejecutamos la acción
            
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper032.do","busqueda_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaPersona))
                alert(objJsMessages.jslit_busca_primero);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaPersona");

                if(typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_de_lista);
                else {
                    seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0],objUtiles.utilSplit(hayChecked, "/")[1]);
                }
            }
        }
        
        function seleccionarLista(SPERSON,CAGENTE){
            var PERSONA = document.miForm.PERSONA.value;
            parent.f_aceptar_axisper032(SPERSON,CAGENTE,PERSONA);
        
        }
        
        function f_but_9901190() {
            var CFICHERO = objDom.getValorPorId("CFITXER");
            var SPARAMETROS = objDom.getValorPorId("SPARAM");
                        
                objAjax.invokeAsyncCGI("modal_axisper032.do?CMAP=" + CFICHERO + "&CPARAMETROS=" + SPARAMETROS
                                        , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
            
        }

        function callbackAjaxGenerarResultado_map (ajaxResponseText) {

                var doc = objAjax.domParse(ajaxResponseText);
               
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                    var pinta =  objUtiles.hayValorElementoXml(doc.getElementsByTagName("PEJECUTAREP")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("PEJECUTAREP"), 0, 0) : "";
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='axisper032' c='ERRORFICHERO' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        var tableM = document.getElementById("OBFICHERO");
                        var tbodyM = tableM.getElementsByTagName("tbody")[0];
                        var trM = tbodyM.getElementsByTagName("tr");
                        objLista.borrarFilasDeLista ("OBFICHERO", "1", "<axis:alt f='axisper032' c='NOVALORES' lit='1000254' />");
                        objLista.borrarFilaVacia(tbodyM, trM);
                        
                        //Per cada fitxer
                        for (var i = 0; i < objDom.numeroDeTags(doc, "FICHERO") ; i++) {
                            fichero = (((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FICHERO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FICHERO"), i, 0) : ""));
                            if (!objUtiles.estaVacio(fichero)) {
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd = new Array(1);
                                sfichero = fichero.replace(/\\/gi, "barrainvertida");
                                newtd[0] = objLista.addTextoEnLista(fichero,
                                  "javascript:f_imprimir_fitxer('"+sfichero+"')");
                                objLista.addNuevaFila(newtd, newtr, tbodyM);  

                            }
                        }
                    }
                }                
            }        

            function f_but_100001 (){ //Resultado   
                objUtiles.ejecutarFormulario("modal_axisper032.do", "imprimir_report", document.miForm, "_new");
            }        

            function f_imprimir_fitxer(pfitxer){
                pfitxer= pfitxer.replace(/barrainvertida/gi, "\\"); 
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
            }     
            
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
            }
        
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr075" c="IMP_DOCUMENTOS" lit="1000205" />|true</c:param>
    </c:import>
        <form name="miForm" action="" method="POST">
             <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="" />
            <input type="hidden" name="PERSONA" id="PERSONA" value="${__formdata.PERSONA}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper032" c="FORM" lit="9901871" /></c:param>
                <c:param name="producto"><axis:alt f="axisper032" c="PRODUCTO" lit="9901871"/></c:param>
                <c:param name="form">axisper032</c:param>
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
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisper032" c="NNUMNIF" dejarHueco="false"> 
                                                  <td class="titulocaja">
                                                      <b><axis:alt f="axisper032" c="NNUMNIF" lit="9000760"></axis:alt></b><%-- <axis:ayuda c="NNUMNIF" f="axisper032" /> --%>
                                                  </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisper032" c="NNUMNIF" >
                                              <td class="campocaja">
                                                  <input  type="text" class="campo campotexto" value="${__formdata.NNUMNIF}" name="NNUMNIF" id="NNUMNIF" size="15"
                                                    title="<axis:alt f="axisper032" c="NNUMNIF2" lit="105904"/>"
                                                     <axis:atr f="axisper032" c="NNUMNIF" a="obligatorio=true"/> 
                                                     <c:if test="${!empty __formdata.NNUMNIF && __formdata.PERSONA == 2 }"> readonly </c:if> />
                                              </td>
                                        </axis:visible>
                                        </tr>   
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td> 
                                <c:set var="title1"><axis:alt f="axisper032" c="NNUMIDE" lit="105330"/></c:set>
                                <c:set var="title2"><axis:alt f="axisper032" c="NOMBRE" lit="105940"/></c:set>
                                <c:set var="title3"><axis:alt c="FNACIMI" f="axisper032" lit="1000064"/></c:set>
                                <c:set var="title4"><axis:alt c="TDOMICI" f="axisper032" lit="110029"/></c:set>
                                <c:set var="title5"><axis:alt c="CPOSTAL" f="axisper032" lit="100823"/></c:set>
                                <c:set var="title0"><axis:alt f="axisper032" c="CAGENTE" lit="100584"/></c:set>
                                
                                
                                <div class="separador">&nbsp;</div>
                                <div class="displayspaceGrandeSinBorde" style="height:200px">
                                 <%int contador = 0;%>
                                    <display:table name="${sessionScope.axisper032_listaPersonas}" id="miListaId" export="false" class="dsptgtable" 
                                     pagesize="-1" defaultsort="1"  sort="list" cellpadding="0" cellspacing="0" 
                                     requestURI="modal_axisper032.do?paginar=true">
                                     <c:set var="contador"><%=contador%></c:set>                                      
                                    <%@ include file="../include/displaytag.jsp"%>
                                       
                                        <display:column title=" " sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['seleccionaPersona']}">checked</c:if> type="radio" id="seleccionaPersona" name="seleccionaPersona" value="${miListaId['CODI']}/${miListaId['CAGENTE']}"/></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['NNUMIDE']}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" style="width:25%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                                              
                                    <axis:visible f="axisper032" c="CAGENTE">
                                        <display:column title="${title0}" sortable="true" style="width:5%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId['CAGENTE']}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" style="width:20%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['TAGENTE']}</a></div>
                                        </display:column>                                                  
                                    </axis:visible>
                                      <axis:visible f="axisper032" c="BT_MASDATOS_EXTSEG">
                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html" style="width:5%" autolink="false" >
                                                <div class="dspIcons">
                                                    <img border="0" alt="<axis:alt c="BT_MASDATOS_EXTSEG" f="axisper032" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_EXTSEG" f="axisper032" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                                                    style="cursor:pointer;"  onmouseout="javascript:ocultar('SECCION_${contador}')"  onmouseover="javascript:mostrar('SECCION_${contador}')"  />
                                                </div>
                                            </display:column>   
                                        </axis:visible>
                                    
                                        <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                        <display:column class="seccion_informacion">
                                    
                                            <div id="SECCION_${contador}" class="seccion_informacion" style="height:150px;" >
                                                <table class="area" id="ivan" align="center">
                                                     <tr>
                                                        <th style="width:25%;height:0px"></th>
                                                        <th style="width:5%;height:0px"></th>
                                                        <th style="width:25%;height:0px"></th>
                                                        <th style="width:45%;height:0px"></th>    
                                                     </tr>
													<axis:visible f="axisper032" c="DECLARANTE"> 
                                                    <tr>
                                                        <td style="background-color:#FFFFFF;border: 0px solid #FFFFFF;">
                                                            <b id="label_DECLARANTE">${title10}</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color:#FFFFFF;border: 0px solid #FFFFFF;">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
													</axis:visible>
                                                    <tr>
                                                        <axis:visible f="axisper032" c="FNACIMI">
                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" colspan="2" >
                                                            <b><axis:alt c="FNACIMI" f="axisper032" lit="1000064"/></b>
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible f="axisper032" c="CPOSTAL">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b><axis:alt c="CPOSTAL" f="axisper032" lit="100823"/></b> 
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:visible f="axisper032" c="FNACIMI">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="2">
                                                                <input type="text" class="campo campotexto" id="NNUMIDE" name="NNUMIDE"  style="width:75%"
                                                                       value="${miListaId.FNACIMI}"
                                                                       readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axisper032" c="CPOSTAL">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                <input type="text" class="campo campotexto" id="TNOMDEC" name="TNOMDEC"  style="width:100%"
                                                                       value="${miListaId['CPOSTAL']}" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axisper032" c="TDOMICI">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b><axis:alt c="TDOMICI" f="axisper032" lit="9000914"/></b> 
                                                            </td>
                                                        </axis:visible>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axisper032" c="TDOMICI">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="4">
                                                                <input type="text" class="campo campotexto" id="TAPE1DEC" name="TAPE1DEC"  style="width:100%"
                                                                       value="${miListaId['TDOMICI']}" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                </table>
                                            </div>
                                        </display:column>
                                        <%contador++;%>
                                    </display:table>
                                </div> 
                            
                            </td>
                        </tr>
                       
                        
                        
                        </table>
                    </td>
                    <td>
                        
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                <div class="separador">&nbsp;</div>
                        <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                        <tr>
                                            <th style="width:40%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                        </tr>
                                        <tr> <%-- Ficheros --%>
                                            <td class="titulocaja" >
                                                <b><axis:alt f="axisctr075" c="TIT_FITX" lit="9901019"/></b>
                                            </td>   
                                        </tr>
                                        <tr>
                                            <td class="campocaja" id="fichero">
                                                <%int cont = 0;%>
                                                <c:set var="title0"><axis:alt f="axisper032" c="FICHERO" lit="1000574"/>  </c:set>
                                                <div class="seccion displayspace">
                                                 <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="modal_axisper032.do?paginar=true" style="width:99.9%">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                                    </display:column>   
                                                 </display:table>
                                                </div>
                                            </td> 
                                        </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
                
                
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper032</c:param><c:param name="f">axisper032</c:param><c:param name="f">axisper032</c:param>
                <c:param name="__botones"><axis:visible f="axisper032" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisper032" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisper032" c="BT_ACEPTAR">,aceptar</axis:visible><axis:visible f="axisper032" c="BT_LISTADO">,9901190</axis:visible></c:param>
            </c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

