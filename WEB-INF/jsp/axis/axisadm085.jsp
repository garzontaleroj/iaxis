<%/*
*  Fichero: axisadm085.jsp
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<!--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>-->
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>Mantenimiento de días de gracia por agente/producto</title> <%-- Mantenimiento de días de gracia por agente/producto --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
        
        function f_cargar_productos(){                    
           CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
           if (!objUtiles.estaVacio (CRAMO) ){
              objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
              objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
           }else{
              objDom.setValorComponente(document.miForm.CRAMO, null);
           }
           objAjax.invokeAsyncCGI("axis_axisadm085.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);                                            
        }      
                
        function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisadm085" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }                       
                }
        }   
        
        function f_onload() {               
           objDom.setDisabledPorId("but_buscar",false);
           f_cargar_propiedades_pantalla();                        
        }        
        
        function f_cerrar_modal(cual) {
           objUtiles.cerrarModal(cual);
           f_but_buscar();                
        }
        
        function f_but_buscar() {                      
           objUtiles.ejecutarFormulario ("axis_axisadm085.do?","buscar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);           
        }
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm085", "cancelar", document.miForm, "_self");                   
        }        
        
        function f_actualizar_agente(){
           objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE) +  "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);          
        }
        
        function callbackAjaxCargarAgente(ajaxResponseText){
                
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            
            objDom.setValorPorId("TAGENTE","");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);                        
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado);                                                                  
                } else{                        
                        objDom.setValorPorId("TAGENTE","");
                        objDom.setValorPorId("CAGENTE","");
                }
            }
        } 
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);                
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                objDom.setValorPorId("TAGENTE", NOMBREformateado);                                                                                      
            }
        }        
        function f_abrir_axisctr014() {            
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=TRASPASO_CARTERA");
        }        

        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    

        function f_aceptar_axisctr014 (CAGENTE){
            objAjax.invokeAsyncCGI("axis_axisadm085.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            f_cerrar_axisctr014();
        }
        
        function f_abrir_axisadm086(){           
           var CAGENTE = objDom.getValorComponente(document.miForm.CAGENTE);           
           var TAGENTE = objDom.getValorComponente(document.miForm.TAGENTE);                      
           if(CAGENTE!=null && CAGENTE!='') {                                          
              objUtiles.abrirModal("axisadm086","src","modal_axisadm086.do?operation=form&CAGENTE="+CAGENTE+"&TAGENTE="+TAGENTE);
           }
           else{
              alert('<axis:alt f="axisadm085" c="ALRT_011" lit="9904590"/>');
           }                                     
        }
        
        function f_aceptar_axisadm086(){
           objUtiles.cerrarModal("axisadm086");
           f_but_buscar();
        }
        
        function f_borrar_formula(cagente, sproduc, fini){              
           objDom.setValorPorId("D_CAGENTE", cagente);
           objDom.setValorPorId("D_SPRODUC", sproduc);
           objDom.setValorPorId("D_FINI", objUtiles.formateaTimeStamp2(fini));                                                 
           var answer = confirm(objJsMessages.jslit_confirma_borrar);
           if (answer)
               objUtiles.ejecutarFormulario("axis_axisadm085.do", "borrarFormula", document.miForm, "_self", objJsMessages.jslit_borrando_registro);                             
        } 
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST" >             
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm085" c="TITULO" lit="9906280"/></c:param>     <%-- Días de gracia --%>
            <c:param name="formulario"><axis:alt f="axisadm085" c="TITULO" lit="9906280"/></c:param> <%-- Días de gracia --%>
            <c:param name="form">axisadm085</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm085" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm086" c="TITULO_AGE" lit="9906293" /></c:param>
            <c:param name="nid" value="axisadm086" />
        </c:import>		
        
        <input type="hidden" name="operation" value=""/>                
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>                
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>                
        <input type="hidden" id="D_CAGENTE" name="D_CAGENTE"/>
        <input type="hidden" id="D_SPRODUC" name="D_SPRODUC"/>
        <input type="hidden" id="D_FINI" name="D_FINI"/>
		        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">         
           <tr>
              <td>                 
                <div class="separador">&nbsp;</div>
                <div class="titulo"><axis:alt f="axisadm085" c="TITULO" lit="1000178"/></div> <!-- Filtro -->
                 <table class="seccion">
                   <tbody>
                     <tr>
                       <td>
                           <tr>
                             <th style="width:15%;height:0px"></th>
                             <th style="width:15%;height:0px"></th>
                             <th style="width:12.5%;height:0px"></th>
                             <th style="width:12.5%;height:0px"></th>
                             <th style="width:12.5%;height:0px"></th>
                             <th style="width:12.5%;height:0px"></th>
                             <th style="width:12.5%;height:0px"></th>
                             <th style="width:7.5%;height:0px"></th>                                                          
                           </tr>
                           <tr>
                             <td>                                                        
                               <axis:ocultar f="axisadm085" c="DSP_PERRAMPROD" dejarHueco="false">                                                     
                                 <tr>
                                   <!-- Ramo -->
                                   <axis:ocultar f="axisadm085" c="CRAMO" dejarHueco="false"> 
                                     <td class="titulocaja">
                                       <b><axis:alt f="axisadm085" c="RAMO" lit="100784"/></b>
                                     </td>
                                   </axis:ocultar>
                                   <!-- Sproduc -->
                                   <axis:ocultar f="axisadm085" c="SPRODUC" dejarHueco="false"> 
                                     <td class="titulocaja" colspan="2">
                                       <b><axis:alt f="axisadm085" c="PRODUCTO" lit="100829"/></b>
                                     </td>
                                   </axis:ocultar>         
                                   <axis:ocultar f="axisadm085" c="AGENTE" dejarHueco="false"> 
                                     <td class="titulocaja" colspan="4">
                                       <b><axis:alt f="axisadm085" c="AGENTE" lit="100584"/></b>
                                     </td>
                                   </axis:ocultar>         
                                 </tr>
                                 <tr>                            
                                   <!-- Ramo -->                                              
                                   <!--<axis:ocultar f="axisadm085" c="CRAMO" dejarHueco="false"> -->
                                     <td class="campocaja">
                                       <select name = "ramoProducto" id="ramoProducto" style="width:100%;"  size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                       <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>
                                       <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                       <option value = "${ramos.CRAMO}/${ramos.TRAMO}"  <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>${ramos.TRAMO}
                                       </option>
                                       </c:forEach>
                                       </select>
                                     </td>
                                   <!--</axis:ocultar>-->
                                   <!-- Producto -->
                                   <axis:ocultar f="axisadm085" c="SPRODUC" dejarHueco="false"> 
                                     <td class="campocaja" colspan="2">
                                       <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="" class="campowidthselect campo campotexto" style="width:100%;"> 
                                       <option value="<%= Integer.MIN_VALUE %>"><axis:alt f="axisadm085" c="SELECCIONAR" lit="108341"/></option>
                                       <c:forEach items="${__formdata.productos}" var="item">
                                       <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                       </c:forEach>
                                       </select>
                                     </td>
                                   </axis:ocultar>                                        
                                   <!-- Agente -->
                                   <axis:ocultar f="axisadm085" c="AGENTE" dejarHueco="false">
                                   <td class="campocaja" colspan="4">
                                     <input type="text" obligatorio="true" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" formato="entero" title="<axis:alt f="axisadm085" c="CAGENTE" lit="100584"/>" size="5" style="width:15%" title="<axis:alt f="axisadm085" c="CAGENTE" lit="100584"/>" onchange="f_actualizar_agente()"/>
                                     <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>                                    
                                     <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisadm085" c="TAGENTE_ORI" lit="100584"/>" size="15" style="width:60%" readonly="true" title="<axis:alt f="axisadm085" c="TAGENTE" lit="100584"/>"/>&nbsp;&nbsp;                                    
                                   </td>      
                                   </axis:ocultar>
                                 </tr>                                                         
                               </axis:ocultar>
                             </td>
                           </tr>
                           </tbody>
                       </table>
               <!-- Tabla de resultados-->
               <div class="separador">&nbsp;</div>
               <div class="titulo">
                 <b><axis:alt f="axisadm085" c="RESULTADO" lit="1000345" /></b>
               </div>
               <table class="seccion" align="center">     
                 <tr>                   
                   <td>
                     <div style="float:right;">
                       <a href="javascript:f_abrir_axisadm086()"><img border="0" alt="<axis:alt f="NGar" c="NGar" lit="104825"/>" title="<axis:alt f="NGarA" c="NGarA" lit="104825"/>" src="images/new.gif"/></a>
                     </div>
                   </td>           
                 </tr>
                 <tr>           
                   <td class="titulocaja" colspan = "4">
                     <div class="separador">&nbsp; </div>                                                                                                                                             
					 
					 <c:set var="title1"><axis:alt f="axisadm085" c="LIT_PRODUCTO" lit="100829" /></c:set>  <%-- Producto --%>
                     <c:set var="title2"><axis:alt f="axisadm085" c="LIT_AGENTE" lit="100584" /></c:set>  <%-- Agente --%>                                             
                     <c:set var="title3"><axis:alt f="axisadm085" c="LIT_NOMAGENTE" lit="105940" /></c:set>  <%-- Nombre agente --%>
                     <c:set var="title4"><axis:alt f="axisadm085" c="LIT_FINICIO" lit="9000526" /></c:set>  <%-- Fecha inicio --%>                                             
                     <c:set var="title5"><axis:alt f="axisadm085" c="LIT_FFIN" lit="9000527" /></c:set>  <%-- Fecha fin --%>
                     <c:set var="title6"><axis:alt f="axisadm085" c="LIT_DIAS_GRACIA" lit="9906293" /></c:set>  <%-- Días gracia --%>                                             
                     <c:set var="title7"><axis:alt f="axisadm085" c="LIT_BORRAR" lit="9001333" /></c:set>  <%-- Borrar --%>
           
                     <div class="seccion displayspaceMaximo">                      
                     <display:table name="${T_FORMULAS}"           
                                    id="miListaFormulas"
                                    export="false"
                                    class="dsptgtable"
                                    pagesize="10"
                                    requestURI="axis_axisadm085.do?paginar=true"
                                    sort="list"
                                    cellpadding="0"
                                    cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>                                                                                                                                     
                     <display:column title="${title1}"
                                     sortable="true"
                                     sortProperty="TPRODUC"
                                     headerClass="sortable"
                                     media="html"
                                     autolink="false"  style="width:30%">
                                     <div class="dspText">                           
                                     ${miListaFormulas.TPRODUC}
                                     </div>                                                            
                     </display:column>
                     <display:column title="${title2}"
                                     sortable="true"
                                     sortProperty="CAGENTE"
                                     headerClass="sortable"
                                     media="html"
                                     autolink="false"   style="width:5%">
                                     <div class="dspText">                                                   
                                     ${miListaFormulas.CAGENTE}
                                     </div>                                               
                     </display:column>                                       
                     <display:column title="${title3}"
                                     sortable="true"
                                     sortProperty="TAGENTE"
                                     headerClass="sortable"
                                     media="html"
                                     autolink="false"   style="width:34%">
                                     <div class="dspText">
                                     ${miListaFormulas.TAGENTE}
                                     </div>                                               
                     </display:column>      
                     <display:column title="${title4}"
                                     sortable="true"
                                     sortProperty="FECHA_INI"
                                     headerClass="sortable"                           
                                     media="html"
                                     autolink="false"   style="width:8%">
                                     <div class="dspText">                           
                                     <fmt:formatDate value='${miListaFormulas.FECHA_INI}' pattern='dd/MM/yyyy'/>
                                     </div>                                               
                     </display:column>      
                     <display:column title="${title5}"
                                     sortable="true"
                                     sortProperty="FECHA_FIN"
                                     headerClass="sortable"
                                     media="html"
                                     autolink="false"   style="width:8%">
                                     <div class="dspText">                                                      
                                     <fmt:formatDate value='${miListaFormulas.FECHA_FIN}' pattern='dd/MM/yyyy'/>
                                     </div>                                               
                     </display:column>      
                     <display:column title="${title6}"
                                     sortable="true"
                                     sortProperty="DIAS_GRACIA"
                                     headerClass="sortable"
                                     media="html"                                                      
                                     autolink="false"   
                                     style="width:10%">                                                              
                                     <div class="dspText" style="text-align:center">
                                     ${miListaFormulas.DIAS_GRACIA}
                                     </div>                                               
                     </display:column>      
                     <display:column title="${title7}" 
                                     sortable="false" 
                                     sortProperty=""  
                                     style="width:5%" 
                                     headerClass="headwidth5 sortable" 
                                     media="html" 
                                     autolink="false" >
                                     <c:if test="${miListaFormulas.FECHA_FIN==null}"> 
                                        <div class="dspIcons">
                                        <a href="javascript:f_borrar_formula('${miListaFormulas.CAGENTE}','${miListaFormulas.SPRODUC}','${miListaFormulas.FECHA_INI}');"><img border="0" alt="<axis:alt f="BGarB1" c="BGarB1" lit="1000127"/>" title="<axis:alt f="BGarB1" c="BGarB1" lit="1000127"/>" src="images/delete.gif"/></a>
                                        </div>
                                     </c:if>
                     </display:column>                                                                        
                     </display:table>
                     </div>
                   </td>
                 </tr>
               </table>
             </td>
           </tr>               
        </table>          
        
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm085</c:param>
    <c:param name="__botones">salir,buscar</c:param> 
    </c:import>    
    </form>
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>
