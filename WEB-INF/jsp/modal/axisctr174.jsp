<%/*
*  Fichero: axisadm174.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 20/05/2009
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15" errorPage="/WEB-INF/jsp/axiserror.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp"/>
    <style type="text/css" title="text/css">
        .clsFile
        
        {
        border: 1px solid black;
        background-color: red;
        }
        
     

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
                inputFakeButton.value = "<axis:alt f="axisctr174" c="BOTTONFAKE" lit="9001708"/>";
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
        
        
        
        function f_but_salir() {
            var subido = document.miForm.subido.value;
            parent.f_but_salirAxisctr174(subido);
        }
        

        
        function f_but_9001532() {
        
             if (objValidador.validaEntrada()){
                if(confirm("<axis:alt f='axisctr174' c='CONFIRMMESSAGE' lit='9001183'/>")){
                    var userAgent = "${header['User-agent']}";
                    // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                    // Por eso, pasamos el nombre de fichero como un campo hidden.
                    // En IE, se recoge de forma normal, con item.getName().
                    if (userAgent.indexOf("Firefox") > 0){
                        objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
                        }
                        
                        
                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                    params= "?CDOCUME="+objDom.getValorPorId("CDOCUME");
                    params+= "&SEQDOCU="+objDom.getValorPorId("SEQDOCU");
                    params+= "&CCLASE="+objDom.getValorPorId("CCLASE");
                    params+= "&NORDEN="+objDom.getValorPorId("NORDEN");
                    params+= "&TDESCRIP="+objDom.getValorPorId("TDESCRIP");
                    params+= "&NRIESGO="+objDom.getValorPorId("NRIESGO");
                    params+= "&SPERSON="+objDom.getValorPorId("SPERSON");
                    
                    document.miForm.action="Axisctr174fileupload"+params;
                    document.miForm.submit();
                }   
            }
        }
        
         function f_redireccionaFoco(){
            document.getElementById("botoCFitxer").focus();                          
        }
        
        function f_onload() {
            initFileUploads();
            f_cargar_propiedades_pantalla(); 
        }

        function f_ejecutar        (){
        objUtiles.ejecutarFormulario ("modal_axisadm174.do",
                "ejecutar", document.miFormAlt, "_self", objJsMessages.jslit_cargando);  
        }
            
    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" enctype='multipart/form-data' action="Axisctr174fileupload" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisctr174" c="TITOL" lit="9900748"/></c:param>
            <c:param name="formulario"><axis:alt f="axisctr174" c="TITOL" lit="9900748"/></c:param>
            <c:param name="form">axisctr174</c:param>
        </c:import>

        <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>
        <input type="hidden" id="CDOCUME" name="CDOCUME" value="${__formdata.CDOCUME}"/>
        <input type="hidden" id="SEQDOCU" name="SEQDOCU" value="${__formdata.SEQDOCU}"/>
        <input type="hidden" id="CCLASE" name="CCLASE" value="${__formdata.CCLASE}"/>
        <input type="hidden" id="NORDEN" name="NORDEN" value="${__formdata.NORDEN}"/>
        <input type="hidden" id="NRIESGO" name="NORDEN" value="${__formdata.NRIESGO}"/>
        <input type="hidden" id="SPERSON" name="NORDEN" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="subido" name="subido" value="${subido}"/>
        
        <div class="separador">&nbsp;</div>    
 <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo">
                    
                    <img src="images/flecha.gif"/><axis:alt f="axisctr174" c="TITOL" lit="9900748"/>
                    </div>
                    <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>                                          
                        <tr>
                            <th style="width:50%;height:0%">&nbsp;</th>
                            <th style="width:50%;height:0%">&nbsp;</th>
                        </tr>
                        <tr>                           
                            <td class="titulocaja">
                                <b><axis:alt c="FITXER" f="axisctr174" lit="1000574"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja" >                             
                                <div class="fileinputs"  style="width:100%;">
                                    <input type="file"   name="TFILE" id="TFILE" title="<axis:alt f="axisctr174" c="FICHERO" lit="9001708"/>" size="70" obligatorio="true" style="width:500px" onkeypress="f_redireccionaFoco()"/> 
                                </div>
                            </td>
                        </tr>
                        <tr>                           
                            <td class="titulocaja">
                                <b><axis:alt c="DESCRIPCION" f="axisctr174" lit="100588"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <div class="fileinputs"  style="width:100%;">
                                    <input type="text"  class="campo campotexto " name="TDESCRIP" id="TDESCRIP" title="<axis:alt c="DESCRIPCION" f="axisctr174" lit="100588"/>" 
                                    size="70" obligatorio="true" /> 
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>


              </td>
            </tr>
        </table>
    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr174</c:param><c:param name="f">axisctr174</c:param><c:param name="__botones">salir,9001532</c:param></c:import>
    </form>
    <%try{%>
    <c:import url="../include/mensajes.jsp" />
    <%}catch(Exception e){System.out.println(e.getMessage());} %>
    
</body>
</html>
