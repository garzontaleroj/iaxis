axisage035<%/**
*  Fichero: axisage35.jsp
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisage035" c="TITULO" lit="9908966"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>   
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/
          /****************************************************************************************/
        function f_onload() {
            
            f_cargar_propiedades_pantalla();
            $("#but_9908890").hide();
            if (objDom.getValorPorId("haydatos") == "1" && $("input:checked" ).val() == "0")
            {
                $("#but_9908890").show();
            }
            
            if (!objUtiles.estaVacio(objDom.getValorPorId("NMES")))
            {
                objDom.setValorComponente(document.miForm.LSTMESES, objDom.getValorPorId("NMES"));
            }
        }         
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisage035", "cancelar", document.miForm, "_self");
            }   
/* *************************************  ACTUALIZAR COBJASE ***********************************        */  
        function f_cargar_cobjase(){
            SPRODUC = document.miForm.SPRODUC.value;
            if (!objUtiles.estaVacio(SPRODUC)){
            objAjax.invokeAsyncCGI("axis_axisage035.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
            }             
            }
            
        function isNumberKey(evt)
        {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false; 
             return true;
        }            
       
        function callbackAjaxCargarCobjase (ajaxResponseText){       
        var doc=objAjax.domParse(ajaxResponseText);
        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
            var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
              
            document.miForm.COBJASE.value = COBJASE; 
            
            }
         }
 /* *************************************  BUSCAR ***********************************        */ 
         function f_but_buscar() {
                CEMPRES = objDom.getValorComponente(document.miForm.CEMPRESA); 
                objDom.setValorPorId("CEMPRES",CEMPRES);
                CCAMPANA = objDom.getValorComponente(document.miForm.LSTCAMPANA);  
                objDom.setValorPorId("CCAMPANA",CCAMPANA);
                CRAMO = objDom.getValorComponente(document.miForm.ramoProducto); 
                objDom.setValorPorId("CRAMO",CRAMO);
                SPRODUC = objDom.getValorComponente(document.miForm.productos);  
                objDom.setValorPorId("SPRODUC",SPRODUC);
                CAGENTE = objDom.getValorComponente(document.miForm.LSAGENTES);  
                objDom.setValorPorId("CAGENTE",CAGENTE);
                CSUCURS = objDom.getValorComponente(document.miForm.LSAGENTESTIPO); 
                objDom.setValorPorId("CSUCURS",CSUCURS);
                NMES = objDom.getValorComponente(document.miForm.LSTMESES);  
                objDom.setValorPorId("NMES",NMES);
                var ind;
             if (objUtiles.estaVacio(objDom.getValorPorId("CEMPRES"))) {
             alert('<axis:alt f="${pantalla}" c="ERROR_CEMPRES" lit="9908992"/>');
             return;
             }
             if (objUtiles.estaVacio(objDom.getValorPorId("CCAMPANA"))) {
             alert('<axis:alt f="${pantalla}" c="ERROR_CCAMPANA" lit="9908991"/>');
             return;
             }
             if (objUtiles.estaVacio(objDom.getValorPorId("NMES"))) {
             alert('<axis:alt f="${pantalla}" c="ERROR_NMES" lit="9908996"/>');
             return;
             }
             if (objUtiles.estaVacio(objDom.getValorPorId("NANO"))) {
             alert('<axis:alt f="${pantalla}" c="ERROR_NANO" lit="9908997"/>');
             return;
             }
             if(objDom.getValorPorId("NANO").length < 4){
                 alert('<axis:alt f="${pantalla}" c="ERROR_NANO" lit="9909023"/>');
                 
                 return;
             }
             
             if(!ind) {             
                objUtiles.ejecutarFormulario("axis_axisage035.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);;
              }
            }
/* *************************************  CARGA PRODUCTOS ***********************************        */ 
           function f_cargar_productos(){
               CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
               CEMPRESA = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CEMPRESA), "/")[0];
               if (!objUtiles.estaVacio(CRAMO) ){
                  url ="operation=ajax_busqueda_productos&CRAMO=" + CRAMO+"&CEMPRES=" + CEMPRESA;                  
                  objAjax.invokeAsyncCGI("axis_axisage035.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
               }
            }
                        
                function f_cargar_ramos(){
            var CEMPRES = objDom.getValorPorId("CEMPRES");
            if (!objUtiles.estaVacio(CEMPRES)) {
                if (document.getElementById('ramoProducto')!= null){
                    if (document.getElementById('ramoProducto').options[0]!=null){
                        document.getElementById('ramoProducto').value = document.getElementById('ramoProducto').options[0].value;
                    }    
                }
                
                if (document.getElementById('SPRODUC')!= null){
                    if (document.getElementById('SPRODUC').options[0]!=null){
                        document.getElementById('SPRODUC').value = document.getElementById('SPRODUC').options[0].value;
                    }
                }
            }
            objDom.setValorComponente(document.miForm.CRAMO, null);
            objDom.setValorComponente(document.miForm.TRAMO, null);
            objAjax.invokeAsyncCGI("axis_axisage035.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + CEMPRES, this, objJsMessages.jslit_cargando);
        }
            
            function f_onchangeproductos(valor){
                if (!objUtiles.estaVacio(valor)){
                f_cargar_cobjase();
                }else {
                f_cargar_actividades();
                }
                }
            
             function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage035" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);                                     
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }
                   f_cargar_productos();

                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }  
            
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    var SPRODUCCombo = document.miForm.productos;
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage035" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);

                   for (i = 0; i < elementos.length; i++) {
                        var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                        objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                    }
                }
                // recarrega scroll pane
                $.reinitialiseScroll();
            }

         function f_actualizar_check(VALOR) {     
              objDom.setValorPorId("TIPO", VALOR);                          
         }

          
         function f_but_9908890 () {  //CORREO

             objUtiles.ejecutarFormulario("axis_axisage035.do", "generar_correo", document.miForm, "_self", objJsMessages.jslit_cargando);
             
            } 
         function f_but_112247() {  //LISTADOS
        
                CCAMPANA = objDom.getValorComponente(document.miForm.LSTCAMPANA);  
                objDom.setValorPorId("CCAMPANA",CCAMPANA);
                
        if (objUtiles.estaVacio(objDom.getValorPorId("CCAMPANA"))) {
             alert('<axis:alt f="${pantalla}" c="ERROR_CCAMPANA" lit="9908991"/>');
        }
        else {
            //  objUtiles.ejecutarFormulario("axis_axisage035.do", "generar_list", document.miForm, "_self", objJsMessages.jslit_cargando);
            var VCCAMPANA = objDom.getValorComponente(document.miForm.LSTCAMPANA);
            var VCAGENTE  = objDom.getValorComponente(document.miForm.LSAGENTES);
            var VCEMPRES  = objDom.getValorComponente(document.miForm.CEMPRESA);
            console.log(VCEMPRES);
            
            objAjax.invokeAsyncCGI_JSON("axis_axisage035.do?operation=generar_list&CCAMPANA="+VCCAMPANA+"&CAGENTE="+VCAGENTE+"&CEMPRES="+VCEMPRES, callBack_miajaxjson, "<axis:alt f='axisage035' c='MSG_CARGAR' lit='9905686'/>")
                             
        }
        }
                 
            function f_imprimir_fitxer(fichero){ 
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+fichero,600,200);
           }  

           function callBack_miajaxjson(p) {
           
           objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
 
           //hay que actualizar la lista de resulotados xxx
           var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
           odiv_OBFICHERO.innerHTML="";
           var div_OBFICHEROcontenido="";
           div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";

           if (p.JSON2.LIST_FICHEROS!=null) {
                       
                   objDom.setValorComponente(document.miForm.DES_FILE, 1);
                   div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer('"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"')\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"SORTIDA"+"\" id=\"SORTIDA"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
                   div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
                   odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
               
           }
           }
       </script>
       </head>
     
       <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
       <c:import url="../include/precargador_ajax.jsp">
       <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
       </c:import>
       <form name="miForm" action="axis_axisage035.do" method="POST">
           
       <c:import url="../include/titulo_nt.jsp">
       <c:param name="formulario"><axis:alt f="axisage035" c="TITULO" lit="9905811"/></c:param>
       <c:param name="titulo"><axis:alt f="axisage035" c="TITULO" lit="9908966"/></c:param> 
       <c:param name="form">axisage035</c:param>
       </c:import>
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
       <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
       <input type="hidden" name="CESTADO" id="CESTADO" value="${__formdata.CESTADO}"/> 
       <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/> 
       <input type="hidden" name="CCAMPANA" id="CCAMPANA" value="${__formdata.CCAMPANA}"/> 
       <input type="hidden" name="CRAMO" id="CRAMO" value="${__formdata.CRAMO}"/> 
       <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/> 
       <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/> 
       <input type="hidden" name="CSUCURS" id="CSUCURS" value="${__formdata.CSUCURS}"/> 
       <input type="hidden" name="NMES" id="NMES" value="${__formdata.NMES}"/>
       <input type="hidden" id="CORREO" name="CORREO" value="${__formdata.CORREO}"/>
       <input type="hidden" id="haydatos" name="haydatos" value="${__formdata.haydatos}"/>
       <input type="hidden" id="TIPO" name="TIPO" value="${__formdata.TIPO}"/>
       
            
       <input type="hidden" name="DES_FILE" id="DES_FILE" value="${__formdata.DES_FILE}"/>
       <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>  

       <c:import url="../include/modal_estandar.jsp">
       <c:param name="titulo"><axis:alt f="axisadm099" c="IMPRIMIR" lit="1000205" /></c:param>
       <c:param name="nid" value="axisimprimir" />
       <c:param name="botonCerrar" value="true"/>
       </c:import>
       <!-- Área de campos  -->
       <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
       <tr>
       <td>
        
       <div class="titulo">
       <img src="images/flecha.gif"/><axis:alt f="axisret002" c="LIT_IMG_1" lit="1000178" />
       </div>      
       <table class="seccion">
       <tr>
       <td>
                                <table class="area" align="center">
                                <tr>
                                <th style="width:30%;height:0%;"/>
                                <th style="width:40%;height:0%;"/>
                                <th style="width:30%;height:0%;"/>
                                <th style="width:15%;height:0%;"/> 
                                </tr>
            
                                <tr>
                                <axis:ocultar f="axisage035" c="CEMPRESA">
                                <td class="titulocaja">
                                <b><axis:alt f="axisage035" c="CEMPRESA" lit="101619"/></b> <%-- Empresa --%>
                                </td>  
                                </axis:ocultar>
        
                               <axis:ocultar f="axisage035" c="CCAMPANA">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="CCAMPANA" lit="9900734"/></b> <%-- Campaña --%>
                               </td>  
                               </axis:ocultar>
                               </tr>
                               
                               <tr>
                               <axis:ocultar f="axisage035" c="CEMPRESA">
                               <td class="campocaja">
                               <select name="CEMPRESA" id="CEMPRESA" size="1" class="campowidthselect campo campotexto" style="width:79%" "
                               <axis:atr f="axisage035" c="CEMPRES" a="modificable=true&isInputText=true&obligatorio=true"/> ">
                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="CEMPRESA" lit="101619"/> - </option>
                               <c:forEach var="element" items="${__formdata.listValores.LSTEMPRESAS}">
                               <option value = "${element.CEMPRES}"
                               <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.listValores.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>> 
                               <%--   <c:if test="${__formdata.listValores.CEMPRESA == element.CEMPRESA}"> selected = "selected"</c:if>  > --%>
                               ${element.TEMPRES}       
                               </option>
                               </c:forEach>
                               </select>  
                               </td> 
                               </axis:ocultar>
                               
                               <axis:ocultar f="axisage035" c="CCAMPANA">
                               <td class="campocaja">                                
                               <select name="LSTCAMPANA" id="LSTCAMPANA" size="1" class="campowidthselect campo campotexto" style="width:79%;" "
                               <axis:atr f="axisage035" c="CCAMPANA" a="modificable=true&isInputText=true&obligatorio=true"/> ">
                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="CCAMPANA" lit="9900734"/> - </option>
                               <c:forEach var="element" items="${__formdata.listValores.LSTCAMPANA}">
                               <option value = "${element.CCODIGO}"
                               <c:if test="${__formdata.CCAMPANA == element.CCODIGO || fn:length(__formdata.listValores.LSTCAMPANA) == 1}"> selected = "selected"</c:if>>
                               ${element.TDESCRIP}       
                               </option>
                               </c:forEach>
                               </select>
                               </td> 
                               </axis:ocultar>
                               </tr>
                               
                               <tr>
                               <axis:ocultar f="axisage035" c="CRAMO">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="CRAMO" lit="100784"/></b> <%-- Ramo --%>
                               </td>  
                               </axis:ocultar>
                               
                               <axis:ocultar f="axisage035" c="SPRODUC">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="SPRODUC" lit="100829"/></b> <%-- Producto --%>
                               </td>  
                               </axis:ocultar>
                               </tr>
                               
                               <tr>
                               <axis:ocultar f="axisage035" c="CRAMO" dejarHueco="false"> 
                               <td class="campocaja">
                               <select name = "ramoProducto" id="ramoProducto" style="width:79%;" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                               <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="SELECCIONAR" lit="108341"/> - </option>
                               <c:forEach var="ramos" items="${axisctr_listaRamos}">
                               <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                               <c:if test="${ramos.CRAMO == __formdata.CRAMO || fn:length(__formdata.ramos.CRAMO) == 1}">selected = "selected" </c:if>>
                               ${ramos.TRAMO}
                               </option>
                               </c:forEach>
                               </select>
                               </td>
                               </axis:ocultar>  
                               
                               <axis:ocultar f="axisage035" c="SPRODUC" dejarHueco="false"> 
                               <td class="campocaja">
                               <select name = "productos" id ="productos" style="width:79%;" size="1" onchange="f_onchangeproductos(this.value)" class="campowidthselect campo campotexto">
                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="SELECCIONAR" lit="108341" />  </option>
                               <c:forEach items="${__formdata.productos}" var="item">
                               <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                               </c:forEach>
                               </select>
                               </td>
                               </axis:ocultar>
                               </tr>  
                               
                               <tr>
                               <axis:ocultar f="axisage035" c="CSUCURS">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="CSUCURS" lit="9002202"/></b> <%-- Sucursal --%>
                               </td>  
                               </axis:ocultar>
                               <axis:ocultar f="axisage035" c="CAGENTE">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="CAGENTE" lit="100584"/></b> <%-- Agente --%>
                               </td>  
                               </axis:ocultar>
                               </tr>
                               <tr>
                               <axis:ocultar f="axisage035" c="CAGENTE" >                            
                               <td class="campocaja"> 
                               <select name="LSAGENTESTIPO" id="LSAGENTESTIPO" size="1" class="campowidthselect campo campotexto" style="width:79%;">
                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="CAGENTE" lit="9002202"/> - </option>
                               <c:forEach var="element" items="${__formdata.listValores.LSAGENTESTIPO}">
                               <option value = "${element.CAGENTE}"
                               <c:if test="${__formdata.CAGENTE == element.CAGENTE|| fn:length(__formdata.listValores.LSAGENTESTIPO) == 1}"> selected = "selected"</c:if>>
                               ${element.TAGENTE} 
                               </option>
                               </c:forEach>
                               </select>
                                                   
                               </td>
                               </axis:ocultar>

                               <axis:ocultar f="axisage035" c="LSAGENTES" >                            
                               <td class="campocaja">
                               <select name="LSAGENTES" id ="LSAGENTES" <axis:atr f="axisage035" c="LSAGENTES" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:79%;">
                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="LSAGENTES" lit="100584"/> - </option>
                               <c:forEach var="element" items="${__formdata.listValores.LSAGENTES}">
                               <option value = "${element.CODI}">  
                               ${element.NOMBRE} 
                               </option>
                               </c:forEach>
                               </select>
                               </td>
                               </axis:ocultar>
                               </tr>
                               <tr>
                               <axis:ocultar f="axisage035" c="NMES">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="NMES" lit="9000495"/></b> <%-- Mes --%>
                               </td>  
                               </axis:ocultar>
                               <axis:ocultar f="axisage035" c="NANO">
                               <td class="titulocaja">
                               <b><axis:alt f="axisage035" c="NANO" lit="9908268"/></b> <%-- Año --%>
                               </td>  
                               </axis:ocultar>
        
                               </tr>
                               <tr>
                               <axis:ocultar f="axisage035" c="NMES">
                               <td class="campocaja">                                
                               <select name="LSTMESES" id="LSTMESES"  class="campowidthselect campo campotexto" style="width:30%;" size="1" "
                               <axis:atr f="axisage035" c="LSTMESES" a="modificable=true&isInputText=true&obligatorio=true"/> ">
                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage035" c="SELECCIONAR" lit="9000495"/> - </option>
                               <c:forEach var="element" items="${__formdata.listValores.LSTMESES}">
                               <option value = "${element.CATRIBU}"
                               <c:if test="${__formdata.NMES == element.NMES || fn:length(__formdata.listValores.LSTMESES) == 1}"></c:if>>
                               ${element.TATRIBU} 
                               </option>
                               </c:forEach>
                               </select>
                               </td> 
                               </axis:ocultar>  
                               <axis:ocultar f="axisage035" c="NANO" dejarHueco="true">
                               <td class="campocaja">
                               <input type="text" class="campowidthinput campo campotexto" style="width:10%" maxlength="4"
                               value="${__formdata.NANO}" name="NANO" id="NANO" 
                               formato="entero" title="<axis:alt f="axisage035" c="NANO" lit="9908268" />" size="15"
                               onkeypress="return isNumberKey(event)"
                               <axis:atr f="axisage035" c="NANO" a="modificable=true&isInputText=true&obligatorio=true"/> />
                               </td>
                               </axis:ocultar>
                                <tr>
                                <axis:ocultar f="axisage035" c="CTIPO" dejarHueco="false"> 
                                <td id="MODO_R" class="titulocaja">
                                </td>
                                </axis:ocultar>   
                                <axis:ocultar f="axisage035" c="CTIPO" dejarHueco="false"> 
                                <td id="MODO_P" class="titulocaja">
                                <b><axis:alt f="axisage035" c="MODO_R" lit="9000506" /></b>
                                <input type="radio" id="CTIPO" name="CTIPO" value="0" <c:if test="${__formdata.CTIPO == 0 || empty __formdata.CTIPO}"> checked </c:if> />
                                <b><axis:alt f="axisage035" c="MODO_P" lit="9000632" /></b>
                                <input type="radio" id="CTIPO" name="CTIPO" value="1" <c:if test="${__formdata.CTIPO == 1}"> checked </c:if>  />
                                </td>
                                </axis:ocultar>
                                                         
                                <c:import url="../include/botonera_nt.jsp"> 
                                <c:param name="f">axisage035</c:param>
                                <c:param name="__botones">buscar</c:param>
                                </c:import>
                                </table>
                                </td>
                                </tr>
                                
            </table>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td>
        
            <div class="titulo">
                 <img src="images/flecha.gif"/><axis:alt f="axisret002" c="LIT_IMG_1" lit="111046" />
            </div>      
            <table class="seccion">
                   <tr>
                       <td>
                           <table class="area" align="center">                                
                           <tr>                                    
                              <th style="width:20%;height:0%;"/>
                              <th style="width:20%;height:0%;"/>
                              <th style="width:20%;height:0%;"/>
                              <th style="width:20%;height:0%;"/> 
                           </tr>    
                         <tr>
                                     
        <axis:ocultar f="axisage035" c="FCIERRE">
                   <td class="titulocaja">
                   <b><axis:alt f="axisage035" c="FCIERRE" lit="9000490"/></b> <%-- Fecha cierre --%>
                   </td>  
        </axis:ocultar>
        <axis:ocultar f="axisage035" c="FINICAM">
                   <td class="titulocaja">  
                   <b><axis:alt f="axisage035" c="FINICAM" lit="9908888"/></b> <%-- Fecha inicio Prod --%>
                   </td>  
        </axis:ocultar>
        <axis:ocultar f="axisage035" c="FFINCAM">
                   <td class="titulocaja">
                   <b><axis:alt f="axisage035" c="FFINCAM" lit="9908889"/></b> <%-- Fecha Fin Prod --%>
                   </td>  
        </axis:ocultar>
        <axis:ocultar f="axisage035" c="FINIREC">
                   <td class="titulocaja">
                   <b><axis:alt f="axisage035" c="FINIREC" lit="9908878"/></b> <%-- Fecha inicio Reca. --%>
                   </td>  
        </axis:ocultar>
        <axis:ocultar f="axisage035" c="FFINREC">
                   <td class="titulocaja">
                   <b><axis:alt f="axisage035" c="FFINREC" lit="9908879"/></b> <%-- Fecha Fin Reca --%>
                   </td>  
        </axis:ocultar>
        </tr>
        <tr>
        <axis:ocultar f="axisage035" c="FCIERRE">
                   <td class="campocaja">  
                   <input type="text" class="campo campotexto" size="5" style="width:50%;"
                   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/>"
                   name="FCIERRE" id="FCIERRE"
                   title="<axis:alt f='axisage035' c='FCIERRE' lit='9000490'/>"
                   alt="<axis:alt f='axisage035' c='FCIERRE' lit='9000490'/>" 
                   <axis:atr f="axisage035" c="FCIERRE" a="modificable=false&formato=fecha"/> />
                   </td>
        </axis:ocultar>
                                  
        <axis:ocultar f="axisage035" c="FINICAM">
                  <td class="campocaja">  
                  <input type="text" class="campo campotexto" size="5" style="width:50%;"
                  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICAM}"/>"
                  name="FINICAM" id="FINICAM"
                  title="<axis:alt f='axisage035' c='FINICAM' lit='9908888'/>"
                  alt="<axis:alt f='axisage035' c='FINICAM' lit='9908888'/>" 
                  <axis:atr f="axisage035" c="FINICAM" a="modificable=false&formato=fecha"/> />
                  </td>
         </axis:ocultar>
         <axis:ocultar f="axisage035" c="FFINCAM">
                   <td class="campocaja">
                   <input type="text" class="campo campotexto" size="15" style="width:50%;"
                   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINCAM}"/>"
                   name="FFINCAM" id="FFINCAM"
                   title="<axis:alt f='axisage035' c='FFINCAM' lit='9908889'/>"
                   alt="<axis:alt f='axisage035' c='FFINCAM' lit='9908889'/>" 
                   <axis:atr f="axisage035" c="FFINCAM" a="modificable=false&formato=fecha"/> />
                   </td>
         </axis:ocultar>
         <axis:ocultar f="axisage035" c="FINIREC">
                   <td class="campocaja">
                   <input type="text" class="campo campotexto" size="15" style="width:50%;"
                   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIREC}"/>"
                   name="FINIREC" id="FINIREC"
                   title="<axis:alt f='axisage035' c='FINIREC' lit='9908878'/>"
                   alt="<axis:alt f='axisage035' c='FINIREC' lit='9908878'/>" 
                   <axis:atr f="axisage035" c="FINIREC" a="modificable=false&formato=fecha"/> />
                   </td>
         </axis:ocultar>
         <axis:ocultar f="axisage035" c="FFINREC">
                    <td class="campocaja">
                    <input type="text" class="campo campotexto" size="15" style="width:50%;" 
                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINREC}"/>"
                    name="FFINREC" id="FFINREC"
                    title="<axis:alt f='axisage035' c='FFINREC' lit='9908879'/>"
                    alt="<axis:alt f='axisage035' c='FFINREC' lit='9908879'/>" 
                    <axis:atr f="axisage035" c="FFINREC" a="modificable=false&formato=fecha"/> />                            
                    </td>
         </axis:ocultar>
         </tr>
         </table>
                <tr>
                    <td align="left" valign="top">
                     <table border="0" class="area" align="left" style="width:100%;">
                     <tr>
                     <td>
                         <axis:visible c="DSP_RESULTADOS_POL" f="axisctr019">
                         </axis:visible>
                                            <div class="separador">&nbsp;</div>
                                            <c:set var="title0"><axis:alt f="axisage035" c="CCAMPANA" lit="9900734"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisage035" c="SPRODUC" lit="100829"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisage035" c="CAGENTE" lit="100584"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisage035" c="CNUMPOL" lit="9908968"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisage035" c="IPRODUCCION" lit="9908967"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisage035" c="IRECAUDO" lit="9908894"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisage035" c="ISINIEST" lit="9908895"/></c:set>
                                          
                                         <div class="seccion displayspaceGrande">
                                         <display:table name="${__formdata.CAMPANAS}" id="ListCam" 
                                             export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                             cellpadding="0" cellspacing="0" requestURI="" >
                                             <%@ include file="../include/displaytag.jsp"%>
                                             <axis:visible f="axisage035" c="CCAMPANA">
                                             <display:column title="${title0}" sortable="true" 
                                             headerClass="sortable" media="html" autolink="false" 
                                             sortProperty="ListCam.CCAMPANA">
                                             <div class="dspText">${ListCam.CCAMPANA}</div> 
                                             </display:column>
                                              </axis:visible>
                                              <axis:visible f="axisage035" c="SPRODUC">
                                              <display:column title="${title1}" sortable="true" 
                                              headerClass="sortable" media="html" autolink="false" 
                                              sortProperty="ListCam.SPRODUC">
                                              <div class="dspText">${ListCam.SPRODUC}</div>
                                              </display:column>
                                              </axis:visible>
                                              <axis:visible f="axisage035" c="CAGENTE">
                                              <display:column title="${title2}" sortable="true" 
                                              headerClass="sortable" media="html" autolink="false" 
                                              sortProperty="ListCam.CAGENTE">
                                              <div class="dspText">${ListCam.CAGENTE}</div>
                                              </display:column>
                                              </axis:visible>
                                              <axis:visible f="axisage035" c="CNUMPOL">
                                              <display:column title="${title3}" sortable="true" 
                                              headerClass="sortable" media="html" autolink="false" 
                                              sortProperty="ListCam.CNUMPOL">
                                              <div class="dspText">${ListCam.CNUMPOL}</div>
                                              </display:column>
                                              </axis:visible>
                                              <axis:visible f="axisage035" c="IPRODUCCION">
                                              <display:column title="${title4}" sortable="true" 
                                              headerClass="sortable" media="html" autolink="false" 
                                              sortProperty="ListCam.IPRODUCCION">
                                              <div class="dspText"> <fmt:formatNumber
                                              pattern="${__formatNumberPatterns[CMONPRODINT]}"
                                              value="${ListCam.IPRODUCCION}"/> </div>
                                              </display:column>
                                              </axis:visible>
                                                            
                                              <axis:visible f="axisage035" c="IRECAUDO">
                                              <display:column title="${title5}" sortable="true" 
                                              headerClass="sortable" media="html" autolink="false" 
                                              sortProperty="ListCam.IRECAUDO">
                                              <div class="dspText"> <div class="dspText"> <fmt:formatNumber
                                              pattern="${__formatNumberPatterns[CMONPRODINT]}"
                                              value="${ListCam.IRECAUDO}"/> </div></div>
                                              </display:column>
                                              </axis:visible>
                                              <axis:visible f="axisage035" c="ISINIEST">
                                              <display:column title="${title6}" sortable="true" 
                                              headerClass="sortable" media="html" autolink="false" 
                                              sortProperty="ListCam.ISINIEST">
                                              <div class="dspText"><fmt:formatNumber
                                              pattern="${__formatNumberPatterns[CMONPRODINT]}"
                                              value="${ListCam.ISINIEST}"/> </div>
                                              </display:column>
                                              </axis:visible>
                                              </display:table> 
                                            </div>	
                                        </td>
                                        </tr>
                                         
                                        <tr>
                            <td colspan="2" id="TITULO_FICHERO">
                            <div class="titulo">
                            <img src="images/flecha.gif"/><b><axis:alt f="axisadm099" c="TIT_FICH" lit="9906322"/> </b>
                            </div>
                            <div class="separador">&nbsp;</div>
                            </td>     
                </tr>
                <tr>
                             <td class="campocaja" id="fichero" colspan="4">
                             <div class="seccion displayspace" id="div_OBFICHERO"></div>
                             </td> 
                       <c:import url="../include/botonera_nt.jsp"> 
                       <c:param name="f">axisage035</c:param>
                       <c:param name="__botones">cancelar,9908890,112247</c:param>
                       </c:import>
               </tr>
               </table>
                       <div class="separador">&nbsp;</div>
                       </td>
                       </tr> 

                       <c:import url="../include/mensajes.jsp" />    
               </table>
             </table>
          </table>
       </table>
    </form>
 </html>
</body>