<%/**
*  Fichero: axisgfi002.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisgfi002" c="TITULO_HTML" lit="1000203"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript" src="scripts/jsTree.js"></script>
        <script type="text/javascript">
            var Tree = new Array;
		// nodeId | parentNodeId | nodeName | nodeUrl
		Tree[0]  = "1|0|Formulas|#|A";
		//Tree[1]	 = "2|1|Formula 1.1|javascript:abrir()|A";
		//Tree[2]  = "3|1|Formula 1.3|#|A";
		//Tree[3]  = "4|3|Formula 1.2.1|#|C";
		//Tree[4]  = "5|1|Formula 1.1.1|#|A";
		//Tree[5]  = "6|2|Formula 1.1.1|#|A";
		//Tree[6]  = "7|6|Formula 1.1.1.1|#|C";
		//Tree[7]  = "8|6|Formula 1.1.1.2|#|A";
		//Tree[8]  = "9|1|Formula 1.4|#|C";
		//Tree[9]  = "10|9|Formula 1.4.1|#|A";
		//Tree[10] = "11|0|Formula 2|#|A";
		//-->
                
                <c:forEach var="formula" items="${axisgfi002_arbol_formula}" varStatus="i">
               
                    Tree[${i.count}]= "${formula.OB_IAX_GFITREE.IDNODE}|${formula.OB_IAX_GFITREE.PADRE}|${formula.OB_IAX_GFITREE.DESCRIPCION}|javascript:abrir(${formula.OB_IAX_GFITREE.CLAVE})|C";
                    
                 </c:forEach>
                
                
                
                
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgfi002", "cancelar", document.miForm, "_self");
            }

            function f_onload(){
                if(Tree.length<=1){
                    f_abrir_axisgfi001();
                }
                
                f_cargar_propiedades_pantalla();
            }
            
            /********************************************/
            /***********MODALES******************/
            /********************************************/
            function f_abrir_axisgfi001() {
                objUtiles.abrirModal("axisgfi001","src","modal_axisgfi001.do?operation=form");
            }
            
            function f_cerrar_axisgfi001() {
                objUtiles.cerrarModal("axisgfi001")
            }    
            function f_aceptar_axisgfi001 (CLAVE, CODIGO, FORMULA, RAMO, RASTRO, UTILIDAD){
                f_cerrar_axisgfi001();
                //Llamada de axisgfi002 de PAC_IAX_GFI.F_SET_CONSULTA
                objDom.setValorPorId("PCLAVE", CLAVE);
                objDom.setValorPorId("PCODIGO", CODIGO);
                objDom.setValorPorId("PFORMULA", FORMULA);
                objDom.setValorPorId("CRAMO", RAMO);
                objDom.setValorPorId("CRASTRO", RASTRO);
                objDom.setValorPorId("CUTILI", UTILIDAD);
                objUtiles.ejecutarFormulario ("axis_axisgfi002.do", "buscar_formula", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_nuevo_axisgfi001() {
                f_cerrar_axisgfi001();
                f_abrir_axisgfi031();
            }
            
            function f_abrir_axisgfi003(CLAVE) {
                objUtiles.abrirModal("axisgfi003","src","modal_axisgfi003.do?operation=form&CLAVE_AXGF002=" + CLAVE);
                
            }
            
            function f_cerrar_axisgfi003() {
                objUtiles.cerrarModal("axisgfi003")
            }    
            function f_aceptar_axisgfi003 (){
                f_cerrar_axisgfi003();
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                document.miForm2.submit();
                
            }
            
            function f_abrir_axisgfi031() {
                objUtiles.abrirModal("axisgfi031","src","modal_axisgfi031.do?operation=form");
            }
            
            function f_recargar_axisgfi031(CLAVE) {
               
                objUtiles.abrirModal("axisgfi031","src","modal_axisgfi031.do?operation=recargar&PCLAVE="+ CLAVE);
            }
                        
            function f_cerrar_axisgfi031() {
                objUtiles.cerrarModal("axisgfi031");
            }
            
            function f_aceptar_axisgfi031(SCLAVE) {
                objUtiles.cerrarModal("axisgfi031");
                 objDom.setValorPorId("PCLAVE", SCLAVE);
                objUtiles.ejecutarFormulario ("axis_axisgfi002.do", "buscar_formula", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function abrir(valor){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                document.miForm2.PCLAVE.value=valor;
                document.miForm2.submit();
            }
            
            function f_iframe_cargado(){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            }

            function f_but_aceptar(){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                document.miForm2.CLAVE.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.CLAVE.value;
                document.miForm2.PCLAVE.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.CLAVE.value;
                document.miForm2.CODIGO.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.CODIGO.value;
                document.miForm2.FORMULA.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.FORMULA.value;
                document.miForm2.CRAMO.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.CRAMO.value;
                document.miForm2.CRASTRO.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.CRASTRO.value;
                document.miForm2.SUMATORIO.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.SUMATORIO.value;
                document.miForm2.DESCRIPCION.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.DESCRIPCION.value;
                document.miForm2.CUTILI.value=document.getElementById("formula_seccion").contentWindow.document.miForm3.CUTILI.value;
                
                document.miForm2.operation.value="grabar_formula";
                document.miForm2.submit();            
            }
            /********************************************************************************/
            /************************ ENLACE APLICATIVOS MODALES*****************************/
            /********************************************************************************/
            function f_consultar_tramos() { // Consultar
                //alert("En consultar tramos");
                objUtiles.ejecutarFormulario("axis_axisgfi002.do", "consultar_tramos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_consultar_terminos(){
                objUtiles.ejecutarFormulario("axis_axisgfi002.do", "consultar_terminos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_consultar_bucles(){
                objUtiles.ejecutarFormulario("axis_axisgfi002.do", "consultar_bucles", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_ejecutar_formula(totalParams){
                objAjax.invokeAsyncCGI("axis_axisgfi002.do?"+totalParams,callbackAjaxEjecutar,"operation=ajax_ejecutar_formula", this, objJsMessages.jslit_cargando, false)
            }            
             
            function callbackAjaxEjecutar(ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);   
                if (!objUtiles.hayValorElementoXml(doc.getElementsByTagName("TERROR")[0])){
                    var resultado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    document.getElementById("formula_seccion").contentWindow.setResultado(resultado);
                    objAppMensajes.vaciarYEsconderMensajes();
                }else{
                     var TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
                     document.getElementById("formula_seccion").contentWindow.setResultado("");
                     objAppMensajes.pintarMensajePantalla(TERROR, "ERROR");
                }
            }        
          
        </script>
    </head>
<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisgfi002" c="TITULO_AXISGFI001" lit="1000202" /></c:param>
    <c:param name="nid" value="axisgfi001" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisgfi002" c="TITULO_AXISGFI003" lit="1000204" /></c:param>
    <c:param name="nid" value="axisgfi003" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisgfi031" c="TITULO_AXISGFI002" lit="1000018" /></c:param>
    <c:param name="nid" value="axisgfi031" />
</c:import>


<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="PCLAVE" id="PCLAVE" value="${__formdata.PCLAVE}"/>
    <input type="hidden" name="PCODIGO" id="PCODIGO" value=""/>
    <input type="hidden" name="PFORMULA" id="PFORMULA" value=""/>
    
    <input type="hidden" name="CRAMO" id="CRAMO" value=""/>
    <input type="hidden" name="CRASTRO" id="CRASTRO" value=""/>
    <input type="hidden" name="CUTILI" id="CUTILI" value=""/>
    <input type="hidden" name="FORMULA" id="FORMULA" value=""/>
    <input type="hidden" name="CODIGO" id="CODIGO" value=""/>
    <input type="hidden" name="CLAVE" id="CLAVE" value=""/>
     <input type="hidden" name="SUMATORIO" id="SUMATORIO" value=""/>
    
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisgfi002" c="TITULO_AXISGFI002" lit="1000018" /></c:param>
            <c:param name="formulario"><axis:alt f="axisgfi002" c="FORM_AXISGFI001" lit="1000018" /></c:param>
            <c:param name="form">axisgfi002</c:param>
    </c:import>

    <table class="mainTableDimensions base"  align="center"> 
    <tr>
        <th style="width:35%;height:0px"></th>
        <th style="width:65%;height:0px"></th>
    </tr>
    <tr>
        <td>
          
            
            
                <div class="titulo">
                           
                                    <img src="images/flecha.gif"/><axis:alt f="axisgfi002" c="TITULO_FORM" lit="149926" />
                                    <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisgfi001()" style="cursor:pointer"/>
                               
                                      </div>
            <div class="seccion" style="overflow-y:auto;height:400px;">
                <script type="text/javascript">
                        var objTree = new JsTree();
                        objTree.createTree(Tree,1);
                </script>
            </div>
        </td>
 
         <td>
            <!-- segunda seccion   -->
            <div class="titulo">
             <div style="float:left;">
                <img src="images/flecha.gif"/><axis:alt f="axisgfi002" c="LIT_1000093" lit="1000093" />
                <img id="find" style="height:16px;border:0px;" src="images/empty.gif"/>
                </div>
                 <div style="float:right;">
                                          
                                               
                                                  <%--c:if test="${!empty __formdata.PCLAVE}">
                                                    <img border="0"
                                                   alt="<axis:alt f="axisgfi002" c="BT_EDITGFI" lit="9901356"/>"
                                                   title="<axis:alt f="axisgfi002" c="BT_EDITGFI" lit="9901356"/>"
                                                   src="images/lapiz.gif"
                                                   onclick="f_recargar_axisgfi031()"/>
                                                 </c:if--%>
                                                 
                                            
                                      
                                      
                                      </div>
            </div>
            <div class="seccion" style="width:100%;height:400px;">
                <iframe id="formula_seccion" name="formula_seccion"  style="width:100%;height:100%;" src="axis_axisgfi002.do?operation=recarga_datos_formula"  scrolling="auto" frameborder="0"></iframe>
            </div>
        </td>

</tr>

</table>
</form>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi002</c:param><c:param name="__botones">salir<axis:visible c="BT_ACEPTAR" f="axisgfi002">,aceptar</axis:visible></c:param></c:import>

<c:import url="../include/mensajes.jsp" />
</body>

<form name="miForm2" target="formula_seccion"  method="POST" action="axis_axisgfi002.do">
    <input type="hidden" name="PCLAVE" id="PCLAVE" value=""/>
    <input type="hidden" name="CLAVE" id="CLAVE" value=""/>
    <input type="hidden" name="CODIGO" id="CODIGO" value=""/>
    <input type="hidden" name="FORMULA" id="FORMULA" value=""/>
    <input type="hidden" name="CRAMO" id="CRAMO" value=""/>
    <input type="hidden" name="CRASTRO" id="CRASTRO" value=""/>
    <input type="hidden" name="SUMATORIO" id="SUMATORIO" value=""/>
    <input type="hidden" name="CUTILI" id="CUTILI" value=""/>
    <input type="hidden" name="DESCRIPCION" id="DESCRIPCION" value=""/>
    <input type="hidden" name="operation" id="operation" value="recarga_datos_formula"/>
</form>
</html>
