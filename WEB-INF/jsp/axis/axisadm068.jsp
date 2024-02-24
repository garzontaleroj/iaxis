<%/**
*  Fichero: axisadm068.jsp
*  Pantalla de generaciones de domiciliaciones de recibos.
*
*  Fecha: 26/02/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisadm068" c="titulo" lit="9902717"/></title> <%-- Domiciliación de recibos --%>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          

        <style type="text/css">
            .displayspaceMaximo {
                width: 930px;
               /* width: expression( this.scrollWidth > 899 ? "900px" : "auto" );*/
                height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
                max-height:350px;
                overflow-x: auto;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>

        <c:import url="../include/carga_framework_js.jsp" />
    
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

        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/

            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
            }
                    
            function f_imprimir_fitxer(pfitxer){                    
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");            
                //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer,600,200);
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axisadm068.jsp",600,200);
            }                         

            function f_onclickCheckbox(thiss) {
                thiss.value =  ((thiss.checked)?1:0);
                objDom.setValorPorId(thiss.id, thiss.value);
            }
            /************/

            function f_abrir_axisadm067(){
                objUtiles.abrirModal("axisadm067","src","modal_axisadm067.do?operation=form");  
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm068", "cancelar", document.miForm, "_self");
            }   
            
            function f_aceptar_axisadm067(CEMPRES,CRAMO,SPRODUC,FEFECTO,FFECCOB,SPROCES,cadena,CCOBBAN,CBANCO,CTIPCUENTA,FVENTAR,CREFERENCIA,DFEFECTO){
                //alert("CADENA::: "+cadena);
                
                objDom.setValorPorId("CEMPRES", CEMPRES);
                document.miForm.CEMPRES.value=CEMPRES;
                document.miForm.CRAMO.value=CRAMO;
                document.miForm.SPRODUC.value=SPRODUC;
                document.miForm.FEFECTO.value=FEFECTO;
                document.miForm.FFECCOB.value=FFECCOB;
                document.miForm.SPROCES.value=SPROCES;
                document.miForm.SPROCES_.value=SPROCES;
                document.miForm.CADENA.value = cadena;
                document.miForm.SPROCDOM.value = '';
                document.miForm.CCOBBAN.value = CCOBBAN;
                document.miForm.CBANCO.value = CBANCO;
                document.miForm.CTIPCUENTA.value = CTIPCUENTA;
                document.miForm.FVENTAR.value = FVENTAR;
                document.miForm.CREFERENCIA.value = CREFERENCIA
                document.miForm.DFEFECTO.value = DFEFECTO;
                    
                objUtiles.ejecutarFormulario ("axis_axisadm068.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
           //     objUtiles.cerrarModal("axisadm067");
            }
            
            function f_cerrar_axisadm067(){
                //alert("Antes de cerrar pantall67");
                //Inici BFP 28/12/2011 bug 20544/101990
                objUtiles.cerrarModal("axisadm067");
                //Fi BFP 28/12/2011 bug 20544/101990
            }            

            function f_but_9902769() {
                // Domiciliar

                //alert("Producto:"+ objDom.getValorPorId("SPRODUC"));
               // if (objValidador.validaEntrada())
               // objUtiles.ejecutarFormulario ("modal_axisadm068.do", "domiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
               objUtiles.ejecutarFormulario ("axis_axisadm068.do", "domiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);
         
            
            }
            
         
            // BUG 21120-0108594-20120228-JLTS-Se cambia el domiciliar por redomiciliar
            function f_but_9002210(){
       
            // Regenerar
                   // if (objValidador.validaEntrada())
                    // objUtiles.ejecutarFormulario ("modal_axisadm068.do", "domiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
                
                    
                objUtiles.ejecutarFormulario ("axis_axisadm068.do", "redomiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }      

            function f_but_imprimir(){
            //Fefecto-obl)|Ramo-opc|Producto-opc|Empresa-opc  /*01012009|||2*/
            var FFECHA = document.miForm.FEFECTO.value;
            var DFFECHA = document.miForm.DFEFECTO.value;
            var SPRODUC = objUtiles.replaceAll(objUtiles.replaceAll(document.miForm.SPRODUC.value,"null",""),"NULL","");
            //var VPARAMETROS = objUtiles.replaceAll(FFECHA, "/", "")+'|'+document.miForm.CRAMO.value+'|'+document.miForm.SPRODUC.value+'|'+document.miForm.CEMPRES.value;
			      var VPARAMETROS = objUtiles.replaceAll(FFECHA, "/", "")+'|'+document.miForm.CRAMO.value+'|'+SPRODUC+'|'+document.miForm.CEMPRES.value+'|'+document.miForm.SPROCDOM.value+'|'+
                                    document.miForm.CCOBBAN.value+'|'+document.miForm.CBANCO.value+'|'+document.miForm.CTIPCUENTA.value+'|'+document.miForm.FVENTAR.value+'|'+document.miForm.CREFERENCIA.value+'|'+
                                    //bug 0020050 document.miForm.DFEFECTO.value
                                    objUtiles.replaceAll(DFFECHA, "/", "")
                                    ;                    
                       //alert(VPARAMETROS);
                       objAjax.invokeAsyncCGI("axis_axisadm068.do?CMAP=477&CPARAMETROS=" + VPARAMETROS
                                                , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);            
            }               

        function f_but_9000754() {
        
            var inputs=document.getElementsByTagName("input");
            var CSPROCES = objDom.getValorPorId("SPROCES_"); 
            
            var param = "|CSPROCES:"+CSPROCES+"|CEMPRES:|CCOBBAN:|CIDIOMA:|"; 
            var maps = "|";

            for (i=0;i<inputs.length;i++) {
                if (inputs[i].name.indexOf("NLISTADO")==0) {
                    if (inputs[i].checked) {
                        var codimap = inputs[i].id.substring(9,13);
                        maps = maps + codimap + "|";
                    }
                }
            }
            
            objUtiles.ejecutarFormulario ("axis_axisadm068.do?CMAP=" + maps +"&CPARAMETROS=" + param, "generar_resultados_maps", document.miForm, "_self", objJsMessages.jslit_cargando);
        
        }
        
        function f_onload(){   
        
                <c:if test="${empty requestScope.LST_DOMICILIACIONES && POST_CONSULTA!='S'}">
                      objUtiles.abrirModal("axisadm067","src","modal_axisadm067.do?operation=form");    
                </c:if>

                f_cargar_propiedades_pantalla();
                 }
                 
                 
            /* ************************************************************************************* */
            /* ***************************** DOMIC varios PROD. ************************************ */
            /* ************************************************************************************* */
            
            
            //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
        function obtener_marcados(){
            var j=0;
            var cadena_sproduc ="";
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                      
                         if( elemento.checked ){
                             objDom.setValorPorId("SELEC_"+j,1);
                             var valor=eval("document.miForm.SPRODUC_"+j+".value");
                             //alert("SELEC"+j+":  "+1);
                             cadena_sproduc = cadena_sproduc + + ";";
                         }else{
                             objDom.setValorPorId("SELEC_"+j,0);
                             //alert("SELEC"+j+":  "+0);
                             
                         }
                        //alert(cadena_sproduc); 
                        j =j+1;
                    } 
            }  
        //alert("*************************************************************************");
        //alert(document.miForm.SELEC_0.value);
        //alert(document.miForm.SELEC_1.value);
        }
        
        function f_but_9901189(){
         
          obtener_marcados();
          objUtiles.ejecutarFormulario("axis_axisadm068.do", "domiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);
          
        }
                 
                 
                 
            /* ************************************************************************************** */
            /* ****************************** CALLBACKS AJAX **************************************** */
            /* ************************************************************************************** */    

            function callbackAjaxGenerarResultado_map (ajaxResponseText) {
                                     
                 objDom.setValorPorId("SORTIDA", "");   
                 objDom.setValorPorId("CXML", "");  
                                

                //alert(ajaxResponseText);
                
                var doc = objAjax.domParse(ajaxResponseText);

                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";               
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                      
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='axisadm068' c='mensaje' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                        
                              objDom.setValorPorId("SORTIDA", fichero);
                              
                              // AHORA LA LISTA /////
                                var tableM = document.getElementById("ReportsList");
                                var tbodyM = tableM.getElementsByTagName("tbody")[0];
                                var trM = tbodyM.getElementsByTagName("tr");
                    
                                objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisadm068' c='ReportsList' lit='1000254' />");
                    
                                objLista.borrarFilaVacia(tbodyM, trM);
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd = new Array(1);
                                
                                //----------------------                                
                                 var str = document.getElementById('SORTIDA').value;                                
                                 var str2 = str.replace(/\\/gi, "barrainvertida");                                 
                                //--------------------
                                
        
                                newtd[0] = objLista.addTextoEnLista(fichero,
                                  "javascript:f_imprimir_fitxer('"+str2+"')");
                              //  "javascript:f_imprimir_fitxer('"+document.getElementById('SORTIDA').value+"')");

                                objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                                ///////////////////////                              
                         }
                   }                
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
            
            //var elem = document.getElementById("CUENTA");
            var elementCount = document.miForm.CUENTA.value;

            //alert(elementCount);
            for(var j=0; j < elementCount ; j++){
                var ID= eval("document.miForm.IDCUENTA_"+j+".value");
                var ISALDO= eval("document.miForm.NREC_"+j+".value");
                
                //alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
           
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
                 
            
            

        </script>
    </head>

    <c:set var="onKeyPress">
        <c:if test="${empty requestScope.LST_DOMICILIACIONES}">
            if (event.keyCode==13)  { f_but_consultar() }
        </c:if>
        <c:if test="${!empty requestScope.LST_DOMICILIACIONES}">
            if (event.keyCode==13)  { f_but_9902769() }
        </c:if>
    </c:set>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="${onKeyPress}">
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm068" c="imprimir" lit="1000205" />|true</c:param>
        </c:import>            
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>      
            <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/> 
            <input type="hidden" name="CRAMO" value="${__formdata.CRAMO}"/>   
            <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>   
            <input type="hidden" name="FEFECTO" value="<c:if test="${!empty __formdata.FEFECTO}"><fmt:formatDate value='${__formdata.FEFECTO}' pattern='dd/MM/yyyy'/></c:if>"/>   
           <input type="hidden" name="FFECCOB" value="<c:if test="${!empty __formdata.FFECCOB}"><fmt:formatDate value='${__formdata.FFECCOB}' pattern='dd/MM/yyyy'/></c:if>"/> <%----%>
            <input type="hidden" name="SPROCES" value="${__formdata.SPROCES}"/>   
            <input type="hidden" name="SORTIDA" id="SORTIDA" value=""/>   
            <input type="hidden" name="NOMMAP1" id="NOMMAP1" value=""/>   
            <input type="hidden" name="NOMMAP2" id="NOMMAP2" value=""/>   
            <input type="hidden" name="NOMDR" id="NOMDR" value=""/>  
            <input type="hidden" name="SPROCDOM" id="SPROCDOM" value="${__formdata.SPROCDOM}"/>  
            <input type="hidden" name="CADENA" id="CADENA" value="${__formdata.CADENA}"/>  
            
            <input type="hidden" name="CCOBBAN" id="CCOBBAN" value="${__formdata.CCOBBAN}"/>
            <input type="hidden" name="CBANCO" id="CBANCO" value="${__formdata.CBANCO}"/>
            <input type="hidden" name="CTIPCUENTA" id="CTIPCUENTA" value="${__formdata.CTIPCUENTA}"/>
            <input type="hidden" name="FVENTAR" id="FVENTAR" value="${__formdata.FVENTAR}"/>
            <input type="hidden" name="CREFERENCIA" id="CREFERENCIA" value="${__formdata.CREFERENCIA}"/>
            <input type="hidden" name="DFEFECTO" value="<c:if test="${!empty __formdata.DFEFECTO}"><fmt:formatDate value='${__formdata.DFEFECTO}' pattern='dd/MM/yyyy'/></c:if>"/>   
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm068" c="formulario" lit="9902717"/></c:param> <%-- Domiciliación de recibos --%>
                <c:param name="titulo"><axis:alt f="axisadm068" c="titulo" lit="9902717"/></c:param>     <%-- Domiciliación de recibos --%>
                <c:param name="form">axisadm068</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisadm067|<axis:alt f="axisadm068" c="nid" lit="9902718"/></c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>                                        
                        
                       
                        <table class="seccion">                            
                            <tr>
                                <td> 
                        <%--c:if test="${!empty requestScope.LST_DOMICILIACIONES}" --%> <!-- LISTA SIEMPRE VISIBLE -->
                            <div id="dt_domiciliaciones" >
                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm068" c="dt_domiciliaciones" lit="9902751"/>
                                <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm068" c="find" lit="100797" />" onclick="f_abrir_axisadm067();" style="cursor:pointer"/>
                                </div>
                            </div> <%-- Detalle domiciliación --%>

                                                            <div class="separador">&nbsp;</div>     
                                                            <%-- DisplayTag Domiciliaciones --%>
                                                            <c:set var="title1"><axis:alt f="axisadm068" c="PRODUCTO" lit="100829"/></c:set>   <%-- Producto --%>
                                                            <c:set var="title2"><axis:alt f="axisadm068" c="NPOLIZA" lit="100836"/></c:set>   <%-- Póliza --%> 
                                                            <c:set var="title3"><axis:alt f="axisadm068" c="NRECIBO" lit="100895"/></c:set>   <%-- Recibo --%> 
                                                            <c:set var="title4"><axis:alt f="axisadm068" c="TIPO_RECIBO" lit="102302"/></c:set>   <%-- Tipo de recibo --%> 
                                                            <c:set var="title6"><axis:alt f="axisadm068" c="FEFECTO" lit="101332"/></c:set>   <%-- F. Efecto --%> 
                                                            <c:set var="title7"><axis:alt f="axisadm068" c="FVENCIM" lit="102526"/></c:set>   <%-- F. vencim. --%> 
                                                            <c:set var="title8"><axis:alt f="axisadm068" c="CBANCAR" lit="100965"/></c:set>   <%-- Cuenta bancaria --%> 
                                                            <c:set var="title9"><axis:alt f="axisadm068" c="ITOTALR" lit="100563"/></c:set>   <%-- Importe --%> 
                                                            <c:set var="title10"><axis:alt f="axisadm068" c="PROCESO" lit="1000576"/></c:set> <%-- Proceso --%> 
                                                            <c:set var="title11"><axis:alt f="axisadm068" c="FICHERO" lit="1000574"/></c:set> <%-- Fichero --%> 
                                                            
                                        		    <c:set var="title12"><axis:alt f="axisadm068" c="ESTADO" lit="100587"/></c:set> <%-- Estado --%> 
                                        		    <c:set var="title13"><axis:alt f="axisadm068" c="EST_DOMI" lit="9902237"/></c:set> <%-- Estado del recaudo --%> 
                                        		    <c:set var="title14"><axis:alt f="axisadm068" c="FESTADO" lit="9902238"/></c:set> <%-- Fecha del recaudo --%> 
                                                    <c:set var="title15"><axis:alt f="axisadm068" c="TESTIMP" lit="9000852"/></c:set> <%-- Subestado --%> 
                                                            
                                                            <%int contador = 0;%>
                                                            <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(sessionScope.REC_LSTRECIBOS)}">
                                                            <div class="displayspaceMaximo">
                                                                <display:table name="${requestScope.LST_DOMICILIACIONES}" id="LST_DOMICILIACIONES" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0" requestURI="axis_axisadm068.do?paginar=true">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                    <%-- display:column title="${title1}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            <input type="checkbox" name="" id=""></input>
                                                                            
                                                                            <input type="hidden" name="IDCUENTA_<%= contador %>" id="IDCUENTA_<%= contador %>" value="${LST_DOMICILIACIONES.NRECIBO}"/>
                                                                            <input type="hidden" name="NREC_<%= contador %>" id="NREC_<%= contador %>" value="${LST_DOMICILIACIONES.NRECIBO}"/>
                                                                            <input type="hidden" name="SPRODUC_<%= contador %>" id="SPRODUC_<%= contador %>" value="${LST_DOMICILIACIONES.CEMPRES}"/>
                                                                            <input type="hidden" name="CEMPRES_<%= contador %>" id="CEMPRES_<%= contador %>" value="${LST_DOMICILIACIONES.SPRODUC}"/>
                                                                            <input type="hidden" name="SELEC_<%= contador %>" id="SELEC_<%= contador %>" value=""/>
                                                                       
                                                                            
                                                                        </div>
                                                                    </display:column --%> 
                                                                    <display:column title="${title1}" sortable="true" sortProperty="PRODUCTO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            ${LST_DOMICILIACIONES.PRODUCTO}
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title2}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            ${LST_DOMICILIACIONES.NPOLIZA}
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title3}" sortable="true" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            ${LST_DOMICILIACIONES.NRECIBO}
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title4}" sortable="true" sortProperty="TIPO_RECIBO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            ${LST_DOMICILIACIONES.TIPO_RECIBO}
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title6}" sortable="true" sortProperty="FEFECTO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            <fmt:formatDate value="${LST_DOMICILIACIONES.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title7}" sortable="true" sortProperty="FVENCIM" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            <fmt:formatDate value="${LST_DOMICILIACIONES.FVENCIM}" pattern="dd/MM/yyyy"/>
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title8}" sortable="true" sortProperty="CBANCAR" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            <axis:masc f="axisadm068" c="CBANCAR" value="${LST_DOMICILIACIONES.CBANCAR}" />
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title9}" sortable="true" sortProperty="ITOTALR" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            <fmt:formatNumber value="${LST_DOMICILIACIONES.ITOTALR}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title10}" sortable="true" sortProperty="PROCESO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                            ${LST_DOMICILIACIONES.PROCESO}
                                                                        </div>
                                                                    </display:column>  
                                                                    <display:column title="${title11}" sortable="true" sortProperty="FICHERO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div style="margin-right:10px" class="dspText">
                                                                            ${LST_DOMICILIACIONES.FICHERO}
                                                                        </div>
                                                                    </display:column>
                                                                    
                                                                    <axis:visible f="axisadm068" c="ESTADO" >
                                                                    <display:column title="${title12}" sortable="true" sortProperty="ESTADO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div style="margin-right:10px" class="dspText">
                                                                            ${LST_DOMICILIACIONES.ESTADO}
                                                                        </div>
                                                                    </display:column>
                                                                    </axis:visible>
                                                                    <axis:visible f="axisadm068" c="TESTIMP" >
                                                                    <display:column title="${title15}" sortable="true" sortProperty="TESTIMP" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div style="margin-right:10px" class="dspText">
                                                                            ${LST_DOMICILIACIONES.TESTIMP}
                                                                        </div>
                                                                    </display:column>
                                                                    </axis:visible>
                                                                    <axis:visible f="axisadm068" c="EST_DOMI" >
                                                                    <display:column title="${title13}" sortable="true" sortProperty="EST_DOMI" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div style="margin-right:10px" class="dspText">
                                                                            ${LST_DOMICILIACIONES.EST_DOMI}
                                                                        </div>
                                                                    </display:column>
                                                                    </axis:visible>
                                                                    <axis:visible f="axisadm068" c="FESTADO" >
                                                                    <display:column title="${title14}" sortable="true" sortProperty="FESTADO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div style="margin-right:10px" class="dspText">
                                                                           <fmt:formatDate value='${LST_DOMICILIACIONES.FESTADO}' pattern='dd/MM/yyyy'/> 
                                                                        </div>
                                                                    </display:column>
                                                                    </axis:visible>
                                                                    
                                                                    <%contador++;%>
                                                                    
                                                                </display:table>                                                        
                                                            </div>
                                                        <div class="separador">&nbsp; </div>
                                                       
                                                </td>
                                            </tr>
                                        
                                        <tr class="campocaja" align="right">
                                            <td>
                                                <c:if test="${!empty requestScope.LST_DOMICILIACIONES && empty __formdata.SPROCES}">                        
                                                <input type="button" class="boton" id="but_9902769" onclick="f_but_9902769()" value="<axis:alt f="axisadm068" c="but_9902769" lit="9902769" />"/>
                                                <input type="button" class="boton" id="but_9002198" onclick="f_but_imprimir()" value="<axis:alt f="axisadm068" c="but_9002198" lit="9002198" />"/>                                            
                                                </c:if>                       
                                                <c:if test="${!empty requestScope.LST_DOMICILIACIONES && !empty __formdata.SPROCES}"> 
                                                <input type="button" class="boton" id="but_9002210" onclick="f_but_9002210()" value="<axis:alt f="axisadm068" c="but_9002210" lit="9002210" />"/>
                                                </c:if>
                                                        <div class="separador">&nbsp; </div>
                                            </td>
                                        </tr>
                                                       
                                    </table>
                                </td>
                            </tr>

<%-- ---------------------- --%>
                            <tr>
                            <td>
                <div class="separador">&nbsp;</div>
                    <div class="titulo"><b><axis:alt f="axisadm068" c="titulo2" lit="9000702"/></b></div>
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->                                
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:45%;height:0px"></th>

                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm068" c="SPROCES" lit="9001242"/></b> 
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" readonly style="background-color:transparent;border:0" 
                                            class="campowidthinput campo campotexto_ob" size="15"  name="SPROCES_" id="SPROCES_" value="${__formdata.SPROCES_}"
                                            title="<axis:alt f="axisadm068" c="SPROCES_" lit="9001242"/>"/>                                     
                                        </td>  
                                    </tr>    
                                    
                                    
                                    <c:forEach items="${__formdata.LISTMAPS}" var="LISTADOS" varStatus="status">
                                        <tr>
                                           <c:if test="${!empty __formdata.SPROCES_}">                                          
                                                    <td class="campocaja" colspan="2">
                                                    <c:set var="MICMAP">NLISTADO_${LISTADOS.CMAP}</c:set>
                                                        <input type="checkbox"  value="${__formdata.NLISTADO3}" <c:if test = "${__formdata[MICMAP] == 1}"> checked </c:if> name="NLISTADO_${LISTADOS.CMAP}" id="NLISTADO_${LISTADOS.CMAP}" onclick="f_onclickCheckbox(this)" /> 
                                                        <b>${LISTADOS.TLITERA}</b>
                                                    </td> 
                                            </c:if>                                             
                                        </tr>
                                        
                                    </c:forEach>
                                    
                                    <c:if test="${!empty __formdata.LISTMAPS && !empty __formdata.SPROCES_ }"> 
                                    <tr>
                                        <td class="campocaja" colspan="2">
                                            <input type="button" class="boton" id="but_9000754" onclick="f_but_9000754()" value="<axis:alt f="axisadm068" c="but_9000754" lit="9000754" />"/>
                                        </td> 
                                    </tr>
                                    </c:if>
                                    
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td> </td>
                                        <td> </td>                                                
                                    </tr>                                               
                                    <tr>
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO}" name="CFICHERO" id="CFICHERO"
                                                     title="<axis:alt f="axisadm068" c="CFICHERO" lit="9002207"/>"/>                                     
                                        </td> 
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO2}" name="CFICHERO2" id="CFICHERO2"
                                                     title="<axis:alt f="axisadm068" c="CFICHERO2" lit="9002208"/>"/>                                     
                                        </td>                                            
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO3}" name="CFICHERO3" id="CFICHERO3"
                                                     title="<axis:alt f="axisadm068" c="CFICHERO3" lit="9002209"/>"/>                                     
                                        </td>                                            
                                        
                                    </tr>
                                    
                                    <tr id="listaImpresion">
                                        <td colspan="2">
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm068" c="listaImpresion" lit="112247"/></div>
                                                        
                                            <c:set var="title0"><axis:alt f="axisadm068" c="title0" lit="107913"/></c:set>
                                            <div class="displayspaceMaximo">
                                            <display:table name="${__formdata.LIST_FICHEROS}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                           requestURI="axis_axisadm068.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                        <div style="cursor:pointer" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+escape( (this.innerText!=undefined)?this.innerText:this.textContent))"><u>${ReportsList.OB_IAX_IMPRESION.FICHERO}</u></div>
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
                  <%--</c:if>--%>
                </td>
            </tr>

        </table>
                        
                        
                        
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm068</c:param><c:param name="f">axisadm068</c:param>
               <c:param name="f">axisadm068</c:param>
               <c:param name="__botones">salir</c:param>
            </c:import>
                        
                    
            
        </form>
        
        <c:import url="../include/mensajes.jsp" />
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEFECTO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FEFECTO", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FFECCOB",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFECCOB", 
                singleClick    :    true,
                firstDay       :    1
            });   
         </script>

    </body>

</html>