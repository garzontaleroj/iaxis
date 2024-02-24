<%/*
*  Fichero: axismap001.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 08/10/2008
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
    <title><fmt:message key="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
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
    
    <script type="text/javascript" src="scripts/jsTree.js"></script>    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                          
            revisarEstilos();            
            var hayDatos = ${!empty RED_ARBOL};
            if (!hayDatos) 
                // Abrir modal buscador
                f_abrir_modal("axismap002", true);
            else {
            
                var CAGENTE2Reload = "${requestScope.CAGENTE2Reload}";
                /*if (!objUtiles.estaVacio(CAGENTE2Reload))
                    // Recargar detalle agente, si venimos de otro flujo
                    f_ver_detalle(CAGENTE2Reload);         */       
            }
                
        }
        
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("axis_axismap001.do", callbackSalir, "operation=salir", this);
        }
        
        function callbackSalir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismap001", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal('axismap002', true);
        }
        

         
       
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString, optionalWidth, optionalHeight) {
       
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
     
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
        
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString, optionalWidth, optionalHeight);        
        }
        
        function f_abrir_modal_axismap005(optionalQueryString){
        //alert("optional Query"+optionalQueryString);
              objUtiles.abrirModal("axismap005", "src", "modal_" + "axismap005" + ".do?operation=form" + optionalQueryString, null, null);        
        }
     
        function f_cerrar_modal(cual) {
        //if (cual == 'axismap005'){
          //  objUtiles.ejecutarFormulario("axis_axismap001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
           // }
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual,CMAPEAD) {
            f_cerrar_modal(cual);
               if (!objUtiles.estaVacio(CMAPEAD))  
           document.miForm.CMAPEAD.value = CMAPEAD;
           
            if (cual == 'axismap002'){
                objUtiles.ejecutarFormulario("axis_axismap001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
                }
        }
        
        
        function f_aceptar_axismap003(cual,CMAPEAD) {
               f_cerrar_modal(cual);
               if (!objUtiles.estaVacio(CMAPEAD))  
                   document.miForm.CMAPEAD.value = CMAPEAD;
           
               buscar_lista('','',CMAPEAD);
        }
        
        function f_aceptar_axismap008(cual) {
               f_cerrar_modal('axismap008');
               buscar_lista('','',document.miForm.CMAPEAD.value );
        }
        
          function f_aceptar_axismap011(cual) {
               f_cerrar_modal('axismap011');
               buscar_lista('','',document.miForm.CMAPEAD.value );
        }
        
          function f_aceptar_axismap012(cual) {
               f_cerrar_modal('axismap012');
               buscar_lista('','',document.miForm.CMAPEAD.value );
        }
        
        
          function f_aceptar_axismap005(cual) {
               f_cerrar_modal('axismap005');
               buscar_lista('','',document.miForm.CMAPEAD.value );
        }
         function f_aceptar_axismap004(cual) {
               f_cerrar_modal('axismap004');
               buscar_lista('','',document.miForm.CMAPEAD.value );
        }
        
        function f_aceptar_axismap007(cual) {
               f_cerrar_modal('axismap007');
               buscar_lista('','',document.miForm.CMAPEAD.value );
        }
        
        
        function f_axismap002_nuevo() {
            f_cerrar_modal("axismap002");
            objUtiles.abrirModal("axismap003", "src", "modal_axismap003.do?operation=form&accion=nuevo");
            // objUtiles.ejecutarFormulario("axis_axismap001.do", "editar", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
        
        function f_axismap003_editar(CMAPEAD) {
            //f_cerrar_modal("axismap003");
            objUtiles.abrirModal("axismap003", "src", "modal_axismap003.do?operation=form&CMAPEAD=" + CMAPEAD );
        }
    function f_ver_detalle(codigo,ttag) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                document.miForm2.NODE_VALUE.value = codigo;
                document.miForm2.NODE_LABEL.value = ttag;
                document.miForm2.submit();
        }
        
       /* 
         function f_ver_detalle(codigo,ttag) {
         alert(codigo);
         alert(ttag);
         objUtiles.ejecutarFormulario("axis_axismap001.do?NODE_LABEL="+ttag+"&NODE_VALUE="+codigo, "form", document.miForm, "_self", objJsMessages.jslit_cargando);            
          
        }*/
        function f_iframe_cargado(){
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
        }
        function f_seleccionar(index){
           
         //   document.miForm2.indexdettratar.value = index;
            document.miForm2.submit();
            }
            
        function buscar_lista(TIPTRAT,TIPMAP,CMAPEAD){
        //alert("Antes de la llamada");
        //alert("1:"+TIPTRAT+"2:"+TIPMAP+"3:CMAPEAD:"+CMAPEAD);
            objUtiles.ejecutarFormulario("axis_axismap001.do?TIPTRAT="+TIPTRAT+"&TIPMAP="+TIPMAP+"&CMAP="+CMAPEAD, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
            
           
            
            function f_axismap008_nuevo(){
                CMAPEAD =    document.miForm.CMAPEAD.value;
                objUtiles.abrirModal("axismap008", "src", "modal_axismap008.do?operation=form&CMAPEAD=" + CMAPEAD );
            
            }
             function f_axismap008_editar(){
                CMAPEAD =    document.miForm.CMAPEAD.value;
                NODE_LABEL =  document.miForm2.NODE_LABEL.value;
                NODE_VALUE= document.miForm2.NODE_VALUE.value;
                
                objUtiles.abrirModal("axismap008", "src", "modal_axismap008.do?operation=form&CMAPEAD=" + CMAPEAD +"&NODE_LABEL="+NODE_LABEL+"&NODE_VALUE="+NODE_VALUE );
            
            }
            
            function f_axismap011_editar(NORDEN){
                CMAPEAD =    document.miForm.CMAPEAD.value;
                NODE_LABEL =  document.miForm2.NODE_LABEL.value;
                NODE_VALUE= document.miForm2.NODE_VALUE.value;
                
                objUtiles.abrirModal("axismap011", "src", "modal_axismap011.do?operation=form&NORDEN="+NORDEN+"&CMAPEAD=" + CMAPEAD +"&NODE_LABEL="+NODE_LABEL+"&NODE_VALUE="+NODE_VALUE );
            
            }
            
            function f_del_mapdetalle(NORDEN){
               CMAPEAD =    document.miForm.CMAPEAD.value;
               objUtiles.ejecutarFormulario("axis_axismap001.do?NORDEN="+NORDEN+"&CMAP="+CMAPEAD, "borrar_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
          
          function f_axismap012_editar(NORDEN,TCONDICION,CTABLA,NVECES,TCAMPO,TSETWHERE){
                CMAPEAD =    document.miForm.CMAPEAD.value;
                NODE_LABEL =  document.miForm2.NODE_LABEL.value;
                NODE_VALUE= document.miForm2.NODE_VALUE.value;
                objUtiles.abrirModal("axismap012", "src", "modal_axismap012.do?operation=form&NORDEN="+NORDEN+"&CMAPEAD=" + CMAPEAD +"&NODE_LABEL="+NODE_LABEL+"&NODE_VALUE="+NODE_VALUE+"&TCONDICION="+TCONDICION+"&CTABLA="+CTABLA+"&NVECES="+NVECES+"&TCAMPO="+TCAMPO+"&TSETWHERE="+TSETWHERE );
            
            }
            
            function f_axismap012_nuevo(NORDEN){
                CMAPEAD =    document.miForm.CMAPEAD.value;
                objUtiles.abrirModal("axismap012", "src", "modal_axismap012.do?operation=form&NORDEN="+NORDEN+"&CMAPEAD=" + CMAPEAD);
            
            }
            
            function f_del_mapdettratar(NORDEN,TCONDICION,CTABLA,NVECES,TCAMPO,TSETWHERE){
               CMAPEAD =    document.miForm.CMAPEAD.value;
               objUtiles.ejecutarFormulario("axis_axismap001.do?NORDEN="+NORDEN+"&CMAP="+CMAPEAD+"&TCONDICION="+TCONDICION+"&CTABLA="+CTABLA+"&NVECES="+NVECES+"&TCAMPO="+TCAMPO+"&TSETWHERE="+TSETWHERE, "borrar_dettratar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
            
            
            
            
          function f_del_mapxml(TTAG,NORDFILL,TPARE){
               CMAPEAD =    document.miForm.CMAPEAD.value;
               objUtiles.ejecutarFormulario("axis_axismap001.do?TTAG="+TTAG+"&NORDFILL="+NORDFILL+"&TPARE="+TPARE+"&CMAP="+CMAPEAD, "borrar_xml", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
     /*    function f_axismap012_editar(){
               CMAPEAD =    document.miForm.CMAPEAD.value;
                objUtiles.abrirModal("axismap012", "src", "modal_axismap012.do?operation=form&CMAPEAD=" + CMAPEAD );
          }*/
        
        /****************************************************************************************/
        /*********************************** CARGA ÁRBOL ****************************************/
        /****************************************************************************************/
        
        <c:if test="${!empty RED_ARBOL}">
            var Tree = new Array;
            var Agentes = "<fmt:message key='101024'/>";
            // nodeId | parentNodeId | nodeName | nodeUrl
            Tree[0]  = "1|0|Maps|#|A";
            /* 
            Tree[0]  = "1|0|" + Agentes + "|#|A";        
            Tree[1]	 = "2|1|agente 1.1|javascript:abrir()|A";
            Tree[2]  = "3|1|agente 1.3|#|A";
            Tree[3]  = "4|3|agente 1.2.1|#|C";
            Tree[4]  = "5|1|agente 1.1.1|#|A";
            Tree[5]  = "6|2|agente 1.1.1|#|A";        
            Tree[6]  = "7|6|agente 1.1.1.1|#|C";
            Tree[7]  = "8|6|agente 1.1.1.2|#|A";
            Tree[8]  = "9|1|agente 1.4|#|C";
            Tree[9]  = "10|9|agente 1.4.1|#|A";
            Tree[10] = "11|0|agente 2|#|A";

                  Tree[1]= "2|0|TP|javascript:abrir(1})|C";
                  Tree[2]= "3|2|Reg_Inverco|javascript:abrir(2})|C";
                  Tree[3]= "4|3|Nombre_Plan|javascript:abrir(3})|C";
                  Tree[4]= "5|3|Nombre_Plan|javascript:abrir(3})|C"; document.miForm.CMAPEAD.value
            */

             
             var todox="|0|";
            <c:forEach var="map" items="${RED_ARBOL}" varStatus="i">
            todox=todox+"|${map.TTAG}|"//        Tree[${i.count}]= "${map.TTAG}|${map.TPARE}|${map.TTAG}|javascript:abrir(${map.CODIGO}})|C";
             </c:forEach>
                            
            <c:forEach var="map" items="${RED_ARBOL}" varStatus="i">
          
                Tree[${i.count}]= todox.indexOf("|${map.TTAG}|")+"|"+todox.indexOf("|${map.TPARE}|")+"|${map.TTAG}|javascript:f_ver_detalle(\'${map.RESUM}\',\'${map.TTAG}\')|C";
             </c:forEach>
        </c:if>

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="9002149"/></c:param>     <%-- Mapeador --%>
        <c:param name="formulario"><fmt:message key="9002149"/></c:param> <%-- Mapeador --%>
        <c:param name="form">axismap001</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismap002|<fmt:message key="9901574"/>#axismap005|<fmt:message key="9901575"/>#axismap004|<fmt:message key="9901576"/>#axismap003|<fmt:message key="9901577"/>#axismap007|<fmt:message key="9901578"/>#axismap008|<fmt:message key="9903585"/>#axismap011|<fmt:message key="9901575"/>#axismap012|<fmt:message key="9901575"/></c:param>
    </c:import>
    
  
       
              <div class="separador">&nbsp;</div>      <div class="separador">&nbsp;</div>
        <table class="mainTableDimensions base" align="center">       
         <div class="titulo">
                                  <div style="float:left;">
                                   <img src="images/flecha.gif"/><b><axis:alt f="axismap001" c="LIT10" lit="9901577"/></b>
                                      <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/>
                                </div>
                                      <div style="float:right;">
                                          
                                                <div style="float:right;">
                                                  <c:if test="${!empty __formdata.CMAPEAD}">
                                                   <img border="0"
                                                   alt="<axis:alt f="axismap001" c="BT_EDITMAP" lit="9901356"/>"
                                                   title="<axis:alt f="axismap001" c="BT_EDITMAP" lit="9901356"/>"
                                                   src="images/lapiz.gif"
                                                   onclick="f_axismap003_editar('${__formdata.CMAPEAD}')"/>
                                                 </c:if>
                                                 <axis:visible f="axismap001" c="BT_NUEVOMAP">
                                                    <img border="0"
                                                         alt='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         title='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         src="images/new.gif"
                                                         onclick="f_axismap003_editar('')"/>
                                                  </axis:visible>
                                                </div>
                                      
                                      
                                      </div>
                                  </div>
        <tr>
            <th style="width:10%;height:0px"></th>
            <th style="width:60%;height:0px"></th>
            <th style="width:20%;height:0px"></th>
            <th style="width:10%;height:0px"></th>
        </tr>
        <tr>
        

                      <td class="titulocaja"><b><axis:alt f="axismap001_form" c="CMAPEAD" lit="9901582"/></b></td><%-- Map --%>
                      <td class="titulocaja"></td>
                      <td class="titulocaja"><b><axis:alt f="axismap001_form" c="TIPOTRAT" lit="100565"/></b></td><%-- Tipus --%>
                    </tr>
                     <tr>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:100%;"
                       value="${__formdata.CMAPEAD}" name="CMAPEAD2" id="CMAPEAD2" readonly="readonly"/>
                      </td>
                           <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" size="15" style="width:95%;"
                    value="${__formdata.COMENTARIO}" name="COMENTARIO" id="COMENTARIO" readonly="readonly"/>
                       </td>
                      <td class="campocaja">
                     
                          <select name="TIPOTRAT" style="width:93%" disabled
                                    id="TIPOTRAT" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap001_form" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstCarga}">
                                        <option value="${ramo.CATRIBU}" 
                                        <c:if test="${!empty __formdata.TIPOTRAT && __formdata.TIPOTRAT ==  fn:substring(ramo.TATRIBU,0,1)}">selected</c:if>>
                                             ${ramo.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                  
                      </td>
                       <td class="campocaja" >
                   
                      
                    </td>
                    </tr>
                  
            
    
         <tr>
         <td colspan="4">
            <table>
                <tr>
                    <th style="width:35%;height:0px"></th>
                    <th style="width:65%;height:0px"></th>
                </tr>
                <tr>
            <form name="miForm" action="" method="POST">         
                <input type="hidden" name="operation" value=""/>
                <input type="hidden" name="CMAPEAD" value="${__formdata.CMAPEAD}"/>
                <input type="hidden" name="indexdettratar" id="indexdettratar" value="${__formdata.indexdettratar}"/>
                <td>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><fmt:message key="9901580"/> <%-- Estructura map --%>
                     
                    </div>
                    <div class="seccion" style="overflow-y:auto;height:550px;">
                        <c:if test="${!empty RED_ARBOL}">
                            <script type="text/javascript">
                                var objTree = new JsTree();                                    
                                objTree.createTree(Tree, 0, true);    
                               
                            </script>
                        </c:if>
                    </div>
                </td>
            </form>
            <td>
            
            <%--    <div class="titulo">
               <img src="images/flecha.gif"/><fmt:message key="9901579"/> 
                    <img id="find" style="height:16px;border:0px;" src="images/empty.gif"/>
                </div>--%>
                <div class="titulo">
                                  <div style="float:left;">
                                   <img src="images/flecha.gif"/><b><axis:alt f="axismap001" c="MAP_FORM" lit="9901579"/></b>
                                     
                                </div>
                                      <div style="float:right;">
                                          
                                                <div style="float:right;">
                                               
                                                 <axis:visible f="axismap001" c="BT_NUEVONODO">
                                                    <img border="0"
                                                         alt='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         title='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                                         src="images/new.gif"
                                                         onclick="f_axismap008_nuevo('')"/>
                                                  </axis:visible>
                                                </div>
                                      
                                      
                                      </div>
                                  </div>
                <div class="seccion" style="width:100%;height:550px;">          
                    <iframe id="formulario_seccion" name="formulario_seccion" style="width:100%;height:100%;" 
                    src="axis_axismap001.do?operation=cargarDetalleAgente&CMAPEAD=${__formdata.CMAPEAD}" scrolling="auto" frameborder="0">
                    </iframe>
                </div>
           </td>
        </tr>
        </table>
        </td>
        </tr>
    </table>
    
    <c:import url="../include/botonera_nt.jsp">
    <c:param name="f">axismap001</c:param>
        <c:param name="__botones">salir</c:param> 
    </c:import>
    
    <c:import url="../include/mensajes.jsp"/>

<form name="miForm2" target="formulario_seccion"  method="POST" action="axis_axismap001.do">
    <input type="hidden" name="operation" id="operation" value="cargarDetalleAgente"/>
    <input type="hidden" name="NODE_LABEL" id="NODE_LABEL" value=""/>
    <input type="hidden" name="NODE_VALUE" id="NODE_VALUE" value=""/>
    <input type="hidden" name="indexdettratar" id="indexdettratar" value="${__formdata.indexdettratar}"/>
     <input type="hidden" name="CMAPEAD" value="${__formdata.CMAPEAD}"/>
</form>

</body>
</html>