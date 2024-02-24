<%/**
*  Fichero: axisadm099.jsp
*  Pantalla de consulta / mantenimiento de usuarios.
*  @author <a href = "mailto:igil@csi-ti.com">Ivan Gil</a>  
*
*  Fecha: 11/07/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
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
        <title><axis:alt f="axisadm099" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>


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

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
                
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
        
       
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }

            function f_but_buscar() {
                
                if(objUtiles.estaVacio(objDom.getValorComponente(document.miForm.ListProduc))){  
                        mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'   lit='103155'/>";
                        objDom.setValorComponente(document.miForm.SEL_SPRODUC, null);
                        alert(mensajesAlert);
                        //f_limpiar();
                }else{
                    var SPRODUC = objDom.getValorComponente(document.miForm.ListProduc);
                    //alert(SPRODUC);
                    document.getElementById("SEL_SPRODUC").value=SPRODUC;
                    //objDom.setValorComponente(document.miForm.SEL_SPRODUC, SPRODUC);
                    objUtiles.ejecutarFormulario ("axis_axisadm099.do?SPRODUC="+SPRODUC, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }

            function f_but_salir() {
                
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm099", "cancelar", document.miForm, "_self");
            }           
            
           
            function f_but_9001481() {
         var TFICHERO = document.getElementById('TFILE').value;            
         var CPROCESO = 84;
         var extension = (TFICHERO.substring(TFICHERO.lastIndexOf("."))).toLowerCase(); 
         if(extension!='.csv'){
            alert("<axis:alt f='axisadm099' c='CONFIRM' lit='50000'/>")
         }
         else{
          objAjax.invokeAsyncCGI("axis_axisadm099.do?TFICHERO="+TFICHERO+"&CPROCESO="+CPROCESO, callbackAjaxProcesar, "operation=procesar", this,  objJsMessages.jslit_cargando, false);            
         }
          
            }
          
            

            
            
            function callbackAjaxProcesar(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var OK = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    if (OK == 1){
                        if(confirm("<axis:alt f='axisadm099' c='CONFIRM' lit='105245'/>")){
                            if (objValidador.validaEntrada()){
                                if(confirm("<axis:alt f='axisadm099' c='CONFIRM2' lit='9001183'/>")){
                                    var userAgent = "${header['User-agent']}";
                                    
                                    // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                                    // Por eso, pasamos el nombre de fichero como un campo hidden.
                                    // En IE, se recoge de forma normal, con item.getName().
                                    if (userAgent.indexOf("Firefox") > 0)
                                        objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
                                    
    
                                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                                    document.miForm1.submit();
                                }   
                            }             
                        }
                    }
                    else if (OK == 0){
                        if (objValidador.validaEntrada()){
                            if(confirm("<axis:alt f='axisadm099' c='CONFIRM2' lit='9001183'/>")){
                                var userAgent = "${header['User-agent']}";
                                
                                // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                                // Por eso, pasamos el nombre de fichero como un campo hidden.
                                // En IE, se recoge de forma normal, con item.getName().
                                if (userAgent.indexOf("Firefox") > 0)
                                    objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
                    
                                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                                document.miForm1.submit();
                            }   
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
            
            function f_but_9902311() {
                
                if(objUtiles.estaVacio(objDom.getValorComponente(document.miForm.ListProduc))){  
                        mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'   lit='103155'/>";
                        objDom.setValorComponente(document.miForm.SEL_SPRODUC, null);
                        alert(mensajesAlert);
                        f_limpiar();
                }else{
                    var url="axis_axisadm099.do?operation=descargar&SPRODUC="+objDom.getValorComponente(document.miForm.ListProduc);
                    objAjax.invokeAsyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f='axisadm099' c='MSG_CARGAR' lit='9905686'/>")
                }
                    
    
                
            }  
 
            function f_cerrar_axisimprimir(){
            	 objUtiles.cerrarModal('axisimprimir');
            }          
            function f_limpiar() {

                objUtiles.ejecutarFormulario ("axis_axisadm099.do", "limpiar", document.miForm, "_self", objJsMessages.jslit_borrando_registro);    
            }  
            function f_imprimir_fitxer(){ 
                
                pfitxer = document.getElementById('SORTIDA').value;
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");    
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist003.jsp",600,200);
            }  
         function f_redireccionaFoco(){
            document.getElementById("botoCFitxer").focus();                          
        }
            function callBack_miajaxjson(p) {
            
            
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
  
            //hay que actualizar la lista de resulotados xxx
            var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
            odiv_OBFICHERO.innerHTML="";
            var div_OBFICHEROcontenido="";
            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";

            if (p.JSON2.LIST_FICHEROS!=null) {
                if (p.JSON2.LIST_FICHEROS.MENSAJES!=null && p.JSON2.LIST_FICHEROS.MENSAJES.length>0) {
                    objDom.setValorComponente(document.miForm.DES_FILE, null);
                    var errmsg="<axis:alt c='EJECUTAR_ERROR' f='axisadm099' lit='108953' />";
                    for (var i=0;i<p.JSON2.LIST_FICHEROS.MENSAJES.length;i++) {
                        var miMENSAJESitem=p.JSON2.LIST_FICHEROS.MENSAJES[i];
                        
                        errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
                        
                    }
                    alert(errmsg);
                }else{
                    objDom.setValorComponente(document.miForm.DES_FILE, 1);
                    div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"SORTIDA"+"\" id=\"SORTIDA"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
                    div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
                    odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
                }
            }
            }
        </script>
    </head>
    
    <body >
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
     
            <form name="miForm" action=""  method="POST" accept-charset='UTF-8'>         <!--<form name="miForm" action="" method="POST">  -->  
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="SEL_FILE" id="SEL_FILE" value="${__formdata.SEL_FILE}"/>
            <input type="hidden" name="SEL_SPRODUC" id="SEL_SPRODUC" value="${__formdata.SEL_SPRODUC}"/>
            <input type="hidden" name="DES_FILE" id="DES_FILE" value="${__formdata.DES_FILE}"/>
            <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>
            <input type="hidden" id="CBORRA_FICH" name="CBORRA_FICH" value="${CBORRA_FICH}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm099" c="MANT_PROYPROV" lit="9908595"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="titulo"><axis:alt f="axisadm099" c="MANT_PROYPROV_TIT" lit="9908595"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="form">axisadm099</c:param>
            </c:import>
            
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm099" c="IMPRIMIR" lit="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir" />
                <c:param name="botonCerrar" value="true"/>
        </c:import>
            
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm099" c="FILTRO" lit="1000178" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axisadm099" c="SPRODUC">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm099" c="PRODUCTO" lit="100681"/></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>

                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm099" c="SPRODUC">
                                            <td class="campocaja">                                
                                                <select name="ListProduc" id="ListProduc" size="1" class="campowidthselect campo campotexto" style="width:79%;" onchange="f_but_buscar()" >
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm099" c="SPRODUC" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUC}">
                                                        <option value = "${element.SPRODUC}"
                                                        <c:if test="${__formdata.SEL_SPRODUC == element.SPRODUC || fn:length(__formdata.LISTVALORES.LSTPRODUC) == 1}"> selected = "selected"</c:if>>
                                                            ${element.TPRODUC} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
 
                                        </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm099" c="RESULTADOS_TIT" lit="1000345" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp; </div>
                                                <%-- DisplayTag Proyecciones--%>
                                                <c:set var="title1"><axis:alt f="axisadm099" c="TPARAM_TIT" lit="104111"/></c:set>   <%-- Descripcion parametro--%>
                                                <c:set var="title2"><axis:alt f="axisadm099" c="NANYO_TIT" lit="101606"/></c:set>  <%-- Año --%>
                                                <c:set var="title3"><axis:alt f="axisadm099" c="NMES_TIT" lit="9000495"/></c:set>  <%-- Mes --%>
                                                <c:set var="title4"><axis:alt f="axisadm099" c="IVALOR_TIT" lit="101159"/></c:set>  <%-- Valor parametro --%>
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${__formdata.LSTPROYPROV}" id="LSTPROYPROV" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axisadm099.do?paginar=true">
                                                        <%@ include file="include/displaytag.jsp"%>
                                                        <display:column title="${title1}" sortable="true" sortProperty="TPARAM" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPROYPROV.TPARAM}
                                                            </div>
                                                        </display:column>
                                                        <axis:visible f="axisadm099" c="NANYO" >
                                                        <display:column title="${title2}" sortable="true" sortProperty="NANYO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPROYPROV.NANYO}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm099" c="NMES" >
                                                        <display:column title="${title3}" sortable="true" sortProperty="NMES" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPROYPROV.NMES}
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <display:column title="${title4}" sortable="true" sortProperty="IVALOR" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTPROYPROV.IVALOR}
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
                    </td>
                </tr>
                
                
                <tr>
                                        <td colspan="2" id="TITULO_FICHERO">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><b><axis:alt f="axisadm099" c="TIT_FICH" lit="9906322"/> </b>
                                            </div>
                                         </td>
                </tr>
   
                <tr>
                                        <td class="campocaja" id="fichero" colspan="4">
                                          <div class="seccion displayspace" id="div_OBFICHERO"></div>
                                          </td> 
                </tr>
                
            </table>
    
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm099</c:param>
                <c:param name="__botones"><axis:visible f="axisadm099" c="BUT_9902311" >9902311</axis:visible></c:param>
            </c:import>
            </form>
            <form name="miForm1" enctype='multipart/form-data' action="Axisadm099fileupload" method="POST" accept-charset='UTF-8'>         
            <table id="tabla12" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
                <tr>
                    <td>                                    
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm099" c="TITULO" lit="9001149" /></div>
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
                                    <b><axis:alt f="axisadm099" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="3">     
                                    <div class="fileinputs"  style="width:100%;">	
                                        <input type="file" id ="TFILE" name="TFILE" title="<axis:alt f='axisadm099' c='FITXER' lit='1000574'/>" obligatorio="true" style="width:500px" onkeypress="f_redireccionaFoco()" value="${__formdata.FILE}">
                                    </div>                             
                                    <div class="separador">&nbsp;</div>                                                        
                                </td>
                            </tr>                        
                        </table>                
                    </td>
                </tr>
            </table>
         
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm099</c:param>
                <c:param name="__botones">salir<axis:visible f="axisadm099" c="BUT_9001481" >,9001481</axis:visible></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>