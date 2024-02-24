<%/*
*  Fichero: axisadm022.jsp
*  Se encarga de la subida de ficheros en APRA
*
*  Fecha: 07/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" errorPage="/WEB-INF/jsp/axiserror.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">

    <c:import url="../include/carga_framework_js.jsp" />    
    <style type="text/css">



        div.fakefile {
                position: absolute;
                top: 0px;
                left: 0px;
                z-index: 1;
                width: 650px;
        }


               
        
        input.file {
                position: relative;
                text-align: right;
                -moz-opacity:0 ;
                filter:alpha(opacity: 0);
                opacity: 0;
                z-index: 2;
                
        }
        
        
        
        
        div.fileinputs {
                position: relative;
                height: 30px;
        }
        
        .campoExaminar {
            border: 1px solid #DDDDDD;
            font-size: 11px;
            color: #333333;
            padding: 1px;   
            margin: 0px 5px 0px 0px;
            width: 60%;
        }

</style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        
        var W3CDOM = (document.createElement && document.getElementsByTagName);

        function initFileUploads() {            
                if (!W3CDOM) return;
                var inputFakeButton = document.createElement('input');
                inputFakeButton.setAttribute('type','button');                
                inputFakeButton.className = 'boton';
                inputFakeButton.value = "<axis:alt f='axisadm022' c='FAKEBUTTON' lit='9001708'/>";
                inputFakeButton.id = 'botoCFitxer';                
                var inputFakeText = document.createElement('input');
                inputFakeText.setAttribute('type','input');                
                inputFakeText.className = 'campowidthinput campoExaminar campotexto';
                inputFakeText.setAttribute('readonly','readonly');
                inputFakeText.setAttribute('obligatorio','true');                
                var fakeFileUpload = document.createElement('div');
                fakeFileUpload.className = 'fakefile';                
                fakeFileUpload.appendChild(inputFakeText);                
                fakeFileUpload.appendChild(inputFakeButton);  
                var x = document.getElementsByTagName('input');
                for (var i=0;i<x.length;i++) {
                        if (x[i].type != 'file') continue;                        
                        if (x[i].parentNode.className != 'fileinputs') continue;                        
                        x[i].className = 'file hidden'; 
                        var clone = fakeFileUpload.cloneNode(true);
                        x[i].parentNode.appendChild(clone);
                        x[i].relatedElement = clone.getElementsByTagName('input')[0];
                        x[i].onchange = x[i].onmouseout = function () {
                                this.relatedElement.value = this.value;                                
                        }
                }
        }
        
         function f_redireccionaFoco(){
            document.getElementById("botoCFitxer").focus();                          
        }
         
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm022", "cancelar", document.miFormAlt, "_self");
        }
        
        function f_but_108502(){
            objUtiles.ejecutarFormulario ("axis_${fn:toLowerCase(__formdata.TPANTALLA)}.do",
                "form", document.miFormAlt, "_self", objJsMessages.jslit_cargando);            
        }
        
        function f_but_9001532() {
            if (objValidador.validaEntrada()){
                var TFICHERO = document.miForm.TFILE.value;            
                var CPROCESO = document.miForm.P_CPROCESOS.value;
                
                
                var NNUMCASO  = document.miForm.NNUMCASO.value;
                try{
                    var NCASO_BPM = document.miForm.NCASO_BPM.value;
                }catch(e){}
                objAjax.invokeAsyncCGI("axis_axisadm022.do?TFICHERO="+TFICHERO+"&CPROCESO="+CPROCESO+"&NNUMCASO="+NNUMCASO+"&NCASO_BPM="+NCASO_BPM, callbackAjaxProcesar, "operation=procesar", this,  objJsMessages.jslit_cargando, false);
            }
        }
        
        function callbackAjaxProcesar(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var OK = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    if (OK == 1){
                        if(confirm("<axis:alt f='axisadm022' c='CONFIRM' lit='105245'/>")){
                            if (objValidador.validaEntrada()){
                                if(confirm("<axis:alt f='axisadm022' c='CONFIRM2' lit='9001183'/>")){
                                    var userAgent = "${header['User-agent']}";
                                    
                                    // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                                    // Por eso, pasamos el nombre de fichero como un campo hidden.
                                    // En IE, se recoge de forma normal, con item.getName().
                                    if (userAgent.indexOf("Firefox") > 0)
                                        objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
                                    
                                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                                    document.miForm.submit();
                                }   
                            }             
                        }
                    }
                    else if (OK == 0){
                        if (objValidador.validaEntrada()){
                            if(confirm("<axis:alt f='axisadm022' c='CONFIRM2' lit='9001183'/>")){
                                var userAgent = "${header['User-agent']}";
                                
                                // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                                // Por eso, pasamos el nombre de fichero como un campo hidden.
                                // En IE, se recoge de forma normal, con item.getName().
                                if (userAgent.indexOf("Firefox") > 0)
                                    objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
                    
                                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                                document.miForm.submit();
                            }   
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_onload() {        
            initFileUploads();
            f_cargar_propiedades_pantalla();
            document.getElementById("P_CPROCESOS").focus();                  
            <c:if test="${!empty __formdata.TPANTALLA && __formdata.TPANTALLA != 'null'}">
                f_but_108502();
            </c:if>   
        }
        
       function f_abrir_axisctr213(){
                objUtiles.abrirModal("axisctr213","src","modal_axisctr213.do?operation=form&DONDE=AXISADM022");
            }
            
            function f_cerrar_axisctr213() {
                objUtiles.cerrarModal("axisctr213");
            }
            
            function f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM){ 
                objUtiles.cerrarModal("axisctr213");
                document.miForm.NCASO_BPM.value = NCASO_BPM;
                document.miForm.NNUMCASO.value = NNUMCASO;
                f_cargar_casobpm(2);
            }
            
            function f_cargar_casobpm(donde){
                elemento = document.getElementById('NCASO_BPM');     
                var re = /^(-)?[0-9]*$/;     
                if (!re.test(elemento.value)) {    
                    document.miForm.NCASO_BPM.value = "";
                    alert("<axis:alt f='axisadm022' c='ERRORNUM' lit='1000150'/>");
                    
                }
                else{
                    if(donde == 1)
                        document.miForm.NNUMCASO.value = "";
                        
                    //alert("Antes de recargar ramos");
                    if (!objUtiles.estaVacio (document.miForm.NNUMCASO.value) ||
                        !objUtiles.estaVacio (document.miForm.NCASO_BPM.value)){
                        NNUMCASO  = document.miForm.NNUMCASO.value;
                        NCASO_BPM = document.miForm.NCASO_BPM.value;
                        document.miForm.NOMBRE_NCASO_BPM.value = "";
                        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarCasoBPM, "operation=ajax_cargar_casobpm&NNUMCASO=" + NNUMCASO +"&NCASO_BPM="+NCASO_BPM , this, objJsMessages.jslit_cargando);
                    }
                }
            }
            
             /* TRATAMIENTO AGENTE LCF */
             function callbackAjaxCargarCasoBPM (ajaxResponseText){
               // alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
              
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNOMCOM")[0])){
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNOMCOM"), 0, 0);
                        var PNUMCASO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNNUMCASO_OUT"), 0, 0);
                        objDom.setValorPorId("NOMBRE_NCASO_BPM", NOMBREformateado); 
                        objDom.setValorPorId("NNUMCASO", PNUMCASO); 
                    }else{
                        objDom.setValorPorId("NNUMCASO", ""); 
                        objDom.setValorPorId("NOMBRE_NCASO_BPM",""); 
                    }
                    
                }
            } 
            
            function f_actualiza(){
                f_cargar_propiedades_pantalla();
            }
            
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" enctype='multipart/form-data' action="Axisadm022fileupload" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm022" c="TITULO" lit="9001149"/></c:param>
            <c:param name="formulario"><axis:alt f="axisadm022" c="FORM" lit="9001149"/></c:param>
            <c:param name="form">axisadm022</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr213|<axis:alt c="axisctr213_TITULO" f="axisctr001" lit="9906011"/></c:param>
        </c:import>
        
        <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="CBORRA_FICH" name="CBORRA_FICH" value="${CBORRA_FICH}"/>
        <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${__formdata.NNUMCASO}"/> 
        
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            <tr>
                <td>                                    
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm022" c="TITULO" lit="9001149" /></div>
                    <table class="seccion">                                            
                        <tr>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                        </tr>
                        <tr>                           
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm022" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="3">     
                                <div class="fileinputs"  style="width:100%;">	
                                    <input type="file" id ="FILE" name="TFILE" title="<axis:alt f='axisadm022' c='FITXER' lit='1000574'/>" obligatorio="true" style="width:500px" onkeypress="f_redireccionaFoco()" value="${__formdata.FILE}">
                                </div>                             
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                        </tr>
                        <tr>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisadm022" c="TIPO_FITXER" lit="9001148"/></b>
                            </td>
                            <axis:visible f="axisadm022" c="NCASO_BPM">
                            <td class="titulocaja" id="tit_NCASO_BPM">
                                    <b><axis:alt f="axisctr001" c="NCASO_BPM" lit="9905993" /></b>
                            </td>
                            <td class="titulocaja" id="tit_NOMBRE_NCASO_BPM">
                                    <b><axis:alt f="axisctr001" c="TNCASO_BPM" lit="105940" /></b>
                            </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="2">                             
                                <select name = "P_CPROCESOS" id ="P_CPROCESOS" size="1" obligatorio="true" title="<axis:alt f="axisadm022" c="TIPO_FITXER" lit="9001148"/>" 
                                    class="campowidthselect campo campotexto" style="width:60%;" onchange="f_actualiza()" value="${__formdata.P_CPROCESOS}">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm022" c="MIN_VALUE" lit="108341"/> - </option> 
                                    <c:forEach items="${__formdata.P_TPROCESOS}" var="P_TPROCESOS">
                                        <option value = "${P_TPROCESOS.CPROCESO}" <c:if test="${P_TPROCESOS.CPROCESO  == __formdata.P_CPROCESOS}">selected</c:if>>${P_TPROCESOS.TDESCRIP}</option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                            <axis:visible f="axisadm022" c="NCASO_BPM">
                            <td class="campocaja">
                                    <input type="text" name="NCASO_BPM" title="<axis:alt f="axisctr001" c="NCASO_BPM" lit="9905993" />" id="NCASO_BPM" value="${__formdata.NCASO_BPM}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axisctr001" c="NCASO_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm(1)" />
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr213()" style="cursor:pointer" id="BUSQNCASO_BPM"/>
                            </td>
                            <td class="campocaja" colspan="2">    
                                            <input readonly="true" type="text" name="NOMBRE_NCASO_BPM" id="NOMBRE_NCASO_BPM" value="${__formdata.NOMBRE_NCASO_BPM}" class="campowidthinput campo campotexto"/>
                            </td>
                            </axis:visible>
                        </tr>     
                        
                    </table>                
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm022</c:param>
            <c:param name="__botones">salir,9001532<c:if test="${!empty __formdata.TPANTALLA && __formdata.TPANTALLA != 'null'}">,108502</c:if>
            </c:param>
        </c:import>        
    </form>
    
    <!-- Form para poder salir mediante el servlet de struts y no el de subida de ficheros-->
    <form name="miFormAlt" action="">
         <input type="hidden" name="operation" value=""/>
        
         <c:set var="varSPROCES">
            ${__formdata.TPANTALLA == 'axisadm024' ? 'SPROCES_CODA' : __formdata.TPANTALLA == 'axisint001' ? 'SPROCESBUSQ' : 'SPROCES'}
         </c:set>
         
         <input type="hidden" id="${varSPROCES}" name="${varSPROCES}" value="${__formdata.SPROCES}"/>
         
    </form>
    
    
    <c:import url="../include/mensajes.jsp" />
    
    
</body>
</html>