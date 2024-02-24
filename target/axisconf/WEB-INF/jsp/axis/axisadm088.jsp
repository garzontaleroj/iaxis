<%
/**
*  Fichero: axisadm088.jsp
*  @author <a href = "mailto:casanchez@csi-ti.com">Carlos Andres Sanchez Lastra</a>  
*  Traspaso bancos cobradores bancarios
*  Fecha: 08/09/2014
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt c="TIT_FORM" f="axisadm088" lit="100681"/></title>
        
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            var COBBANCORIGEN  = null;
            var COBBANCDESTINO = null;
            
            function f_set_cobBancOrg(cobBancOrg){
                //
                if(cobBancOrg > 0){
                    //
                    COBBANCORIGEN = cobBancOrg;
                    //
                }else{
                    //
                    COBBANCORIGEN = '';
                    //
                }
                //
            }
            
            function f_set_cobBancDest(cobBancDest){
                //
                if(cobBancDest > 0){
                    //
                    COBBANCDESTINO = cobBancDest;
                    //
                }else{
                    //
                    COBBANCDESTINO = '';
                    //
                }
                //
            }
            
            function f_cons_bancos(){
                //
                objAjax.invokeAsyncCGI("axis_axisadm088.do", callbackAjaxCargarBancos, "operation=ajax_busqueda_bancos&COBBANORG="+COBBANCORIGEN, this, objJsMessages.jslit_cargando);                                   
                //
            }
            
            function callbackAjaxCargarBancos (ajaxResponseText){
                //
                var doc=objAjax.domParse(ajaxResponseText);
                //
                //Buscamos las filas (tradded) y el cuerpo (tbodyadded) de un displayTag asociado (miListaId) 
                //para poder añadir una nueva fila
                //
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    //
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    //
                    objLista.borrarFilasDeLista ("miListaId", "8", "<axis:alt c='SNV_COMBO' f='axisadm088' lit='9907019'/>");
                    //  
                    if (objDom.existeTag(doc, "CCOBBAN")){
                        //
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        //
                        objLista.borrarFilaVacia(tbodyadded, tradded);
                        //
                    }
                    //
                    // Bucle para insertar cada una de las filas
                    //                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CCOBBAN") ; i++) {                        
                        //
                        //Obtenemos el estilo para la fila que insertaremos
                        //
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                        //
                        //Creamos una nueva fila vacia y le damos el estilo obtenido
                        //
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        //
                        //Creamos un array de columnas a añadir a la nueva fila del displayTag
                        //
                        var newtd = new Array(6);
                        //
                        var CCOBBAN = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCOBBAN")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCOBBAN"), i, 0) : "";
                        var NORDEN  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NORDEN")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NORDEN"), i, 0) : "";
                        var CAGENTE = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CAGENTE")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAGENTE"), i, 0) : "";
                        var CRAMO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CRAMO")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0) : "";
                        var TRAMO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRAMO")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0) : "";
                        var SPRODUC = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPRODUC")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0) : "";
                        var CBANCO  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CBANCO")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCO"), i, 0) : "";
                        var CBANCO  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CBANCO")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCO"), i, 0) : "";
                        var TBANCO  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TBANCO")[i]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TBANCO"), i, 0) : "";                        
                        //
                        //Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        // COLUMNA DEL CHECKBOX
                        //
                        newtd[0] = objLista.addCheckBoxEnLista("checkBanco", CBANCO);
                        //                        
                        //COLUMNA ORDEN
                        //
                        newtd[1] = objLista.addNumeroEnLista(NORDEN);
                        //  
                        //COLUMNA AGENTE
                        //
                        newtd[2] = objLista.addTextoEnLista(CAGENTE);
                        //  
                        //COLUMNA RAMO
                        //
                        newtd[3] = objLista.addTextoEnLista(CRAMO+' - '+TRAMO);
                        //
                        //COLUMNA PRODUC
                        //
                        newtd[4] = objLista.addTextoEnLista(SPRODUC);
                        // 
                        //COLUMNA BANCO
                        //
                        newtd[5] = objLista.addTextoEnLista(CBANCO+' - '+TBANCO);
                        //
                        //Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        //
                        objLista.addNuevaFila(newtd, newtr, tbodyadded);
                        //
                        var objOpcs = document.getElementsByName("checkBanco");
                        var objOpc  = objOpcs.item(0); 
                        //
                        if(!objUtiles.estaVacio(objOpc)){
                            //
                            objOpc.checked=true;
                            //
                        }
                        //
                    }
                    //
                }
                //
                // recarrega scroll pane
                //
                $.reinitialiseScroll(); 
                f_cargar_propiedades_pantalla();
                //                
            }
                        
            function f_but_aceptar() {
                //
                var inputs=document.getElementsByTagName("input");
                var bancosATraspasar = '';
                var codEmpresa = document.getElementById("CEMPRES").value;
                //
                if(COBBANCORIGEN > 0){
                    //
                    if(COBBANCDESTINO  > 0){
                        //
                        if(COBBANCORIGEN != COBBANCDESTINO){
                            //
                            for(i=0;i<inputs.length;i++){
                                //
                                if (inputs[i].type=="checkbox") {
                                    //
                                    if (inputs[i].checked) {
                                        //
                                        if (inputs[i].name=="checkBanco"){
                                            //                                
                                            if (bancosATraspasar==null){
                                                //                                    
                                                bancosATraspasar=inputs[i].value;
                                                //
                                            }else{
                                                //
                                                bancosATraspasar=bancosATraspasar+"|"+inputs[i].value;
                                                //
                                            }
                                            //
                                        }
                                        //
                                    }
                                    //
                                }                                
                                //
                           }
                           //
                            if(bancosATraspasar != ''){
                                //
                                objDom.setValorPorId("CODEMPRESA", codEmpresa);
                                objDom.setValorPorId("COBBANCORIGEN", COBBANCORIGEN);
                                objDom.setValorPorId("BANCOSATRASPASAR", bancosATraspasar);
                                objDom.setValorPorId("COBBANCDESTINO", COBBANCDESTINO);
                                //
                                objUtiles.ejecutarFormulario ("axis_axisadm088.do?CODEMPRESA="+codEmpresa+"&COBBANCORIGEN="+COBBANCORIGEN+"&BANCOSATRASPASAR="+bancosATraspasar+"&COBBANCDESTINO="+COBBANCDESTINO, "accion_aceptar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
                                //
                            }else{
                                //
                                //Debe seleccionar al menos un banco para su traspaso
                                //
                                alert("<axis:alt f="axisadm088" c="BUT_ACEPTAR" lit="9907073"/>"); 
                                //
                            }
                           //
                        }else{
                            //
                            //Cobrador bancario origen y cobrador bancario destino no pueden ser iguales
                            //
                            alert("<axis:alt f="axisadm088" c="BUT_ACEPTAR" lit="9907074"/>"); 
                            //
                        }
                        //                        
                    }else{
                        //
                        //No se ha informado el cobrador bancario destino
                        //
                        alert("<axis:alt f="axisadm088" c="BUT_ACEPTAR" lit="9907075"/>"); 
                        //
                    }
                    //
                }else{
                    //
                    //No se ha informado el cobrador bancario origen
                    //
                    alert("<axis:alt f="axisadm088" c="BUT_ACEPTAR" lit="9907076"/>"); 
                    //
                }
                //
            }
            
            function f_but_cancelar() {
                //
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm088", "cancelar", document.miForm, "_self");                  
                //
            }
            
            function f_onload(){
                //               
                objEstilos.toggleDisplay('DSP_COBRADOR', document.getElementById("DSP_COBRADOR_parent"));
                f_cargar_propiedades_pantalla();                
                //
                <c:if test="${empty __formdata.CCOBBAN}">                  
                    var ok = "${__formdata.OK}";                             
                </c:if>
                //                
            }
            
        </script>
        
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST"> 
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CEMPRES" id="CEMPRES"  value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />        
        <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
            <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
        </c:if>        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo" f="axisadm088" lit="9907013"/></c:param>
                <c:param name="formulario"><axis:alt c="formulario" f="axisadm088" lit="9907013"/></c:param>
                <c:param name="form">axisadm088</c:param>
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

    <!-- Area de campos  -->
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
          <td>                                   
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:50%;height:0px"></th>
                                <th style="width:50%;height:0px"></th>
                            </tr>
                            <tr>                            
                               <axis:ocultar f="axisadm088" c="CEMPRES"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="2" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisadm088" c="CEMPRES" lit="101619"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>       
                             </tr>
                             <tr>                             
                                <axis:ocultar f="axisadm088" c="CEMPRES"  dejarHueco="false"> 
                                   <c:choose>  
                                                <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                                  <td class="campocaja" colspan="2">
                                                        <select name="SCEMPRES" id ="SCEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                        title="<axis:alt c="CEMPRES" f="axisadm088" lit="101619"/>" 
                                                        <axis:atr f="axisadm088" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="SELECC" f="axisadm088" lit="108341"/> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                    <c:otherwise> 
                                                 <td class="campocaja" colspan="" >
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                 <axis:atr f="axisadm088" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                 </axis:ocultar>
                             </tr>
                             <tr><td colspan="2">&nbsp</td></tr>
                             <tr>                            
                               <axis:ocultar f="axisadm088" c="COBBANCORIG"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisadm088" c="COBBANCORIG" lit="9907019"></axis:alt></b> 
                                         <b><select name="COBBANCORIG" id ="COBBANCORIG" size="1" class="campo campotexto" style="width:30%" 
                                            title="<axis:alt c="COBBANCORIG" f="axisadm088" lit="9907019"/>" onchange="javascript:f_set_cobBancOrg(this.value);f_cons_bancos();"
                                            <axis:atr f="axisadm088" c="COBBANCORIG" a="isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="SNV_COMBO" f="axisadm088" lit="9907019"/> - </option>
                                                <c:forEach items="${__formdata.LVCOBBANCORG.LSTCOBBANORG}" var="item">
                                                    <option value = "${item.CCOBBAN}" <c:if test="${!empty  __formdata.CCOBBAN}"> selected </c:if>>${item.CCOBBAN} - ${item.DESCRIPCION}</option>
                                                </c:forEach>
                                            </select></b>
                                    </td>
                                </axis:ocultar>       
                                <axis:ocultar f="axisadm088" c="COBBANCDEST"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisadm088" c="COBBANCDEST" lit="9907020"></axis:alt></b> 
                                         <b><select name="COBBANCDEST" id ="COBBANCDEST" size="1" class="campo campotexto" style="width:30%" 
                                            title="<axis:alt c="COBBANCDEST" f="axisadm088" lit="9907020"/>" onchange="javascript:f_set_cobBancDest(this.value);"
                                            <axis:atr f="axisadm088" c="COBBANCDEST" a="isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="SELECC" f="axisadm088" lit="9907020"/> - </option>
                                                <c:forEach items="${__formdata.LVCOBBANCDEST.LSTCOBBANDEST}" var="item">
                                                    <option value = "${item.CCOBBAN}" <c:if test="${!empty  __formdata.CCOBBAN}"> selected </c:if>>${item.CCOBBAN} - ${item.DESCRIPCION}</option>
                                                </c:forEach>
                                            </select></b>
                                    </td>
                                </axis:ocultar>
                             </tr>
                                <tr><td colspan="2">&nbsp</td></tr>
                                <tr><td colspan="2">&nbsp</td></tr>
                                <tr><td colspan="2">&nbsp</td></tr>
                             <!--- Sección Cobrador --->                           
                            <tr>                                
                                <td class="campocaja" colspan ="4">
                                    <div style="float:left;">
                                            <img id="DSP_COBRADOR_parent" src="images/mes.gif" 
                                                onclick="objEstilos.toggleDisplay('DSP_COBRADOR', this)" 
                                                style="cursor:pointer"/> 
                                            <b><axis:alt f="axisadm088" c="DSP_COBRADOR_1" lit="9907021"></axis:alt></b>
                                    </div>
                                    <div class="seccion_cobrador"  id="SECCION_COBRADOR"></div>                                            
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>         
                               </td> 
                            </tr>   
                            <tr id="DSP_COBRADOR_children" style="display:none">
                                <td class="campocaja" colspan = "4"> 
                                    <axis:ocultar c="DSP_COBRADOR" f="axisctr58" dejarHueco="false">                                                                
                                        <c:set var="title1"><axis:alt c="orden" f="axisadm088" lit="500102"/></c:set>  <%-- orden --%>
                                              <c:set var="title2"><axis:alt c="agente" f="axisadm088" lit="100584"/></c:set>   <%-- agente --%>
                                              <c:set var="title3"><axis:alt c="ramo" f="axisadm088" lit="100784"/></c:set>   <%-- Ramo --%>
                                              <c:set var="title4"><axis:alt c="producto" f="axisadm088" lit="100829"/></c:set>  <%-- Producto --%>
                                              <c:set var="title5"><axis:alt c="banco" f="axisadm088" lit="9000964"/></c:set>   <%-- Banco --%>   
                                              <c:set var="title6"><axis:alt c="editar" f="axisadm088" lit="9901356"/></c:set>   <%-- Editar --%>   
                                              <% int i=0; %>
                                              <c:set var="pos"><%=i%></c:set>
                                              <!-- Valores de columnas -->
                                              <div class="displayspace">                                             
                                                <display:table name="${__formdata.axisctr_listaBancos}" id="miListaId" export="false" class="dsptgtable" 
                                                pagesize="-1" defaultsort="2" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" 
                                                requestURI="axis_axisadm088.do?operation=form&paginar=true">
                                                  <%@ include file="../include/displaytag.jsp"%>                                                   
                                                  <display:column headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons">                                                
                                                      <input type="checkbox" id="check" name="check" value=""/>
                                                    </div>
                                                  </display:column>
                                                  <axis:visible f="axisadm088" c="NORDEN"> 
                                                      <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_COBBANCARIOSEL.NORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                        <div class="dspNumber">${miListaId.OB_IAX_COBBANCARIOSEL.NORDEN}</div>
                                                      </display:column>
                                                  </axis:visible>                                                        
                                                  <axis:visible f="axisadm088" c="CAGENTE"> 
                                                      <display:column title="${title2}" sortable="true" sortProperty="CAGENTE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                          <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TAGENTE}</div>
                                                      </display:column>
                                                  </axis:visible>                                                    
                                                  <axis:visible f="axisadm088" c="TRAMO"> 
                                                      <display:column title="${title3}" sortable="true" sortProperty="TRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                         <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TRAMO}</div>  
                                                      </display:column>  
                                                  </axis:visible>   
                                                  <axis:visible f="axisadm088" c="TITULO"> 
                                                      <display:column title="${title4}" sortable="true" sortProperty="TITULO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                         <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TTITULO}</div>                                           
                                                      </display:column>  
                                                  </axis:visible>   
                                                  <axis:visible f="axisadm088" c="CBANCO"> 
                                                      <display:column title="${title5}" sortable="true" sortProperty="CBANCO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                         <div class="dspText">${miListaId.OB_IAX_COBBANCARIOSEL.TBANCO}</div>                                           
                                                      </display:column>  
                                                  </axis:visible>    
                                                  <axis:visible f="axisadm088" c="CBANCO"> 
                                                      <display:column title="" sortable="true" sortProperty="CBANCO" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                         <div class="dspIcon" align="center">
                                                                <img align="center" border="0" alt="<axis:alt c="mod_lit" f="axisadm088" lit="100002"/>" title1="<axis:alt c="mod_img" f="axisadm088" lit="100002"/>" src="images/lapiz.gif" 
                                                                style="cursor:pointer;" onclick="javascript:f_modif_cobradorsel_lista('${miListaId.OB_IAX_COBBANCARIOSEL.NORDEN}','${miListaId.OB_IAX_COBBANCARIOSEL.CCOBBAN}')"/>  
                                                         </div>
                                                       </display:column>  
                                                  </axis:visible>   
                                                      
                                                        <%i++;%>
                                                        <c:set var="pos"><%=i%></c:set>
                                                    </display:table>
                                                  </div>  
                                            </axis:ocultar>
                                      </td>
                                    </tr>
                            </tr>    
                    </table>
            </table>    
    </table>
    <c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisadm088</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>