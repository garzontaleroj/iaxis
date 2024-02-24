<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
    
        function f_onload() {
        	f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               parent.f_aceptar_modal("axisprf005");
            }
        }
        
        function f_but_cancelar() {            
            parent.f_cerrar_modal('axisprf005');                      
        }        

        function f_but_aceptar(){
          if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario("modal_axisprf005.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
        function callbackGuardar(ajaxResponseText){
            var doc = objAjax.domParse(ajaxResponseText);
            var  TIPERROR = 0;
            var CERROR = 0;
            var TERROR = "";
            try { 
                TIPERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0);
                CERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0);
                TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
            } catch (e) {
                TIPERROR = 0;
            }
            alert(TIPERROR);
            if (TIPERROR == 0){
                confirma  = true;
            }else if (TIPERROR == 2){
                    //Avis
                    confirma=confirm(TERROR);
                  }else{
                    objAppMensajes.existenErroresEnAplicacion(doc);
                  }
        }
        function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else{        
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                }
                objAjax.invokeAsyncCGI("modal_axisprf005.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }  
        
        function callbackAjaxCargarProductos(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");              
                var SPRODUCCombo = document.miForm.SPRODUC;
                var CACTIVIDADCombo = document.miForm.CACTIVIDAD;
                objDom.borrarOpcionesDeCombo(CACTIVIDADCombo);
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf005" c="SELECC" lit="108341"/> - ', SPRODUCCombo, 0);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf005" c="SELECC" lit="108341"/> - ', CACTIVIDADCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                     var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                     var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0); 
                     objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
            }// recarrega scroll pane
            $.reinitialiseScroll(); 
        }  
        
        function f_cargar_actividades(){
            CRAMO=objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
            SPRODUC=objDom.getValorComponente(document.miForm.SPRODUC);            
            objAjax.invokeAsyncCGI("modal_axisprf005.do", callbackAjaxCargarActividades, "operation=ajax_busqueda_actividades&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC, this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCargarActividades(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);            
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CACTIVI");                
                var CACTIVIDADCombo = document.miForm.CACTIVIDAD;
                objDom.borrarOpcionesDeCombo(CACTIVIDADCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf005" c="SELECCACTIV" lit="108341"/> - ', CACTIVIDADCombo, 0);
                if(elementos.length>0){
                    for (i = 0; i < elementos.length; i++) {
                        var CACTIVI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);
                        objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVIDADCombo, i+1);
                    }                
                }
            }
            $.reinitialiseScroll(); 
        }
        
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>        
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>      
        
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axisprf005" lit="9904114" /></c:param>
           <c:param name="producto">
                <axis:alt f="axisprf005" c="formulario" lit="9904114"/>
           </c:param>
           <c:param name="form">axisprf005</c:param>
        </c:import>    
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
               <th style="width:20%;height:0px"></th>
               <th style="width:20%;height:0px"></th>
               <th style="width:20%;height:0px"></th>
               <th style="width:20%;height:0px"></th>
               <th style="width:20%;height:0px"></th>
            </tr><tr>    
            <axis:ocultar f="axisprf005" c="LISTARAMOS"> 
             <td class="titulocaja">
                  <b><axis:alt f="axisprf005" c="LISTARAMOS" lit="100784"></axis:alt></b>
             </td>
            </axis:ocultar> 
            <td class="titulocaja">
                <b><axis:alt f="axisprf005" c="SPRODUC" lit="100829" /></b>
            </td>
            <axis:ocultar f="axisprf005" c="TACTIVI">
               <td class="titulocaja">
                <b><axis:alt f="axisprf005" c="TACTIVI" lit="103481"/></b> <%-- 103481 --%>
               </td>
            </axis:ocultar>  
            <axis:ocultar f="axisprf005" c="CBANCAR" dejarHueco="false">
                <td class="titulocaja" colspan="2" id="tit_CBANCAR" >
                    <b><axis:alt f="axisprf005" c="CBANCAR" lit="100965"/></b>   
                </td>
            </axis:ocultar>            
            </tr>
            <tr>
               <axis:ocultar f="axisprf005" c="LISTARAMOS">
                 <td class="campocaja">
                    <select name = "ramoProducto" id="ramoProducto" style="width:200px;" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                       <option value = "escogeRamoOption"> - <axis:alt f="axisprf005" c="SNV_COMBO" lit="108341"/> - </option>
                         <c:forEach var="ramos" items="${sessionScope.axisprf_listaRamos}">
                               <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                    <c:if test="${ramos.CRAMO == sessionScope.axisprf_selectedRamo.CRAMO}">selected</c:if>>
                                       ${ramos.TRAMO}
                         </option>
                        </c:forEach>
                    </select>
                  </td>
               </axis:ocultar>  
               <axis:ocultar f="axisprf005" c="SPRODUC">
               <td class="campocaja"> 
                 <select name = "SPRODUC" id ="SPRODUC" size="1" class="campowidthselect campo campotexto" onchange="f_cargar_actividades()">
                   <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf005" c="SELECC" lit="108341" /> - </option>
                     <c:forEach items="${__formdata.LISTVALORES.PRODUCTOS}" var="item">
                       <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                    </c:forEach>
                  </select>
               </td> 
               </axis:ocultar>
               <axis:ocultar f="axisprf005" c="CACTIVIDAD" dejarHueco="false">
                 <td class="campocaja"  id="td_CACTIVIDAD" >                    
                    <select name = "CACTIVIDAD" id="CACTIVIDAD" style="width:200px;" size="1" class="campowidthselect campo campotexto">
                       <option value ="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf005" c="SELECCACTIV" lit="108341" /> - </option>
                         <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCACTPRINCIPAL}">
                               <option value = "${element.CACTIVI}"
                                <c:if test="${__formdata.CACTIVIDAD == element.CACTIVI}"> selected = "selected"</c:if>>
                                 ${element.TTITULO}
                         </option>
                        </c:forEach>
                    </select>                    
                 </td>
               </axis:ocultar>    
               <axis:ocultar f="axisprf005" c="CBANCAR" dejarHueco="false">
                <td class="campocaja" colspan="2" id="td_CBANCAR" >
                    <axis:encryptflag f="axisprf005" c="CBANCAR" />
                    <!--
                    <select name="CBANCAR" id="CBANCAR" size="1" class="campowidthselect campo campotexto_ob" style="width:79%;"
                    <axis:atr f="axisprf005" c="CBANCAR" a="obligatorio=false&isInputText=false"/>>&nbsp;
                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf005" c="SELEC" lit="1000348"/> - </option></c:if>
                        <c:forEach var="element" items="${__formdata.CCC}">
                            <option value = "<axis:encrypt f="axisprf005" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCAR}" />@@${element.OB_IAX_CCC.CTIPBAN}" 
                            <c:if test="${__formdata.CBANCAR == element.OB_IAX_CCC.CBANCAR}"> selected = "selected"</c:if>>
                                <axis:masc f="axisprf005" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCARFORMAT}" />                                               
                            </option>
                        </c:forEach>
                    </select>
                    -->                               
                    <select name="CNORDBAN" id="CNORDBAN" size="1" class="campowidthselect campo campotexto_ob" style="width:79%;"
                    <axis:atr f="axisprf005" c="CBANCAR" a="obligatorio=true&isInputText=false"/> title= "<axis:alt f="axisprf002" c="CDOMICI" lit="100965"/>">
                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf005" c="SELEC" lit="1000348"/> - </option></c:if>
                        <option value ="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf005" c="SELECCUENTACC" lit="108341" /> - </option>
                        <c:forEach var="cuentas" items="${listaCuentasCC}">
                            <option value = "${cuentas.CNORDBAN}" >${cuentas.CBANCAR}</option>
                        </c:forEach>
                    </select>
                </td>
              </axis:ocultar>               
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf005</c:param><c:param name="f">axisprf005</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
