<%/*
*  Fichero: axisadm093.jsp
*
*  Fecha: 17/02/2015
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
                inputFakeButton.value = "<axis:alt f='axisadm093' c='FAKEBUTTON' lit='9001708'/>";
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
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm093", "cancelar", document.miFormAlt, "_self");
        }
        
        function f_but_cancelar() {
             parent.f_cerrar_modal('axisadm093');
        }
        
        function f_but_108502(){
            objUtiles.ejecutarFormulario ("axis_${fn:toLowerCase(__formdata.TPANTALLA)}.do",
                "form", document.miFormAlt, "_self", objJsMessages.jslit_cargando);            
        }
        
        function f_but_9001532() {
            
            if (objValidador.validaEntrada()){
                 
                var TFICHERO = document.miForm.TFILE.value;    
                var SSEGURO = document.miForm.SSEGURO.value;
                var NRIESGO = document.miForm.NRIESGO.value;
                var CGARANT = document.miForm.CGARANT.value;
                var CPREGUN = document.miForm.CPREGUN.value;
                var NMOVIMI = document.miForm.NMOVIMI.value;
                var CPROCESO = document.miForm.CPROCESO.value;
                
                objAjax.invokeAsyncCGI("modal_axisadm093.do?TFICHERO="+TFICHERO+"&SSEGURO="+SSEGURO+"&NRIESGO="+NRIESGO+"&CGARANT="+CGARANT+"&CPREGUN="+CPREGUN+"&NMOVIMI="+NMOVIMI+"&CPROCESO="+CPROCESO, callbackAjaxProcesar, "operation=procesar", this,  objJsMessages.jslit_cargando, false);            
               
            }
        }
        
        function callbackAjaxProcesar(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var OK = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    if (OK == 1){
                        if(confirm("<axis:alt f='axisadm093' c='CONFIRM' lit='105245'/>")){
                            if (objValidador.validaEntrada()){
                                if(confirm("<axis:alt f='axisadm093' c='CONFIRM2' lit='9001183'/>")){
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
                            if(confirm("<axis:alt f='axisadm093' c='CONFIRM2' lit='9001183'/>")){
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
            
            var cargaok = "${__formdata.FicheroOK}";
            var P_SPROCESSAL = "${__formdata.P_SPROCESSAL}";
            
            if(!objUtiles.estaVacio(cargaok) && cargaok == 0)
                parent.f_cerrar_modal('axisadm093',P_SPROCESSAL);
                
            initFileUploads();
            f_cargar_propiedades_pantalla();
           
        }
        
      
            
            function f_actualiza(){
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
             parent.f_cerrar_modal('axisadm093');
        }
        
            
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" enctype='multipart/form-data' action="Axisadm093fileupload" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm093" c="TITULO" lit="9001149"/></c:param>
            <c:param name="formulario"><axis:alt f="axisadm093" c="FORM" lit="9001149"/></c:param>
            <c:param name="form">axisadm093</c:param>
        </c:import>
        
        
        <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="CBORRA_FICH" name="CBORRA_FICH" value="${CBORRA_FICH}"/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
        <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
        <input type="hidden" id="CPREGUN" name="CPREGUN" value="${__formdata.CPREGUN}"/>
        <input type="hidden" id="CGARANT" name="CGARANT" value="${__formdata.CGARANT}"/>
        <input type="hidden" id="CPROCESO" name="CPROCESO" value="223"/>
        
        
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            <tr>
                <td>                                    
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm093" c="TITULO" lit="9001149" /></div>
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
                                <b><axis:alt f="axisadm093" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="3">     
                                <div class="fileinputs"  style="width:100%;">	
                                    <input type="file" id ="FILE" name="TFILE" title="<axis:alt f='axisadm093' c='FITXER' lit='1000574'/>" obligatorio="true" style="width:500px" onkeypress="f_redireccionaFoco()" value="${__formdata.FILE}">
                                </div>                             
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                        </tr>
                        
                    </table>                
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm093</c:param>
            <c:param name="__botones">cancelar,9001532<c:if test="${!empty __formdata.TPANTALLA && __formdata.TPANTALLA != 'null'}">,108502</c:if>
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